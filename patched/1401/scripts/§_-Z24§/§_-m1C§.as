package §_-Z24§
{
   import §_-H7§.§_-z1v§;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-e1z§;
   import §_-k1c§.§_-7O§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-m1C§ extends Sprite
   {
      
      private static const §_-a2Q§:int = 55;
      
      private static const §_-p2t§:Object = {};
      
      §_-p2t§[§_-428§.§_-113§] = {
         "iconScale":50,
         "iconX":70,
         "fontColor":16749312
      };
      §_-p2t§[§_-428§.§_-wG§] = {
         "iconScale":50,
         "iconX":80,
         "fontColor":12935424
      };
      §_-p2t§[§_-428§.§_-61Q§] = {
         "iconScale":50,
         "iconX":80,
         "fontColor":4508945
      };
      §_-p2t§[§_-428§.§_-a1H§] = {
         "iconScale":55,
         "iconX":85,
         "fontColor":1351405
      };
      §_-p2t§[§_-428§.§_-P13§] = {
         "iconScale":60,
         "iconX":95,
         "fontColor":16761134
      };
      §_-p2t§[§_-428§.§_-O2P§] = {
         "iconScale":50,
         "iconX":75,
         "fontColor":16734208
      };
      §_-p2t§[§_-428§.§_-dU§] = {
         "iconScale":60,
         "iconX":55
      };
      
      public function §_-m1C§(param1:int, param2:String)
      {
         super();
         var _loc3_:Sprite = new §_-z1v§(param1,param1 == §_-428§.§_-O2P§ ? §_-e1z§.VIP : 0);
         _loc3_.scaleX = _loc3_.scaleY = §_-p2t§[param1]["iconScale"] / Math.max(_loc3_.width,_loc3_.height);
         _loc3_.x = §_-p2t§[param1]["iconX"] - _loc3_.width;
         addChild(_loc3_);
         var _loc4_:uint = uint(§_-p2t§[param1]["fontColor"]);
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:§_-22V§ = new §_-22V§(param2,0,0,new TextFormat(§_-22V§.§_-pJ§,38,_loc4_));
         _loc5_.filters = §_-7O§.§_-w1P§;
         _loc5_.y = §_-a2Q§ - _loc5_.height;
         addChild(_loc5_);
      }
   }
}

