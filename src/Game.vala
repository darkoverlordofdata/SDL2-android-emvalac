using Sdx;
using Entitas;
using Systems;
	
/**
 * Game controller 
 */
public class Game : AbstractGame {
	public Game(Sdx.Ui.Window window) {
		width = (int)window.bounds.w;
		height = (int)window.bounds.h;

		setResourceBase("/darkoverlordofdata/shmupwarz");
		setSmallFont("assets/fonts/OpenDyslexic-Bold.otf", 16);
		setDefaultFont("assets/fonts/OpenDyslexic-Bold.otf", 24);
		setLargeFont("assets/fonts/OpenDyslexic-Bold.otf", 36);
		setAtlas("assets/assets.atlas");

		/**  
		 * Create the UI 
		 */
		var world = new Factory();
		var label = new Sdx.Ui.Label.Text(window.name, largeFont, Sdx.Color.NavajoWhite, Sdx.Color.DodgerBlue);
		var button = new Sdx.Ui.Button.NinePatch("Start", largeFont, Sdx.Color.Black, "btn", "btnPressed");
		
		window.add(label.setPos(width/2-label.width/2, 10));
		window.add(button.setPos(width/2-button.width/2, height/3));

		/**
		 * Start Button clicked
		 */
		button.onMouseClick = (c, x, y) => {
			window.remove(label);
			window.remove(button);
			world.addPlayer(x, y);
			update = () => {
				world.execute(Sdx.delta);
			};
		};
		
		/**
		 * Set up the game
		 */
		var display = new DisplaySystem(this, world);
		
		world.addSystem(new SpawnSystem(this, world))
			.addSystem(new InputSystem(this, world))
			.addSystem(new PhysicsSystem(this, world))
			.addSystem(new CollisionSystem(this, world))
			.addSystem(new AnimationSystem(this, world))
			.addSystem(new ExpireSystem(this, world))
			.addSystem(new SoundSystem(this, world))
			.addSystem(new ScoreSystem(this, world));

		world.initialize();
		world.addBackground(0, 0);

	}
}
