package chat
{
   import §_-42B§.TweenMax;
   import §_-S1D§.§_-3m§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-p1R§;
   import com.api.Player;
   import events.ScreenEvent;
   import events.§_-11G§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.StyleSheet;
   import flash.utils.Timer;
   import utils.§_-c10§;
   
   public class §_-r0§ extends Sprite
   {
      
      public static const §_-vi§:int = 0;
      
      private static const §_-yv§:int = 1;
      
      private static const §_-P1m§:int = 5;
      
      private static const §_-PL§:int = 15;
      
      private static const §_-t20§:int = 65;
      
      private static const §_-728§:int = -100;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","}",".name {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".service_message {","color: #72300B;","font-weight: bold;","}",".name_shaman {","color: #0078EA;","font-weight: bold;","}"].join("\n");
      
      private static var _instance:§_-r0§ = null;
      
      private var style:StyleSheet = new StyleSheet();
      
      private var timer:Timer = new Timer(10 * 1000,1);
      
      private var §_-03P§:Array = [];
      
      private var history:Array = [];
      
      private var §_-ya§:§_-p1R§ = null;
      
      private var §_-83h§:§_-p1R§ = null;
      
      private var §_-WL§:§_-p1R§ = null;
      
      private var §_-53q§:Sprite = new Sprite();
      
      private var §_-92V§:Sprite = new Sprite();
      
      private var tween:TweenMax = null;
      
      public function §_-r0§()
      {
         super();
         _instance = this;
         this.init();
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
         Game.chat.addEventListener(§_-6O§.§_-013§,this.§_-o17§);
         Game.chat.addEventListener(§_-6O§.§_-V1c§,this.§_-X29§);
         this.§_-A3q§();
      }
      
      public static function get instance() : §_-r0§
      {
         if(!_instance)
         {
            new §_-r0§();
         }
         return _instance;
      }
      
      public function show() : void
      {
         this.§_-A3q§();
      }
      
      public function §_-52u§() : void
      {
         this.timer.stop();
         this.timer.reset();
         this.removeAll();
         this.§_-h1S§();
         this.§_-83h§.off();
      }
      
      public function §_-1y§(param1:Player, param2:Player, param3:int, param4:int, param5:int) : void
      {
         this.§_-72y§(new §_-x2C§(param1,param2,param3,param4,param5));
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
            case §_-yv§:
               this.§_-72y§(new §_-s2y§(_loc4_,param2,true,true,param1));
               break;
            case §_-vi§:
               this.§_-72y§(new §_-s2y§(_loc4_,param2,false,true,param1));
               break;
            default:
               this.§_-n1I§(param1,param2,param3);
         }
      }
      
      public function §_-n1I§(param1:int, param2:String, param3:int, param4:int = 0) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc5_:Player = Game.getPlayer(param1);
         var _loc6_:§_-A1n§ = new §_-A1n§(_loc5_,param2,param3,param4,param1);
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) && (param3 == §_-A1n§.§_-32a§ || param3 == §_-A1n§.§_-iG§ || param3 == §_-A1n§.§_-7u§))
         {
            if(!§_-c10§.§_-73j§(_loc5_.rights,§_-c10§.§_-639§))
            {
               _loc6_.addEventListener(§_-11G§.REMOVE,this.§_-G1b§,false,0,true);
            }
            else if(§_-c10§.§_-73j§(_loc5_.rights,§_-c10§.§_-639§))
            {
               return;
            }
         }
         this.§_-72y§(_loc6_);
      }
      
      public function §_-t2S§() : void
      {
         var _loc1_:* = 0;
         if(this.§_-03P§.length > 0)
         {
            this.§_-03P§[this.§_-03P§.length - 1].y = 0;
            _loc1_ = int(this.§_-03P§.length - 2);
            while(_loc1_ >= 0)
            {
               this.§_-03P§[_loc1_].y = this.§_-03P§[_loc1_ + 1].y - this.§_-03P§[_loc1_].messageHeight;
               _loc1_--;
            }
         }
         this.§_-Z1X§();
      }
      
      private function init() : void
      {
         this.style.parseCSS(§_-I2U§);
         this.§_-ya§ = new §_-p1R§(new ButtonFooterChatOff(),new ButtonFooterChatOn(),true);
         this.§_-ya§.x = 20;
         this.§_-ya§.y = 2;
         this.§_-ya§.addEventListener(MouseEvent.CLICK,this.§_-pC§);
         new §_-Hb§(this.§_-ya§.§_-H1o§,gls("Развернуть чат"));
         new §_-Hb§(this.§_-ya§.§_-l2A§,gls("Скрыть чат"));
         this.§_-WL§ = new §_-p1R§(new ButtonFooterInputboxOff(),new ButtonFooterInputboxOn(),false);
         this.§_-WL§.x = this.§_-ya§.x + this.§_-ya§.width;
         this.§_-WL§.y = this.§_-ya§.y;
         this.§_-WL§.addEventListener(MouseEvent.CLICK,this.§_-a1s§);
         new §_-Hb§(this.§_-WL§.§_-H1o§,gls("Отправить сообщение"));
         new §_-Hb§(this.§_-WL§.§_-l2A§,gls("Отмена"));
         this.§_-83h§ = new §_-p1R§(new HistoryOff(),new HistoryOn(),false);
         this.§_-83h§.x = this.§_-WL§.x + this.§_-WL§.width;
         this.§_-83h§.y = this.§_-WL§.y;
         this.§_-83h§.addEventListener(MouseEvent.CLICK,this.§_-71p§);
         this.§_-83h§.visible = false;
         new §_-Hb§(this.§_-83h§.§_-H1o§,gls("Показать историю чата"));
         new §_-Hb§(this.§_-83h§.§_-l2A§,gls("Скрыть историю чата"));
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-33t§);
         addChild(this.§_-53q§);
         this.§_-92V§.visible = false;
         addChild(this.§_-92V§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
      }
      
      private function §_-A3q§(param1:Event = null) : void
      {
         this.§_-ya§.x = §_-3m§.instance.x + 20;
         this.§_-ya§.y = Game.starling.stage.stageHeight - 50;
         this.x = §_-3m§.instance.x + 20;
         this.y = this.§_-ya§.y + §_-728§;
         this.§_-WL§.x = this.§_-ya§.x + 35;
         this.§_-WL§.y = this.§_-ya§.y;
         this.§_-83h§.x = this.§_-WL§.x + 35;
         this.§_-83h§.y = this.§_-WL§.y;
         this.§_-t2S§();
      }
      
      private function §_-pC§(param1:MouseEvent) : void
      {
         if(!this.§_-y14§)
         {
            this.§_-53q§.visible = false;
            this.§_-h1S§();
            return;
         }
         this.§_-53q§.visible = true;
         this.§_-83h§.visible = this.history.length > 0 && this.§_-y14§;
         this.§_-71p§();
      }
      
      private function §_-71p§(param1:MouseEvent = null) : void
      {
         this.§_-92V§.visible = this.§_-p2P§ && this.§_-83h§.visible;
      }
      
      private function §_-h1S§() : void
      {
         this.§_-83h§.visible = false;
         this.§_-71p§();
      }
      
      private function §_-a1s§(param1:MouseEvent = null) : void
      {
         if(this.§_-l2S§)
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
         while(_loc1_ < this.§_-03P§.length)
         {
            (this.§_-03P§[_loc1_] as §_-s2y§).dispose();
            _loc1_++;
         }
         this.§_-03P§.splice(0);
         _loc1_ = 0;
         while(_loc1_ < this.history.length)
         {
            (this.history[_loc1_] as §_-s2y§).dispose();
            _loc1_++;
         }
         this.history.splice(0);
         while(this.§_-53q§.numChildren > 0)
         {
            this.§_-53q§.removeChildAt(0);
         }
         while(this.§_-92V§.numChildren > 0)
         {
            this.§_-92V§.removeChildAt(0);
         }
      }
      
      private function §_-72y§(param1:§_-s2y§) : void
      {
         if(param1.isNull)
         {
            return;
         }
         this.§_-53q§.addChild(param1);
         this.timer.reset();
         this.timer.start();
         this.§_-03P§.push(param1);
         if(this.§_-03P§.length > §_-P1m§)
         {
            if(this.tween != null)
            {
               this.tween.§_-h2r§();
            }
            this.§_-E2z§();
         }
         this.§_-t2S§();
      }
      
      private function §_-33t§(param1:TimerEvent) : void
      {
         if(this.§_-03P§[0] == null)
         {
            return;
         }
         this.timer.stop();
         if(this.§_-y14§)
         {
            this.tween = TweenMax.to(this.§_-03P§[0],1,{
               "alpha":0,
               "onComplete":this.§_-g15§
            });
         }
         else
         {
            this.§_-g15§();
         }
      }
      
      private function §_-E2z§() : void
      {
         if(this.§_-03P§.length == 0 || this.§_-03P§[0] == null)
         {
            return;
         }
         var _loc1_:§_-s2y§ = this.§_-03P§.shift();
         if(this.§_-53q§.contains(_loc1_))
         {
            this.§_-53q§.removeChild(_loc1_);
         }
         if(!(_loc1_ is §_-A1n§))
         {
            _loc1_.alpha = 1;
            this.history.push(_loc1_);
            this.§_-92V§.addChild(_loc1_);
         }
         this.§_-t2S§();
         this.§_-NR§();
      }
      
      private function §_-g15§() : void
      {
         this.§_-E2z§();
         this.timer.reset();
         this.timer.start();
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-92z§)
         {
            Game.§_-d2t§.addChild(this.§_-ya§);
            Game.§_-d2t§.addChild(this.§_-83h§);
            Game.§_-d2t§.addChild(this.§_-WL§);
            return;
         }
         if(Game.§_-d2t§.contains(this.§_-ya§))
         {
            Game.§_-d2t§.removeChild(this.§_-ya§);
         }
         if(Game.§_-d2t§.contains(this.§_-83h§))
         {
            Game.§_-d2t§.removeChild(this.§_-83h§);
         }
         if(Game.§_-d2t§.contains(this.§_-WL§))
         {
            Game.§_-d2t§.removeChild(this.§_-WL§);
         }
      }
      
      private function §_-Z1X§() : void
      {
         var _loc3_:* = 0;
         var _loc1_:Number = §_-s2y§.§_-K2E§;
         var _loc2_:Number = this.§_-03P§.length > 0 ? this.§_-03P§[0].y - _loc1_ : -_loc1_;
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
         this.§_-NR§();
         this.§_-83h§.visible = this.history.length > 0 && this.§_-y14§;
      }
      
      private function §_-Y1s§() : Number
      {
         var _loc2_:§_-s2y§ = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in this.§_-03P§)
         {
            _loc1_ += _loc2_.messageHeight;
         }
         return _loc1_;
      }
      
      private function §_-bG§() : Number
      {
         var _loc2_:§_-s2y§ = null;
         if(this.history.length == 0)
         {
            return 0;
         }
         var _loc1_:Number = §_-s2y§.§_-K2E§;
         for each(_loc2_ in this.history)
         {
            _loc1_ += _loc2_.messageHeight;
         }
         return _loc1_;
      }
      
      private function §_-524§() : Number
      {
         return Math.max(0,this.y - §_-t20§ - this.§_-Y1s§());
      }
      
      private function §_-NR§() : void
      {
         var _loc2_:§_-s2y§ = null;
         var _loc1_:Number = this.§_-524§();
         while(this.history.length > §_-PL§ || this.§_-bG§() > _loc1_)
         {
            _loc2_ = this.history.shift() as §_-s2y§;
            if(this.§_-92V§.contains(_loc2_))
            {
               this.§_-92V§.removeChild(_loc2_);
            }
            _loc2_.dispose();
         }
      }
      
      private function §_-G1b§(param1:§_-11G§) : void
      {
         this.§_-03P§.splice(this.§_-03P§.indexOf(param1.message),1);
         if(this.§_-53q§.contains(param1.message))
         {
            this.§_-53q§.removeChild(param1.message);
         }
         param1.message.removeEventListener(§_-11G§.REMOVE,this.§_-G1b§);
         param1.message.dispose();
         this.§_-t2S§();
      }
      
      private function get §_-y14§() : Boolean
      {
         return !this.§_-ya§.§_-H1o§.visible;
      }
      
      private function get §_-l2S§() : Boolean
      {
         return !this.§_-WL§.§_-H1o§.visible;
      }
      
      private function get §_-p2P§() : Boolean
      {
         return !this.§_-83h§.§_-H1o§.visible;
      }
      
      private function §_-o17§(param1:Event) : void
      {
         this.§_-WL§.on();
      }
      
      private function §_-X29§(param1:Event) : void
      {
         this.§_-WL§.off();
      }
   }
}

