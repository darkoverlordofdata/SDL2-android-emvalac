using SDL;
[Compact, CCode ( /** reference counting */
	ref_function = "sprite_retain", 
	unref_function = "sprite_release"
)]
public class Sprite {
	public int _retainCount = 1;
	public unowned Sprite retain() {
		GLib.AtomicInt.add (ref _retainCount, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
	}
	public extern void free();
		
    public SDL.Video.Texture texture;
    public uint16 w;
    public uint16 h;

    public Sprite(string file, SDL.Video.Renderer renderer) {
        //  SDL.Video.Surface temp = new SDL.Video.Surface.from_bmp(file);
        SDL.Video.Surface temp = SDLImage.load(file);
        if (temp == null) {
            print("Couldn't load %s: %s\n", file, SDL.get_error());
        }

        w = (uint16)temp.w;
        h = (uint16)temp.h; 
        texture = SDL.Video.Texture.create_from_surface(renderer, temp);
        if (texture == null) {
            print("Couldn't create texture: %s\n", SDL.get_error());
        }
        
    }
}
