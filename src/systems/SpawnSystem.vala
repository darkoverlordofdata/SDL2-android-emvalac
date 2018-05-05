using Entitas;
namespace Systems {
	/**
	* game systems
	*/	
	public class SpawnSystem : System {
		const int[] retval = { 1, 4, 6 };
		const int[] offset = { 35, 85, 160 };
			
		public SpawnSystem(Game game, Factory world) {

			float[] counter = { 1.0f, 4.0f, 6.0f };
<<<<<<< HEAD
			update = (delta) => {
=======
			execute = (delta) => {
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				for (var i=0; i<counter.length; i++)
					spawn(game, world, i, delta, ref counter[i]);
			};
		}

		void spawn(Game game, Factory world, int enemy, float delta, ref float counter) {
			var countDown = counter-delta;
			if (countDown < 0.0) {
	
				var y = offset[enemy];
				var x = (int)(Sdx.getRandom() * (game.width-(y*2))) + y;
				((Factory)world).addEnemy(enemy+1, x, -y);
				counter = retval[enemy];
		
			} else counter = countDown;
		}
	}
}
