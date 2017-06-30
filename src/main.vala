
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
	var window = Sdx.Initialize(720, 512, "Shmupwarz");
	var game = new Game(720, 512);
	game.Start();
	Emscripten.SetMainLoopArg(MainLoop, game, 0, 1);
	return;
}
/**
 * the main loop
 */
public void MainLoop(void* arg) {
	Sdx.GameLoop((Game*)arg);
}


#else
/**
 * Start the game
 *
 */
public int main(string args[]) {
#if (ANDROID)
	var window = Sdx.Initialize(1184, 768, "Shmupwarz");
	var game = new Game(1184, 768);
#else
	var window = Sdx.Initialize(720, 512, "Shmupwarz");
	var game = new Game(720, 512);
#endif
	game.Start();
	while (Sdx.running) {
		Sdx.GameLoop(game);
	}
	return 0;
}
#endif

