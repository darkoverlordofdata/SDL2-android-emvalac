/**
 *	profiling data
 */
public int k;
public double t;
public double t1;
public double t2;
public double t3;

/**
 * gameloop
 * 
 * process each frame
 * 
 * @param game Game object
 * 
 */
public void gameloop(Game game) {

#if (PROFILING)
	t1 = sdx.getNow();
#endif
	game.update();
#if (PROFILING)
	t2 = sdx.getNow();
	t3 = t2 - t1;
	t = t + t3;
	k += 1;
	if (k == 1000) {
		k = 0;
		t = t / 1000.0;
		stdout.printf("%f\n", t);
		t = 0;
	}
#endif
	game.draw();
}

#if (DESKTOP || ANDROID)

/**
 * Start the game
 *
 */
public int main(string args[]) {

	var window = sdx.initialize(1184, 768, "Shmupwarz");
	var game = new Game(1184, 768);
	//  var window = sdx.initialize(720, 512, "Shmupwarz");
	//  var game = new Game(720, 512);
	game.initialize();
	game.start();
	while (sdx.running) {
		gameloop(game);
	}
	return 0;
}

#else
/**
 * game
 * 
 * entry point for Emscripten
 * 
 * -s EXPORTED_FUNCTIONS='["_game"]'
 * Invoked by clicking on the start button in the browser
 *
 */
public void game() {
	var window = sdx.initialize(720, 512, "Shmupwarz");
	var game = new Game(720, 512);
	game.initialize();
	game.start();
	Emscripten.emscripten_set_main_loop_arg(mainloop, game, 0, 1);
	return;
}
/**
 * the main loop
 */
public void mainloop(void* arg) {
	gameloop((Game*)arg);
}
#endif

/** compiler trick needed to force compilation */
[Compact, CCode ( /** reference counting */
	ref_function = "zed_retain", 
	unref_function = "zed_release"
)]
public class Zed {
	public int _retainCount = 1;
	public unowned Zed retain() {
		GLib.AtomicInt.add (ref _retainCount, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
	}
	public extern void free();
		
    public Zed(string file, SDL.Video.Renderer renderer) {
        SDL.Video.Surface never = SDLImage.load(file);
        }
}
