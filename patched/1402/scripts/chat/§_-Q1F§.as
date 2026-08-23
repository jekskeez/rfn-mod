package chat
{
   import §_-61C§.§_-z1J§;
   import §_-I2Y§.§_-91K§;
   import §_-J19§.§_-534§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-XW§;
   import §_-X1k§.§_-u2n§;
   import §_-c2C§.§_-t2c§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-uH§;
   import com.api.Player;
   import events.GameEvent;
   import events.ScreenEvent;
   import events.§_-b2G§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import utils.§_-33I§;
   import utils.§_-L2J§;
   
   public class §_-Q1F§ extends §_-In§
   {
      
      private static var _instance:§_-Q1F§ = null;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private var §_-vZ§:§_-uH§ = null;
      
      private var §_-3V§:§_-uH§ = null;
      
      private var §_-D24§:Boolean = false;
      
      private var §_-Ys§:Boolean = true;
      
      private var §_-03a§:Boolean = false;
      
      public function §_-Q1F§()
      {
         _instance = this;
         super();
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-M2s§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O1s§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-q1d§,§_-s2l§.§_-x1i§]);
      }
      
      public static function listen(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function forget(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-82u§(param1:Boolean) : void
      {
         if(!_instance)
         {
            new §_-Q1F§();
         }
         _instance.§_-82u§(param1);
      }
      
      public static function get §_-Vx§() : Boolean
      {
         if(!_instance)
         {
            return false;
         }
         return _instance.visible;
      }
      
      public static function §_-C1s§() : void
      {
         if(_instance == null)
         {
            return;
         }
         _instance.§_-C1s§();
      }
      
      override public function add(param1:§_-N2t§) : void
      {
         super.add(param1);
         Connection.§_-e2T§(§_-u1O§.§_-81f§,§_-u1O§.§_-Qv§,(param1 as §_-a1R§).type);
      }
      
      override protected function init() : void
      {
         this.§_-G2g§ = new ChatInputBg();
         this.§_-G2g§.cacheAsBitmap = true;
         addChild(this.§_-G2g§);
         this.§_-H2p§ = new TextField();
         this.§_-H2p§.text = " ";
         this.§_-H2p§.type = TextFieldType.INPUT;
         this.§_-H2p§.wordWrap = false;
         this.§_-H2p§.multiline = false;
         this.§_-H2p§.x = 28;
         this.§_-H2p§.y = 377;
         this.§_-H2p§.width = 210;
         this.§_-H2p§.height = 20;
         §_-L2J§.embedFonts(this.§_-H2p§);
         addChild(this.§_-H2p§);
         this.§_-P2T§ = new TextFormat(§_-i5§.§_-c10§,12,13238271,true);
         var _loc1_:TextField = new TextField();
         _loc1_.x = 11;
         _loc1_.y = 378;
         _loc1_.selectable = false;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.defaultTextFormat = §_-P2T§;
         §_-L2J§.embedFonts(_loc1_);
         _loc1_.text = " > ";
         addChild(_loc1_);
         this.§_-P2T§.indent = _loc1_.textWidth - 15;
         var _loc2_:ButtonChatSend = new ButtonChatSend();
         _loc2_.x = 233;
         _loc2_.y = 372;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-03W§);
         addChild(_loc2_);
         super.init();
         this.§_-W18§.setSize(285,345);
         this.§_-W18§.y = 12;
         this.§_-vZ§ = new §_-uH§(new ChatCommonTab());
         this.§_-vZ§.x = 298;
         this.§_-vZ§.y = 22;
         this.§_-3V§ = new §_-uH§(new ChatNewbieTab());
         this.§_-3V§.x = 298;
         this.§_-3V§.y = 67;
         this.§_-a3§.x = 0;
         this.§_-a3§.y = 0;
         this.§_-a3§.insert(this.§_-vZ§);
         this.§_-a3§.insert(this.§_-3V§);
         this.§_-a3§.addEventListener(§_-b2G§.SELECT,this.§_-QC§);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
         {
            this.add(new §_-a1R§(§_-u1O§.§_-K2m§));
            this.§_-a3§.§_-l1Y§(this.§_-vZ§);
         }
         else
         {
            this.§_-a3§.visible = false;
            this.add(new §_-a1R§(§_-LZ§.§_-mA§ > §_-XW§.§_-a26§ ? §_-u1O§.§_-K2m§ : §_-u1O§.§_-e1d§));
         }
         if(Game.§_-53N§ > 0)
         {
            §_-C1s§();
         }
         this.§_-A1v§ = !§_-F1Z§.§_-O1u§ && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) && §_-LZ§.§_-mA§ > §_-XW§.§_-a26§;
         §_-z1J§.§_-DQ§(this);
         Game.stage.focus = this.§_-H2p§;
         this.y = -409;
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) || §_-LZ§.§_-mA§ <= §_-XW§.§_-a26§)
         {
            return;
         }
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-q1o§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-q1o§);
      }
      
      override protected function §_-73S§(param1:KeyboardEvent) : void
      {
         if(this.§_-03a§ || this.§_-D24§)
         {
            return;
         }
         super.§_-73S§(param1);
      }
      
      override protected function sendMessage(param1:String) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-Nb§,(this.§_-G1O§ as §_-a1R§).type,param1);
         GameSounds.play("message_send");
      }
      
      override protected function §_-52S§(param1:Event) : void
      {
         this.§_-Ys§ = this.§_-Ys§ || Math.abs(this.§_-W18§.verticalScrollPosition - this.§_-W18§.maxVerticalScrollPosition) < 0.01;
         super.§_-52S§(param1);
         if(this.§_-Ys§)
         {
            this.§_-W18§.verticalScrollPosition = this.§_-W18§.maxVerticalScrollPosition;
         }
      }
      
      override protected function §_-QC§(param1:§_-b2G§) : void
      {
         switch(param1.button)
         {
            case this.§_-vZ§:
               this.§_-G1O§ = this.§_-U1B§[0];
               break;
            case this.§_-3V§:
               if(!(1 in this.§_-U1B§))
               {
                  this.add(new §_-a1R§(§_-u1O§.§_-e1d§));
               }
               this.§_-G1O§ = this.§_-U1B§[1];
         }
         this.§_-Ys§ = true;
      }
      
      override protected function §_-X2c§(param1:Event) : void
      {
         super.§_-X2c§(param1);
         this.§_-Ys§ = false;
      }
      
      override protected function set blockChat(param1:Boolean) : void
      {
         super.blockChat = param1;
         if(!param1 && this.§_-03a§)
         {
            this.§_-A1v§ = true;
         }
      }
      
      private function §_-82u§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         §_-u2n§.save(§_-u2n§.§_-M1L§,{"chatState":param1});
         if(this.visible == param1)
         {
            return;
         }
         this.visible = param1;
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.CHANGED));
         if(param1)
         {
            Game.stage.focus = this.§_-H2p§;
            if(!this.§_-03a§)
            {
               this.§_-H2p§.text = "";
            }
            if(this.§_-D24§)
            {
               _loc2_ = 0;
               while(_loc2_ < this.§_-U1B§.length)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-81f§,§_-u1O§.§_-Qv§,(this.§_-U1B§[_loc2_] as §_-a1R§).type);
                  _loc2_++;
               }
            }
            this.§_-D24§ = false;
         }
         else
         {
            Game.stage.focus = Game.stage;
         }
      }
      
      private function set §_-A1v§(param1:Boolean) : void
      {
         this.§_-03a§ = param1;
         if(!this.blockChat)
         {
            this.§_-H2p§.type = param1 ? TextFieldType.DYNAMIC : TextFieldType.INPUT;
            this.§_-H2p§.text = param1 ? gls("Необходим VIP статус") : "";
            this.§_-H2p§.selectable = !param1;
            if(param1)
            {
               this.§_-H2p§.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
            }
            else
            {
               this.§_-H2p§.removeEventListener(MouseEvent.CLICK,this.§_-G2T§);
            }
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-U1B§.length)
         {
            if((this.§_-U1B§[_loc2_] as §_-a1R§).type == §_-u1O§.§_-K2m§)
            {
               (this.§_-U1B§[_loc2_] as §_-a1R§).§_-A1v§ = param1;
               break;
            }
            _loc2_++;
         }
      }
      
      private function §_-03W§(param1:MouseEvent) : void
      {
         if(this.blockChat || this.§_-03a§ || this.§_-D24§)
         {
            return;
         }
         §_-91r§();
      }
      
      private function clear() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-U1B§.length)
         {
            (this.§_-U1B§[_loc1_] as §_-a1R§).flush();
            _loc1_++;
         }
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(!(param1.screen is §_-91K§))
         {
            return;
         }
         this.§_-82u§(false);
         this.§_-s1Z§();
         §_-z1J§.§_-81q§();
      }
      
      private function §_-s1Z§() : void
      {
         if(this.§_-D24§)
         {
            return;
         }
         this.§_-D24§ = true;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-U1B§.length)
         {
            Connection.§_-e2T§(§_-u1O§.§_-81f§,§_-u1O§.§_-s2K§,(this.§_-U1B§[_loc1_] as §_-a1R§).type);
            _loc1_++;
         }
         this.clear();
      }
      
      private function §_-q1o§(param1:GameEvent) : void
      {
         this.§_-A1v§ = !§_-F1Z§.§_-O1u§;
      }
      
      private function §_-G2T§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-U2d§.load(function():void
         {
            §_-534§.§_-R2X§(§_-534§.VIP);
         });
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Player = null;
         var _loc3_:int = 0;
         if(this.§_-D24§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-q1d§:
               _loc3_ = 0;
               while(_loc3_ < this.§_-U1B§.length)
               {
                  if((this.§_-U1B§[_loc3_] as §_-a1R§).type == param1[0])
                  {
                     (this.§_-U1B§[_loc3_] as §_-a1R§).§_-B2s§(param1[1]);
                     return;
                  }
                  _loc3_++;
               }
               break;
            case §_-s2l§.§_-x1i§:
               if(Game.selfId != param1[0] && Game.selfId != param1[3] && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
               {
                  return;
               }
               _loc2_ = param1[3] != 0 ? Game.getPlayer(param1[3]) : null;
               this.§_-G1O§.§_-GH§(new §_-N2p§(Game.getPlayer(param1[0]),_loc2_,param1[4],param1[1],param1[2]));
         }
      }
      
      private function §_-M2s§(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:Boolean = true;
         while(_loc2_ != null)
         {
            if(_loc2_ is §_-Q1F§ || _loc2_ is §_-cD§)
            {
               _loc3_ = false;
               break;
            }
            _loc2_ = _loc2_.parent;
         }
         if(_loc3_ && this.visible)
         {
            §_-z1J§.§_-81q§(false);
         }
      }
      
      private function §_-O1s§(param1:KeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER && !this.visible && !(Game.stage.focus is TextField))
         {
            §_-z1J§.§_-81q§(true);
         }
      }
   }
}

