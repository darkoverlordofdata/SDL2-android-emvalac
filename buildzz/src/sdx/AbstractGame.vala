/* ******************************************************************************
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
using SDL;
using SDL.Video;
using SDLImage;

namespace Sdx 
{
     [Compact, CCode ( /** reference counting */
     	ref_function = "sdx_abstract_reference_retain", 
     	unref_function = "sdx_abstract_reference_release"
     )]
     public class AbstractReference {
     	public int ref_count = 1;
     	public unowned AbstractReference retain() {
     		GLib.AtomicInt.add (ref ref_count, 1);
     		return this;
     	}
     	public void release() { 
     		if (GLib.AtomicInt.dec_and_test (ref ref_count)) this.free ();
     	}
     	public extern void free();
		}
    /**
     * Base game object
     */
    [Compact, CCode ( /** reference counting */
    	ref_function = "sdx_abstract_game_retain", 
    	unref_function = "sdx_abstract_game_release"
    )]
    public class AbstractGame {
    	public int ref_count = 1;
    	public unowned AbstractGame retain() {
    		GLib.AtomicInt.add (ref ref_count, 1);
    		return this;
    	}
    	public void release() { 
    		if (GLib.AtomicInt.dec_and_test (ref ref_count)) this.free ();
    	}
    	public extern void free();
		
		public int width;
		public int height;
		public delegate void AbstractUpdate();
		public delegate void AbstractDraw();
		public AbstractUpdate Update = () => {};
		public AbstractDraw Draw = () => {};
		public AbstractGame() 
		{
			// forces the subclassed lambda context to be reference counted
			var r = new AbstractReference();
		}
		public void Start() 
		{
			Sdx.Start();
		}
	}
 
    /**
     * Base platformer object
     */
[Compact, CCode ( /** reference counting */
	ref_function = "sdx_abstract_platform_retain", 
	unref_function = "sdx_abstract_platform_release"
)]
public class AbstractPlatform {
	public int ref_count = 1;
	public unowned AbstractPlatform retain() {
		GLib.AtomicInt.add (ref ref_count, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref ref_count)) this.free ();
	}
	public extern void free();
		
		public int width;
		public int height;
		public delegate void AbstractUpdate(int tick);
		public delegate void AbstractDraw(int tick);
		public AbstractUpdate Update = (tick) => {};
		public AbstractDraw Draw = (tick) => {};
		public AbstractPlatform() 
		{
			// forces the subclassed lambda context to be reference counted
			var r = new AbstractReference();
		}
	}
 
    
} 