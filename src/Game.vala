using Sdx;
using Entitas;
using Systems;
/**
 * Game controller 
 */
public class Game : AbstractGame {

	public Game(int w, int h) {
	
		width = w;
		height = h;

		Sdx.SetResourceBase("/darkoverlordofdata/shmupwarz");
		Sdx.SetSmallFont("assets/fonts/OpenDyslexic-Bold.otf", 16);
		Sdx.SetDefaultFont("assets/fonts/OpenDyslexic-Bold.otf", 24);
		Sdx.SetShowFps(true);
		
		var world = new Factory();
		var display = new DisplaySystem();

		world.SetEntityRemovedListener(it => display.sprites.Remove(it));

		world.AddSystem(new SpawnSystem(this, world))
			.AddSystem(new InputSystem(this, world))
			.AddSystem(new PhysicsSystem(this, world))
			.AddSystem(new CollisionSystem(this, world))
			.AddSystem(new AnimationSystem(this, world))
			.AddSystem(new ExpireSystem(this, world))
			.AddSystem(new ScoreSystem(this, world));

		world.Initialize();

		/**
		 * Update
		 * 
		 */
		Update = () => {
			world.Execute(Sdx.delta);
		};

		/**
		 * Render
		 * 
		 */
		Draw = () => {
			Sdx.Begin();
			foreach (var entity in display.sprites) 
				if (entity.IsActive()) 
					display.Draw(entity, ref entity.transform);
			Sdx.End();
		};
	}
}