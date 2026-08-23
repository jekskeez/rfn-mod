package §_-5T§
{
   import §_-X1k§.NotificationManager;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-WS§;
   import buttons.§_-Hg§;
   import buttons.§_-uH§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import utils.§_-Y11§;
   import views.§_-O2q§;
   
   public class §_-S2l§ extends Sprite
   {
      
      private static const §_-X1F§:Array = [{"button":"ButtonLocation1"},{"button":"ButtonLocation7"},{"button":"ButtonLocation3"},{"button":"ButtonLocation9"},{"button":"ButtonLocation6"},{"button":"ButtonLocation8"},{"button":"ButtonLocation4"},{"button":"ButtonLocation5"}];
      
      private static const §_-e1O§:Array = [new GlowFilter(16777215,1,3,3,5)];
      
      private static var _instance:§_-S2l§ = null;
      
      private var §_-f8§:Object = {};
      
      private var §_-sU§:Object = null;
      
      private var §_-z1D§:§_-N2Y§ = null;
      
      private var §_-Gi§:Object = {};
      
      public function §_-S2l§()
      {
         super();
         _instance = this;
         this.init();
      }
      
      public static function get §_-u21§() : Boolean
      {
         return _instance != null;
      }
      
      public static function §_-e2E§(param1:int) : Boolean
      {
         return _instance.§_-Z1k§(param1);
      }
      
      public static function §_-eL§(param1:int) : void
      {
         _instance.§_-eL§(param1);
      }
      
      public static function §_-t1M§(param1:Array) : void
      {
         _instance.§_-51w§(param1);
      }
      
      public static function §_-21R§(param1:int, param2:Boolean) : void
      {
         if(_instance)
         {
            _instance.§_-21R§(param1,param2);
         }
      }
      
      public static function §_-s1l§(param1:Vector.<§_-Y11§>, param2:Vector.<§_-Y11§>) : void
      {
         _instance.setData(param1,param2);
      }
      
      public static function §_-g2U§(param1:Boolean, param2:int) : void
      {
         _instance.§_-g2U§(param1,param2);
      }
      
      private function init() : void
      {
         var _loc2_:Sprite = null;
         var _loc5_:§_-uH§ = null;
         var _loc6_:Sprite = null;
         var _loc7_:§_-i5§ = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:§_-B2G§ = null;
         var _loc1_:§_-Hg§ = new §_-Hg§();
         addChild(_loc1_);
         this.§_-sU§ = {};
         var _loc3_:TextFormat = new TextFormat(null,16,6697728,true);
         var _loc4_:int = 0;
         while(_loc4_ < §_-42H§.§_-xO§.length)
         {
            _loc5_ = new §_-uH§(this.§_-u1D§(_loc4_));
            _loc5_.x = 45 + 102 * _loc4_;
            _loc5_.y = 90;
            this.§_-Gi§[_loc4_] = new §_-O2q§(_loc5_);
            _loc2_ = new Sprite();
            _loc2_.y = 210;
            addChild(_loc2_);
            _loc1_.insert(_loc5_,_loc2_);
            _loc6_ = new Sprite();
            _loc6_.mouseEnabled = false;
            _loc6_.graphics.beginFill(16777215,0.9);
            _loc6_.graphics.drawRoundRect(68,56,26,26,5,5);
            _loc5_.addChild(_loc6_);
            _loc7_ = new §_-i5§("0",68,58,_loc3_);
            _loc7_.filters = §_-e1O§;
            _loc7_.width = 26;
            _loc7_.autoSize = TextFieldAutoSize.CENTER;
            _loc7_.mouseEnabled = false;
            _loc5_.addChild(_loc7_);
            this.§_-f8§[_loc4_] = _loc7_;
            _loc8_ = §_-42H§.§_-xO§[_loc4_]["set"];
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length)
            {
               _loc10_ = new §_-B2G§(_loc8_[_loc9_]);
               _loc10_.x = 45 + 207 * _loc9_ + int((4 - _loc8_.length) * 102);
               _loc10_.addEventListener(Event.CHANGE,this.§_-f5§);
               _loc2_.addChild(_loc10_);
               this.§_-sU§[_loc8_[_loc9_]] = {
                  "set":_loc10_,
                  "location":_loc4_
               };
               _loc9_++;
            }
            _loc4_++;
         }
         this.§_-z1D§ = new §_-N2Y§();
         this.§_-z1D§.x = 44;
         this.§_-z1D§.y = 545;
         addChild(this.§_-z1D§);
      }
      
      private function §_-g2U§(param1:Boolean, param2:int) : void
      {
         (this.§_-sU§[param2]["set"] as §_-B2G§).§_-g2U§(param1);
      }
      
      private function setData(param1:Vector.<§_-Y11§>, param2:Vector.<§_-Y11§>) : void
      {
         var _loc3_:Object = null;
         for each(_loc3_ in this.§_-sU§)
         {
            (_loc3_["set"] as §_-B2G§).setData(param1,param2);
         }
      }
      
      private function §_-51w§(param1:Array) : void
      {
         this.§_-z1D§.setData(param1);
      }
      
      private function §_-21R§(param1:int, param2:Boolean) : void
      {
         (this.§_-sU§[§_-42H§.§_-U13§[param1]["collection"]]["set"] as §_-B2G§).§_-5o§(param1,param2);
      }
      
      private function §_-Z1k§(param1:int) : Boolean
      {
         return this.§_-z1D§.addItem(param1);
      }
      
      private function §_-eL§(param1:int) : void
      {
         this.§_-z1D§.removeItem(param1);
      }
      
      private function §_-f5§(param1:Event) : void
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc2_:int = int(this.§_-sU§[(param1.target as §_-B2G§).§_-S2Q§]["location"]);
         var _loc3_:Array = §_-42H§.§_-xO§[_loc2_]["set"];
         if((param1.target as §_-B2G§).§_-L2F§())
         {
            §_-L1H§.show(NotificationManager.§_-Xd§);
         }
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = §_-42H§.§_-V10§[_loc3_[_loc5_]]["set"];
            for each(_loc7_ in _loc6_)
            {
               if("icon" in §_-42H§.§_-U13§[_loc7_])
               {
                  _loc4_ += §_-WS§.§_-2P§[_loc7_].count;
               }
            }
            _loc5_++;
         }
         this.§_-f8§[_loc2_].text = _loc4_.toString();
         this.§_-OK§();
      }
      
      private function §_-OK§() : void
      {
         var _loc1_:String = null;
         var _loc3_:String = null;
         var _loc2_:Object = {};
         for(_loc3_ in this.§_-sU§)
         {
            _loc1_ = this.§_-sU§[_loc3_]["location"];
            _loc2_[_loc1_] = (this.§_-sU§[_loc3_]["set"] as §_-B2G§).§_-L2F§() || _loc2_[_loc1_];
         }
         for(_loc1_ in _loc2_)
         {
            this.§_-Gi§[_loc1_].active = _loc2_[_loc1_];
         }
         if(!§_-WS§.§_-c1e§())
         {
            §_-L1H§.hide(NotificationManager.§_-Xd§);
         }
      }
      
      private function §_-u1D§(param1:int) : SimpleButton
      {
         var _loc2_:Class = getDefinitionByName(§_-X1F§[param1]["button"]) as Class;
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

