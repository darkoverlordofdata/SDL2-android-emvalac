/*******************************************************************************
 * Copyright 2017 darkoverlordofdata.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
namespace Sdx.Ui 
{
/**
 * Game loop should check & fire events on components
 */
    public struct Dimension
    {
        public int width;
        public int height;
    }
	/**
	 * base UI Component
	 */
	public class Component : Object 
    {
		public enum Kind 
        {
			Window, Label, Button
        }
        public Component? parent;
        public SDL.Video.Window? root;
        public SDL.Video.Rect? bounds;
        public SDL.Video.Color? foreground;
        public SDL.Video.Color? background;
        public Sdx.Font? font;
        public bool visible;
        public bool enabled;
        public bool valid;
        public string name;
        public bool focus;
        public bool selected;
        public string text;
        public List<Component> controls;
        public Sdx.Graphics.Sprite[] image;
        public int index;

        public delegate void VirtualOnMouseClick();
        public delegate void VirtualOnMouseLeave();
        public delegate void VirtualOnMouseEnter();
        public VirtualOnMouseClick OnMouseClick = () => {};
        public VirtualOnMouseEnter OnMouseEnter = () => {};
        public VirtualOnMouseLeave OnMouseLeave = () => {};

        public int width 
        {
            get { return (int)bounds.w;}
        }
         
        public int height 
        {
            get { return (int)bounds.h;}
        }

        public Component(int x=0, int y=0, int w=0, int h=0) 
        {
            bounds = { x, y, w, h };
            visible = false;
            focus = true;
            controls = new List<Component>();
        }

        public void Render(int x = 0, int y = 0)
        {
            x += bounds.x;
            y += bounds.y;

            if (index < image.length)
                image[index].Render(x, y);

            foreach (var child in controls) {
                child.Render(x, y);
            }
        }

        public void Add(Component child) 
        {
            controls.Add(child);
            child.parent = this;
        }
        public Component SetPos(int x, int y)
        {
            bounds.x = x;
            bounds.y = y;
            return this;
        }



    }
    public class Window : Component 
    {
        public Window(int h, int w, string name) 
        {
            base(0, 0, w, h);
            this.name = name;
            root = Sdx.Initialize(h, w, name);
            Sdx.ui = this;
        }
    }

    /**
     * A label is just a sprite that renders as a child of the components subsystem.
     * The sprite can be an image or generated from text, or ...
     */
    public class Button : Component 
    {
        public Button()
        {
            base();
			Sdx.SetInputProcessor(InputProcessor() 
			{ 
				TouchDown = (x, y, pointer, button) => 
				{
                    if (Test(x, y)) OnMouseClick();
					return false;
				},

				TouchUp = (x, y, pointer, button) => 
				{
					return false;
				},

				TouchDragged = (x, y, pointer) => 
				{
                    Test(x, y);
					return false;
				},

				MouseMoved = (x, y) => 
				{
                    Test(x, y);
					return false;
                }
            });
            
        }

        public bool Test(int x, int y)
        {
            var test = bounds.HasIntersection({ x, y, 1, 1 });
            if (test && index == 0) index = 1;
            if (!test && index == 1) index = 0;
            return test;
        }
        
        public class Text : Button {
            public Text(string text, Font font, SDL.Video.Color fg, SDL.Video.Color? bg = null) 
            {
                base();
                this.text = text;
                this.font = font;
                foreground = fg;
                background = bg;
                index = 0;
                image = { new Sdx.Graphics.Sprite.TextSprite(this.text, this.font, foreground, background) };
                image[0].SetCentered(false);
                bounds.w = image[0].width;
                bounds.h = image[0].height;
            }
        }

        public class NinePatch : Button {
            public NinePatch(string text, Font font, SDL.Video.Color fg, string bg, string alt) 
            {
                base();
                this.text = text;
                this.font = font;
                foreground = fg;
                index = 0;
                image = { 
                    new Sdx.Graphics.Sprite.UISprite(Sdx.atlas.CreatePatch(bg), this.text, this.font, foreground, 100, 40),
                    new Sdx.Graphics.Sprite.UISprite(Sdx.atlas.CreatePatch(alt), this.text, this.font, foreground, 100, 40) 
                };
                image[0].SetCentered(false);
                image[1].SetCentered(false);
                bounds.w = image[0].width;
                bounds.h = image[0].height;
            }
        }
    }


}


