using Sdx;
using Entitas;
using Systems;
	
/**
 * Game controller 
 */
public class Game : AbstractGame 
{

	public Game(Sdx.Ui.Window window) 
	{

		width = (int)window.bounds.w;
		height = (int)window.bounds.h;

		Sdx.SetResourceBase("/darkoverlordofdata/shmupwarz");
		Sdx.SetSmallFont("assets/fonts/OpenDyslexic-Bold.otf", 16);
		Sdx.SetDefaultFont("assets/fonts/OpenDyslexic-Bold.otf", 24);
		Sdx.SetAtlas("assets/assets.atlas");
		Sdx.SetShowFps(true);
		var world = new Factory();
	
		var label = new Sdx.Ui.Label.Text("ShmupWarz", font, Sdx.Color.White, Sdx.Color.Blue);
		window.Add(label.SetPos(width/2+label.width/4, 10));
		
		var btn = new Sdx.Ui.Button.NinePatch("Frodo", font, Sdx.Color.Black, "btn", "btnPressed");
		
		btn.OnMouseClick = () => 
		{
			print("this is a click\n");

		};
		
		window.Add(btn.SetPos(100, 100));

		var display = new DisplaySystem(this, world);

		world.AddSystem(new SpawnSystem(this, world))
			.AddSystem(new InputSystem(this, world))
			.AddSystem(new PhysicsSystem(this, world))
			.AddSystem(new CollisionSystem(this, world))
			.AddSystem(new AnimationSystem(this, world))
			.AddSystem(new ExpireSystem(this, world))
			.AddSystem(new SoundSystem(this, world))
			.AddSystem(new ScoreSystem(this, world));

		world.Initialize();
		/**
		 * Update
		 * 
		 */
		Update = () => 
		{
			world.Execute(Sdx.delta);
		};

		/**
		 * Render
		 * 
		 */
		Draw = () => 
		{
			Sdx.Begin();
			display.sprites.ForEach(entity => 
			{
				if (entity.IsActive()) 
					display.Draw(entity, ref entity.transform);
			});
			Sdx.End();
		};
	}
}
