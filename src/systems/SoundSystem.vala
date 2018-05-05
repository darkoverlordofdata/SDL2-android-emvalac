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
<<<<<<< HEAD
			update = (delta) => {
=======
			execute = (delta) => {
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
				effects.entities.forEach(entity => {
					if (entity.isActive()) {
						entity.sound.sound.play();
					}
				});
			};
		}
	}
}


