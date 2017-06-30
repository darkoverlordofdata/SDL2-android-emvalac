namespace  Sdx.Math { 

    public inline float Clamp(float value, float low, float hi) {
	    return value < low ? low : value > hi ? hi : value;
    }
    
    public struct Vector2 {

        public float x;
        public float y;

        public static Vector2 Zero  { get {return {  0,  0 }; } }
        public static Vector2 One   { get {return {  1,  1 }; } }
        public static Vector2 Down  { get {return {  0, -1 }; } }
        public static Vector2 Left  { get {return { -1,  0 }; } }
        public static Vector2 Right { get {return {  1,  0 }; } }
        public static Vector2 Up    { get {return {  0,  1 }; } }

        public static float Distance(Vector2 a, Vector2 b) {
            return GLib.Math.sqrtf( (a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y) );
        }

        public Vector2(float x = 0, float y = 0) {
            this.x = x;
            this.y = y;
        }

        public inline Vector2 Mul(float f) {
            return { x*f, y*f };
        }

        public inline Vector2 Div(float f) {
            return { x/f, y/f };
        }

        public inline float Len() {
            return GLib.Math.sqrtf(x*x + y*y);
        }

        public inline Vector2 Add(Vector2 v) {
            return { x+v.x, y+v.y };
        }

        public inline Vector2 Sub(Vector2 v) {
            return { x-v.x, y-v.y };
        }            
    }
}