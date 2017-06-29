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

						switch (entity.pool) {
							case Pool.ENEMY1:
								if (entity.transform.position.y > game.height) world.deleteEntity(entity);
								break;
								
							case Pool.ENEMY2:
								if (entity.transform.position.y > game.height) world.deleteEntity(entity);
								break;
								
							case Pool.ENEMY3:
								if (entity.transform.position.y > game.height) world.deleteEntity(entity);
								break;
								
							case Pool.BULLET:
								if (entity.transform.position.y < 0) world.deleteEntity(entity);
								break;
						}
					}
				}
			};
		}
	}
}



