namespace Sdx.Graphics { 
	public struct Blit {
		SDL.Video.Rect source;
		SDL.Video.Rect dest;
		SDL.Video.RendererFlip flip;
	}
	
	public delegate Blit[] Compositor(int x, int y);	
    
}