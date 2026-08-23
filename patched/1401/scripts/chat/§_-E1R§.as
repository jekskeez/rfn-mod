package chat
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-Q13§;
   import buttons.§_-F1F§;
   import events.§_-4Y§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.StringUtil;
   import utils.§_-w2j§;
   import views.§_-fu§;
   
   public class §_-E1R§ extends §_-71C§
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,12,6765838);
      
      private var §_-v2b§:Sprite;
      
      private var §_-w0§:Sprite;
      
      private var §_-mB§:Sprite;
      
      private var §_-Iz§:EditClanNewsButton;
      
      private var §_-G§:SetDecorationButton;
      
      private var §_-12y§:HideDecorationButton;
      
      private var §_-93N§:§_-w2j§ = null;
      
      private var §_-b2j§:§_-F1F§;
      
      private var §_-91P§:§_-F1F§;
      
      private var §_-73x§:§_-F1F§;
      
      private var §_-O2S§:§_-F1F§;
      
      private var §_-G6§:§_-F1F§;
      
      private var §_-X1d§:§_-Q13§ = null;
      
      private var §_-r4§:Rectangle = null;
      
      public function §_-E1R§(param1:TextField, param2:DisplayObject, param3:*, param4:Rectangle, param5:DisplayObject, param6:§_-w2j§)
      {
         var _loc10_:§_-22V§ = null;
         this.§_-Iz§ = new EditClanNewsButton();
         this.§_-G§ = new SetDecorationButton();
         this.§_-12y§ = new HideDecorationButton();
         this.§_-b2j§ = new §_-F1F§(new ButtonClanChatLong());
         this.§_-91P§ = new §_-F1F§(new ButtonClanChatLong());
         this.§_-73x§ = new §_-F1F§(new ButtonClanChatLong());
         this.§_-O2S§ = new §_-F1F§(new ButtonClanChatLong());
         this.§_-G6§ = new §_-F1F§(new ButtonClanChatShort());
         this.§_-N2t§ = 120;
         this.§_-M20§ = new TextFormat(§_-22V§.§_-F2z§,13,0);
         this.§_-S1y§ = param2;
         this.§_-L12§ = param1;
         this.§_-L12§.text = "";
         this.§_-L12§.wordWrap = false;
         this.§_-L12§.multiline = false;
         super();
         this.§_-j1w§ = param4;
         this.§_-w0§ = new Sprite();
         this.§_-w0§.x = 600;
         this.§_-w0§.y = 340;
         this.§_-w0§.visible = false;
         this.§_-93N§ = param6;
         this.§_-w0§.addChild(this.§_-93N§);
         this.§_-mB§ = new Sprite();
         this.§_-mB§.x = 603;
         this.§_-mB§.y = 340;
         this.§_-mB§.visible = false;
         this.§_-X1d§ = new §_-Q13§(gls("Изменение новости"),gls("Ты не можешь сохранить эту новость, т.к. она занимает больше 12-и строк\n "));
         new §_-Hb§(this.§_-Iz§,gls("Изменить новость"));
         this.§_-Iz§.x = this.§_-93N§.x + this.§_-93N§.width + 5;
         this.§_-Iz§.y = this.§_-93N§.y + this.§_-93N§.height - this.§_-Iz§.height;
         this.§_-Iz§.addEventListener(MouseEvent.CLICK,this.§_-4c§);
         this.§_-Iz§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.§_-Iz§.addEventListener(MouseEvent.ROLL_OVER,this.§_-F1c§);
         this.§_-G§.visible = false;
         this.§_-G§.x = this.§_-Iz§.x;
         this.§_-G§.y = this.§_-93N§.y + this.§_-93N§.height - this.§_-G§.height;
         this.§_-G§.addEventListener(MouseEvent.CLICK,this.§_-4c§);
         this.§_-G§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.§_-G§.addEventListener(MouseEvent.ROLL_OVER,this.§_-F1c§);
         this.§_-12y§.visible = false;
         this.§_-12y§.x = this.§_-G§.x;
         this.§_-12y§.y = this.§_-G§.y - this.§_-12y§.height - 5;
         this.§_-12y§.addEventListener(MouseEvent.CLICK,this.§_-42l§);
         this.§_-12y§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.§_-12y§.addEventListener(MouseEvent.ROLL_OVER,this.§_-F1c§);
         this.§_-w0§.addChild(this.§_-Iz§);
         this.§_-w0§.addChild(this.§_-G§);
         this.§_-w0§.addChild(this.§_-12y§);
         addChild(this.§_-w0§);
         addChild(this.§_-mB§);
         this.§_-v2b§ = param3;
         this.§_-v2b§.addEventListener(MouseEvent.CLICK,this.§_-qP§);
         var _loc7_:Array = [this.§_-b2j§,this.§_-91P§,this.§_-73x§,this.§_-O2S§,this.§_-G6§];
         var _loc8_:Array = [gls("Чат клана"),gls("Казна"),gls("Казна"),gls("Новости"),gls("ЧС")];
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc10_ = new §_-22V§(_loc8_[_loc9_],0,11,§_-i2c§);
            _loc10_.mouseEnabled = false;
            _loc10_.x = int((_loc7_[_loc9_].width - _loc10_.textWidth) * 0.5);
            _loc7_[_loc9_].addChild(_loc10_);
            _loc9_++;
         }
         this.§_-b2j§.x = 460;
         this.§_-b2j§.y = 256;
         this.§_-91P§.x = this.§_-b2j§.x + this.§_-b2j§.width + 5;
         this.§_-91P§.y = this.§_-b2j§.y;
         this.§_-73x§.x = this.§_-91P§.x;
         this.§_-73x§.y = this.§_-91P§.y;
         this.§_-O2S§.x = this.§_-91P§.x + this.§_-91P§.width + 5;
         this.§_-O2S§.y = this.§_-b2j§.y;
         this.§_-G6§.x = this.§_-O2S§.x + this.§_-O2S§.width + 5;
         this.§_-G6§.y = this.§_-b2j§.y;
         this.§_-Y2N§.x = 55;
         this.§_-Y2N§.y = -5;
         this.§_-Y2N§.insert(this.§_-b2j§);
         this.§_-Y2N§.insert(this.§_-91P§);
         this.§_-Y2N§.insert(this.§_-73x§);
         this.§_-Y2N§.insert(this.§_-O2S§);
         this.§_-Y2N§.insert(this.§_-G6§);
         this.§_-73x§.visible = false;
         param5.parent.addChildAt(this.§_-Y2N§,0);
         this.§_-Y2N§.addEventListener(§_-4Y§.SELECT,this.§_-o1n§);
         this.§_-Y2N§.§_-32c§(this.§_-O2S§);
      }
      
      public function §_-j11§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-6e§.length)
         {
            this.§_-6e§[_loc1_].dispose();
            _loc1_++;
         }
         this.§_-M1N§.update();
         this.§_-Y2N§.§_-32c§(this.§_-O2S§);
      }
      
      public function §_-334§(param1:Boolean) : void
      {
         this.§_-Iz§.visible = Boolean(this.§_-Iz§.visible) && param1;
      }
      
      public function §_-z2w§(param1:Boolean) : void
      {
         this.§_-G6§.visible = param1;
      }
      
      public function set §_-j1w§(param1:Rectangle) : void
      {
         this.§_-r4§ = param1;
         this.§_-M1N§.x = param1.x;
         this.§_-M1N§.y = param1.y;
         this.§_-M1N§.width = param1.width;
         this.§_-M1N§.height = param1.height;
         if(this.§_-S2t§)
         {
            this.§_-S2t§.§_-7M§(param1.width - 20);
         }
      }
      
      public function set §_-p29§(param1:Boolean) : void
      {
         this.§_-91P§.visible = param1;
         this.§_-73x§.visible = !param1;
      }
      
      public function §_-j16§(param1:Boolean) : void
      {
         this.§_-93N§.background = param1;
         this.§_-93N§.border = param1;
         this.§_-G§.visible = param1;
         this.§_-12y§.visible = param1;
         this.§_-Iz§.visible = !param1;
         if(param1)
         {
            this.§_-93N§.type = TextFieldType.INPUT;
         }
         else
         {
            this.§_-93N§.type = TextFieldType.DYNAMIC;
         }
      }
      
      override protected function sendMessage(param1:String) : void
      {
         this.§_-S2t§.sendMessage(param1);
         GameSounds.play("message_send");
      }
      
      override protected function §_-21t§(param1:Event) : void
      {
         super.§_-21t§(param1);
         try
         {
            if(this.scroll > 19 * 5)
            {
               return;
            }
            this.scroll = 0;
         }
         catch(e:Error)
         {
         }
      }
      
      override protected function §_-o1n§(param1:§_-4Y§) : void
      {
         this.§_-mB§.visible = this.§_-M1N§.visible = this.§_-w0§.visible = this.§_-L12§.visible = this.§_-S1y§.visible = this.§_-v2b§.visible = false;
         switch(param1.button)
         {
            case this.§_-b2j§:
               this.§_-M1N§.visible = this.§_-L12§.visible = this.§_-S1y§.visible = this.§_-v2b§.visible = true;
               this.§_-S2t§ = this.§_-6e§[0];
               this.§_-M1N§.height = this.§_-r4§.height;
               break;
            case this.§_-91P§:
            case this.§_-73x§:
               this.§_-S2t§ = this.§_-6e§[1];
               this.§_-M1N§.height = this.§_-r4§.height + 30;
               this.§_-M1N§.visible = true;
               break;
            case this.§_-O2S§:
               this.§_-w0§.visible = true;
               break;
            case this.§_-G6§:
               if(this.§_-mB§.numChildren == 0)
               {
                  this.§_-mB§.addChild(new §_-fu§());
               }
               this.§_-mB§.visible = true;
         }
         super.§_-o1n§(param1);
      }
      
      private function §_-42l§(param1:MouseEvent) : void
      {
         this.§_-93N§.text = §_-e2W§.§_-Rg§ ? §_-e2W§.§_-Rg§ : "";
         this.§_-4c§(param1);
      }
      
      private function §_-23n§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.CLICK);
      }
      
      private function §_-F1c§(param1:MouseEvent) : void
      {
      }
      
      private function §_-4c§(param1:MouseEvent) : void
      {
         if(this.§_-93N§.type == TextFieldType.DYNAMIC)
         {
            this.§_-j16§(true);
            return;
         }
         if(§_-e2W§.§_-Rg§ != null && Game.self["clan_duty"] != Clan.§_-k1P§ && Game.self["clan_duty"] != Clan.§_-jY§)
         {
            this.§_-93N§.text = §_-e2W§.§_-Rg§;
            return;
         }
         this.§_-93N§.text = StringUtil.§_-22O§(this.§_-93N§.text);
         this.§_-93N§.text = StringUtil.§_-T2i§(this.§_-93N§.text);
         if(this.§_-93N§.textHeight > 185)
         {
            this.§_-X1d§.show();
            return;
         }
         this.§_-j16§(false);
         if(§_-e2W§.§_-Rg§ == null || §_-e2W§.§_-Rg§ == this.§_-93N§.text)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-K1k§,this.§_-93N§.text);
      }
      
      private function §_-qP§(param1:MouseEvent) : void
      {
         if(this.blockChat)
         {
            return;
         }
         §_-34§();
      }
   }
}

