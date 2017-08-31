/**
 * Sdx.d.ts
 *
 */
declare module 'Sdx' {
    import * as GObject from "GObject"
    export const AliceBlue:any
    export const AntiqueWhite:any
    export const Aqua:any
    export const Aquamarine:any
    export const Azure:any
    export const Beige:any
    export const Bisque:any
    export const Black:any
    export const BlanchedAlmond:any
    export const Blue:any
    export const BlueViolet:any
    export const Brown:any
    export const BurlyWood:any
    export const CadetBlue:any
    export const Chartreuse:any
    export const Chocolate:any
    export const Coral:any
    export const CornflowerBlue:any
    export const Cornsilk:any
    export const Crimson:any
    export const Cyan:any
    export const DarkBlue:any
    export const DarkCyan:any
    export const DarkGoldenrod:any
    export const DarkGray:any
    export const DarkGreen:any
    export const DarkKhaki:any
    export const DarkMagenta:any
    export const DarkOliveGreen:any
    export const DarkOrange:any
    export const DarkOrchid:any
    export const DarkRed:any
    export const DarkSalmon:any
    export const DarkSeaGreen:any
    export const DarkSlateBlue:any
    export const DarkSlateGray:any
    export const DarkTurquoise:any
    export const DarkViolet:any
    export const DeepPink:any
    export const DeepSkyBlue:any
    export const DimGray:any
    export const DodgerBlue:any
    export const Firebrick:any
    export const FloralWhite:any
    export const ForestGreen:any
    export const Fuchsia:any
    export const Gainsboro:any
    export const GhostWhite:any
    export const Gold:any
    export const Goldenrod:any
    export const Gray:any
    export const Green:any
    export const GreenYellow:any
    export const Honeydew:any
    export const HotPink:any
    export const IndianRed:any
    export const Indigo:any
    export const Ivory:any
    export const Khaki:any
    export const Lavender:any
    export const LavenderBlush:any
    export const LawnGreen:any
    export const LemonChiffon:any
    export const LightBlue:any
    export const LightCoral:any
    export const LightCyan:any
    export const LightGoldenrodYellow:any
    export const LightGray:any
    export const LightGreen:any
    export const LightPink:any
    export const LightSalmon:any
    export const LightSeaGreen:any
    export const LightSkyBlue:any
    export const LightSlateGray:any
    export const LightSlateBlue:any
    export const LightSteelBlue:any
    export const LightYellow:any
    export const Lime:any
    export const LimeGreen:any
    export const Linen:any
    export const Magenta:any
    export const Maroon:any
    export const MediumAquamarine:any
    export const MediumBlue:any
    export const MediumOrchid:any
    export const MediumPurple:any
    export const MediumSeaGreen:any
    export const MediumSlateBlue:any
    export const MediumSpringGreen:any
    export const MediumTurquoise:any
    export const MediumVioletRed:any
    export const MidnightBlue:any
    export const MintCream:any
    export const MistyRose:any
    export const Moccasin:any
    export const NavajoWhite:any
    export const Navy:any
    export const OldLace:any
    export const Olive:any
    export const OliveDrab:any
    export const Orange:any
    export const OrangeRed:any
    export const Orchid:any
    export const PaleGoldenrod:any
    export const PaleGreen:any
    export const PaleTurquoise:any
    export const PaleVioletRed:any
    export const PapayaWhip:any
    export const PeachPuff:any
    export const Peru:any
    export const Pink:any
    export const Plum:any
    export const PowderBlue:any
    export const Purple:any
    export const Red:any
    export const RosyBrown:any
    export const RoyalBlue:any
    export const SaddleBrown:any
    export const Salmon:any
    export const SandyBrown:any
    export const SeaGreen:any
    export const SeaShell:any
    export const Sienna:any
    export const Silver:any
    export const SkyBlue:any
    export const SlateBlue:any
    export const SlateGray:any
    export const Snow:any
    export const SpringGreen:any
    export const SteelBlue:any
    export const Tan:any
    export const Teal:any
    export const Thistle:any
    export const Tomato:any
    export const Turquoise:any
    export const Violet:any
    export const Wheat:any
    export const White:any
    export const WhiteSmoke:any
    export const Yellow:any
    export const YellowGreen:any
    export const PathSeparator:string
    export const PathSeparatorChar:number
    export function files_GetHandle(path: string, type:FileType):FilesFileHandle
    export function files_Resource(path: string):FilesFileHandle
    export function files_Asset(path: string):FilesFileHandle
    export function files_Absolute(path: string):FilesFileHandle
    export function files_Relative(path: string):FilesFileHandle
    export function files_Default(path: string):FilesFileHandle
    export function graphics_texture_filter_from(value: string):GraphicsTextureFilter
    export function graphics_texture_filter_isMipMap():boolean
    export function graphics_texture_filter_ToString():string
    export function graphics_texture_wrap_from(value: string):GraphicsTextureWrap
    export function graphics_texture_wrap_ToString():string
    export function graphics_format_from(value: string):GraphicsFormat
    export function graphics_format_ToString():string
    export function math_Clamp(value: number, low: number, hi: number):number
    export function Initialize(width: number, height: number, name: string):any
    export function Render(texture: any, srcrect: any, dstrect: any):number
    export function GetRandom():number
    export function SetAtlas(path: string):void
    export function SetTweenManager(manager:MathTweenManager):void
    export function AddInputProcessor(processor:InputProcessor):void
    export function RemoveInputProcessor(processor:InputProcessor):void
    export function SetResourceBase(path: string):void
    export function SetDefaultFont(path: string, size: number):void
    export function SetSmallFont(path: string, size: number):void
    export function SetLargeFont(path: string, size: number):void
    export function GetNow():number
    export function Start():void
    export function GameLoop(game:AbstractGame):void
    export function ProcessEvents():void
    export function Begin():void
    export function End():void
    export function Log(text: string):void
    export function get_version():string
    export function CreateWindow(width: number, height: number, name: string):UiWindow
    export enum GraphicsTextureFilter {
        NEAREST,
        LINEAR,
        MIPMAP,
        MIPMAPNEARESTNEAREST,
        MIPMAPLINEARNEAREST,
        MIPMAPNEARESTLINEAR,
        MIPMAPLINEARLINEAR,
    }
    export enum GraphicsTextureWrap {
        CLAMPTOEDGE,
        REPEAT,
    }
    export enum GraphicsFormat {
        ALPHA,
        INTENSITY,
        LUMINANCEALPHA,
        RGB565,
        RGBA4444,
        RGB888,
        RGBA8888,
    }
    export enum GraphicsCameraKind {
        FLUIDCAMERA,
        INNERCAMERA,
        SIMPLECAMERA,
    }
    export enum GraphicsSpriteKind {
        ANIMATEDSPRITE,
        TEXTURESPRITE,
        ATLASSPRITE,
        NINESLICESPRITE,
        COMPOSITESPRITE,
        TEXTSPRITE,
    }
    export enum MathTimelineModes {
        SEQUENCE,
        PARALLEL,
    }
    export enum MathTweenKind {
        TWEEN,
        TIMELINE,
    }
    export enum MathInterpolationKind {
        LINEAR,
        SMOOTH,
        SMOOTH2,
        SMOOTHER,
        POW,
        POWIN,
        POWOUT,
        SIN,
        SININ,
        SINOUT,
        EXP,
        EXPIN,
        EXPOUT,
        CIRCLE,
        CIRCLEIN,
        CIRCLEOUT,
        ELASTIC,
        ELASTICIN,
        ELASTICOUT,
        SWING,
        SWINGIN,
        SWINGOUT,
        BOUNCE,
        BOUNCEIN,
        BOUNCEOUT,
        QUADIN,
        QUADOUT,
        QUADINOUT,
    }
    export enum MathTweenbaseTweenCallback {
        BEGIN,
        START,
        END,
        COMPLETE,
        BACK_BEGIN,
        BACK_START,
        BACK_END,
        BACK_COMPLETE,
        ANY_FORWARD,
        ANY_BACKWARD,
        ANY,
    }
    export enum UiComponentKind {
        WINDOW,
        LABEL,
        BUTTON,
    }
    export enum UtilsJsType {
        JS_INVALID,
        JS_BOOLEAN,
        JS_NUMBER,
        JS_STRING,
        JS_OBJECT,
        JS_ARRAY,
    }
    export enum UtilsAlign {
        CENTER,
        TOP,
        BOTTOM,
        LEFT,
        RIGHT,
        TOPLEFT,
        TOPRIGHT,
        BOTTOMLEFT,
        BOTTOMRIGHT,
    }
    export enum JsonException {
        SYNTAXERROR,
        UNEXPECTEDCHARACTER,
        INVALIDSTRING,
        INVALIDARRAY,
        INVALIDOBJECT,
        DUPLICATEKEY,
    }
    export enum FileType {
        RESOURCE,
        ASSET,
        ABSOLUTE,
        RELATIVE,
    }
    export class AudioSound extends GObject.Object {
        constructor(config?: any)
        Play(loops: number):void
    }
    export class FilesFileHandle extends GObject.Object {
        constructor(config?: any)
        GetRWops():any
        Read():string
        GetType():FileType
        GetName():string
        GetExt():string
        GetPath():string
        GetParent():FilesFileHandle
        Exists():boolean
        Child(name: string):FilesFileHandle
    }
    export class GraphicsBitmapFont extends GObject.Object {
        constructor(config?: any)
    }
    export class GraphicsGlyph extends GObject.Object {
        constructor(config?: any)
        GetKerning(ch: number):number
        SetKerning(ch: number, value: number):void
    }
    export class GraphicsBitmapFontData extends GObject.Object {
        constructor(config?: any)
        Load(fontFile:FilesFileHandle, flip: boolean):void
        SetGlyphRegion(glyph:GraphicsGlyph, region:GraphicsTextureRegion):void
        SetLineHeight(height: number):void
        SetGlyph(ch: number, glyph:GraphicsGlyph):void
        GetFirstGlyph():GraphicsGlyph
        HasGlyph(ch: number):boolean
        GetGlyph(ch: number):GraphicsGlyph
        GetWrapIndex(start: number, glyphs: any):number
        IsBreakChar(c: number):boolean
        GetImagePath(index: number):string
    }
    export class GraphicsCamera extends GObject.Object {
        constructor(config?: any)
    }
    export class GraphicsCameraInnerCamera extends GraphicsCamera {
        constructor(config?: any)
    }
    export class GraphicsCameraFluidCamera extends GraphicsCamera {
        constructor(config?: any)
    }
    export class GraphicsCameraSimpleCamera extends GraphicsCamera {
        constructor(config?: any)
    }
    export class GraphicsNinePatch extends GObject.Object {
        constructor(config?: any)
        SetColor(color: any):void
        GetColor():any
        GetLeftWidth():number
        SetLeftWidth(leftWidth: number):void
        GetRightWidth():number
        SetRightWidth(rightWidth: number):void
        GetTopHeight():number
        SetTopHeight(topHeight: number):void
        GetBottomHeight():number
        SetBottomHeight(bottomHeight: number):void
        GetMiddleWidth():number
        SetMiddleWidth(middleWidth: number):void
        GetMiddleHeight():number
        SetMiddleHeight(middleHeight: number):void
        GetTotalWidth():number
        GetTotalHeight():number
        SetPadding(left: number, right: number, top: number, bottom: number):void
        GetPadLeft():number
        SetPadLeft(left: number):void
        GetPadRight():number
        SetPadRight(right: number):void
        GetPadTop():number
        SetPadTop(top: number):void
        GetPadBottom():number
        SetPadBottom(bottom: number):void
        Scale(scaleX: number, scaleY: number):void
    }
    export class GraphicsSprite extends GObject.Object {
        constructor(config?: any)
        Render(x: number, y: number, clip: any):void
        Copy(src: any, dest: any):void
        SetColor(color: any):GraphicsSprite
        SetScale(x: number, y: number):GraphicsSprite
        SetPosition(x: number, y: number):GraphicsSprite
        SetCentered(value: boolean):GraphicsSprite
        get_Width():number
        set_Width(value: number):void
    }
    export class GraphicsSpriteAnimatedSprite extends GraphicsSprite {
        constructor(config?: any)
        SetFrame(frame: number):void
    }
    export class GraphicsSpriteTextureSprite extends GraphicsSprite {
        constructor(config?: any)
    }
    export class GraphicsSpriteAtlasSprite extends GraphicsSprite {
        constructor(config?: any)
    }
    export class GraphicsSpriteCompositeSprite extends GraphicsSprite {
        constructor(config?: any)
    }
    export class GraphicsSpriteNineSliceSprite extends GraphicsSprite {
        constructor(config?: any)
    }
    export class GraphicsSpriteUISprite extends GraphicsSprite {
        constructor(config?: any)
    }
    export class GraphicsSpriteTextSprite extends GraphicsSprite {
        constructor(config?: any)
        SetText(text: string, font:Font, fg: any, bg: any):void
    }
    export class GraphicsSurface extends GObject.Object {
        constructor(config?: any)
        GetSurface(ext: string, raw: any):any
        get_width():number
        get_height():number
    }
    export class GraphicsSurfaceCachedSurface extends GraphicsSurface {
        static Initialize(size: number):void
        static IndexOfPath(path: string):number
        constructor(config?: any)
    }
    export class GraphicsSurfaceTextureSurface extends GraphicsSurface {
        constructor(config?: any)
        SetFilter(minFilter: number, magFilter: number):void
        SetWrap(u: number, v: number):void
    }
    export class GraphicsTextureAtlas extends GObject.Object {
        constructor(config?: any)
        FindRegion(name: string, index: number):GraphicsAtlasRegion
        CreateSprite(name: string, index: number):GraphicsSprite
        CreateUI(name: string, text: string, font:Font, color: any, width: number, height: number):GraphicsSprite
        CreatePatch(name: string):GraphicsNinePatch
    }
    export class GraphicsAtlasRegion extends GraphicsTextureRegionFromTexture {
        constructor(config?: any)
    }
    export class GraphicsPage extends GObject.Object {
        constructor(config?: any)
    }
    export class GraphicsRegion extends GObject.Object {
        constructor(config?: any)
    }
    export class GraphicsTextureAtlasData extends GObject.Object {
        static ReadTuple(reader:DataInputStream):number
        static ReadValue(reader:DataInputStream):string
        constructor(config?: any)
    }
    export class GraphicsTextureRegion extends GObject.Object {
        constructor(config?: any)
        SetRegion(u: number, v: number, u2: number, v2: number):void
        SetRegionXY(x: number, y: number, width: number, height: number):void
        SetByRegion(region:GraphicsTextureRegion):void
        SetByRegionXY(region:GraphicsTextureRegion, x: number, y: number, width: number, height: number):void
        Flip(x: boolean, y: boolean):void
        GetU():number
        SetU(u: number):void
        GetV():number
        SetV(v: number):void
        GetU2():number
        SetU2(u2: number):void
        GetV2():number
        SetV2(v2: number):void
        GetRegionX():number
        SetRegionX(x: number):void
        GetRegionY():number
        SetRegionY(y: number):void
        GetRegionWidth():number
        SetRegionWidth(width: number):void
        GetRegionHeight():number
        SetRegionHeight(height: number):void
        IsFlipX():boolean
        IsFlipY():boolean
    }
    export class GraphicsTextureRegionFromTexture extends GraphicsTextureRegion {
        constructor(config?: any)
    }
    export class GraphicsTextureRegionFromRegion extends GraphicsTextureRegion {
        constructor(config?: any)
    }
    export class MathInterpolation extends GObject.Object {
        static Initialize():void
        constructor(config?: any)
    }
    export class MathInterpolationLinear extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSmooth extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSmooth2 extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSmoother extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationPow extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationPowIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationPowOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSin extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSinIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSinOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationExp extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationExpIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationExpOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationCircle extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationCircleIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationCircleOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationElastic extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationElasticIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationElasticOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationBounceOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationBounce extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationBounceIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSwing extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSwingOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationSwingIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationQuadIn extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationQuadOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathInterpolationQuadInOut extends MathInterpolation {
        constructor(config?: any)
    }
    export class MathTimeline extends MathTweenbase {
        static CreateSequence():MathTimeline
        static CreateParallel():MathTimeline
        Setup(mode:MathTimelineModes):void
        Push(tween:MathTween):MathTimeline
        PushPause(time: number):MathTimeline
        BeginSequence():MathTimeline
        BeginParallel():MathTimeline
        End():MathTimeline
        GetChildren():MathTweenbase[]
    }
    export class MathTween extends MathTweenbase {
        static Init():void
        static SetCombinedAttributesLimit(limit: number):void
        static SetWaypointsLimit(limit: number):void
        static RegisterAccessor(someClass: any, defaultAccessor:MathTweenAccessor):void
        static GetRegisteredAccessor(someClass: any):MathTweenAccessor
        static To(target: any, tweenType: number, duration: number):MathTween
        static From(target: any, tweenType: number, duration: number):MathTween
        static Set(target: any, tweenType: number):MathTween
        static Call(callback: any, callback_target: any):MathTween
        static Mark():MathTween
        Setup(target: any, tweenType: number, duration: number):void
        Ease(easeEquation:MathInterpolation):MathTween
        Target(targetValues: number[], targetValues_length1: number):MathTween
        TargetRelative(targetValues: number[], targetValues_length1: number):MathTween
        Overrides():void
    }
    export class MathTweenAccessor extends GObject.Object {
        constructor(config?: any)
    }
    export class MathTweenManager extends GObject.Object {
        static SetAutoRemove(object:MathTween, value: boolean):void
        static SetAutoStart(object:MathTween, value: boolean):void
        constructor(config?: any)
        Add(object:MathTweenbase):MathTweenManager
        ContainsTarget(target: any, tweenType: number):boolean
        KillAll():void
        KillTarget(target: any, tweenType: number):void
        Pause():void
        Resume():void
        Update(delta: number):void
        Size():number
        GetRunningTweensCount():number
    }
    export class MathTweenbase extends GObject.Object {
        constructor(config?: any)
        Delay(delay: number):MathTweenbase
        Kill():void
        Pause():void
        Resume():void
        Repeat(count: number, delay: number):MathTweenbase
        RepeatYoyo(count: number, delay: number):MathTweenbase
        SetCallback(callback: any, callback_target: any):MathTweenbase
        SetCallbackTriggers(flags: number):MathTweenbase
        SetUserData(data: any):MathTweenbase
        GetDelay():number
        GetDuration():number
        GetRepeatCount():number
        GetRepeatDelay():number
        GetFullDuration():number
        GetUserData():any
        GetStep():number
        GetCurrentTime():number
        IsStarted():boolean
        IsInitialized():boolean
        IsFinished():boolean
        IsYoyo():boolean
        IsPaused():boolean
        ForceToStart():void
        ForceToEnd(time: number):void
        CallCallback(type: number):void
        IsReverse(step: number):boolean
        IsValid(step: number):boolean
        KillTarget(target: any, tweenType: number):void
        Update(delta: number):void
    }
    export class UiComponent extends GObject.Object {
        constructor(config?: any)
        Render(x: number, y: number):void
        Add(child:UiComponent):void
        Remove(child:UiComponent):void
        SetPos(x: number, y: number):UiComponent
        get_width():number
        get_height():number
    }
    export class UiWindow extends UiComponent {
        constructor(config?: any)
    }
    export class UiButton extends UiComponent {
        constructor(config?: any)
        EventStop():void
        EventStart():void
        Test(x: number, y: number):boolean
    }
    export class UiButtonText extends UiButton {
        constructor(config?: any)
    }
    export class UiButtonNinePatch extends UiButton {
        constructor(config?: any)
    }
    export class UiContainer extends UiComponent {
        constructor(config?: any)
    }
    export class UiLabel extends UiComponent {
        constructor(config?: any)
    }
    export class UiLabelText extends UiLabel {
        constructor(config?: any)
    }
    export class UiLabelNinePatch extends UiLabel {
        constructor(config?: any)
    }
    export class UtilsFile extends GObject.Object {
        constructor(config?: any)
        GetPath():string
        GetName():string
        GetParent():string
        Exists():boolean
        IsFile():boolean
        IsDirectory():boolean
        Length():number
        Read():string
        List(result_length1: number):string[]
    }
    export class UtilsJson extends GObject.Object {
        static Parse(source: string):UtilsJsVariant
        static Stringify(value:UtilsJsVariant, Replacer: any, Replacer_target: any, space: string):string
        constructor(config?: any)
        Quote(str: string):string
        GetItem(holder:UtilsJsVariant, key: string):UtilsJsVariant
        Str(key: string, holder:UtilsJsVariant):string
        ParseJson(source: string):UtilsJsVariant
        Next(c: number):number
        GetValue():UtilsJsVariant
        GetNumber():UtilsJsVariant
        GetString():UtilsJsVariant
        SkipWhite():void
        GetWord():UtilsJsVariant
        GetArray():UtilsJsVariant
        GetObject():UtilsJsVariant
    }
    export class UtilsJsVariant extends GObject.Object {
        static String(value: string):UtilsJsVariant
        static Number(value: number):UtilsJsVariant
        static Boolean(value: boolean):UtilsJsVariant
        constructor(config?: any)
        At(index: number):UtilsJsVariant
        Member(key: string):UtilsJsVariant
    }
    export class UtilsStringTokenizer extends GObject.Object {
        constructor(config?: any)
        SetMaxDelimCodePoint():void
        SkipDelimiters(startPos: number):number
        ScanToken(startPos: number):number
        IsDelimiter(c: number):boolean
        HasMoreTokens():boolean
        NextToken(delim: string):string
        CountTokens():number
    }
    export class AbstractReference extends GObject.Object {
        constructor(config?: any)
    }
    export class AbstractGame extends GObject.Object {
        constructor(config?: any)
        Start():void
    }
    export class AbstractPlatform extends GObject.Object {
        constructor(config?: any)
    }
    export class DataInputStream extends GObject.Object {
        constructor(config?: any)
        ReadLine():string
    }
    export class Font extends GObject.Object {
        constructor(config?: any)
        Render(text: string, fg: any, bg: any):any
    }
    export class InputMultiplexer extends GObject.Object {
        constructor(config?: any)
        Add(processor:InputProcessor):void
        Remove(processor:InputProcessor):void
        KeyDown(keycode: number):boolean
        KeyUp(keycode: number):boolean
        KeyTyped(character: number):boolean
        TouchDown(x: number, y: number, pointer: number, button: number):boolean
        TouchUp(x: number, y: number, pointer: number, button: number):boolean
        TouchDragged(x: number, y: number, pointer: number):boolean
        MouseMoved(x: number, y: number):boolean
        Scrolled(amount: number):boolean
    }
    export class InputProcessor extends GObject.Object {
        constructor(config?: any)
        SetKeyDown(keyDown: any, keyDown_target: any):InputProcessor
        SetKeyUp(keyUp: any, keyUp_target: any):InputProcessor
        SetKeyTyped(keyTyped: any, keyTyped_target: any):InputProcessor
        SetTouchDown(touchDown: any, touchDown_target: any):InputProcessor
        SetTouchUp(touchUp: any, touchUp_target: any):InputProcessor
        SetTouchDragged(touchDragged: any, touchDragged_target: any):InputProcessor
        SetMouseMoved(mouseMoved: any, mouseMoved_target: any):InputProcessor
        SetScrolled(scrolled: any, scrolled_target: any):InputProcessor
    }
}