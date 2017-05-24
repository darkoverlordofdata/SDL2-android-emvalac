namespace sdx.graphics {
	/**sdx_graphics_texture_atlas_inner_class_release
	 * 
	 */
[Compact, CCode ( /** reference counting */
	ref_function = "sdx_graphics_texture_atlas_retain", 
	unref_function = "sdx_graphics_texture_atlas_release"
)]
public class TextureAtlas {
	public int _retainCount = 1;
	public unowned TextureAtlas retain() {
		GLib.AtomicInt.add (ref _retainCount, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
	}
	public extern void free();
		

        public InnerClass x;
            [Compact, CCode ( /** reference counting */
            	ref_function = "sdx_graphics_texture_atlas_innerclass_retain", 
            	unref_function = "sdx_graphics_texture_atlas_innerclass_release"
            )]
            public class InnerClass {
            	public int _retainCount = 1;
            	public unowned InnerClass retain() {
            		GLib.AtomicInt.add (ref _retainCount, 1);
            		return this;
            	}
            	public void release() { 
            		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
            	}
            	public extern void free();
		

            public string name;

            public InnerClass() {
                print("this is na inner test\n");
                name = "frodo";
            }
        }


        public TextureAtlas() {
            x = new InnerClass();
            print("this is a test\n");

        }

        public InnerClass createInner() {
            return new InnerClass();
        }
    }
}