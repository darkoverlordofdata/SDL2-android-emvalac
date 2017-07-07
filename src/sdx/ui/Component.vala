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
	/**
	 * base Component
	 */
	public class Component : Object 
    {
		public delegate void VirtualSelect();

		public enum Kind 
        {
			Window, Label, Button
		}
        public enum State 
        {
            Normal, Hover, Select
        }
        public bool visible;
        public bool focus;
        public bool decorate;
        public bool selected;
        public SDL.Video.Color bg;
        public SDL.Video.Color fg;
        public SDL.Video.Rect rect;
        public Sdx.Font font;
        public string text;
        public Component? parent;
        public List<Component> controls;
        public Sdx.Graphics.Sprite? image;

        public Component(int x=0, int y=0, int w=0, int h=0) 
        {
            rect = { x, y, w, h };
            visible = false;
            focus = true;
            controls = new List<Component>();
        }

        public void Add(Component child) 
        {
            controls.Add(child);
            child.parent = this;
        }

		public VirtualSelect Select = () => {};

        public class Window : Component 
        {
            public Window(bool decorate, int x, int y, int h, int w) 
            {
                base(x, y, w, h);
                bg = Sdx.Color.White;
            }
            public void Draw() {}
        }

        public class Label : Component 
        {
            public Label(string text, int x, int y) 
            {
                base(x, y);
                this.text = text;
                font = Sdx.smallFont;
                fg = Sdx.Color.Black;
            }
            public void Draw() {}
        }

        public class Button : Component 
        {
            public Button(string text, int x, int y) 
            {
                base(x, y);
                this.text = text;
                font = Sdx.smallFont;
                fg = Sdx.Color.Black;
                
                Select = () => 
                {
                    print("Hello");
                };
            }
            public void Draw() {}
       }
    }
}