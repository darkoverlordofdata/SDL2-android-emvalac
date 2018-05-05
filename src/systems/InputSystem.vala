using Entitas;
using Sdx;
namespace Systems {
	/**
	* game systems
	*/
	public class InputSystem : System {
		const float FIRE_RATE = 0.1f;

		public InputSystem(Game game, Factory world) {
			var x = 0;
			var y = 0;
			var mouseDown = false;
			var shoot = false;
			var timeToFire = FIRE_RATE;
			var player = world
						.getGroup(Matcher.allOf({ Components.PlayerComponent }))
						.getSingleEntity();
						
			update = (delta) => {
				player.setPosition(x, y);
				if (shoot || mouseDown) timeToFire -= delta;
				if (timeToFire < 0) {
					world.addBullet(x + 27, y + 2);
					world.addBullet(x - 27, y + 2);
					timeToFire = FIRE_RATE;
				}
			};

			addInputEvents(InputEvents(){

				keyDown = (keycode) => {
					shoot = keycode == SDL.Input.Keycode.z ? true : false; 
					return false;
				},
				
				keyUp = (keycode) => {
					shoot = keycode == SDL.Input.Keycode.z ? false : true; 
					return false;
				},

				touchDown = (screenX, screenY, pointer, button) => {
					x = screenX;
					y = screenY;
					mouseDown = true;
					return false;	
				},

				touchUp = (screenX, screenY, pointer, button) => {
					x = screenX;
					y = screenY;
					mouseDown = false;
					return false;						
				},

				touchDragged = (screenX, screenY, pointer) => {
					x = screenX;
					y = screenY;
					return false;						
				},
				
				mouseMoved = (screenX, screenY) => {
					x = screenX;
					y = screenY;
					return false;	
				}
			});
		}
	}
}
