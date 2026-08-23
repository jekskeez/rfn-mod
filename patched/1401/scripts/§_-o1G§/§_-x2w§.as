package §_-o1G§
{
   import §_-42B§.*;
   import §_-bQ§.*;
   import flash.display.*;
   import flash.geom.ColorTransform;
   import flash.geom.Transform;
   
   public class §_-x2w§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected static var §_-x2J§:Array = ["redMultiplier","greenMultiplier","blueMultiplier","alphaMultiplier","redOffset","greenOffset","blueOffset","alphaOffset"];
      
      protected var §_-A3y§:ColorTransform;
      
      protected var §_-N2E§:Transform;
      
      protected var §_-ft§:Boolean;
      
      public function §_-x2w§()
      {
         super();
         this.propName = "tint";
         this.overwriteProps = ["tint"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
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
         §_-ft§ = true;
         §_-N2E§ = DisplayObject(param1).transform;
         init(§_-N2E§.colorTransform,_loc4_);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc2_:ColorTransform = null;
         §_-FL§(param1);
         if(§_-N2E§)
         {
            if(§_-ft§)
            {
               _loc2_ = §_-N2E§.colorTransform;
               §_-A3y§.alphaMultiplier = _loc2_.alphaMultiplier;
               §_-A3y§.alphaOffset = _loc2_.alphaOffset;
            }
            §_-N2E§.colorTransform = §_-A3y§;
         }
      }
      
      public function init(param1:ColorTransform, param2:ColorTransform) : void
      {
         var _loc4_:String = null;
         §_-A3y§ = param1;
         var _loc3_:* = int(§_-x2J§.length);
         var _loc5_:* = int(§_-d1k§.length);
         while(_loc3_--)
         {
            _loc4_ = §_-x2J§[_loc3_];
            if(§_-A3y§[_loc4_] != param2[_loc4_])
            {
               §_-d1k§[_loc5_++] = new §_-f§(§_-A3y§,_loc4_,§_-A3y§[_loc4_],param2[_loc4_] - §_-A3y§[_loc4_],"tint",false);
            }
         }
      }
   }
}

