
#if (EMSCRIPTEN)
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
	game.start();
	Emscripten.emscripten_set_main_loop_arg(mainloop, game, 0, 1);
	return;
}
/**
 * the main loop
 */
public void mainloop(void* arg) {
	sdx.gameloop((Game*)arg);
}


#else
/**
 * Start the game
 *
 */
public int main(string args[]) {
#if (ANDROID)
	var window = sdx.initialize(1184, 768, "Shmupwarz");
	var game = new Game(1184, 768);
#else
	var window = sdx.initialize(720, 512, "Shmupwarz");
	var game = new Game(720, 512);
#endif
	game.start();
	while (sdx.running) {
		sdx.gameloop(game);
	}
	return 0;
}
#endif

