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
[Compact, CCode ( /** reference counting */
	ref_function = "text_retain", 
	unref_function = "text_release"
)]
public class Text {
	public int _retainCount = 1;
	public unowned Text retain() {
		GLib.AtomicInt.add (ref _retainCount, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
	}
	public extern void free();
		
    public SDL.Video.Texture texture;
    public SDL.Video.Surface surface;
    public SDLTTF.Font font;
    public uint16 w;
    public uint16 h;

    public Text(string text, SDL.Video.Renderer renderer) {
        font = new SDLTTF.Font("assets/fonts/OpenDyslexic-Bold.otf", 32);
        surface = font.render("FRed", sdx.Color.LimeGreen);
        if (surface == null) {
            Android.log_write(Android.LogPriority.ERROR, "Text", "Surface is null");
            Android.log_write(Android.LogPriority.ERROR, "Text", SDL.get_error());
            return;
        }
        w = (uint16)surface.w;
        h = (uint16)surface.h; 
        //  surface.set_alphamod(sdx.Color.LimeGreen.a);
        //  texture = SDL.Video.Texture.create_from_surface(renderer, surface);
        //  texture.set_blend_mode(SDL.Video.BlendMode.BLEND);
        
    }
}
