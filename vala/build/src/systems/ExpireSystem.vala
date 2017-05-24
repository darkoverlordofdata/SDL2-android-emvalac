using entitas;
namespace systems {
	/**
	* game systems
	*/
[Compact, CCode ( /** reference counting */
	ref_function = "systems_expire_system_retain", 
	unref_function = "systems_expire_system_release"
)]
public class ExpireSystem {
	public int _retainCount = 1;
	public unowned ExpireSystem retain() {
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
		public Group expiring;

		public ExpireSystem(Game game, Factory world) {
			this.game = game;
			this.world = world;
		}

		public void initialize() {
			expiring = world.getGroup(Matcher.AllOf({Components.ExpiresComponent}));
		}

		/**
		 * Remove exired entities
		 */
		public void execute(double delta) {
			foreach (var entity in expiring.entities) {
				if (entity.isActive()) {
					var exp = entity.expires.value - delta;
					entity.expires.value = exp;
					if (entity.expires.value < 0)	
						world.deleteEntity(entity);
				}
			}
		}
	}
}


