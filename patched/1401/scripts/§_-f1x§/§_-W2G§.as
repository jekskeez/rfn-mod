package §_-f1x§
{
   import §_-I10§.NotificationManager;
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-vy§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import utils.§_-Y25§;
   import views.§_-E8§;
   
   public class §_-W2G§ extends Sprite
   {
      
      private static const §_-r1p§:Array = [{"button":"ButtonLocation1"},{"button":"ButtonLocation7"},{"button":"ButtonLocation3"},{"button":"ButtonLocation9"},{"button":"ButtonLocation6"},{"button":"ButtonLocation8"},{"button":"ButtonLocation4"},{"button":"ButtonLocation5"}];
      
      private static const §_-k1X§:Array = [new GlowFilter(16777215,1,3,3,5)];
      
      private static var _instance:§_-W2G§ = null;
      
      private var §_-21i§:Object = {};
      
      private var §_-g1z§:Object = null;
      
      private var §_-b11§:§_-Z1s§ = null;
      
      private var §_-A2m§:Object = {};
      
      public function §_-W2G§()
      {
         super();
         _instance = this;
         this.init();
      }
      
      public static function get §_-P20§() : Boolean
      {
         return _instance != null;
      }
      
      public static function §_-n1T§(param1:int) : Boolean
      {
         return _instance.§_-UL§(param1);
      }
      
      public static function §_-72N§(param1:int) : void
      {
         _instance.§_-72N§(param1);
      }
      
      public static function §_-TU§(param1:Array) : void
      {
         _instance.§_-32R§(param1);
      }
      
      public static function §_-K2Y§(param1:int, param2:Boolean) : void
      {
         if(_instance)
         {
            _instance.§_-K2Y§(param1,param2);
         }
      }
      
      public static function §_-k1i§(param1:Vector.<§_-Y25§>, param2:Vector.<§_-Y25§>) : void
      {
         _instance.setData(param1,param2);
      }
      
      public static function §_-31O§(param1:Boolean, param2:int) : void
      {
         _instance.§_-31O§(param1,param2);
      }
      
      private function init() : void
      {
         var _loc2_:Sprite = null;
         var _loc5_:§_-F1F§ = null;
         var _loc6_:Sprite = null;
         var _loc7_:§_-22V§ = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:§_-ib§ = null;
         var _loc1_:§_-G2L§ = new §_-G2L§();
         addChild(_loc1_);
         this.§_-g1z§ = {};
         var _loc3_:TextFormat = new TextFormat(null,16,6697728,true);
         var _loc4_:int = 0;
         while(_loc4_ < §_-vy§.§_-e2P§.length)
         {
            _loc5_ = new §_-F1F§(this.§_-z18§(_loc4_));
            _loc5_.x = 45 + 102 * _loc4_;
            _loc5_.y = 90;
            this.§_-A2m§[_loc4_] = new §_-E8§(_loc5_);
            _loc2_ = new Sprite();
            _loc2_.y = 210;
            addChild(_loc2_);
            _loc1_.insert(_loc5_,_loc2_);
            _loc6_ = new Sprite();
            _loc6_.mouseEnabled = false;
            _loc6_.graphics.beginFill(16777215,0.9);
            _loc6_.graphics.drawRoundRect(68,56,26,26,5,5);
            _loc5_.addChild(_loc6_);
            _loc7_ = new §_-22V§("0",68,58,_loc3_);
            _loc7_.filters = §_-k1X§;
            _loc7_.width = 26;
            _loc7_.autoSize = TextFieldAutoSize.CENTER;
            _loc7_.mouseEnabled = false;
            _loc5_.addChild(_loc7_);
            this.§_-21i§[_loc4_] = _loc7_;
            _loc8_ = §_-vy§.§_-e2P§[_loc4_]["set"];
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length)
            {
               _loc10_ = new §_-ib§(_loc8_[_loc9_]);
               _loc10_.x = 45 + 207 * _loc9_ + int((4 - _loc8_.length) * 102);
               _loc10_.addEventListener(Event.CHANGE,this.§_-E1y§);
               _loc2_.addChild(_loc10_);
               this.§_-g1z§[_loc8_[_loc9_]] = {
                  "set":_loc10_,
                  "location":_loc4_
               };
               _loc9_++;
            }
            _loc4_++;
         }
         this.§_-b11§ = new §_-Z1s§();
         this.§_-b11§.x = 44;
         this.§_-b11§.y = 545;
         addChild(this.§_-b11§);
      }
      
      private function §_-31O§(param1:Boolean, param2:int) : void
      {
         (this.§_-g1z§[param2]["set"] as §_-ib§).§_-31O§(param1);
      }
      
      private function setData(param1:Vector.<§_-Y25§>, param2:Vector.<§_-Y25§>) : void
      {
         var _loc3_:Object = null;
         for each(_loc3_ in this.§_-g1z§)
         {
            (_loc3_["set"] as §_-ib§).setData(param1,param2);
         }
      }
      
      private function §_-32R§(param1:Array) : void
      {
         this.§_-b11§.setData(param1);
      }
      
      private function §_-K2Y§(param1:int, param2:Boolean) : void
      {
         (this.§_-g1z§[§_-vy§.§_-U2M§[param1]["collection"]]["set"] as §_-ib§).§_-um§(param1,param2);
      }
      
      private function §_-UL§(param1:int) : Boolean
      {
         return this.§_-b11§.addItem(param1);
      }
      
      private function §_-72N§(param1:int) : void
      {
         this.§_-b11§.removeItem(param1);
      }
      
      private function §_-E1y§(param1:Event) : void
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc2_:int = int(this.§_-g1z§[(param1.target as §_-ib§).§_-A1t§]["location"]);
         var _loc3_:Array = §_-vy§.§_-e2P§[_loc2_]["set"];
         if((param1.target as §_-ib§).§_-O1i§())
         {
            §_-fO§.show(NotificationManager.§_-M0§);
         }
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = §_-vy§.§_-C3T§[_loc3_[_loc5_]]["set"];
            for each(_loc7_ in _loc6_)
            {
               if("icon" in §_-vy§.§_-U2M§[_loc7_])
               {
                  _loc4_ += §_-k1C§.§_-G1c§[_loc7_].count;
               }
            }
            _loc5_++;
         }
         this.§_-21i§[_loc2_].text = _loc4_.toString();
         this.§_-Yx§();
      }
      
      private function §_-Yx§() : void
      {
         var _loc1_:String = null;
         var _loc3_:String = null;
         var _loc2_:Object = {};
         for(_loc3_ in this.§_-g1z§)
         {
            _loc1_ = this.§_-g1z§[_loc3_]["location"];
            _loc2_[_loc1_] = (this.§_-g1z§[_loc3_]["set"] as §_-ib§).§_-O1i§() || _loc2_[_loc1_];
         }
         for(_loc1_ in _loc2_)
         {
            this.§_-A2m§[_loc1_].active = _loc2_[_loc1_];
         }
         if(!§_-k1C§.§_-A1B§())
         {
            §_-fO§.hide(NotificationManager.§_-M0§);
         }
      }
      
      private function §_-z18§(param1:int) : SimpleButton
      {
         var _loc2_:Class = getDefinitionByName(§_-r1p§[param1]["button"]) as Class;
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(new _loc2_());
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(new _loc2_());
         _loc4_.addChild(new ButtonLocationFrame());
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(new _loc2_());
         _loc5_.addChild(new ButtonLocationFrame());
         return new SimpleButton(_loc3_,_loc4_,_loc5_);
      }
   }
}

