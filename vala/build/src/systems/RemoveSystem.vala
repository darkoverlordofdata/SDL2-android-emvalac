using entitas;
namespace systems {

	/**
	* game systems
	*/
[Compact, CCode ( /** reference counting */
	ref_function = "systems_remove_system_retain", 
	unref_function = "systems_remove_system_release"
)]
public class RemoveSystem {
	public int _retainCount = 1;
	public unowned RemoveSystem retain() {
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
		public Group movable;

		public RemoveSystem(Game game, Factory world) {
			this.game = game;
			this.world = world;
		}

		public void initialize() {
			movable = world.getGroup(Matcher.AllOf({Components.PositionComponent}));
		}

		/**
		 * Remove entities that have gone off-screen
		 */
		public void execute(double delta) {
			foreach (var entity in movable.entities) {
				if (entity.isActive()) {
					switch (entity.pool) {
						case Pool.ENEMY1:
							if (entity.position.y > game.height) world.deleteEntity(entity);
							break;
							
						case Pool.ENEMY2:
							if (entity.position.y > game.height) world.deleteEntity(entity);
							break;
							
						case Pool.ENEMY3:
							if (entity.position.y > game.height) world.deleteEntity(entity);
							break;
							
						case Pool.BULLET:
							if (entity.position.y < 0) world.deleteEntity(entity);
							break;
					}
				}
			}
		}
	}
}


