using SDL;
using SDL.Video;
using SDLImage;

namespace sdx {

	public class AbstractPlatform : Object {
		public int width;
		public int height;
		public delegate void AbstractUpdate(int tick);
		public delegate void AbstractDraw(int tick);
		public AbstractUpdate update = (tick) => {};
		public AbstractDraw draw = (tick) => {};
		public AbstractPlatform() {
			// forces the subclassed lambda context to be reference counted
			var r = new LambdaReference();
		}
	}

	public class AbstractGame : Object {
		public int width;
		public int height;
		public delegate void AbstractUpdate();
		public delegate void AbstractDraw();
		public AbstractUpdate update = () => {};
		public AbstractDraw draw = () => {};
		public AbstractGame() {
			// forces the subclassed lambda context to be reference counted
			var r = new LambdaReference();
		}
		public void start() {
			sdx.start();
		}
	}

	public class LambdaReference: Object {}

	/**
	 * Global vars
	 * 
	 */
#if (DESKTOP)
	FileType platform = FileType.Resource;
	const int pixelFactor = 1;
#elif (ANDROID)
	const int pixelFactor = 2;
	FileType platform = FileType.Asset;
#else
	const int pixelFactor = 1;
	FileType platform = FileType.Relative;
#endif
	Renderer renderer;
	sdx.Font font;
	sdx.Font smallFont;
	sdx.Font largeFont;
	SDL.Video.Display display;
	SDL.Video.DisplayMode displayMode;
	SDL.Video.Color fpsColor;
	SDL.Video.Color bgdColor;
	sdx.graphics.Sprite.TextSprite fpsSprite;
	sdx.graphics.Sprite.AnimatedSprite fps1;
	sdx.graphics.Sprite.AnimatedSprite fps2;
	sdx.graphics.Sprite.AnimatedSprite fps3;
	sdx.graphics.Sprite.AnimatedSprite fps4;
	sdx.graphics.Sprite.AnimatedSprite fps5;
	bool showFps;
	float fps;
	float delta = 1.0f/60.0f;
	int mouseX;
	int mouseY;
	bool mouseDown;
	bool running;
	uint8[] keys;
	bool[] direction;
	string resourceBase;
	double currentTime;
	double accumulator;
	const double MS_PER_UPDATE = 1.0/60.0;
	double freq;
	int width;
	int height;
	Event _evt;

	public enum Direction {
		NONE, LEFT, RIGHT, UP, DOWN
	}

	/**
	 * Initialization
	 * 
	 */
	Window initialize(int width, int height, string name) {
		sdx.height = height;
		sdx.width = width;
		keys = new uint8[256];
		direction = new bool[5];

		if (SDL.init(SDL.InitFlag.VIDEO | SDL.InitFlag.TIMER | SDL.InitFlag.EVENTS) < 0)
			throw new SdlException.Initialization(SDL.get_error());

		if (SDLImage.init(SDLImage.InitFlags.PNG) < 0)
			throw new SdlException.ImageInitialization(SDL.get_error());

		if (!SDL.Hint.set_hint(Hint.RENDER_SCALE_QUALITY, "1"))	
			throw new SdlException.TextureFilteringNotEnabled(SDL.get_error());

		if (SDLTTF.init() == -1)
			throw new SdlException.TtfInitialization(SDL.get_error());

		display = 0;
		display.get_mode(0, out displayMode);
		//  if (display.get_dpi(null, null, null) == -1) {
		//  	pixelFactor = 1;
		//  } else {
		//  	pixelFactor = 1;
		//  }

#if (ANDROID)    

		width = displayMode.w;
		height = displayMode.h;
		var window = new Window(name, Window.POS_CENTERED, Window.POS_CENTERED, 0, 0, WindowFlags.SHOWN);
#else
		var window = new Window(name, Window.POS_CENTERED, Window.POS_CENTERED, width, height, WindowFlags.SHOWN);
#endif	
		if (window == null)
			throw new SdlException.OpenWindow(SDL.get_error());
		
		sdx.renderer = Renderer.create(window, -1, RendererFlags.ACCELERATED | RendererFlags.PRESENTVSYNC);
		if (sdx.renderer == null)
			throw new SdlException.CreateRenderer(SDL.get_error());

		freq = SDL.Timer.get_performance_frequency();
		fpsColor = sdx.Color.AntiqueWhite;
		bgdColor = sdx.Color.Black; //{ 0, 0, 0, 0 };

		fps = 60;
		MersenneTwister.init_genrand((ulong)SDL.Timer.get_performance_counter());
		return window;
	}

	double getRandom() {
		return MersenneTwister.genrand_real2();
	}

	void setResourceBase(string path) {
		sdx.resourceBase = path;
	}

	void setDefaultFont(string path, int size) {
		font = new sdx.Font(path, size);
	}

	void setSmallFont(string path, int size) {
		smallFont = new sdx.Font(path, size);
	}

	void setLargeFont(string path, int size) {
		largeFont = new sdx.Font(path, size);
	}

	void setShowFps(bool value) {
		showFps = value;
		if (showFps == true) {

			fps1 = new sdx.graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps2 = new sdx.graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps3 = new sdx.graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps4 = new sdx.graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps5 = new sdx.graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);

		} else {
			fpsSprite = null;
		}
	}

	void drawFps() {
		if (showFps) {
			var f = "%2.2f".printf(fps);
			fps1.setFrame(f[0]);
			fps1.render(20, 12);
			fps2.setFrame(f[1]);
			fps2.render(35, 12);
			fps3.setFrame(f[2]);
			fps3.render(50, 12);
			fps4.setFrame(f[3]);
			fps4.render(65, 12);
			fps5.setFrame(f[4]);
			fps5.render(80, 12);
		}
	}

	double getNow() {
		return (double)SDL.Timer.get_performance_counter()/freq;
	} 

	void start() {
		currentTime = getNow();
		running = true;
	}

	void gameloop(AbstractGame game) {
		
		double newTime = getNow();
		double frameTime = newTime - currentTime;
		if (frameTime > 0.25) frameTime = 0.25;
		currentTime = newTime;

		accumulator += frameTime;

		processEvents();
		while (accumulator >= MS_PER_UPDATE) {
			game.update();
			accumulator -= MS_PER_UPDATE;
		}
		game.draw();
	}


	void processEvents() {
		while (SDL.Event.poll(out _evt) != 0) {
			switch (_evt.type) {
				case SDL.EventType.QUIT:
					running = false;
					break;
				case SDL.EventType.KEYDOWN:
					switch (_evt.key.keysym.scancode) {
						case SDL.Input.Scancode.LEFT: 	direction[Direction.LEFT] = true; break;
						case SDL.Input.Scancode.RIGHT: 	direction[Direction.RIGHT] = true; break;
						case SDL.Input.Scancode.UP: 	direction[Direction.UP] = true; break;
						case SDL.Input.Scancode.DOWN: 	direction[Direction.DOWN] = true; break;
					}
					if (_evt.key.keysym.sym < 0 || _evt.key.keysym.sym > 255) break;
					keys[_evt.key.keysym.sym] = 1;
					break;
				case SDL.EventType.KEYUP:
					switch (_evt.key.keysym.scancode) {
						case SDL.Input.Scancode.LEFT: 	direction[Direction.LEFT] = false; break;
						case SDL.Input.Scancode.RIGHT: 	direction[Direction.RIGHT] = false; break;
						case SDL.Input.Scancode.UP: 	direction[Direction.UP] = false; break;
						case SDL.Input.Scancode.DOWN: 	direction[Direction.DOWN] = false; break;
					}
					if (_evt.key.keysym.sym < 0 || _evt.key.keysym.sym > 255) break;
					keys[_evt.key.keysym.sym] = 0;
					break;
				case SDL.EventType.MOUSEMOTION:
					mouseX = _evt.motion.x;
					mouseY = _evt.motion.y;
					break;
				case SDL.EventType.MOUSEBUTTONDOWN:
					mouseDown = true;
					break;
				case SDL.EventType.MOUSEBUTTONUP:
					mouseDown = false;
					break;
#if (!ANDROID)
				case SDL.EventType.FINGERMOTION:
#if (EMSCRIPTEN)					
					mouseX = (int)(_evt.tfinger.x * (float)width);
					mouseY = (int)(_evt.tfinger.y * (float)height);
#else
					mouseX = (int)_evt.tfinger.x;
					mouseY = (int)_evt.tfinger.y;
#endif
					break;
				case SDL.EventType.FINGERDOWN:
					mouseDown = true;
					break;
				case SDL.EventType.FINGERUP:
					mouseDown = false;
					break;
#endif
			}
		}
	}
	
	void begin() {
		renderer.set_draw_color(bgdColor.r, bgdColor.g, bgdColor.b, bgdColor.a);
		renderer.clear();
	}

	void end() {
		// sdx.drawFps();
		sdx.renderer.present();
	}

	void log(string text) {
#if (ANDROID)
		Android.logWrite(Android.LogPriority.ERROR, "SDX", text);
#else
		stdout.printf("%s\n", text);
#endif
	}

}