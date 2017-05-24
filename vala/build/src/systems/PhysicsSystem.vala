using entitas;
namespace systems {

	/**
	* game systems
	*/
[Compact, CCode ( /** reference counting */
	ref_function = "systems_physics_system_retain", 
	unref_function = "systems_physics_system_release"
)]
public class PhysicsSystem {
	public int _retainCount = 1;
	public unowned PhysicsSystem retain() {
		GLib.AtomicInt.add (ref _retainCount, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
	}
	public extern void free();
		
		public ISystem _ISystem { get { return { initialize, execute }; } }

		public Game game;
		public Factory world;
		public Group physics;

		public PhysicsSystem(Game game, Factory world) {
			this.game = game;
			this.world = world;
		}

		public void initialize() {
			physics = world.getGroup(Matcher.AllOf({Components.VelocityComponent}));
		}

		/**
		* physics system
		* model movement
		*/
		public void execute(double delta) {

			foreach (var entity in physics.entities)  {
				if (entity.isActive()) {

					var x = entity.position.x + entity.velocity.x * delta;
					var y = entity.position.y + entity.velocity.y * delta;

					entity.setPosition(x, y);
					entity.bounds.x = (int)x;
					entity.bounds.y = (int)y;
				}
			}
		}
	}
}



