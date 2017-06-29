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
			var player = world.getGroup(Matcher.AllOf({Components.PlayerComponent}));
			
			world.addBackground(0, 0);
			world.addPlayer(0, 0);
			/**
			 * get player input
			 */
			execute = (delta) => {
				var x = (int)sdx.mouseX;
				var y = (int)sdx.mouseY;
				
				player.getSingleEntity().setPosition(x, y);
				shoot = sdx.mouseDown || (sdx.keys[122] == 1);
				if (shoot) timeToFire -= delta;
				if (timeToFire < 0) {
					world.addBullet(x + 27, y + 2);
					world.addBullet(x - 27, y + 2);
					timeToFire = FIRE_RATE;
				}
			};
		}
	}
}