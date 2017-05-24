using SDL;

public class Sprite : Object {
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

public class Text : Object {
    public SDL.Video.Texture texture;
    public SDL.Video.Surface surface;
    public SDLTTF.Font font;
    public uint16 w;
    public uint16 h;

    public Text(string text, SDL.Video.Renderer renderer) {
        font = new SDLTTF.Font("assets/fonts/OpenDyslexic-Bold.otf", 48);
        surface = font.render("Hello World", sdx.Color.Black);
        if (surface == null) {
            Android.log_write(Android.LogPriority.ERROR, "Text", "Surface is null");
            Android.log_write(Android.LogPriority.ERROR, "Text", SDL.get_error());
            return;
        }
        w = (uint16)surface.w;
        h = (uint16)surface.h; 
        //  surface.set_alphamod(sdx.Color.Black.a);
        texture = SDL.Video.Texture.create_from_surface(renderer, surface);
        texture.set_blend_mode(SDL.Video.BlendMode.BLEND);
        
    }
}
