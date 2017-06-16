using entitas;
namespace systems {

	/**
	* game systems
	*/	
	public class SpawnSystem : System {

		public delegate float SpawnEnemy(float delta, float t, int enemy);

		public SpawnSystem(Game game, Factory world) {
			var enemyT1 = 1.0f;
			var enemyT2 = 4.0f;
			var enemyT3 = 6.0f;

			SpawnEnemy spawnEnemy = (delta, t, enemy) => {
				var d1 = t-delta;
				if (d1 < 0.0) {
					switch (enemy) {
						case 1:
							var x = (int)(sdx.getRandom() * (game.width-70)) + 35;
							world.enemy1(x, -35);
							return 1;
						case 2:
							var x = (int)(sdx.getRandom() * (game.width-172)) + 85;
							world.enemy2(x, -85);
							return 4;
						case 3:
							var x = (int)(sdx.getRandom() * (game.width-320)) + 160;
							world.enemy3(x, -160);
							return 6;
						default:
							return 0;
					}
				} else {
					return d1;
				}    
				
			};

			/**
			 * Spawn enemy ships
			 */
			execute = (delta) => {
				enemyT1 = spawnEnemy(delta, enemyT1, 1);
				enemyT2 = spawnEnemy(delta, enemyT2, 2);
				enemyT3 = spawnEnemy(delta, enemyT3, 3);
			};

		}
	}
}
