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
						
<<<<<<< HEAD
			update = (delta) => {
=======
			execute = (delta) => {
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				player.setPosition(x, y);
				if (shoot || mouseDown) timeToFire -= delta;
				if (timeToFire < 0) {
					world.addBullet(x + 27, y + 2);
					world.addBullet(x - 27, y + 2);
					timeToFire = FIRE_RATE;
				}
			};

<<<<<<< HEAD
			addInputEvents(InputEvents(){

				keyDown = (keycode) => {
					shoot = keycode == SDL.Input.Keycode.z ? true : false; 
					return false;
				},
				
				keyUp = (keycode) => {
					shoot = keycode == SDL.Input.Keycode.z ? false : true; 
					return false;
				},

=======
			addInputEvents(InputEvents() {
				keyDown = (keycode) => {
					shoot = keycode == SDL.Input.Keycode.z ? true : false; 
					return false;
				},
				keyUp = (keycode) => {
					shoot = keycode == SDL.Input.Keycode.z ? false : true; 
					return false;
				},
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				touchDown = (screenX, screenY, pointer, button) => {
					x = screenX;
					y = screenY;
					mouseDown = true;
					return false;	
				},
<<<<<<< HEAD

=======
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				touchUp = (screenX, screenY, pointer, button) => {
					x = screenX;
					y = screenY;
					mouseDown = false;
					return false;						
				},
<<<<<<< HEAD

=======
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				touchDragged = (screenX, screenY, pointer) => {
					x = screenX;
					y = screenY;
					return false;						
				},
<<<<<<< HEAD
				
=======
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				mouseMoved = (screenX, screenY) => {
					x = screenX;
					y = screenY;
					return false;	
				}
			});
		}
	}
}
