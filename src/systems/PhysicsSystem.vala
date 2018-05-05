using Entitas;
namespace Systems {

	/**
	* game systems
	*/
	public class PhysicsSystem : System {
		public PhysicsSystem(Game game, Factory world) {
			var physics = world.getGroup(Matcher.allOf({ Components.VelocityComponent }));

			/**
			* physics system
			* model movement
			*/
<<<<<<< HEAD
			update = (delta) => {
=======
			execute = (delta) => {
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				physics.entities.forEach(it => {
					if (it.isActive()) {

						var x = it.transform.position.x + it.velocity.x * delta;
						var y = it.transform.position.y + it.velocity.y * delta;
						it.setPosition(x, y);

						switch (it.pool) {
							case Pool.ENEMY1:
								if (it.transform.position.y > game.height)  {
									world.deleteEntity(it.setShow(false));
								}
								break;
								
							case Pool.ENEMY2:
								if (it.transform.position.y > game.height) {
									world.deleteEntity(it.setShow(false));
								}
								break;
								
							case Pool.ENEMY3:
								if (it.transform.position.y > game.height) {
									world.deleteEntity(it.setShow(false));
								}
								break;
								
							case Pool.BULLET:
								if (it.transform.position.y < 0) {
									world.deleteEntity(it.setShow(false));
								}
								break;
						}
					}
				});
			};
		}
	}
}



