package tape
{
   import §_-I10§.§_-I2h§;
   import §_-I10§.§_-f22§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-wc§;
   import buttons.§_-wn§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   
   public class §_-6a§ extends §_-K2k§
   {
      
      private static const §_-r2u§:int = 74;
      
      private static const §_-R1K§:int = 59;
      
      public var id:int;
      
      private var active:DisplayObject;
      
      private var §_-C2S§:DisplayObject;
      
      private var §_-p1Z§:§_-wc§;
      
      private var §_-q2O§:§_-Hb§;
      
      private var §_-71R§:§_-wn§ = null;
      
      private var §_-K6§:§_-wn§ = null;
      
      public function §_-6a§(param1:int)
      {
         this.id = param1;
         super();
         var _loc2_:TapeEditButton = new TapeEditButton();
         this.§_-C2S§ = _loc2_.upState;
         this.§_-C2S§.scaleX = this.§_-C2S§.scaleY = 1.5;
         addChild(this.§_-C2S§);
         this.active = _loc2_.downState;
         this.active.scaleX = this.active.scaleY = 1.5;
         this.active.visible = false;
         addChild(this.active);
         var _loc3_:MovieClip = new (§_-I2h§.§_-er§(param1))();
         var _loc4_:Number = 50 / Math.max(_loc3_.width,_loc3_.height);
         var _loc5_:Rectangle = _loc3_.getRect(_loc3_);
         _loc3_.scaleX = _loc4_;
         _loc3_.scaleY = _loc4_;
         _loc3_.x = -_loc5_.left * _loc4_ + int((§_-r2u§ - _loc3_.width) * 0.5);
         _loc3_.y = -_loc5_.top * _loc4_ + int((§_-R1K§ - _loc3_.height) * 0.5);
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         addChild(_loc3_);
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.beginFill(0,0);
         _loc6_.graphics.drawRect(0,0,§_-r2u§,§_-R1K§);
         _loc6_.graphics.endFill();
         addChild(_loc6_);
         var _loc7_:SetDecorationButton = new SetDecorationButton();
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-72i§);
         var _loc8_:HideDecorationButton = new HideDecorationButton();
         _loc8_.addEventListener(MouseEvent.CLICK,this.§_-j2F§);
         this.§_-p1Z§ = new §_-wc§(_loc7_,_loc8_,true);
         this.§_-p1Z§.x = 60;
         this.§_-p1Z§.y = -3;
         this.§_-p1Z§.alpha = 0;
         addChild(this.§_-p1Z§);
         this.§_-q2O§ = new §_-Hb§(this.§_-p1Z§,gls("Скрыть"));
         var _loc9_:String = "";
         if(§_-I2h§.§_-eC§(param1) == §_-I2h§.§_-8P§)
         {
            _loc9_ = gls("<br>Для установки требуется стол");
         }
         if(§_-I2h§.§_-eC§(param1) == §_-I2h§.§_-11b§)
         {
            _loc9_ = gls("<br>Для установки требуется окно");
         }
         new §_-Hb§(_loc6_,"<body>" + §_-I2h§.§_-bh§(param1) + "<span class=\'small\'>" + _loc9_ + "</span></body>",false,true);
         var _loc10_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,14614477);
         if(this.item["gold_cost"] > 0)
         {
            this.§_-K6§ = new §_-wn§(new ButtonBuySmall(),_loc10_,-11,1);
            this.§_-K6§.textField.wordWrap = true;
            this.§_-K6§.textField.multiline = true;
            this.§_-K6§.x = this.item["acorn_cost"] > 0 ? -1 : 19;
            this.§_-K6§.y = 53;
            this.§_-K6§.textField.text = this.item["gold_cost"] + " -";
            this.§_-K6§.addEventListener(MouseEvent.CLICK,this.buy,false,0,true);
            addChild(this.§_-K6§);
            §_-jB§.§_-fG§(this.§_-K6§.textField,"-",ImageIconCoins,0.6,0.6,-this.§_-K6§.textField.x - 2,-2,false);
            this.§_-K6§.scaleX = this.§_-K6§.scaleY = 0.75;
         }
         if(this.item["acorn_cost"] > 0)
         {
            this.§_-71R§ = new §_-wn§(new ButtonBuySmall(),_loc10_,-11,1);
            this.§_-71R§.textField.wordWrap = true;
            this.§_-71R§.textField.multiline = true;
            this.§_-71R§.x = this.item["gold_cost"] > 0 ? 39 : 19;
            this.§_-71R§.y = 53;
            this.§_-71R§.textField.text = (this.item["acorn_cost"] >= 1000 ? int(this.item["acorn_cost"] / 1000) + "к" : this.item["acorn_cost"]) + " -";
            this.§_-71R§.addEventListener(MouseEvent.CLICK,this.§_-r2S§,false,0,true);
            addChild(this.§_-71R§);
            §_-jB§.§_-fG§(this.§_-71R§.textField,"-",ImageIconNut,0.6,0.6,-this.§_-71R§.textField.x - 2,-2,false);
            this.§_-71R§.scaleX = this.§_-71R§.scaleY = 0.75;
         }
         addEventListener(MouseEvent.MOUSE_OVER,this.§_-Q20§);
         addEventListener(MouseEvent.MOUSE_OUT,this.§_-9c§);
      }
      
      public function get selected() : Boolean
      {
         return this.active.visible;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-C2S§.visible = !param1;
         this.active.visible = param1;
         this.§_-p1Z§.setState(!param1);
         this.§_-q2O§.setStatus(param1 ? gls("Скрыть") : gls("Установить"));
         this.§_-p1Z§.visible = param1 ? §_-f22§.§_-E2I§(this.id) : §_-f22§.§_-r1O§(this.id);
      }
      
      public function get §_-c1X§() : Boolean
      {
         return §_-f22§.§_-q27§(this.id);
      }
      
      public function set §_-c1X§(param1:Boolean) : void
      {
         if(this.§_-71R§)
         {
            this.§_-71R§.visible = !param1;
         }
         if(this.§_-K6§)
         {
            this.§_-K6§.visible = !param1;
         }
         this.§_-p1Z§.visible = this.§_-p1Z§.visible && param1;
      }
      
      private function get item() : Object
      {
         return §_-I2h§.DATA[this.id];
      }
      
      private function §_-72i§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         §_-f22§.§_-72i§(this.id);
      }
      
      private function §_-j2F§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         §_-f22§.§_-j2F§(this.id);
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         this.§_-p1Z§.alpha = this.§_-c1X§ ? 1 : 0;
         §_-f22§.§_-a1r§ = this.id;
      }
      
      private function §_-9c§(param1:MouseEvent) : void
      {
         this.§_-p1Z§.alpha = 0;
         §_-f22§.§_-a1r§ = -1;
      }
      
      private function buy(param1:MouseEvent) : void
      {
         var _loc2_:int = "gold_cost" in this.item ? int(this.item["gold_cost"]) : 0;
         Game.§_-K2t§(§_-h2B§.§_-I1C§,_loc2_,0,Game.selfId,this.id);
      }
      
      private function §_-r2S§(param1:MouseEvent) : void
      {
         var _loc2_:int = "acorn_cost" in this.item ? int(this.item["acorn_cost"]) : 0;
         Game.§_-K2t§(§_-h2B§.§_-I1C§,0,_loc2_,Game.selfId,this.id);
      }
   }
}

