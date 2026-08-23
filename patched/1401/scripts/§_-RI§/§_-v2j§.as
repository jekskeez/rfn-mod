package §_-RI§
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.display.DisplayObject;
   import starling.display.DisplayObjectContainer;
   
   public interface §_-v2j§
   {
      
      function §_-iu§(param1:Point, param2:Boolean = false) : *;
      
      function removeFromParent(param1:Boolean = true) : void;
      
      function set pivotX(param1:Number) : void;
      
      function get pivotX() : Number;
      
      function set pivotY(param1:Number) : void;
      
      function get pivotY() : Number;
      
      function getStarlingView() : DisplayObjectContainer;
      
      function §_-d2R§(param1:*, param2:int) : void;
      
      function §_-83v§(param1:*) : *;
      
      function removeChildStarling(param1:*, param2:Boolean = true) : void;
      
      function §_-ws§(param1:*) : Boolean;
      
      function get parentStarling() : *;
      
      function set parentStarling(param1:*) : void;
      
      function getChildStarlingIndex(param1:*, param2:Boolean = false) : int;
      
      function setChildStarlingIndex(param1:*, param2:int) : void;
      
      function §_-ek§(param1:int) : *;
      
      function §_-n2T§(param1:int, param2:Boolean = true) : DisplayObject;
      
      function set alpha(param1:Number) : void;
      
      function get alpha() : Number;
      
      function set name(param1:String) : void;
      
      function get name() : String;
      
      function set rotation(param1:Number) : void;
      
      function get rotation() : Number;
      
      function set scaleX(param1:Number) : void;
      
      function set scaleY(param1:Number) : void;
      
      function get scaleX() : Number;
      
      function get scaleY() : Number;
      
      function scaleXY(param1:Number, param2:Number = 0) : void;
      
      function set localRect(param1:Rectangle) : void;
      
      function get localRect() : Rectangle;
      
      function set x(param1:Number) : void;
      
      function get x() : Number;
      
      function set y(param1:Number) : void;
      
      function get y() : Number;
      
      function set width(param1:Number) : void;
      
      function get width() : Number;
      
      function set height(param1:Number) : void;
      
      function get height() : Number;
      
      function play() : void;
   }
}

