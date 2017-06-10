using entitas;
namespace systems {

	/**
	* game systems
	*/
	public class ScoreSystem : System {

		public ScoreSystem(Game game, Factory world) {
			Group? group = null;	

			initialize = () => {
				group = world.getGroup(Matcher.AllOf({
					Components.HealthComponent, 
					Components.TextComponent
				}));
			};
				

			execute = (delta) => {
				foreach (var entity in group.entities) {
					if (entity.isActive()) {
						var pct = "%d%%".printf((int)Math.fmin(100, (double)entity.health.current/(double)entity.health.maximum*100.0));
						if (pct != entity.text.text) {
							entity.text.text = pct;
							entity.text.sprite.setText(pct, sdx.smallFont, sdx.Color.LimeGreen);
							entity.text.sprite.x = (int)entity.position.x;
							entity.text.sprite.y = (int)entity.position.y;
						}
					}
				}
			};
		}
	}
}

