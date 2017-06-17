using entitas;
namespace systems {
	/**
	* game systems
	*/
	public class InputSystem : System {

		const float FIRE_RATE = 0.1f;
		public InputSystem(Game game, Factory world) {

			var shoot = false;
			var timeToFire = FIRE_RATE;
			var player = world.createPlayer();
			/**
			 * get player input
			 */
			execute = (delta) => {
				var x = (int)sdx.mouseX;
				var y = (int)sdx.mouseY;
				player.setPosition(x, y);
				player.aabb.x = x;
				player.aabb.y = y;
				shoot = sdx.mouseDown || (sdx.keys[122] == 1);
				if (shoot) timeToFire -= delta;
				if (timeToFire < 0) {
					world.bullet(x + 27, y + 2);
					world.bullet(x - 27, y + 2);
					timeToFire = FIRE_RATE;
				}
			};
		}
	}
}