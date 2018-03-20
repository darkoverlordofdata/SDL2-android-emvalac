using Entitas;
namespace Systems {

	/**
	* game systems
	*/
	public class SoundSystem : System {
		public SoundSystem(Game game, Factory world) {
			var effects = world.getGroup(Matcher.allOf({ Components.SoundComponent }));
			
			/**
			 * Remove exired entities
			 */
			execute = (delta) => {
				effects.entities.forEach(entity => {
					if (entity.isActive()) {
						entity.sound.sound.play();
					}
				});
			};
		}
	}
}


