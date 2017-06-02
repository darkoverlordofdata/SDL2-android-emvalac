/**
 * Texture.gs
 *
 */
using SDL;
using SDLImage;
using SDLTTF;
using GLib;
using sdx;
using sdx.files;

namespace sdx.graphics {

    public class Texture : Object {
        public Video.Surface data;
        //  public int index;
        public string path;
        public int width {
            get { return data.w; }
            //  get { return Sprite.cache[index].width; }
        }
        public int height {
            get { return data.h; }
            //  get { return Sprite.cache[index].height; }
        }

        public Texture(FileHandle file) {
            path = file.getPath();
            var raw = file.getRWops();
            print("CALL getSurface |%s|\n", file.getPath());
            data = getSurface(file.getExt(), raw);
        }


        public void setFilter(int minFilter, int magFilter) {}
        public void setWrap(int u, int v) {}

        /**
         *  Load a Surface from raw memory
         *
         * @param ext file extension (encoding)
         * @param raw RWops memory ptr
         * @param the new Surface
         */

        public static Video.Surface getSurface(string ext, RWops raw) {
            switch (ext) {
                case ".cur":
                    return SDLImage.load_cur(raw);
                case ".ico":
                    return SDLImage.load_ico(raw);
                case ".bmp":
                    return SDLImage.load_bmp(raw);
                case ".pnm":
                    return SDLImage.load_pnm(raw);
                case ".xpm":
                    return SDLImage.load_xpm(raw);
                case ".xcf":
                    return SDLImage.load_xcf(raw);
                case ".pvx":
                    return SDLImage.load_pcx(raw);
                case ".gif":
                    return SDLImage.load_gif(raw);
                case ".jpg":
                    return SDLImage.load_jpg(raw);
                case ".tif":
                    return SDLImage.load_tif(raw);
                case ".png":
                    return SDLImage.load_png(raw);
                case ".tga":
                    return SDLImage.load_tga(raw);
                case ".lbm":
                    return SDLImage.load_lbm(raw);
                case ".xv":
                    return SDLImage.load_xv(raw);
                case ".webp":
                    return SDLImage.load_webp(raw);
                
            }
            throw new SdlException.UnableToLoadSurface(ext);
            return null;
        }
    }
}
        
