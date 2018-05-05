using Entitas;
namespace Systems {

	/**
	* game systems
	*/
	public class ExpireSystem : System {
		public ExpireSystem(Game game, Factory world) {
			var expiring = world.getGroup(Matcher.allOf({ Components.ExpiresComponent }));
			
			/**
			 * Remove exired entities
			 */
			update = (delta) => {
				expiring.entities.forEach(entity => {
					if (entity.isActive()) {
						entity.expires.value -= delta; 
						if (entity.expires.value < 0)	
							world.deleteEntity(entity.setShow(false));
					}
				});
			};
		}
	}
}


