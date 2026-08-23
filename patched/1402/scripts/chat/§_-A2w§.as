package chat
{
   import §_-61C§.§_-im§;
   import §_-S1n§.§_-kr§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import com.api.Player;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import utils.§_-33I§;
   import utils.§_-L2J§;
   
   public class §_-A2w§ extends §_-63Y§
   {
      
      public static const §_-Sn§:String = "chatShowed";
      
      public static const §_-3y§:String = "chatHidden";
      
      private var direction:TextField = new TextField();
      
      private var §_-E1Q§:ButtonChatSend = null;
      
      private var §_-v2c§:int = 0;
      
      public function §_-A2w§()
      {
         super();
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-M29§);
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-H26§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-x1i§]);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
      }
      
      override protected function §_-73S§(param1:KeyboardEvent) : void
      {
      }
      
      override protected function §_-D1Z§(param1:String) : void
      {
         super.§_-D1Z§(param1);
         this.hide();
      }
      
      override protected function sendMessage(param1:String) : void
      {
         if(this.blockChat || §_-t2c§.active is §_-fx§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-Nb§,this.§_-v2c§,param1);
         GameSounds.play("message_send");
      }
      
      override protected function init() : void
      {
         this.§_-G2g§ = new BackgroundInputBox();
         this.§_-G2g§.x = 0;
         this.§_-G2g§.y = 0;
         addChild(this.§_-G2g§);
         this.§_-P2T§ = new TextFormat(§_-i5§.§_-c10§,13,16777215);
         this.direction.x = 5;
         this.direction.y = 5;
         this.direction.selectable = false;
         this.direction.autoSize = TextFieldAutoSize.LEFT;
         this.direction.defaultTextFormat = this.§_-P2T§;
         §_-L2J§.embedFonts(this.direction);
         addChild(this.direction);
         this.direction.text = " > ";
         this.§_-P2T§.indent = this.direction.textWidth - 15;
         this.§_-H2p§ = new TextField();
         this.§_-H2p§.x = 19;
         this.§_-H2p§.y = 4;
         this.§_-H2p§.width = 230;
         this.§_-H2p§.height = 65;
         §_-L2J§.embedFonts(this.§_-H2p§);
         addChild(this.§_-H2p§);
         this.§_-E1Q§ = new ButtonChatSend();
         this.§_-E1Q§.x = 250;
         this.§_-E1Q§.y = 0;
         addChild(this.§_-E1Q§);
         this.§_-E1Q§.addEventListener(MouseEvent.CLICK,this.§_-p1p§);
         new §_-kr§(this.§_-E1Q§,gls("Отправить"));
         super.init();
         this.hide();
      }
      
      public function show() : void
      {
         this.visible = true;
         dispatchEvent(new Event(§_-Sn§));
         this.§_-W1N§();
         if(this.blockChat)
         {
            return;
         }
         this.§_-H2p§.type = TextFieldType.INPUT;
         Game.stage.focus = this.§_-H2p§;
      }
      
      public function hide() : void
      {
         this.visible = false;
         dispatchEvent(new Event(§_-3y§));
         if(this.blockChat)
         {
            return;
         }
         this.§_-H2p§.type = TextFieldType.DYNAMIC;
         this.§_-H2p§.text = "";
         Game.stage.focus = Game.stage;
      }
      
      public function hasFocus() : Boolean
      {
         return Game.stage.focus == this.§_-H2p§ && this.§_-H2p§.type == TextFieldType.INPUT;
      }
      
      private function §_-H26§(param1:MouseEvent) : void
      {
         var _loc2_:§_-A2w§ = param1.target.parent as §_-A2w§;
         if(_loc2_ == null && this.visible)
         {
            this.hide();
         }
      }
      
      private function §_-W1N§(param1:Event = null) : void
      {
         this.x = §_-im§.instance.x + 5;
         this.y = Game.starling.stage.stageHeight - this.height - 42;
      }
      
      private function §_-M29§(param1:KeyboardEvent) : void
      {
         if(!(§_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-fx§))
         {
            return;
         }
         if(!this.visible)
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               this.show();
            }
            return;
         }
         if(param1.keyCode == Keyboard.DELETE || param1.keyCode == Keyboard.ENTER && this.blockChat)
         {
            this.hide();
            return;
         }
         super.§_-73S§(param1);
      }
      
      private function §_-p1p§(param1:MouseEvent) : void
      {
         if(this.blockChat)
         {
            this.hide();
            return;
         }
         §_-91r§();
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(Game.selfId != param1[0] && Game.selfId != param1[3] && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
         {
            return;
         }
         var _loc2_:Player = Game.getPlayer(param1[0]);
         var _loc3_:Player = param1[3] != 0 ? Game.getPlayer(param1[3]) : null;
         §_-O1y§.instance.§_-k1K§(_loc2_,_loc3_,param1[4],param1[1],param1[2]);
      }
   }
}

