using entitas;
namespace systems {

	/**
	* game systems
	*/
[Compact, CCode ( /** reference counting */
	ref_function = "systems_input_system_retain", 
	unref_function = "systems_input_system_release"
)]
public class InputSystem {
	public int _retainCount = 1;
	public unowned InputSystem retain() {
		GLib.AtomicInt.add (ref _retainCount, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
	}
	public extern void free();
		
		public ISystem _ISystem { get { return { initialize, execute }; } }

		const double FIRE_RATE = 0.1;

		public Game game;
		public Factory world;
		public Entity* player;
		public double timeToFire = 0.0;
		public bool shoot;

		public InputSystem(Game game, Factory world) {
			this.game = game;
			this.world = world;
		}

		public void initialize() {
			player = world.createPlayer();
		}

		/**
		 * get player input
		 */
		public void execute(double delta) {
			var x = (int)sdx.mouseX;
			var y = (int)sdx.mouseY;
			player.setPosition(x, y);
			player.bounds.x = x;
			player.bounds.y = y;
			shoot = sdx.mouseDown || (sdx.keys[122] == 1);
			if (shoot) timeToFire -= delta;
			if (timeToFire < 0.0) {
				world.bullet(x + 27, y + 2);
				world.bullet(x - 27, y + 2);
				timeToFire = FIRE_RATE;
			}
		}
	}
}


