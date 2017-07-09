using Entitas;
using Sdx.Graphics;

namespace Systems 
{
	/**
	* Display systems
	*/
	public class DisplaySystem : Object 
	{
		public List<Entity*> sprites = new List<Entity*>();

		public DisplaySystem(Game game, Factory world) 
		{
			
			var show = world.GetGroup(Matcher.AllOf({ Components.ShowComponent }));

			show.onEntityAdded.Add(OnEntityAdded);
			show.onEntityRemoved.Add(OnEntityRemoved);

		}

		public void OnEntityAdded(Group group, Entity* entity, int index,  void* component) 
		{
			var layer = entity.layer.value;
			if (sprites.Length() == 0) 
			{
				sprites.Add(entity);
			} 
			else 
			{
				var i = 0;
				foreach (var s in sprites) 
				{
					assert(s != null);
					if (layer <= s.layer.value) 
					{
						sprites.Insert(entity, i);
						return;
					} 
					else 
					{
						i++;
					}
				}
				sprites.Add(entity);
			}
		}

		public void OnEntityRemoved(Group group, Entity* entity, int index,  void* component) 
		{
			sprites.Remove(entity);
		}

		public bool Draw(Entity* e, ref Transform t) 
		{
			if (t.sprite != null) 
			{

				t.aabb.w = (int)((float)t.sprite.width * t.scale.x);
				t.aabb.h = (int)((float)t.sprite.height * t.scale.y);
				if (t.sprite.centered) 
				{
					t.aabb.x = (int)((float)t.position.x - t.aabb.w / 2);
					t.aabb.y = (int)((float)t.position.y - t.aabb.h / 2);
				}
				if (e.HasTint()) 
				{
					t.sprite.texture.SetColorMod((uint8)e.tint.r, (uint8)e.tint.g, (uint8)e.tint.b);
					t.sprite.texture.SetAlphaMod((uint8)e.tint.a);
				}
				Sdx.renderer.Copy(t.sprite.texture, null, 
					{ t.aabb.x, t.aabb.y, (uint)t.aabb.w, (uint)t.aabb.h });

			if (e.HasText())
				Sdx.renderer.Copy(e.text.sprite.texture, null, 
					{ 
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
