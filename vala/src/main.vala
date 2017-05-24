public errordomain SdlException {
    Initialization,
    ImageInitialization,
    TtfInitialization,
    TextureFilteringNotEnabled,
    OpenWindow,
    CreateRenderer
}

public int main(string args[]) {
    


    if (SDL.init(SDL.InitFlag.VIDEO | SDL.InitFlag.TIMER | SDL.InitFlag.EVENTS) < 0)
        throw new SdlException.Initialization(SDL.get_error());


    if (SDLImage.init(SDLImage.InitFlags.PNG) < 0)
        throw new SdlException.ImageInitialization(SDL.get_error());

    if (!SDL.Hint.set_hint(SDL.Hint.RENDER_SCALE_QUALITY, "1"))	
        throw new SdlException.TextureFilteringNotEnabled(SDL.get_error());

    if (SDLTTF.init() == -1)
        throw new SdlException.TtfInitialization(SDL.get_error());
    
    SDL.Video.Window window;
    SDL.Video.Renderer renderer;

    if (SDL.Video.Renderer.create_with_window(0, 0, 0, out window, out renderer) < 0)
        return 2;

    Sprite sprite = new Sprite("assets/images/background.png", renderer);
    //  Sprite sprite = new Sprite("sample.png", renderer);
    if(sprite.texture == null)
        return 2;

    Text text = new Text("Dude!", renderer);        
    //  if(text.texture == null)
    //      return 2;

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
        if (text.texture == null) {
            renderer.set_draw_color(0x00, 0x00, 0xff, 0xFF);
        } else {
            renderer.set_draw_color(sdx.Color.LightSteelBlue.r, sdx.Color.LightSteelBlue.g, sdx.Color.LightSteelBlue.b, sdx.Color.LightSteelBlue.a);
        }
        renderer.clear();
        
        //renderer.copy(sprite.texture, null, null);

        renderer.copy(text.texture, null, { 100, 100, text.w, text.h } );
    
        /* Update the screen! */
        renderer.present();
    }

    return 0;
}

/** compiler trick needed to force compilation */
public class Zed : Object {
    public Zed(string file, SDL.Video.Renderer renderer) {
        SDL.Video.Surface never = SDLImage.load(file);
        }
}

