using SDL;

public class Sprite : Object {
    public SDL.Video.Texture texture;
    public uint16 w;
    public uint16 h;

    public Sprite(string file, SDL.Video.Renderer renderer) {
        SDL.Video.Surface temp = new SDL.Video.Surface.from_bmp(file);
        if (temp == null)
        {
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




//  public Sprite LoadSprite(string file, SDL.Video.Renderer renderer) {
//      SDL.Video.Surface temp = new SDL.Video.Surface.from_bmp(file);
//      if (temp == null)
//      {
//          print("Couldn't load %s: %s\n", file, SDL.get_error());
//          return Sprite() { w = 0, h = 0, texture = null};
//      }

//      Sprite result = Sprite() { 
//          w = (uint16)temp.w,  
//          h = (uint16)temp.h, 
//          texture = SDL.Video.Texture.create_from_surface(renderer, temp)
//      };
//      if (result.texture == null) {
//          print("Couldn't create texture: %s\n", SDL.get_error());
//      }
//      return result;
//  }


public void draw(SDL.Video.Window window, SDL.Video.Renderer renderer, Sprite sprite)
{
    int w, h;

    window.get_size(out w, out h);

    SDL.Video.Rect destRect = { w/2 - sprite.w/2, h/2 - sprite.h/2, sprite.w, sprite.h };
    /* Blit the sprite onto the screen */
    renderer.copy(sprite.texture, null, destRect);
}

public int main(string args[]) {
    
    SDL.Video.Window window;
    SDL.Video.Renderer renderer;

    if (SDL.Video.Renderer.create_with_window(0, 0, 0, out window, out renderer) < 0)
        return 2;

    Sprite sprite = new Sprite("sample.bmp", renderer);
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
	    if(event.type == SDL.EventType.QUIT || event.type == SDL.EventType.KEYDOWN
               || event.type == SDL.EventType.FINGERDOWN)
            {
                done = true;
            }
        } while (SDL.Event.poll(out event)>0);
        
        
        /* Draw a gray background */
        renderer.set_draw_color(0x00, 0x00, 0x00, 0xFF);
        renderer.clear();
        
        draw(window, renderer, sprite);
    
        /* Update the screen! */
        renderer.present();
    }

    return 0;
}