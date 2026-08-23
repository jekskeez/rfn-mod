package chat
{
   import §_-22D§.TweenMax;
   import §_-61C§.§_-im§;
   import §_-S1n§.§_-kr§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import buttons.§_-c6§;
   import com.api.Player;
   import events.ScreenEvent;
   import events.§_-83v§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.StyleSheet;
   import flash.utils.Timer;
   import utils.§_-33I§;
   
   public class §_-O1y§ extends Sprite
   {
      
      public static const §_-63s§:int = 0;
      
      private static const §_-J4§:int = 1;
      
      private static const §_-Za§:int = 5;
      
      private static const §_-33v§:int = 15;
      
      private static const §_-m1I§:int = 65;
      
      private static const §_-h17§:int = -100;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","}",".name {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".service_message {","color: #72300B;","font-weight: bold;","}",".name_shaman {","color: #0078EA;","font-weight: bold;","}"].join("\n");
      
      private static var _instance:§_-O1y§ = null;
      
      private var style:StyleSheet = new StyleSheet();
      
      private var timer:Timer = new Timer(10 * 1000,1);
      
      private var §_-Z0§:Array = [];
      
      private var history:Array = [];
      
      private var §_-Zb§:§_-c6§ = null;
      
      private var §_-D2K§:§_-c6§ = null;
      
      private var §_-B2k§:§_-c6§ = null;
      
      private var §_-Px§:Sprite = new Sprite();
      
      private var §_-R2§:Sprite = new Sprite();
      
      private var tween:TweenMax = null;
      
      public function §_-O1y§()
      {
         super();
         _instance = this;
         this.init();
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
         Game.chat.addEventListener(§_-A2w§.§_-Sn§,this.§_-nl§);
         Game.chat.addEventListener(§_-A2w§.§_-3y§,this.§_-i2e§);
         this.§_-W1N§();
      }
      
      public static function get instance() : §_-O1y§
      {
         if(!_instance)
         {
            new §_-O1y§();
         }
         return _instance;
      }
      
      public function show() : void
      {
         this.§_-W1N§();
      }
      
      public function §_-9e§() : void
      {
         this.timer.stop();
         this.timer.reset();
         this.removeAll();
         this.§_-p§();
         this.§_-D2K§.off();
      }
      
      public function §_-k1K§(param1:Player, param2:Player, param3:int, param4:int, param5:int) : void
      {
         this.§_-GH§(new §_-VW§(param1,param2,param3,param4,param5));
      }
      
      public function sendMessage(param1:int, param2:String, param3:int = 0) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc4_:Player = Game.getPlayer(param1);
         switch(param3)
         {
            case §_-J4§:
               this.§_-GH§(new §_-X9§(_loc4_,param2,true,true,param1));
               break;
            case §_-63s§:
               this.§_-GH§(new §_-X9§(_loc4_,param2,false,true,param1));
               break;
            default:
               this.§_-m1N§(param1,param2,param3);
         }
      }
      
      public function §_-m1N§(param1:int, param2:String, param3:int, param4:int = 0) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc5_:Player = Game.getPlayer(param1);
         var _loc6_:§_-g1j§ = new §_-g1j§(_loc5_,param2,param3,param4,param1);
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) && (param3 == §_-g1j§.§_-42f§ || param3 == §_-g1j§.§_-A3O§ || param3 == §_-g1j§.§_-a9§))
         {
            if(!§_-33I§.§_-V1O§(_loc5_.rights,§_-33I§.§_-AJ§))
            {
               _loc6_.addEventListener(§_-83v§.REMOVE,this.§_-72N§,false,0,true);
            }
            else if(§_-33I§.§_-V1O§(_loc5_.rights,§_-33I§.§_-AJ§))
            {
               return;
            }
         }
         this.§_-GH§(_loc6_);
      }
      
      public function §_-z8§() : void
      {
         var _loc1_:* = 0;
         if(this.§_-Z0§.length > 0)
         {
            this.§_-Z0§[this.§_-Z0§.length - 1].y = 0;
            _loc1_ = int(this.§_-Z0§.length - 2);
            while(_loc1_ >= 0)
            {
               this.§_-Z0§[_loc1_].y = this.§_-Z0§[_loc1_ + 1].y - this.§_-Z0§[_loc1_].messageHeight;
               _loc1_--;
            }
         }
         this.§_-02O§();
      }
      
      private function init() : void
      {
         this.style.parseCSS(§_-aD§);
         this.§_-Zb§ = new §_-c6§(new ButtonFooterChatOff(),new ButtonFooterChatOn(),true);
         this.§_-Zb§.x = 20;
         this.§_-Zb§.y = 2;
         this.§_-Zb§.addEventListener(MouseEvent.CLICK,this.§_-82u§);
         new §_-kr§(this.§_-Zb§.§_-3I§,gls("Развернуть чат"));
         new §_-kr§(this.§_-Zb§.§_-A3W§,gls("Скрыть чат"));
         this.§_-B2k§ = new §_-c6§(new ButtonFooterInputboxOff(),new ButtonFooterInputboxOn(),false);
         this.§_-B2k§.x = this.§_-Zb§.x + this.§_-Zb§.width;
         this.§_-B2k§.y = this.§_-Zb§.y;
         this.§_-B2k§.addEventListener(MouseEvent.CLICK,this.§_-j12§);
         new §_-kr§(this.§_-B2k§.§_-3I§,gls("Отправить сообщение"));
         new §_-kr§(this.§_-B2k§.§_-A3W§,gls("Отмена"));
         this.§_-D2K§ = new §_-c6§(new HistoryOff(),new HistoryOn(),false);
         this.§_-D2K§.x = this.§_-B2k§.x + this.§_-B2k§.width;
         this.§_-D2K§.y = this.§_-B2k§.y;
         this.§_-D2K§.addEventListener(MouseEvent.CLICK,this.§_-GY§);
         this.§_-D2K§.visible = false;
         new §_-kr§(this.§_-D2K§.§_-3I§,gls("Показать историю чата"));
         new §_-kr§(this.§_-D2K§.§_-A3W§,gls("Скрыть историю чата"));
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-A1B§);
         addChild(this.§_-Px§);
         this.§_-R2§.visible = false;
         addChild(this.§_-R2§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
      }
      
      private function §_-W1N§(param1:Event = null) : void
      {
         this.§_-Zb§.x = §_-im§.instance.x + 20;
         this.§_-Zb§.y = Game.starling.stage.stageHeight - 50;
         this.x = §_-im§.instance.x + 20;
         this.y = this.§_-Zb§.y + §_-h17§;
         this.§_-B2k§.x = this.§_-Zb§.x + 35;
         this.§_-B2k§.y = this.§_-Zb§.y;
         this.§_-D2K§.x = this.§_-B2k§.x + 35;
         this.§_-D2K§.y = this.§_-B2k§.y;
         this.§_-z8§();
      }
      
      private function §_-82u§(param1:MouseEvent) : void
      {
         if(!this.§_-G16§)
         {
            this.§_-Px§.visible = false;
            this.§_-p§();
            return;
         }
         this.§_-Px§.visible = true;
         this.§_-D2K§.visible = this.history.length > 0 && this.§_-G16§;
         this.§_-GY§();
      }
      
      private function §_-GY§(param1:MouseEvent = null) : void
      {
         this.§_-R2§.visible = this.§_-E29§ && this.§_-D2K§.visible;
      }
      
      private function §_-p§() : void
      {
         this.§_-D2K§.visible = false;
         this.§_-GY§();
      }
      
      private function §_-j12§(param1:MouseEvent = null) : void
      {
         if(this.§_-Z17§)
         {
            Game.chat.show();
         }
         else
         {
            Game.chat.hide();
         }
      }
      
      private function removeAll() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-Z0§.length)
         {
            (this.§_-Z0§[_loc1_] as §_-X9§).dispose();
            _loc1_++;
         }
         this.§_-Z0§.splice(0);
         _loc1_ = 0;
         while(_loc1_ < this.history.length)
         {
            (this.history[_loc1_] as §_-X9§).dispose();
            _loc1_++;
         }
         this.history.splice(0);
         while(this.§_-Px§.numChildren > 0)
         {
            this.§_-Px§.removeChildAt(0);
         }
         while(this.§_-R2§.numChildren > 0)
         {
            this.§_-R2§.removeChildAt(0);
         }
      }
      
      private function §_-GH§(param1:§_-X9§) : void
      {
         if(param1.isNull)
         {
            return;
         }
         this.§_-Px§.addChild(param1);
         this.timer.reset();
         this.timer.start();
         this.§_-Z0§.push(param1);
         if(this.§_-Z0§.length > §_-Za§)
         {
            if(this.tween != null)
            {
               this.tween.§_-kl§();
            }
            this.§_-e1l§();
         }
         this.§_-z8§();
      }
      
      private function §_-A1B§(param1:TimerEvent) : void
      {
         if(this.§_-Z0§[0] == null)
         {
            return;
         }
         this.timer.stop();
         if(this.§_-G16§)
         {
            this.tween = TweenMax.to(this.§_-Z0§[0],1,{
               "alpha":0,
               "onComplete":this.§_-k1i§
            });
         }
         else
         {
            this.§_-k1i§();
         }
      }
      
      private function §_-e1l§() : void
      {
         if(this.§_-Z0§.length == 0 || this.§_-Z0§[0] == null)
         {
            return;
         }
         var _loc1_:§_-X9§ = this.§_-Z0§.shift();
         if(this.§_-Px§.contains(_loc1_))
         {
            this.§_-Px§.removeChild(_loc1_);
         }
         if(!(_loc1_ is §_-g1j§))
         {
            _loc1_.alpha = 1;
            this.history.push(_loc1_);
            this.§_-R2§.addChild(_loc1_);
         }
         this.§_-z8§();
         this.§_-ln§();
      }
      
      private function §_-k1i§() : void
      {
         this.§_-e1l§();
         this.timer.reset();
         this.timer.start();
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-u24§)
         {
            Game.§_-q1L§.addChild(this.§_-Zb§);
            Game.§_-q1L§.addChild(this.§_-D2K§);
            Game.§_-q1L§.addChild(this.§_-B2k§);
            return;
         }
         if(Game.§_-q1L§.contains(this.§_-Zb§))
         {
            Game.§_-q1L§.removeChild(this.§_-Zb§);
         }
         if(Game.§_-q1L§.contains(this.§_-D2K§))
         {
            Game.§_-q1L§.removeChild(this.§_-D2K§);
         }
         if(Game.§_-q1L§.contains(this.§_-B2k§))
         {
            Game.§_-q1L§.removeChild(this.§_-B2k§);
         }
      }
      
      private function §_-02O§() : void
      {
         var _loc3_:* = 0;
         var _loc1_:Number = §_-X9§.§_-n3§;
         var _loc2_:Number = this.§_-Z0§.length > 0 ? this.§_-Z0§[0].y - _loc1_ : -_loc1_;
         if(this.history.length > 0)
         {
            this.history[this.history.length - 1].y = _loc2_ - this.history[this.history.length - 1].messageHeight;
            _loc3_ = int(this.history.length - 2);
            while(_loc3_ >= 0)
            {
               this.history[_loc3_].y = this.history[_loc3_ + 1].y - this.history[_loc3_].messageHeight;
               _loc3_--;
            }
         }
         this.§_-ln§();
         this.§_-D2K§.visible = this.history.length > 0 && this.§_-G16§;
      }
      
      private function §_-33y§() : Number
      {
         var _loc2_:§_-X9§ = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in this.§_-Z0§)
         {
            _loc1_ += _loc2_.messageHeight;
         }
         return _loc1_;
      }
      
      private function §_-h2x§() : Number
      {
         var _loc2_:§_-X9§ = null;
         if(this.history.length == 0)
         {
            return 0;
         }
         var _loc1_:Number = §_-X9§.§_-n3§;
         for each(_loc2_ in this.history)
         {
            _loc1_ += _loc2_.messageHeight;
         }
         return _loc1_;
      }
      
      private function §_-e1t§() : Number
      {
         return Math.max(0,this.y - §_-m1I§ - this.§_-33y§());
      }
      
      private function §_-ln§() : void
      {
         var _loc2_:§_-X9§ = null;
         var _loc1_:Number = this.§_-e1t§();
         while(this.history.length > §_-33v§ || this.§_-h2x§() > _loc1_)
         {
            _loc2_ = this.history.shift() as §_-X9§;
            if(this.§_-R2§.contains(_loc2_))
            {
               this.§_-R2§.removeChild(_loc2_);
            }
            _loc2_.dispose();
         }
      }
      
      private function §_-72N§(param1:§_-83v§) : void
      {
         this.§_-Z0§.splice(this.§_-Z0§.indexOf(param1.message),1);
         if(this.§_-Px§.contains(param1.message))
         {
            this.§_-Px§.removeChild(param1.message);
         }
         param1.message.removeEventListener(§_-83v§.REMOVE,this.§_-72N§);
         param1.message.dispose();
         this.§_-z8§();
      }
      
      private function get §_-G16§() : Boolean
      {
         return !this.§_-Zb§.§_-3I§.visible;
      }
      
      private function get §_-Z17§() : Boolean
      {
         return !this.§_-B2k§.§_-3I§.visible;
      }
      
      private function get §_-E29§() : Boolean
      {
         return !this.§_-D2K§.§_-3I§.visible;
      }
      
      private function §_-nl§(param1:Event) : void
      {
         this.§_-B2k§.on();
      }
      
      private function §_-i2e§(param1:Event) : void
      {
         this.§_-B2k§.off();
      }
   }
}

