package tape
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-I2l§;
   import §_-X1k§.§_-m2r§;
   import buttons.§_-613§;
   import buttons.§_-G15§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   
   public class §_-u6§ extends §_-QN§
   {
      
      private static const §_-B1t§:int = 74;
      
      private static const §_-u1l§:int = 59;
      
      public var id:int;
      
      private var active:DisplayObject;
      
      private var §_-d2N§:DisplayObject;
      
      private var §_-vP§:§_-613§;
      
      private var §_-oo§:§_-kr§;
      
      private var §_-E17§:§_-G15§ = null;
      
      private var §_-Z2F§:§_-G15§ = null;
      
      public function §_-u6§(param1:int)
      {
         this.id = param1;
         super();
         var _loc2_:TapeEditButton = new TapeEditButton();
         this.§_-d2N§ = _loc2_.upState;
         this.§_-d2N§.scaleX = this.§_-d2N§.scaleY = 1.5;
         addChild(this.§_-d2N§);
         this.active = _loc2_.downState;
         this.active.scaleX = this.active.scaleY = 1.5;
         this.active.visible = false;
         addChild(this.active);
         var _loc3_:MovieClip = new (§_-m2r§.§_-x14§(param1))();
         var _loc4_:Number = 50 / Math.max(_loc3_.width,_loc3_.height);
         var _loc5_:Rectangle = _loc3_.getRect(_loc3_);
         _loc3_.scaleX = _loc4_;
         _loc3_.scaleY = _loc4_;
         _loc3_.x = -_loc5_.left * _loc4_ + int((§_-B1t§ - _loc3_.width) * 0.5);
         _loc3_.y = -_loc5_.top * _loc4_ + int((§_-u1l§ - _loc3_.height) * 0.5);
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         addChild(_loc3_);
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.beginFill(0,0);
         _loc6_.graphics.drawRect(0,0,§_-B1t§,§_-u1l§);
         _loc6_.graphics.endFill();
         addChild(_loc6_);
         var _loc7_:SetDecorationButton = new SetDecorationButton();
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-KR§);
         var _loc8_:HideDecorationButton = new HideDecorationButton();
         _loc8_.addEventListener(MouseEvent.CLICK,this.§_-W2N§);
         this.§_-vP§ = new §_-613§(_loc7_,_loc8_,true);
         this.§_-vP§.x = 60;
         this.§_-vP§.y = -3;
         this.§_-vP§.alpha = 0;
         addChild(this.§_-vP§);
         this.§_-oo§ = new §_-kr§(this.§_-vP§,gls("Скрыть"));
         var _loc9_:String = "";
         if(§_-m2r§.§_-iM§(param1) == §_-m2r§.§_-64§)
         {
            _loc9_ = gls("<br>Для установки требуется стол");
         }
         if(§_-m2r§.§_-iM§(param1) == §_-m2r§.§_-b1u§)
         {
            _loc9_ = gls("<br>Для установки требуется окно");
         }
         new §_-kr§(_loc6_,"<body>" + §_-m2r§.§_-3f§(param1) + "<span class=\'small\'>" + _loc9_ + "</span></body>",false,true);
         var _loc10_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,14614477);
         if(this.item["gold_cost"] > 0)
         {
            this.§_-Z2F§ = new §_-G15§(new ButtonBuySmall(),_loc10_,-11,1);
            this.§_-Z2F§.textField.wordWrap = true;
            this.§_-Z2F§.textField.multiline = true;
            this.§_-Z2F§.x = this.item["acorn_cost"] > 0 ? -1 : 19;
            this.§_-Z2F§.y = 53;
            this.§_-Z2F§.textField.text = this.item["gold_cost"] + " -";
            this.§_-Z2F§.addEventListener(MouseEvent.CLICK,this.buy,false,0,true);
            addChild(this.§_-Z2F§);
            §_-K1Y§.§_-P2W§(this.§_-Z2F§.textField,"-",ImageIconCoins,0.6,0.6,-this.§_-Z2F§.textField.x - 2,-2,false);
            this.§_-Z2F§.scaleX = this.§_-Z2F§.scaleY = 0.75;
         }
         if(this.item["acorn_cost"] > 0)
         {
            this.§_-E17§ = new §_-G15§(new ButtonBuySmall(),_loc10_,-11,1);
            this.§_-E17§.textField.wordWrap = true;
            this.§_-E17§.textField.multiline = true;
            this.§_-E17§.x = this.item["gold_cost"] > 0 ? 39 : 19;
            this.§_-E17§.y = 53;
            this.§_-E17§.textField.text = (this.item["acorn_cost"] >= 1000 ? int(this.item["acorn_cost"] / 1000) + "к" : this.item["acorn_cost"]) + " -";
            this.§_-E17§.addEventListener(MouseEvent.CLICK,this.§_-f2§,false,0,true);
            addChild(this.§_-E17§);
            §_-K1Y§.§_-P2W§(this.§_-E17§.textField,"-",ImageIconNut,0.6,0.6,-this.§_-E17§.textField.x - 2,-2,false);
            this.§_-E17§.scaleX = this.§_-E17§.scaleY = 0.75;
         }
         addEventListener(MouseEvent.MOUSE_OVER,this.§_-T2H§);
         addEventListener(MouseEvent.MOUSE_OUT,this.§_-k2s§);
      }
      
      public function get selected() : Boolean
      {
         return this.active.visible;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-d2N§.visible = !param1;
         this.active.visible = param1;
         this.§_-vP§.setState(!param1);
         this.§_-oo§.setStatus(param1 ? gls("Скрыть") : gls("Установить"));
         this.§_-vP§.visible = param1 ? §_-I2l§.§_-qN§(this.id) : §_-I2l§.§_-YW§(this.id);
      }
      
      public function get §_-j2X§() : Boolean
      {
         return §_-I2l§.§_-b1x§(this.id);
      }
      
      public function set §_-j2X§(param1:Boolean) : void
      {
         if(this.§_-E17§)
         {
            this.§_-E17§.visible = !param1;
         }
         if(this.§_-Z2F§)
         {
            this.§_-Z2F§.visible = !param1;
         }
         this.§_-vP§.visible = this.§_-vP§.visible && param1;
      }
      
      private function get item() : Object
      {
         return §_-m2r§.DATA[this.id];
      }
      
      private function §_-KR§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         §_-I2l§.§_-KR§(this.id);
      }
      
      private function §_-W2N§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         §_-I2l§.§_-W2N§(this.id);
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         this.§_-vP§.alpha = this.§_-j2X§ ? 1 : 0;
         §_-I2l§.§_-K2h§ = this.id;
      }
      
      private function §_-k2s§(param1:MouseEvent) : void
      {
         this.§_-vP§.alpha = 0;
         §_-I2l§.§_-K2h§ = -1;
      }
      
      private function buy(param1:MouseEvent) : void
      {
         var _loc2_:int = "gold_cost" in this.item ? int(this.item["gold_cost"]) : 0;
         Game.§_-u2z§(§_-u1O§.§_-63I§,_loc2_,0,Game.selfId,this.id);
      }
      
      private function §_-f2§(param1:MouseEvent) : void
      {
         var _loc2_:int = "acorn_cost" in this.item ? int(this.item["acorn_cost"]) : 0;
         Game.§_-u2z§(§_-u1O§.§_-63I§,0,_loc2_,Game.selfId,this.id);
      }
   }
}

