package §_-f1x§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-I10§.§_-vy§;
   import §_-k1c§.Dialog;
   import §_-r16§.§_-p1e§;
   import buttons.§_-22b§;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import utils.§_-Y25§;
   
   public class §_-72Y§ extends Sprite
   {
      
      private static var _instance:§_-72Y§ = null;
      
      private var §_-u2T§:§_-22b§ = null;
      
      private var §_-g2I§:Object = {};
      
      public function §_-72Y§()
      {
         super();
         _instance = this;
         this.init();
      }
      
      public static function get §_-P20§() : Boolean
      {
         return _instance != null;
      }
      
      public static function §_-k1i§(param1:Vector.<§_-Y25§>) : void
      {
         _instance.setData(param1);
      }
      
      public static function §_-12G§() : void
      {
         _instance.§_-12G§();
      }
      
      public static function §_-31O§(param1:Boolean, param2:int) : void
      {
         _instance.§_-31O§(param1,param2);
      }
      
      private function init() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:§_-22V§ = null;
         var _loc4_:§_-b22§ = null;
         var _loc5_:§_-p1e§ = null;
         this.§_-u2T§ = new §_-22b§(1,4,210,280,4);
         this.§_-u2T§.x = 24;
         this.§_-u2T§.y = 200;
         this.§_-u2T§.§_-D2s§(1,new Point(850,140),new Point(-21,140));
         var _loc1_:int = 0;
         while(_loc1_ < §_-vy§.§_-k1M§.length)
         {
            if("clothesId" in §_-vy§.§_-k1M§[_loc1_])
            {
               _loc2_ = new Sprite();
               _loc2_.addChild(new §_-22V§(§_-g2W§.§_-G1Y§(§_-vy§.§_-k1M§[_loc1_]["clothesId"]),20,88,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-m2A§;
               _loc3_ = new §_-22V§(§_-g2W§.§_-81F§(§_-vy§.§_-k1M§[_loc1_]["clothesId"]),20,115,new TextFormat(null,12,8746579,true),860);
               _loc3_.wordWrap = true;
               _loc2_.addChild(_loc3_);
               _loc4_ = new §_-b22§(_loc1_);
               _loc4_.x = 23;
               _loc4_.y = 545;
               _loc2_.addChild(_loc4_);
               addChild(_loc2_);
               _loc5_ = new §_-p1e§(_loc1_);
               _loc4_.§_-L1I§.x = 105 - int(_loc4_.§_-L1I§.width * 0.5);
               _loc4_.§_-L1I§.y = 270 + 15;
               _loc5_.mouseChildren = true;
               _loc5_.addChild(_loc4_.§_-L1I§);
               this.§_-u2T§.insert(_loc5_,_loc2_);
               this.§_-g2I§[_loc1_] = {
                  "clothes":_loc5_,
                  "exchange":_loc4_
               };
            }
            _loc1_++;
         }
         this.§_-u2T§.offset = 0;
         addChild(this.§_-u2T§);
      }
      
      private function setData(param1:Vector.<§_-Y25§>) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-g2I§)
         {
            (_loc2_["exchange"] as §_-b22§).setData(param1);
         }
      }
      
      private function §_-12G§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         for each(_loc1_ in this.§_-g2I§)
         {
            _loc2_ = int(§_-vy§.§_-k1M§[(_loc1_["clothes"] as §_-p1e§).elementId]["clothesId"]);
            _loc3_ = §_-h1f§.§_-i21§(_loc2_,§_-h1f§.§_-A3r§);
            (_loc1_["clothes"] as §_-p1e§).update(_loc3_);
            (_loc1_["exchange"] as §_-b22§).update(_loc3_);
         }
      }
      
      private function §_-31O§(param1:Boolean, param2:int) : void
      {
         (this.§_-g2I§[param2]["exchange"] as §_-b22§).§_-31O§(param1);
      }
   }
}

