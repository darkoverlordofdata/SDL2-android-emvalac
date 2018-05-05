using Entitas;
using Sdx;
using Sdx.Graphics;

namespace Systems {
	/**
	* Display systems
	*/
	public class DisplaySystem : System {
		//  public static List<Entity*>? sprites;

		public DisplaySystem(Game game, Factory world) {

			List<Entity*> sprites = new List<Entity*>();

			/**
			 * Wire up the events
			 */
			var show = world.getGroup(Matcher.allOf({ Components.ShowComponent }));
			/**
			 * Remove the entity from the display
			 */
			show.onEntityRemoved.add((group, entity, index, comp) => {
				sprites.remove(entity);
			});
			/**
			 * Add the entity to the display 
			 * insert in z-Order
			 */
			show.onEntityAdded.add((group, entity, index, comp) => {
				var layer = entity.layer.value;
				if (sprites.length() == 0) 
					sprites.add(entity);
				else {
					var i = 0;
					foreach (var sprite in sprites) {
						if (layer <= sprite.layer.value) {
							sprites.insert(entity, i);
							return;
						} 
						i++;
					}
					sprites.add(entity);
				}
			});


			draw = () => {
				Sdx.begin();
				sprites.forEach(entity => drawSprite(entity, ref entity.transform));
				Sdx.ui.render();
				Sdx.end();
			};
		}

		public bool drawSprite(Entity* e, ref Transform t) {
			if (!e.isActive()) return false;
			if (t.sprite != null) {

				t.aabb.w = (int)((float)t.sprite.width * t.scale.x);
				t.aabb.h = (int)((float)t.sprite.height * t.scale.y);
				if (t.sprite.centered) {
					t.aabb.x = (int)((float)t.position.x - t.aabb.w / 2);
					t.aabb.y = (int)((float)t.position.y - t.aabb.h / 2);
				}
				if (e.hasTint()) {
					t.sprite.texture.SetColorMod((uint8)e.tint.r, (uint8)e.tint.g, (uint8)e.tint.b);
					t.sprite.texture.SetAlphaMod((uint8)e.tint.a);
				}
				Sdx.render(t.sprite.texture, null, 
					{ t.aabb.x, t.aabb.y, (uint)t.aabb.w, (uint)t.aabb.h });

			if (e.hasText())
				Sdx.render(e.text.sprite.texture, null, { 
						(int)t.position.x, 
						(int)t.position.y, 
						e.text.sprite.width, 
						e.text.sprite.height 
					});
			}
			return true;
		}
	}
}
