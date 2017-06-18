using entitas;
namespace systems {

	/**
	* game systems
	*/
	public class PhysicsSystem : System {
		public PhysicsSystem(Game game, Factory world) {

			var physics = world.getGroup(Matcher.AllOf({Components.VelocityComponent}));

			/**
			* physics system
			* model movement
			*/
			execute = (delta) => {

				foreach (var entity in physics.entities)  {
					if (entity.isActive()) {

						var x = entity.transform.position.x + entity.velocity.x * delta;
						var y = entity.transform.position.y + entity.velocity.y * delta;
						entity.setPosition(x, y);
					}
				}
			};
		}
	}
}



