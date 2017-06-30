/**
 * TextureRegion.gs
 *
 */
using GLib;
using Sdx.Graphics;

namespace Sdx.Graphics {

    public class TextureRegion : Object {
        public Surface.TextureSurface? texture;
        public int top;
        public int left;
        public int width;
        public int height;
        public int regionWidth;
        public int regionHeight;
        public float u;
        public float v;
        public float u2;
        public float v2;

        public TextureRegion(Surface.TextureSurface texture, int x=0, int y=0, int width=0, int height=0) {
            width = width == 0 ? texture.width : width;
            height = height == 0 ? texture.height : height;
            this.texture = texture;
            this.top = x;
            this.left = y;
            this.width = width;
            this.height = height; 
            SetRegionXY(x, y, width, height);
        }

        public void SetRegion(float u, float v, float u2, float v2) {
            var texWidth = this.width;
            var texHeight = this.height;
            regionWidth =(int)GLib.Math.round(GLib.Math.fabs(u2 - u) * texWidth);
            regionHeight =(int)GLib.Math.round(GLib.Math.fabs(v2 - v) * texHeight);
            if (regionWidth == 1 && regionHeight == 1) {
                var adjustX = 0.25f / texWidth;
                u = adjustX;
                u2 = adjustX;
                var adjustY = 0.25f / texHeight;
                v = adjustY;
                v2 = adjustY;
            }
        }

        public void SetRegionXY(int x, int y, int width, int height) {
            var invTexWidth = 1 / this.width;
            var invTexHeight = 1 / this.height;
            SetRegion(x * invTexWidth, y * invTexHeight,(x + width) * invTexWidth,(y + height) * invTexHeight);
            regionWidth =(int)GLib.Math.fabs(width);
            regionHeight =(int)GLib.Math.fabs(height);
        }

        public void SetByRegion(TextureRegion region) {
            texture = region.texture;
            SetRegion(region.u, region.v, region.u2, region.v2);
        }

        public void SetByRegionXY(TextureRegion region, int x, int y, int width, int height) {            
            texture = region.texture;
            SetRegionXY(region.GetRegionX()+x, region.GetRegionY()+y, width, height);
        }

        public void Flip(bool x, bool y) {
            if (x) {
                var temp = u;
                u = u2;
                u2 = temp;
            }
            if (y) {
                var temp = v;
                v = v2;
                v2 = temp;
            }
        }

        public float GetU() { 
            return u;
        }

        public void SetU(float u) { 
            this.u = u;
            regionWidth = (int)GLib.Math.round(GLib.Math.fabs(u2 - u) * this.width);
        }

        public float GetV() {
            return v;
        }

        public void SetV(float v) { 
            this.v = v;
            regionHeight = (int)GLib.Math.round(GLib.Math.fabs(v2 - v) * this.height);
        }

        public float GetU2() {
            return u2;
        }

        public void SetU2(float u2) { 
            this.u2 = u2;
            regionWidth = (int)GLib.Math.round(GLib.Math.fabs(u2 - u) * this.width);
        }

        public float GetV2() {
            return v2;
        }

        public void SetV2(float v2) { 
            this.v2 = v2;
            regionHeight = (int)GLib.Math.round(GLib.Math.fabs(v2 - v) * this.height);
        }

        public int GetRegionX() {
            return (int)GLib.Math.round(u * this.width);
        }

        public void SetRegionX(int x) {
            SetU(x /(float)this.width);
        }

        public int GetRegionY() {
            return (int)GLib.Math.round(v * this.height);
        }        

        public void SetRegionY(int y) {
            SetV(y /this.height);
        }

        /** Returns the region's width. */
        public int GetRegionWidth() {
            return regionWidth;
        }

        public void SetRegionWidth(int width) {
            if (IsFlipX())
                SetU(u2 + width /(float)this.width);
             else 
                SetU2(u + width /(float)this.width);
        }
        

        /** Returns the region's height. */
        public int GetRegionHeight() {
            return regionHeight;
        }

        public void SetRegionHeight(int height) { 
            if (IsFlipY())
                SetV(v2 + height /(float)this.height);	
             else 
                SetV2(v + height /(float)this.height);
        }
        
        public bool IsFlipX() {
            return u > u2;
        }

        public bool IsFlipY() {
            return v > v2;
        }
    }
}