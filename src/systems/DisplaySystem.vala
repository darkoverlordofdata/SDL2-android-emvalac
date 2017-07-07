using Entitas;
using Sdx.Graphics;

namespace Systems 
{
	/**
	* game systems
	*/
	public class DisplaySystem : Object 
	{
		public static DisplaySystem instance; 
		public List<Entity*> sprites = new List<Entity*>();
		public NinePatch btn9;
		public Sprite button;

		public static void Add(Entity* e) 
		{
			instance.AddEntity(e);
		}
		
		public DisplaySystem(Factory world) 
		{
			instance = this;
			btn9 = Factory.atlas.CreatePatch("btnPressed");
			//  button = new Sprite.NineSliceSprite(btn9);
			button = new Sprite.UISprite(btn9, "Click Me", Sdx.font, Sdx.Color.Black);

		}

		public void Test()
		{

			Sdx.renderer.Copy(button.texture, null, { 100, 100, button.width, button.height } );			
		}
		public void AddEntity(Entity* e) 
		{
			//sprites.ForEach(it => Sdx.Log(it.ToString()));

			var layer = e.layer.value;
			if (sprites.Length() == 0) 
			{
				sprites.Add(e);
			} 
			else 
			{
				var i = 0;
				foreach (var s in sprites) 
				{
					assert(s != null);
					if (layer <= s.layer.value) 
					{
						sprites.Insert(e, i);
						return;
					} 
					else 
					{
						i++;
					}
				}
				sprites.Add(e);
			}
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