namespace Sdx {
	
	public class Font : Object {
		public static int uniqueId = 0;
		public int id = ++uniqueId;
		public string path;
		public int size;
		public SDLTTF.Font innerFont;
		public SDL.RWops raw;


		public Font(string path, int size) {
			
			var file = Sdx.Files.Default(path);
			raw = file.GetRWops();
			innerFont = new SDLTTF.Font.RW(raw, 0, size);
			this.path = path;
			this.size = size;
		}


		/**
		 *  Render text for Sprite.fromRenderedText
		 *
		 * @param text to generate surface from
		 * @param color foreground color of text
		 * @return new Surface
		 */
		public SDL.Video.Surface Render(string text, SDL.Video.Color color) {
			return innerFont.render(text, color);
		}
	}
}

