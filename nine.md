14x54






	--------------------------
	|       |       |       |
	|   1   |   2   |   3   |        
	|       |       |       |
	-------------------------
	|       |       |       |
	|       |       |       |
	|       |       |       |
	|   4   |   5   |   6   |       
	|       |       |       |
	|       |       |       |
	|       |       |       |
	--------------------------
	|       |       |       |
	|   7   |   8   |   9   |        
	|       |       |       |
	--------------------------
                                     
black brder pixels define the stretchable points

    1,3,7,9 - corners fixed
    2,8	- stretch horizontally
    4,6 - stretch vertically
    5 stretch both directions


Array of rect to define source
[
    { x = 2, y = 2, width = 13, height = 11 },
    { x = 15, y = 2, width = 7, height = 11 },
    { x = 22, y = 2, width = 12, height = 11 },
    { x = 2, y = 13, width = 13, height = 9 },
    { x = 15, y = 13, width = 7, height = 9 },
    { x = 22, y = 13, width = 12, height = 9 },
    { x = 2, y = 22, width = 13, height = 12 },
    { x = 15, y = 22, width = 7, height = 12 },
    { x = 22, y = 22, width = 12, height = 12 }
]

9 blits to define the composed sprite
	public struct Blit {
		SDL.Video.Rect source;
		SDL.Video.Rect dest;
		SDL.Video.RendererFlip flip;
	}
