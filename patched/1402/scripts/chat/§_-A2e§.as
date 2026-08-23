package chat
{
   import §_-S1n§.§_-kr§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-bN§.§_-Fk§;
   import buttons.§_-uH§;
   import events.§_-b2G§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.StringUtil;
   import utils.§_-72U§;
   import views.§_-lJ§;
   
   public class §_-A2e§ extends §_-In§
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,12,6765838);
      
      private var §_-E1Q§:Sprite;
      
      private var §_-I1m§:Sprite;
      
      private var §_-337§:Sprite;
      
      private var §_-Q1K§:EditClanNewsButton;
      
      private var §_-Q2V§:SetDecorationButton;
      
      private var §_-l1o§:HideDecorationButton;
      
      private var §_-YA§:§_-72U§ = null;
      
      private var §_-e23§:§_-uH§;
      
      private var §_-S2x§:§_-uH§;
      
      private var §_-43v§:§_-uH§;
      
      private var §_-o§:§_-uH§;
      
      private var §_-Te§:§_-uH§;
      
      private var §_-A26§:§_-Fk§ = null;
      
      private var §_-Q1l§:Rectangle = null;
      
      public function §_-A2e§(param1:TextField, param2:DisplayObject, param3:*, param4:Rectangle, param5:DisplayObject, param6:§_-72U§)
      {
         var _loc10_:§_-i5§ = null;
         this.§_-Q1K§ = new EditClanNewsButton();
         this.§_-Q2V§ = new SetDecorationButton();
         this.§_-l1o§ = new HideDecorationButton();
         this.§_-e23§ = new §_-uH§(new ButtonClanChatLong());
         this.§_-S2x§ = new §_-uH§(new ButtonClanChatLong());
         this.§_-43v§ = new §_-uH§(new ButtonClanChatLong());
         this.§_-o§ = new §_-uH§(new ButtonClanChatLong());
         this.§_-Te§ = new §_-uH§(new ButtonClanChatShort());
         this.§_-q2T§ = 120;
         this.§_-P2T§ = new TextFormat(§_-i5§.§_-c10§,13,0);
         this.§_-G2g§ = param2;
         this.§_-H2p§ = param1;
         this.§_-H2p§.text = "";
         this.§_-H2p§.wordWrap = false;
         this.§_-H2p§.multiline = false;
         super();
         this.§_-X1M§ = param4;
         this.§_-I1m§ = new Sprite();
         this.§_-I1m§.x = 600;
         this.§_-I1m§.y = 340;
         this.§_-I1m§.visible = false;
         this.§_-YA§ = param6;
         this.§_-I1m§.addChild(this.§_-YA§);
         this.§_-337§ = new Sprite();
         this.§_-337§.x = 603;
         this.§_-337§.y = 340;
         this.§_-337§.visible = false;
         this.§_-A26§ = new §_-Fk§(gls("Изменение новости"),gls("Ты не можешь сохранить эту новость, т.к. она занимает больше 12-и строк\n "));
         new §_-kr§(this.§_-Q1K§,gls("Изменить новость"));
         this.§_-Q1K§.x = this.§_-YA§.x + this.§_-YA§.width + 5;
         this.§_-Q1K§.y = this.§_-YA§.y + this.§_-YA§.height - this.§_-Q1K§.height;
         this.§_-Q1K§.addEventListener(MouseEvent.CLICK,this.§_-E1I§);
         this.§_-Q1K§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.§_-Q1K§.addEventListener(MouseEvent.ROLL_OVER,this.§_-u1e§);
         this.§_-Q2V§.visible = false;
         this.§_-Q2V§.x = this.§_-Q1K§.x;
         this.§_-Q2V§.y = this.§_-YA§.y + this.§_-YA§.height - this.§_-Q2V§.height;
         this.§_-Q2V§.addEventListener(MouseEvent.CLICK,this.§_-E1I§);
         this.§_-Q2V§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.§_-Q2V§.addEventListener(MouseEvent.ROLL_OVER,this.§_-u1e§);
         this.§_-l1o§.visible = false;
         this.§_-l1o§.x = this.§_-Q2V§.x;
         this.§_-l1o§.y = this.§_-Q2V§.y - this.§_-l1o§.height - 5;
         this.§_-l1o§.addEventListener(MouseEvent.CLICK,this.§_-gx§);
         this.§_-l1o§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.§_-l1o§.addEventListener(MouseEvent.ROLL_OVER,this.§_-u1e§);
         this.§_-I1m§.addChild(this.§_-Q1K§);
         this.§_-I1m§.addChild(this.§_-Q2V§);
         this.§_-I1m§.addChild(this.§_-l1o§);
         addChild(this.§_-I1m§);
         addChild(this.§_-337§);
         this.§_-E1Q§ = param3;
         this.§_-E1Q§.addEventListener(MouseEvent.CLICK,this.§_-r7§);
         var _loc7_:Array = [this.§_-e23§,this.§_-S2x§,this.§_-43v§,this.§_-o§,this.§_-Te§];
         var _loc8_:Array = [gls("Чат клана"),gls("Казна"),gls("Казна"),gls("Новости"),gls("ЧС")];
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc10_ = new §_-i5§(_loc8_[_loc9_],0,11,§_-W2P§);
            _loc10_.mouseEnabled = false;
            _loc10_.x = int((_loc7_[_loc9_].width - _loc10_.textWidth) * 0.5);
            _loc7_[_loc9_].addChild(_loc10_);
            _loc9_++;
         }
         this.§_-e23§.x = 460;
         this.§_-e23§.y = 256;
         this.§_-S2x§.x = this.§_-e23§.x + this.§_-e23§.width + 5;
         this.§_-S2x§.y = this.§_-e23§.y;
         this.§_-43v§.x = this.§_-S2x§.x;
         this.§_-43v§.y = this.§_-S2x§.y;
         this.§_-o§.x = this.§_-S2x§.x + this.§_-S2x§.width + 5;
         this.§_-o§.y = this.§_-e23§.y;
         this.§_-Te§.x = this.§_-o§.x + this.§_-o§.width + 5;
         this.§_-Te§.y = this.§_-e23§.y;
         this.§_-a3§.x = 55;
         this.§_-a3§.y = -5;
         this.§_-a3§.insert(this.§_-e23§);
         this.§_-a3§.insert(this.§_-S2x§);
         this.§_-a3§.insert(this.§_-43v§);
         this.§_-a3§.insert(this.§_-o§);
         this.§_-a3§.insert(this.§_-Te§);
         this.§_-43v§.visible = false;
         param5.parent.addChildAt(this.§_-a3§,0);
         this.§_-a3§.addEventListener(§_-b2G§.SELECT,this.§_-QC§);
         this.§_-a3§.§_-l1Y§(this.§_-o§);
      }
      
      public function §_-s2W§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-U1B§.length)
         {
            this.§_-U1B§[_loc1_].dispose();
            _loc1_++;
         }
         this.§_-W18§.update();
         this.§_-a3§.§_-l1Y§(this.§_-o§);
      }
      
      public function §_-330§(param1:Boolean) : void
      {
         this.§_-Q1K§.visible = Boolean(this.§_-Q1K§.visible) && param1;
      }
      
      public function §_-Yq§(param1:Boolean) : void
      {
         this.§_-Te§.visible = param1;
      }
      
      public function set §_-X1M§(param1:Rectangle) : void
      {
         this.§_-Q1l§ = param1;
         this.§_-W18§.x = param1.x;
         this.§_-W18§.y = param1.y;
         this.§_-W18§.width = param1.width;
         this.§_-W18§.height = param1.height;
         if(this.§_-G1O§)
         {
            this.§_-G1O§.§_-pH§(param1.width - 20);
         }
      }
      
      public function set §_-a2s§(param1:Boolean) : void
      {
         this.§_-S2x§.visible = param1;
         this.§_-43v§.visible = !param1;
      }
      
      public function §_-x20§(param1:Boolean) : void
      {
         this.§_-YA§.background = param1;
         this.§_-YA§.border = param1;
         this.§_-Q2V§.visible = param1;
         this.§_-l1o§.visible = param1;
         this.§_-Q1K§.visible = !param1;
         if(param1)
         {
            this.§_-YA§.type = TextFieldType.INPUT;
         }
         else
         {
            this.§_-YA§.type = TextFieldType.DYNAMIC;
         }
      }
      
      override protected function sendMessage(param1:String) : void
      {
         this.§_-G1O§.sendMessage(param1);
         GameSounds.play("message_send");
      }
      
      override protected function §_-52S§(param1:Event) : void
      {
         super.§_-52S§(param1);
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
      
      override protected function §_-QC§(param1:§_-b2G§) : void
      {
         this.§_-337§.visible = this.§_-W18§.visible = this.§_-I1m§.visible = this.§_-H2p§.visible = this.§_-G2g§.visible = this.§_-E1Q§.visible = false;
         switch(param1.button)
         {
            case this.§_-e23§:
               this.§_-W18§.visible = this.§_-H2p§.visible = this.§_-G2g§.visible = this.§_-E1Q§.visible = true;
               this.§_-G1O§ = this.§_-U1B§[0];
               this.§_-W18§.height = this.§_-Q1l§.height;
               break;
            case this.§_-S2x§:
            case this.§_-43v§:
               this.§_-G1O§ = this.§_-U1B§[1];
               this.§_-W18§.height = this.§_-Q1l§.height + 30;
               this.§_-W18§.visible = true;
               break;
            case this.§_-o§:
               this.§_-I1m§.visible = true;
               break;
            case this.§_-Te§:
               if(this.§_-337§.numChildren == 0)
               {
                  this.§_-337§.addChild(new §_-lJ§());
               }
               this.§_-337§.visible = true;
         }
         super.§_-QC§(param1);
      }
      
      private function §_-gx§(param1:MouseEvent) : void
      {
         this.§_-YA§.text = §_-B2U§.§_-Z2Y§ ? §_-B2U§.§_-Z2Y§ : "";
         this.§_-E1I§(param1);
      }
      
      private function §_-31U§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.CLICK);
      }
      
      private function §_-u1e§(param1:MouseEvent) : void
      {
      }
      
      private function §_-E1I§(param1:MouseEvent) : void
      {
         if(this.§_-YA§.type == TextFieldType.DYNAMIC)
         {
            this.§_-x20§(true);
            return;
         }
         if(§_-B2U§.§_-Z2Y§ != null && Game.self["clan_duty"] != Clan.§_-01X§ && Game.self["clan_duty"] != Clan.§_-HJ§)
         {
            this.§_-YA§.text = §_-B2U§.§_-Z2Y§;
            return;
         }
         this.§_-YA§.text = StringUtil.§_-Sv§(this.§_-YA§.text);
         this.§_-YA§.text = StringUtil.§_-U2s§(this.§_-YA§.text);
         if(this.§_-YA§.textHeight > 185)
         {
            this.§_-A26§.show();
            return;
         }
         this.§_-x20§(false);
         if(§_-B2U§.§_-Z2Y§ == null || §_-B2U§.§_-Z2Y§ == this.§_-YA§.text)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-c16§,this.§_-YA§.text);
      }
      
      private function §_-r7§(param1:MouseEvent) : void
      {
         if(this.blockChat)
         {
            return;
         }
         §_-91r§();
      }
   }
}

