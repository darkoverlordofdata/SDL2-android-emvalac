/**
 * Game controller 
 */
using entitas;
using systems;

public class Game : Object {

	public static Game instance;
	public int width;
	public int height;
	public Factory world;
	public CollisionSystem collision;
	public ExpireSystem expire;
	public InputSystem input;
	public PhysicsSystem physics;
	public RemoveSystem remove;
	public SpawnSystem spawn;
	public AnimationSystem animate;
	public DisplaySystem display;
	public ScoreSystem score;

	public Game(int width, int height) {
		instance = this;
		this.width = width;
		this.height = height;
	}

	/**
	 * setup the game
	 */
	public void initialize() {

		sdx.setResource("/darkoverlordofdata/shmupwarz");
		sdx.setSmallFont("assets/fonts/OpenDyslexic-Bold.otf", 16);
		sdx.setDefaultFont("assets/fonts/OpenDyslexic-Bold.otf", 24);
		sdx.setShowFps(true);

		world = (Factory)createSystems();
		world.setEntityRemovedListener(entityRemoved);
		world.initialize();
		world.createBackground();
	}

	/**
	 * createSystems
	 * 
	 */
	public World createSystems() {
		display = new DisplaySystem();
		var world = new Factory();
		return world.addSystem(spawn = new SpawnSystem(this, world))
					.addSystem(input = new InputSystem(this, world))
					.addSystem(physics = new PhysicsSystem(this, world))
					.addSystem(collision = new CollisionSystem(this, world))
					.addSystem(animate = new AnimationSystem(this, world))
					.addSystem(expire = new ExpireSystem(this, world))
					.addSystem(remove = new RemoveSystem(this, world))
					.addSystem(score = new ScoreSystem(this, world));
	}

	/**
	 * start the game
	 */
	public void start() {
		sdx.start();
	}

	/**
	 * update each frame
	 */
	public void update() {
		sdx.update();	
		sdx.processEvents();
		world.execute(sdx.delta);
	}

	/**
	 * draw each frame
	 */
	public void draw() {
		sdx.begin();
		foreach (var sprite in display.sprites) {
			if (sprite.isActive()) display.draw(sprite);
		}
		sdx.drawFps();
		sdx.end();
	}

}