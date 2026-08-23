package §_-4I§
{
   import §_-22D§.*;
   import §_-y1E§.*;
   import flash.display.*;
   import flash.geom.ColorTransform;
   import flash.geom.Transform;
   
   public class §_-dr§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected static var §_-Z1A§:Array = ["redMultiplier","greenMultiplier","blueMultiplier","alphaMultiplier","redOffset","greenOffset","blueOffset","alphaOffset"];
      
      protected var §_-Y22§:ColorTransform;
      
      protected var §_-93e§:Transform;
      
      protected var §_-72C§:Boolean;
      
      public function §_-dr§()
      {
         super();
         this.propName = "tint";
         this.overwriteProps = ["tint"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         if(!(param1 is DisplayObject))
         {
            return false;
         }
         var _loc4_:ColorTransform = new ColorTransform();
         if(param2 != null && param3.vars.removeTint != true)
         {
            _loc4_.color = uint(param2);
         }
         §_-72C§ = true;
         §_-93e§ = DisplayObject(param1).transform;
         init(§_-93e§.colorTransform,_loc4_);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc2_:ColorTransform = null;
         §_-No§(param1);
         if(§_-93e§)
         {
            if(§_-72C§)
            {
               _loc2_ = §_-93e§.colorTransform;
               §_-Y22§.alphaMultiplier = _loc2_.alphaMultiplier;
               §_-Y22§.alphaOffset = _loc2_.alphaOffset;
            }
            §_-93e§.colorTransform = §_-Y22§;
         }
      }
      
      public function init(param1:ColorTransform, param2:ColorTransform) : void
      {
         var _loc4_:String = null;
         §_-Y22§ = param1;
         var _loc3_:* = int(§_-Z1A§.length);
         var _loc5_:* = int(§_-n1X§.length);
         while(_loc3_--)
         {
            _loc4_ = §_-Z1A§[_loc3_];
            if(§_-Y22§[_loc4_] != param2[_loc4_])
            {
               §_-n1X§[_loc5_++] = new §_-bg§(§_-Y22§,_loc4_,§_-Y22§[_loc4_],param2[_loc4_] - §_-Y22§[_loc4_],"tint",false);
            }
         }
      }
   }
}

