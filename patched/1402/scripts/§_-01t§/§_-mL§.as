package §_-01t§
{
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-ku§;
   import §_-bN§.§_-Sg§;
   import §_-u1R§.§_-g1m§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-mL§ extends Sprite
   {
      
      private static const §_-82m§:int = 55;
      
      private static const §_-U1o§:Object = {};
      
      §_-U1o§[§_-A3y§.§_-M1U§] = {
         "iconScale":50,
         "iconX":70,
         "fontColor":16749312
      };
      §_-U1o§[§_-A3y§.§_-l2X§] = {
         "iconScale":50,
         "iconX":80,
         "fontColor":12935424
      };
      §_-U1o§[§_-A3y§.§_-W27§] = {
         "iconScale":50,
         "iconX":80,
         "fontColor":4508945
      };
      §_-U1o§[§_-A3y§.§_-fz§] = {
         "iconScale":55,
         "iconX":85,
         "fontColor":1351405
      };
      §_-U1o§[§_-A3y§.§_-V2n§] = {
         "iconScale":60,
         "iconX":95,
         "fontColor":16761134
      };
      §_-U1o§[§_-A3y§.§_-y2q§] = {
         "iconScale":50,
         "iconX":75,
         "fontColor":16734208
      };
      §_-U1o§[§_-A3y§.§_-t1F§] = {
         "iconScale":60,
         "iconX":55
      };
      
      public function §_-mL§(param1:int, param2:String)
      {
         super();
         var _loc3_:Sprite = new §_-g1m§(param1,param1 == §_-A3y§.§_-y2q§ ? §_-ku§.VIP : 0);
         _loc3_.scaleX = _loc3_.scaleY = §_-U1o§[param1]["iconScale"] / Math.max(_loc3_.width,_loc3_.height);
         _loc3_.x = §_-U1o§[param1]["iconX"] - _loc3_.width;
         addChild(_loc3_);
         var _loc4_:uint = uint(§_-U1o§[param1]["fontColor"]);
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:§_-i5§ = new §_-i5§(param2,0,0,new TextFormat(§_-i5§.§_-p1s§,38,_loc4_));
         _loc5_.filters = §_-Sg§.§_-13A§;
         _loc5_.y = §_-82m§ - _loc5_.height;
         addChild(_loc5_);
      }
   }
}

