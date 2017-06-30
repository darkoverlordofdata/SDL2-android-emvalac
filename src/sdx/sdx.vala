using SDL;
using SDL.Video;
using SDLImage;

namespace Sdx {

	public class AbstractPlatform : Object {
		public int width;
		public int height;
		public delegate void AbstractUpdate(int tick);
		public delegate void AbstractDraw(int tick);
		public AbstractUpdate Update = (tick) => {};
		public AbstractDraw Draw = (tick) => {};
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
		public AbstractUpdate Update = () => {};
		public AbstractDraw Draw = () => {};
		public AbstractGame() {
			// forces the subclassed lambda context to be reference counted
			var r = new LambdaReference();
		}
		public void Start() {
			Sdx.Start();
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
	Sdx.Font font;
	Sdx.Font smallFont;
	Sdx.Font largeFont;
	SDL.Video.Display display;
	SDL.Video.DisplayMode displayMode;
	SDL.Video.Color fpsColor;
	SDL.Video.Color bgdColor;
	Sdx.Graphics.Sprite.TextSprite fpsSprite;
	Sdx.Graphics.Sprite.AnimatedSprite fps1;
	Sdx.Graphics.Sprite.AnimatedSprite fps2;
	Sdx.Graphics.Sprite.AnimatedSprite fps3;
	Sdx.Graphics.Sprite.AnimatedSprite fps4;
	Sdx.Graphics.Sprite.AnimatedSprite fps5;
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
	Window Initialize(int width, int height, string name) {
		Sdx.height = height;
		Sdx.width = width;
		keys = new uint8[256];
		direction = new bool[5];

		if (SDL.Init(SDL.InitFlag.VIDEO | SDL.InitFlag.TIMER | SDL.InitFlag.EVENTS) < 0)
			throw new SdlException.Initialization(SDL.GetError());

		if (SDLImage.Init(SDLImage.InitFlags.PNG) < 0)
			throw new SdlException.ImageInitialization(SDL.GetError());

		if (!SDL.Hint.SetHint(Hint.RENDER_SCALE_QUALITY, "1"))	
			throw new SdlException.TextureFilteringNotEnabled(SDL.GetError());

		if (SDLTTF.Init() == -1)
			throw new SdlException.TtfInitialization(SDL.GetError());

		display = 0;
		display.GetMode(0, out displayMode);
		//  if (display.GetDpi(null, null, null) == -1) {
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
			throw new SdlException.OpenWindow(SDL.GetError());
		
		Sdx.renderer = Renderer.Create(window, -1, RendererFlags.ACCELERATED | RendererFlags.PRESENTVSYNC);
		if (Sdx.renderer == null)
			throw new SdlException.CreateRenderer(SDL.GetError());

		freq = SDL.Timer.GetPerformanceFrequency();
		fpsColor = Sdx.Color.AntiqueWhite;
		bgdColor = Sdx.Color.Black; //{ 0, 0, 0, 0 };

		fps = 60;
		MersenneTwister.InitGenrand((ulong)SDL.Timer.GetPerformanceCounter());
		return window;
	}

	double GetRandom() {
		return MersenneTwister.GenrandReal2();
	}

	void SetResourceBase(string path) {
		Sdx.resourceBase = path;
	}

	void SetDefaultFont(string path, int size) {
		font = new Sdx.Font(path, size);
	}

	void SetSmallFont(string path, int size) {
		smallFont = new Sdx.Font(path, size);
	}

	void SetLargeFont(string path, int size) {
		largeFont = new Sdx.Font(path, size);
	}

	void SetShowFps(bool value) {
		showFps = value;
		if (showFps == true) {

			fps1 = new Sdx.Graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps2 = new Sdx.Graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps3 = new Sdx.Graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps4 = new Sdx.Graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);
			fps5 = new Sdx.Graphics.Sprite.AnimatedSprite("assets/fonts/tom-thumb-white.png", 16, 24);

		} else {
			fpsSprite = null;
		}
	}

	void DrawFps() {
		if (showFps) {
			var f = "%2.2f".printf(fps);
			fps1.SetFrame(f[0]);
			fps1.Render(20, 12);
			fps2.SetFrame(f[1]);
			fps2.Render(35, 12);
			fps3.SetFrame(f[2]);
			fps3.Render(50, 12);
			fps4.SetFrame(f[3]);
			fps4.Render(65, 12);
			fps5.SetFrame(f[4]);
			fps5.Render(80, 12);
		}
	}

	double GetNow() {
		return (double)SDL.Timer.GetPerformanceCounter()/freq;
	} 

	void Start() {
		currentTime = GetNow();
		running = true;
	}

	void GameLoop(AbstractGame game) {
		
		double newTime = GetNow();
		double frameTime = newTime - currentTime;
		if (frameTime > 0.25) frameTime = 0.25;
		currentTime = newTime;

		accumulator += frameTime;

		ProcessEvents();
		while (accumulator >= MS_PER_UPDATE) {
			game.Update();
			accumulator -= MS_PER_UPDATE;
		}
		game.Draw();
	}


	void ProcessEvents() {
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
	
	void Begin() {
		renderer.SetDrawColor(bgdColor.r, bgdColor.g, bgdColor.b, bgdColor.a);
		renderer.Clear();
	}

	void End() {
		// Sdx.drawFps();
		renderer.Present();
	}

	void Log(string text) {
#if (ANDROID)
		Android.LogWrite(Android.LogPriority.ERROR, "SDX", text);
#else
		stdout.printf("%s\n", text);
#endif
	}

}