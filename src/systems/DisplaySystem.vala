using entitas;

namespace systems {
	/**
	* game systems
	*/
	public class DisplaySystem : Object {
		public static DisplaySystem instance; 
		public List<Entity*> sprites = new List<Entity*>();

		public static void add(Entity* e) {
			instance.addEntity(e);

		}
		public DisplaySystem() {
			instance = this;
		}

		public static void remove(Entity* e) {
			instance.sprites.remove(e);
		}
		
		public void addEntity(Entity* e) {
			var layer = e.layer.value;
			if (sprites.length() == 0) {
				sprites.append(e);
			} else {
				var i = 0;
				foreach (var s in sprites) {
					assert(s != null);
					if (layer <= s.layer.value) {
						sprites.insert(e, i);
						return;
					} else {
						i++;
					}
				}
				sprites.append(e);
			}
		}

		public bool draw(Entity* e, ref Transform t) {
			if (t.sprite != null) {

				t.aabb.w = (int)((float)t.sprite.width * t.scale.x);
				t.aabb.h = (int)((float)t.sprite.height * t.scale.y);
				if (t.sprite.centered) {
					t.aabb.x = (int)((float)t.position.x - t.aabb.w / 2);
					t.aabb.y = (int)((float)t.position.y - t.aabb.h / 2);
				}
				if (e.hasTint()) {
					t.sprite.texture.set_color_mod((uint8)e.tint.r, (uint8)e.tint.g, (uint8)e.tint.b);
					t.sprite.texture.set_alpha_mod((uint8)e.tint.a);
				}
				sdx.renderer.copy(t.sprite.texture, null, 
					{ t.aabb.x, t.aabb.y, (uint)t.aabb.w, (uint)t.aabb.h });

			if (e.hasText())
				sdx.renderer.copy(e.text.sprite.texture, null, 
					{ (int)t.position.x, (int)t.position.y, e.text.sprite.width, e.text.sprite.height });
			}
			return true;
		}
	}
}