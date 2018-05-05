using Entitas;
namespace Systems {

	/**
	* game systems
	*/
	public class RemoveSystem : System {
		public RemoveSystem(Game game, Factory world) {
			var moving = world.getGroup(Matcher.allOf({Components.VelocityComponent}));
			
			/**
			 * Remove entities that have gone off-screen
			 */
			update = (delta) => {
				foreach (var entity in moving.entities) {
					if (entity.isActive()) {
						//  switch (entity.pool) {
						//  	case Pool.ENEMY1:
						//  		if (entity.transform.position.y > game.height) world.deleteEntity(entity);
						//  		break;
								
						//  	case Pool.ENEMY2:
						//  		if (entity.transform.position.y > game.height) world.deleteEntity(entity);
						//  		break;
								
						//  	case Pool.ENEMY3:
						//  		if (entity.transform.position.y > game.height) world.deleteEntity(entity);
						//  		break;
								
						//  	case Pool.BULLET:
						//  		if (entity.transform.position.y < 0) world.deleteEntity(entity);
						//  		break;
						//  }
					}
				}
			};
		}
	}
}


