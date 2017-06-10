using entitas;
namespace systems {

	/**
	* game systems
	*/
	public class InputSystem : System {

		const double FIRE_RATE = 0.1;
		public InputSystem(Game game, Factory world) {

			Entity* player = null;
			var timeToFire = 0.0;
			var shoot = false;

			initialize = () => {
				player = world.createPlayer();
			};

			/**
			 * Remove exired entities
			 */
			execute = (delta) => {
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
			};
		}
	}
}


