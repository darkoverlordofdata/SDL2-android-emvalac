using sdx;
using entitas;
using systems;
/**
 * Game controller 
 */
public class Game : AbstractGame {
	public static DisplaySystem display;

	/**
	 * Removed from display system
	 */
	public Entity* entityRemoved(Entity* e) {
		DisplaySystem.instance.remove(e);
		return e;
	}

	public Game(int w, int h) {

		width = w;
		height = h;

		sdx.setResourceBase("/darkoverlordofdata/shmupwarz");
		sdx.setSmallFont("assets/fonts/OpenDyslexic-Bold.otf", 16);
		sdx.setDefaultFont("assets/fonts/OpenDyslexic-Bold.otf", 24);
		sdx.setShowFps(true);
		display = new DisplaySystem();
		
		Factory world = new Factory();
		world.addSystem(new SpawnSystem(this, world))
			.addSystem(new InputSystem(this, world))
			.addSystem(new PhysicsSystem(this, world))
			.addSystem(new CollisionSystem(this, world))
			.addSystem(new AnimationSystem(this, world))
			.addSystem(new ExpireSystem(this, world))
			.addSystem(new RemoveSystem(this, world))
			.addSystem(new ScoreSystem(this, world));

		world.setEntityRemovedListener(entityRemoved);
		world.initialize();
		world.createBackground();

		/**
		 * Update
		 * 
		 */
		update = () => {
			sdx.update();	
			sdx.processEvents();
			world.execute(sdx.delta);
		};

		/**
		 * Render
		 * 
		 */
		draw = () => {
			sdx.begin();
			foreach (var sprite in display.sprites) {
				if (sprite.isActive()) display.draw(sprite);
			}
			sdx.drawFps();
			sdx.end();
		};
	}

}