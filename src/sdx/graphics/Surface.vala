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
		public static sdx.graphics.Surface[] cache;
		public static int uniqueId = 0;
		public SDL.Video.Surface surface;
		public int width;
		public int height;
		public int id = ++uniqueId;
		public string path;

		public Surface(string path) {

			this.path = path;
			var file = sdx.files.@default(path);
			surface = SDLImage.load_png(file.getRWops());
			surface.set_alphamod(0xff);
			width = surface.w;
			height = surface.h;
		}

		public static int indexOfPath(string path) {
			if (cache.length == 0) cache = new sdx.graphics.Surface[Pool.Count+1];
			for (var i=0; i<cache.length; i++) {
				if (cache[i] == null) {
					cache[i] = new sdx.graphics.Surface(path);
					return i;
				}
				if (cache[i].path == path) return i;
			}
			return -1;
		}

	}
}

