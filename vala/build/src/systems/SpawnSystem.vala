using entitas;
namespace systems {

	/**
	* game systems
	*/	
[Compact, CCode ( /** reference counting */
	ref_function = "systems_spawn_system_retain", 
	unref_function = "systems_spawn_system_release"
)]
public class SpawnSystem {
	public int _retainCount = 1;
	public unowned SpawnSystem retain() {
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
		public double enemyT1 = 1.0;
		public double enemyT2 = 4.0;
		public double enemyT3 = 6.0;


		public SpawnSystem(Game game, Factory world) {
			this.game = game;
			this.world = world;
			//  isystem = { initialize, execute };
		}

		public void initialize(){}

		/**
		 * Spawn enemy ships
		 */
		public void execute(double delta) {
			enemyT1 = spawnEnemy(delta, enemyT1, 1);
			enemyT2 = spawnEnemy(delta, enemyT2, 2);
			enemyT3 = spawnEnemy(delta, enemyT3, 3);
		}

		public double spawnEnemy(double delta , double t , int enemy) {
			var d1 = t-delta;
			if (d1 < 0.0) {
				switch (enemy) {
					case 1:
						var x = (int)(sdx.getRandom() * (game.width-70)) + 35;
						world.enemy1(x, -35);
						return 1.0;
					case 2:
						var x = (int)(sdx.getRandom() * (game.width-172)) + 85;
						world.enemy2(x, -85);
						return 4.0;
					case 3:
						var x = (int)(sdx.getRandom() * (game.width-320)) + 160;
						world.enemy3(x, -160);
						return 6.0;
					default:
						return 0.0;
				}
			} else {
				return d1;
			}    
		}
	}
}
