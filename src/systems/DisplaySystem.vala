using entitas;

namespace systems {
	/**
	* game systems
	*/
	public class DisplaySystem : Object {
		public static DisplaySystem instance; 
		public List<Entity*> sprites = new List<Entity*>();

		public DisplaySystem() {
			instance = this;
		}

		public void remove(Entity* e) {
			sprites.remove(e);
		}
		
		public void add(Entity* e) {
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

		public bool draw(Entity* e) {
			if (e.hasSprite()) {

				e.aabb.w = (int)((float)e.sprite.width * e.scale.x);
				e.aabb.h = (int)((float)e.sprite.height * e.scale.y);
				if (!e.isBackground()) {
					e.aabb.x = (int)((float)e.position.x - e.aabb.w / 2);
					e.aabb.y = (int)((float)e.position.y - e.aabb.h / 2);
					if (e.hasTint()) {
						e.sprite.sprite.texture.set_color_mod((uint8)e.tint.r, (uint8)e.tint.g, (uint8)e.tint.b);
						e.sprite.sprite.texture.set_alpha_mod((uint8)e.tint.a);
					}
				}
				sdx.renderer.copy(e.sprite.sprite.texture, null, 
					{ e.aabb.x, e.aabb.y, (uint)e.aabb.w, (uint)e.aabb.h });

			if (e.hasText())
				sdx.renderer.copy(e.text.sprite.texture, null, 
					{ (int)e.position.x, (int)e.position.y, e.text.sprite.width, e.text.sprite.height });
			}
			return true;
		}
	}
}