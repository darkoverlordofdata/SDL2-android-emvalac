using entitas;
namespace systems {

	/**
	* game systems
	*/
	public class ExpireSystem : System {
		public ExpireSystem(Game game, Factory world) {

			var expiring = world.getGroup(Matcher.AllOf({Components.ExpiresComponent}));
			
			/**
			 * Remove exired entities
			 */
			execute = (delta) => {
				foreach (var entity in expiring.entities) {
					if (entity.isActive()) {
						entity.expires.value -= delta; 
						if (entity.expires.value < 0)	
							world.deleteEntity(entity);
					}
				}
			};
		}
	}
}


