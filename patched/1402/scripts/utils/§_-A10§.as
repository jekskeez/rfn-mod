package utils
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-A10§ extends Sprite
   {
      
      public function §_-A10§(param1:String)
      {
         super();
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,0,true);
         var _loc3_:§_-i5§ = new §_-i5§(param1,0,0,_loc2_);
         addChild(_loc3_);
         var _loc4_:int = Math.floor(super.width) + 30;
         var _loc5_:int = Math.floor(super.height) + 40;
         var _loc6_:MovieClip = new LearningMessage();
         addChildAt(_loc6_,0);
         _loc6_.width = _loc4_;
         _loc6_.height = _loc5_;
         _loc3_.x = int((_loc6_.width - _loc3_.width) * 0.5);
         _loc3_.y = int((_loc6_.height - _loc3_.height) * 0.5) - 8;
      }
   }
}

