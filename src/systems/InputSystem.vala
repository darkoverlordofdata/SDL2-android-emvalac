using Entitas;
namespace Systems {
	/**
	* game systems
	*/
	public class InputSystem : System {

		const float FIRE_RATE = 0.1f;
		public InputSystem(Game game, Factory world) {

			var shoot = false;
			var timeToFire = FIRE_RATE;
			var player = world.GetGroup(Matcher.AllOf({ Components.PlayerComponent }));
			
			world.AddBackground(0, 0);
			world.AddPlayer(0, 0);
			/**
			 * get player input
			 */
			Execute = (delta) => {
				var x = (int)Sdx.mouseX;
				var y = (int)Sdx.mouseY;
				
				player.GetSingleEntity().SetPosition(x, y);
				shoot = Sdx.mouseDown || (Sdx.keys[122] == 1);
				if (shoot) timeToFire -= delta;
				if (timeToFire < 0) {
					world.AddBullet(x + 27, y + 2);
					world.AddBullet(x - 27, y + 2);
					timeToFire = FIRE_RATE;
				}
			};
		}
	}
}