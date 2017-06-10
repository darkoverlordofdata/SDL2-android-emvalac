using entitas;
namespace systems {
	/**
	* game systems
	*/
	public class ExpireSystem : System {
		public ExpireSystem(Game game, Factory world) {

			Group? expiring = null;

			initialize = () => {
				expiring = world.getGroup(Matcher.AllOf({Components.ExpiresComponent}));
			};


			/**
			 * Remove exired entities
			 */
			execute = (delta) => {
				foreach (var entity in expiring.entities) {
					if (entity.isActive()) {
						var exp = entity.expires.value - delta;
						entity.expires.value = exp;
						if (entity.expires.value < 0)	
							world.deleteEntity(entity);
					}
				}
			};
		}
	}
}


