package chat
{
   import §_-68§.§_-EI§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-d2x§;
   import §_-S1D§.§_-V18§;
   import §_-T2y§.§_-71o§;
   import §_-Y22§.§_-E1J§;
   import buttons.§_-F1F§;
   import com.api.Player;
   import events.GameEvent;
   import events.ScreenEvent;
   import events.§_-4Y§;
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
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import utils.§_-c10§;
   import utils.§_-vo§;
   
   public class §_-v13§ extends §_-71C§
   {
      
      private static var _instance:§_-v13§ = null;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private var §_-513§:§_-F1F§ = null;
      
      private var §_-pE§:§_-F1F§ = null;
      
      private var §_-s1L§:Boolean = false;
      
      private var §_-h1h§:Boolean = true;
      
      private var §_-iR§:Boolean = false;
      
      public function §_-v13§()
      {
         _instance = this;
         super();
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-y1b§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-027§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b19§,§_-S2I§.§_-N29§]);
      }
      
      public static function listen(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function forget(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-pC§(param1:Boolean) : void
      {
         if(!_instance)
         {
            new §_-v13§();
         }
         _instance.§_-pC§(param1);
      }
      
      public static function get §_-k2N§() : Boolean
      {
         if(!_instance)
         {
            return false;
         }
         return _instance.visible;
      }
      
      public static function §_-r17§() : void
      {
         if(_instance == null)
         {
            return;
         }
         _instance.§_-r17§();
      }
      
      override public function add(param1:§_-AQ§) : void
      {
         super.add(param1);
         Connection.§_-Li§(§_-h2B§.§_-9z§,§_-h2B§.§_-E0§,(param1 as §_-qt§).type);
      }
      
      override protected function init() : void
      {
         this.§_-S1y§ = new ChatInputBg();
         this.§_-S1y§.cacheAsBitmap = true;
         addChild(this.§_-S1y§);
         this.§_-L12§ = new TextField();
         this.§_-L12§.text = " ";
         this.§_-L12§.type = TextFieldType.INPUT;
         this.§_-L12§.wordWrap = false;
         this.§_-L12§.multiline = false;
         this.§_-L12§.x = 28;
         this.§_-L12§.y = 377;
         this.§_-L12§.width = 210;
         this.§_-L12§.height = 20;
         §_-vo§.embedFonts(this.§_-L12§);
         addChild(this.§_-L12§);
         this.§_-M20§ = new TextFormat(§_-22V§.§_-F2z§,12,13238271,true);
         var _loc1_:TextField = new TextField();
         _loc1_.x = 11;
         _loc1_.y = 378;
         _loc1_.selectable = false;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.defaultTextFormat = §_-M20§;
         §_-vo§.embedFonts(_loc1_);
         _loc1_.text = " > ";
         addChild(_loc1_);
         this.§_-M20§.indent = _loc1_.textWidth - 15;
         var _loc2_:ButtonChatSend = new ButtonChatSend();
         _loc2_.x = 233;
         _loc2_.y = 372;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-p2u§);
         addChild(_loc2_);
         super.init();
         this.§_-M1N§.setSize(285,345);
         this.§_-M1N§.y = 12;
         this.§_-513§ = new §_-F1F§(new ChatCommonTab());
         this.§_-513§.x = 298;
         this.§_-513§.y = 22;
         this.§_-pE§ = new §_-F1F§(new ChatNewbieTab());
         this.§_-pE§.x = 298;
         this.§_-pE§.y = 67;
         this.§_-Y2N§.x = 0;
         this.§_-Y2N§.y = 0;
         this.§_-Y2N§.insert(this.§_-513§);
         this.§_-Y2N§.insert(this.§_-pE§);
         this.§_-Y2N§.addEventListener(§_-4Y§.SELECT,this.§_-o1n§);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
         {
            this.add(new §_-qt§(§_-h2B§.§_-S1S§));
            this.§_-Y2N§.§_-32c§(this.§_-513§);
         }
         else
         {
            this.§_-Y2N§.visible = false;
            this.add(new §_-qt§(§_-d2x§.§_-z2o§ > §_-My§.§_-S1A§ ? §_-h2B§.§_-S1S§ : §_-h2B§.§_-n2§));
         }
         if(Game.§_-K3§ > 0)
         {
            §_-r17§();
         }
         this.§_-X2q§ = !§_-Br§.§_-f2k§ && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) && §_-d2x§.§_-z2o§ > §_-My§.§_-S1A§;
         §_-V18§.§_-S2V§(this);
         Game.stage.focus = this.§_-L12§;
         this.y = -409;
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) || §_-d2x§.§_-z2o§ <= §_-My§.§_-S1A§)
         {
            return;
         }
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-y21§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-y21§);
      }
      
      override protected function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(this.§_-iR§ || this.§_-s1L§)
         {
            return;
         }
         super.§_-O2u§(param1);
      }
      
      override protected function sendMessage(param1:String) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-aR§,(this.§_-S2t§ as §_-qt§).type,param1);
         GameSounds.play("message_send");
      }
      
      override protected function §_-21t§(param1:Event) : void
      {
         this.§_-h1h§ = this.§_-h1h§ || Math.abs(this.§_-M1N§.verticalScrollPosition - this.§_-M1N§.maxVerticalScrollPosition) < 0.01;
         super.§_-21t§(param1);
         if(this.§_-h1h§)
         {
            this.§_-M1N§.verticalScrollPosition = this.§_-M1N§.maxVerticalScrollPosition;
         }
      }
      
      override protected function §_-o1n§(param1:§_-4Y§) : void
      {
         switch(param1.button)
         {
            case this.§_-513§:
               this.§_-S2t§ = this.§_-6e§[0];
               break;
            case this.§_-pE§:
               if(!(1 in this.§_-6e§))
               {
                  this.add(new §_-qt§(§_-h2B§.§_-n2§));
               }
               this.§_-S2t§ = this.§_-6e§[1];
         }
         this.§_-h1h§ = true;
      }
      
      override protected function §_-yb§(param1:Event) : void
      {
         super.§_-yb§(param1);
         this.§_-h1h§ = false;
      }
      
      override protected function set blockChat(param1:Boolean) : void
      {
         super.blockChat = param1;
         if(!param1 && this.§_-iR§)
         {
            this.§_-X2q§ = true;
         }
      }
      
      private function §_-pC§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         §_-82N§.save(§_-82N§.§_-J1S§,{"chatState":param1});
         if(this.visible == param1)
         {
            return;
         }
         this.visible = param1;
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CHANGED));
         if(param1)
         {
            Game.stage.focus = this.§_-L12§;
            if(!this.§_-iR§)
            {
               this.§_-L12§.text = "";
            }
            if(this.§_-s1L§)
            {
               _loc2_ = 0;
               while(_loc2_ < this.§_-6e§.length)
               {
                  Connection.§_-Li§(§_-h2B§.§_-9z§,§_-h2B§.§_-E0§,(this.§_-6e§[_loc2_] as §_-qt§).type);
                  _loc2_++;
               }
            }
            this.§_-s1L§ = false;
         }
         else
         {
            Game.stage.focus = Game.stage;
         }
      }
      
      private function set §_-X2q§(param1:Boolean) : void
      {
         this.§_-iR§ = param1;
         if(!this.blockChat)
         {
            this.§_-L12§.type = param1 ? TextFieldType.DYNAMIC : TextFieldType.INPUT;
            this.§_-L12§.text = param1 ? gls("Необходим VIP статус") : "";
            this.§_-L12§.selectable = !param1;
            if(param1)
            {
               this.§_-L12§.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
            }
            else
            {
               this.§_-L12§.removeEventListener(MouseEvent.CLICK,this.§_-r1S§);
            }
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-6e§.length)
         {
            if((this.§_-6e§[_loc2_] as §_-qt§).type == §_-h2B§.§_-S1S§)
            {
               (this.§_-6e§[_loc2_] as §_-qt§).§_-X2q§ = param1;
               break;
            }
            _loc2_++;
         }
      }
      
      private function §_-p2u§(param1:MouseEvent) : void
      {
         if(this.blockChat || this.§_-iR§ || this.§_-s1L§)
         {
            return;
         }
         §_-34§();
      }
      
      private function clear() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-6e§.length)
         {
            (this.§_-6e§[_loc1_] as §_-qt§).flush();
            _loc1_++;
         }
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(!(param1.screen is §_-E1J§))
         {
            return;
         }
         this.§_-pC§(false);
         this.§_-UD§();
         §_-V18§.§_-zg§();
      }
      
      private function §_-UD§() : void
      {
         if(this.§_-s1L§)
         {
            return;
         }
         this.§_-s1L§ = true;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-6e§.length)
         {
            Connection.§_-Li§(§_-h2B§.§_-9z§,§_-h2B§.§_-B3A§,(this.§_-6e§[_loc1_] as §_-qt§).type);
            _loc1_++;
         }
         this.clear();
      }
      
      private function §_-y21§(param1:GameEvent) : void
      {
         this.§_-X2q§ = !§_-Br§.§_-f2k§;
      }
      
      private function §_-r1S§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-EI§.load(function():void
         {
            §_-m1L§.§_-Y1T§(§_-m1L§.VIP);
         });
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Player = null;
         var _loc3_:int = 0;
         if(this.§_-s1L§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-b19§:
               _loc3_ = 0;
               while(_loc3_ < this.§_-6e§.length)
               {
                  if((this.§_-6e§[_loc3_] as §_-qt§).type == param1[0])
                  {
                     (this.§_-6e§[_loc3_] as §_-qt§).§_-A3Q§(param1[1]);
                     return;
                  }
                  _loc3_++;
               }
               break;
            case §_-S2I§.§_-N29§:
               if(Game.selfId != param1[0] && Game.selfId != param1[3] && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
               {
                  return;
               }
               _loc2_ = param1[3] != 0 ? Game.getPlayer(param1[3]) : null;
               this.§_-S2t§.§_-72y§(new §_-B3Q§(Game.getPlayer(param1[0]),_loc2_,param1[4],param1[1],param1[2]));
         }
      }
      
      private function §_-y1b§(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:Boolean = true;
         while(_loc2_ != null)
         {
            if(_loc2_ is §_-v13§ || _loc2_ is §_-927§)
            {
               _loc3_ = false;
               break;
            }
            _loc2_ = _loc2_.parent;
         }
         if(_loc3_ && this.visible)
         {
            §_-V18§.§_-zg§(false);
         }
      }
      
      private function §_-027§(param1:KeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER && !this.visible && !(Game.stage.focus is TextField))
         {
            §_-V18§.§_-zg§(true);
         }
      }
   }
}

