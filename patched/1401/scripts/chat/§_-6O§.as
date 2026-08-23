package chat
{
   import §_-S1D§.§_-3m§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-w17§;
   import §_-e1G§.§_-Hb§;
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
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import utils.§_-c10§;
   import utils.§_-vo§;
   
   public class §_-6O§ extends §_-N1D§
   {
      
      public static const §_-013§:String = "chatShowed";
      
      public static const §_-V1c§:String = "chatHidden";
      
      private var direction:TextField = new TextField();
      
      private var §_-v2b§:ButtonChatSend = null;
      
      private var §_-c2P§:int = 0;
      
      public function §_-6O§()
      {
         super();
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-52t§);
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-B3y§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-N29§]);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
      }
      
      override protected function §_-O2u§(param1:KeyboardEvent) : void
      {
      }
      
      override protected function §_-s1a§(param1:String) : void
      {
         super.§_-s1a§(param1);
         this.hide();
      }
      
      override protected function sendMessage(param1:String) : void
      {
         if(this.blockChat || §_-71o§.active is §_-w17§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-aR§,this.§_-c2P§,param1);
         GameSounds.play("message_send");
      }
      
      override protected function init() : void
      {
         this.§_-S1y§ = new BackgroundInputBox();
         this.§_-S1y§.x = 0;
         this.§_-S1y§.y = 0;
         addChild(this.§_-S1y§);
         this.§_-M20§ = new TextFormat(§_-22V§.§_-F2z§,13,16777215);
         this.direction.x = 5;
         this.direction.y = 5;
         this.direction.selectable = false;
         this.direction.autoSize = TextFieldAutoSize.LEFT;
         this.direction.defaultTextFormat = this.§_-M20§;
         §_-vo§.embedFonts(this.direction);
         addChild(this.direction);
         this.direction.text = " > ";
         this.§_-M20§.indent = this.direction.textWidth - 15;
         this.§_-L12§ = new TextField();
         this.§_-L12§.x = 19;
         this.§_-L12§.y = 4;
         this.§_-L12§.width = 230;
         this.§_-L12§.height = 65;
         §_-vo§.embedFonts(this.§_-L12§);
         addChild(this.§_-L12§);
         this.§_-v2b§ = new ButtonChatSend();
         this.§_-v2b§.x = 250;
         this.§_-v2b§.y = 0;
         addChild(this.§_-v2b§);
         this.§_-v2b§.addEventListener(MouseEvent.CLICK,this.§_-Q1r§);
         new §_-Hb§(this.§_-v2b§,gls("Отправить"));
         super.init();
         this.hide();
      }
      
      public function show() : void
      {
         this.visible = true;
         dispatchEvent(new Event(§_-013§));
         this.§_-A3q§();
         if(this.blockChat)
         {
            return;
         }
         this.§_-L12§.type = TextFieldType.INPUT;
         Game.stage.focus = this.§_-L12§;
      }
      
      public function hide() : void
      {
         this.visible = false;
         dispatchEvent(new Event(§_-V1c§));
         if(this.blockChat)
         {
            return;
         }
         this.§_-L12§.type = TextFieldType.DYNAMIC;
         this.§_-L12§.text = "";
         Game.stage.focus = Game.stage;
      }
      
      public function hasFocus() : Boolean
      {
         return Game.stage.focus == this.§_-L12§ && this.§_-L12§.type == TextFieldType.INPUT;
      }
      
      private function §_-B3y§(param1:MouseEvent) : void
      {
         var _loc2_:§_-6O§ = param1.target.parent as §_-6O§;
         if(_loc2_ == null && this.visible)
         {
            this.hide();
         }
      }
      
      private function §_-A3q§(param1:Event = null) : void
      {
         this.x = §_-3m§.instance.x + 5;
         this.y = Game.starling.stage.stageHeight - this.height - 42;
      }
      
      private function §_-52t§(param1:KeyboardEvent) : void
      {
         if(!(§_-71o§.active is §_-92z§ || §_-71o§.active is §_-w17§))
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
         super.§_-O2u§(param1);
      }
      
      private function §_-Q1r§(param1:MouseEvent) : void
      {
         if(this.blockChat)
         {
            this.hide();
            return;
         }
         §_-34§();
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(Game.selfId != param1[0] && Game.selfId != param1[3] && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
         {
            return;
         }
         var _loc2_:Player = Game.getPlayer(param1[0]);
         var _loc3_:Player = param1[3] != 0 ? Game.getPlayer(param1[3]) : null;
         §_-r0§.instance.§_-1y§(_loc2_,_loc3_,param1[4],param1[1],param1[2]);
      }
   }
}

