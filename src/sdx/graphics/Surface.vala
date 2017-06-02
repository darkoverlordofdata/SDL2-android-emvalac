namespace sdx.graphics {

	/**
	 * a reference counted wrapper for surface
	 * keeps all the requires surfaced cahced in memory
	 * prevents the surface memory from being reclaimed 
	 * prevents loading the same surface again & again -
	 * which causes emscripten to fail
	 * 
	 */
	
	public class Surface : Object {
		public static int uniqueId = 0;
		public SDL.Video.Surface surface;
		public int width;
		public int height;
		public int id = ++uniqueId;
		public string path;

		public Surface(string path) {

			this.path = path;
//  #if (EMSCRIPTEN)			
//  			// just use the path as is
//  			var file = sdx.files.relative(path);
//  #elif (ANDROID)				
//  			// from the *.apk asset folder
//  			var file = sdx.files.asset(path);
//  #else					
//  			// from GResource
//  			var file = sdx.files.resource(path);
//  #endif
			var file = sdx.files.@default(path);
			surface = SDLImage.load_png(file.getRWops());
			surface.set_alphamod(0xff);
			width = surface.w;
			height = surface.h;
		}
	}
}

