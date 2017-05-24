public void draw(SDL.Video.Window window, SDL.Video.Renderer renderer, Sprite sprite)
{
    int w, h;

    window.get_size(out w, out h);

    //  SDL.Video.Rect destRect = { w/2 - sprite.w/2, h/2 - sprite.h/2, sprite.w, sprite.h };
    SDL.Video.Rect destRect = { 0, 0, sprite.w, sprite.h };
    /* Blit the sprite onto the screen */
    renderer.copy(sprite.texture, null, null);
}

public int main(string args[]) {
    
    SDL.Video.Window window;
    SDL.Video.Renderer renderer;

    if (SDL.Video.Renderer.create_with_window(0, 0, 0, out window, out renderer) < 0)
        return 2;

    Sprite sprite = new Sprite("assets/images/background.png", renderer);
    //  Sprite sprite = new Sprite("sample.png", renderer);
    if(sprite.texture == null)
        return 2;

    /* Main render loop */
    bool done = false;
    SDL.Event event;
    while(!done)
    {
        /* Wait for events */
        SDL.Event.wait(out event);
        do {
	    if (event.type == SDL.EventType.QUIT || event.type == SDL.EventType.KEYDOWN
               || event.type == SDL.EventType.FINGERDOWN) {
                done = true;
            }
        } while (SDL.Event.poll(out event) > 0);
        
        
        /* Draw a gray background */
        renderer.set_draw_color(0x00, 0x00, 0xff, 0xFF);
        renderer.clear();
        
        draw(window, renderer, sprite);
    
        /* Update the screen! */
        renderer.present();
    }

    return 0;
}

/** compiler trick needed to force compilation */
[Compact, CCode ( /** reference counting */
	ref_function = "zed_retain", 
	unref_function = "zed_release"
)]
public class Zed {
	public int _retainCount = 1;
	public unowned Zed retain() {
		GLib.AtomicInt.add (ref _retainCount, 1);
		return this;
	}
	public void release() { 
		if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
	}
	public extern void free();
		
    public Zed(string file, SDL.Video.Renderer renderer) {
        SDL.Video.Surface never = SDLImage.load(file);
        }
}

