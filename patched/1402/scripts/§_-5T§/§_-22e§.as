package §_-5T§
{
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-bN§.Dialog;
   import §_-wJ§.§_-E2G§;
   import buttons.§_-n1a§;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import utils.§_-Y11§;
   
   public class §_-22e§ extends Sprite
   {
      
      private static var _instance:§_-22e§ = null;
      
      private var §_-v1j§:§_-n1a§ = null;
      
      private var §_-C2q§:Object = {};
      
      public function §_-22e§()
      {
         super();
         _instance = this;
         this.init();
      }
      
      public static function get §_-u21§() : Boolean
      {
         return _instance != null;
      }
      
      public static function §_-s1l§(param1:Vector.<§_-Y11§>) : void
      {
         _instance.setData(param1);
      }
      
      public static function §_-tx§() : void
      {
         _instance.§_-tx§();
      }
      
      public static function §_-g2U§(param1:Boolean, param2:int) : void
      {
         _instance.§_-g2U§(param1,param2);
      }
      
      private function init() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:§_-i5§ = null;
         var _loc4_:§_-Ws§ = null;
         var _loc5_:§_-E2G§ = null;
         this.§_-v1j§ = new §_-n1a§(1,4,210,280,4);
         this.§_-v1j§.x = 24;
         this.§_-v1j§.y = 200;
         this.§_-v1j§.§_-E1Z§(1,new Point(850,140),new Point(-21,140));
         var _loc1_:int = 0;
         while(_loc1_ < §_-42H§.§_-s1B§.length)
         {
            if("clothesId" in §_-42H§.§_-s1B§[_loc1_])
            {
               _loc2_ = new Sprite();
               _loc2_.addChild(new §_-i5§(§_-P2x§.§_-01H§(§_-42H§.§_-s1B§[_loc1_]["clothesId"]),20,88,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-q2I§;
               _loc3_ = new §_-i5§(§_-P2x§.§_-T1O§(§_-42H§.§_-s1B§[_loc1_]["clothesId"]),20,115,new TextFormat(null,12,8746579,true),860);
               _loc3_.wordWrap = true;
               _loc2_.addChild(_loc3_);
               _loc4_ = new §_-Ws§(_loc1_);
               _loc4_.x = 23;
               _loc4_.y = 545;
               _loc2_.addChild(_loc4_);
               addChild(_loc2_);
               _loc5_ = new §_-E2G§(_loc1_);
               _loc4_.§_-Ch§.x = 105 - int(_loc4_.§_-Ch§.width * 0.5);
               _loc4_.§_-Ch§.y = 270 + 15;
               _loc5_.mouseChildren = true;
               _loc5_.addChild(_loc4_.§_-Ch§);
               this.§_-v1j§.insert(_loc5_,_loc2_);
               this.§_-C2q§[_loc1_] = {
                  "clothes":_loc5_,
                  "exchange":_loc4_
               };
            }
            _loc1_++;
         }
         this.§_-v1j§.offset = 0;
         addChild(this.§_-v1j§);
      }
      
      private function setData(param1:Vector.<§_-Y11§>) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-C2q§)
         {
            (_loc2_["exchange"] as §_-Ws§).setData(param1);
         }
      }
      
      private function §_-tx§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         for each(_loc1_ in this.§_-C2q§)
         {
            _loc2_ = int(§_-42H§.§_-s1B§[(_loc1_["clothes"] as §_-E2G§).elementId]["clothesId"]);
            _loc3_ = §_-L1o§.§_-J2p§(_loc2_,§_-L1o§.§_-U1v§);
            (_loc1_["clothes"] as §_-E2G§).update(_loc3_);
            (_loc1_["exchange"] as §_-Ws§).update(_loc3_);
         }
      }
      
      private function §_-g2U§(param1:Boolean, param2:int) : void
      {
         (this.§_-C2q§[param2]["exchange"] as §_-Ws§).§_-g2U§(param1);
      }
   }
}

