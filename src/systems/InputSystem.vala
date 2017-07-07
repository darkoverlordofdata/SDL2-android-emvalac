using Entitas;
using Sdx;
namespace Systems 
{
	/**
	* game systems
	*/
	public class InputSystem : System 
	{

		const float FIRE_RATE = 0.1f;
		public InputSystem(Game game, Factory world) 
		{

			var x = 0;
			var y = 0;
			var mouseDown = false;
			var shoot = false;
			var timeToFire = FIRE_RATE;
			var player = world.GetGroup(Matcher.AllOf({ Components.PlayerComponent }));
			
			world.AddBackground(0, 0);
			world.AddPlayer(0, 0);
			/**
			 * get player input
			 */
			Execute = (delta) => 
			{
				player.GetSingleEntity().SetPosition(x, y);
				if (shoot || mouseDown) timeToFire -= delta;
				if (timeToFire < 0) 
				{
					world.AddBullet(x + 27, y + 2);
					world.AddBullet(x - 27, y + 2);
					timeToFire = FIRE_RATE;
				}
			};

			/**
			 * process input events
			 */
			Sdx.SetInputProcessor(InputProcessor() 
			{ 

				KeyDown = (keycode) => 
				{
					if (keycode == SDL.Input.Keycode.z) shoot = true;
					return false;
				},

				KeyUp = (keycode) => 
				{
					if (keycode == SDL.Input.Keycode.z) shoot = false;
					return false;
				},

				TouchDown = (screenX, screenY, pointer, button) => 
				{
					x = screenX;
					y = screenY;
					mouseDown = true;
					return false;
				},

				TouchUp = (screenX, screenY, pointer, button) => 
				{
					x = screenX;
					y = screenY;
					mouseDown = false;
					return false;
				},

				TouchDragged = (screenX, screenY, pointer) => 
				{
					x = screenX;
					y = screenY;
					return false;
				},

				MouseMoved = (screenX, screenY) => 
				{
					x = screenX;
					y = screenY;
					return false;
				}
			});
				
		}
			
	}
}