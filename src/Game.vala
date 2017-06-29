using sdx;
using entitas;
using systems;
/**
 * Game controller 
 */
public class Game : AbstractGame {
	public static DisplaySystem? display;

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
			.addSystem(new ScoreSystem(this, world));

		/**
		 * Removed from display system
		 */
		world.setEntityRemovedListener(it => {
			DisplaySystem.remove(it);
			return it;
		});
		world.initialize();

		/**
		 * Update
		 * 
		 */
		update = () => {
			world.execute(sdx.delta);
		};

		/**
		 * Render
		 * 
		 */
		draw = () => {
			sdx.begin();
			foreach (var entity in display.sprites) 
				if (entity.isActive()) display.draw(entity, ref entity.transform);
			sdx.end();
		};
	}
}