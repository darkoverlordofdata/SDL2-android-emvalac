using entitas;
namespace systems {

	/**
	* game systems
	*/
	public class ScoreSystem : System {

		public ScoreSystem(Game game, Factory world) {

			var group = world.getGroup(Matcher.AllOf({
				Components.HealthComponent, 
				Components.TextComponent
			}));

			execute = (delta) => {
				foreach (var entity in group.entities) {
					if (entity.isActive()) {
						var score = (int)Math.fmin(100, (float)entity.health.current/(float)entity.health.maximum*100);
						var pct = ((double)score).to_string();
						if (pct != entity.text.text) {
							entity.text.text = pct;
							entity.text.sprite.setText(pct, sdx.smallFont, sdx.Color.LimeGreen);
							entity.text.sprite.x = (int)entity.transform.position.x;
							entity.text.sprite.y = (int)entity.transform.position.y;
						}
					}
				}
			};
		}
	}
}

