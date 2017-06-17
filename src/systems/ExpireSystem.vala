using entitas;
namespace systems {

	public delegate Group Lazy(World w);
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
						var exp = entity.expires.value - delta;
						entity.expires.value = (float)exp;
						if (entity.expires.value < 0)	
							world.deleteEntity(entity);
					}
				}
			};
		}
	}
}


