package views
{
   import §_-RI§.§_-h2I§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   
   public class §_-nd§ extends §_-h2I§
   {
      
      public static const §_-J2D§:int = 0;
      
      public static const §_-S6§:int = 3;
      
      public static const §_-jM§:int = 6;
      
      private static var _instance:§_-nd§ = null;
      
      private var §_-t1A§:Number = 1;
      
      private var §_-o2U§:Number = 1;
      
      private var §_-Qy§:Number = 0;
      
      private var deltaX:Number = 0;
      
      private var §_-z2h§:Timer = new Timer(2000);
      
      private var §_-sh§:Timer = new Timer(2000);
      
      private var §_-Iy§:Timer = new Timer(20 * 1000,1);
      
      private var §_-eB§:Timer = new Timer(30);
      
      private var mode:int = 0;
      
      private var §_-61k§:Array = [];
      
      private var §_-R2M§:Object = {};
      
      private var §_-A3G§:Object = {};
      
      private var §_-7d§:Boolean = false;
      
      public function §_-nd§()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public static function start(param1:int, param2:int) : void
      {
         if(!_instance)
         {
            _instance = new §_-nd§();
            SquirrelGame.instance.§_-83v§(_instance.getStarlingView());
         }
         _instance.start(param1,param2);
      }
      
      public static function stop(param1:int, param2:int) : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.stop(param1,param2);
      }
      
      public static function §_-23V§(param1:int = 0, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(_instance == null)
         {
            return;
         }
         if(!param2)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < _instance.§_-61k§.length)
            {
               if(_instance.§_-61k§[_loc4_]["mode"] != param1)
               {
                  _loc3_.push(_instance.§_-61k§[_loc4_]);
               }
               _loc4_++;
            }
            _instance.§_-61k§ = _loc3_;
            if(_instance.§_-61k§.length != 0)
            {
               _instance.mode = _instance.§_-61k§[_instance.§_-61k§.length - 1];
               return;
            }
         }
         else
         {
            _instance.§_-61k§ = [];
         }
         _instance.§_-n2r§();
      }
      
      public function get §_-l2N§() : Number
      {
         return this.§_-t1A§;
      }
      
      public function set §_-l2N§(param1:Number) : void
      {
         this.§_-t1A§ = param1;
      }
      
      public function get §_-u2x§() : int
      {
         return this.§_-o2U§;
      }
      
      public function set §_-u2x§(param1:int) : void
      {
         this.§_-o2U§ = param1;
      }
      
      public function start(param1:int, param2:int) : void
      {
         var _loc3_:Boolean = this.§_-61k§.length != 0;
         this.§_-61k§.push({
            "mode":param1,
            "playerId":param2
         });
         this.mode = param1;
         if(_loc3_)
         {
            return;
         }
         if(!this.§_-7d§)
         {
            this.§_-a2d§();
            this.§_-7d§ = true;
         }
         this.§_-z2h§.reset();
         this.§_-z2h§.start();
         this.§_-Iy§.reset();
         this.§_-Iy§.start();
         setTimeout(this.§_-W5§,500);
      }
      
      private function §_-W5§() : void
      {
         this.§_-sh§.reset();
         this.§_-sh§.start();
      }
      
      public function stop(param1:int, param2:int) : void
      {
         if(this.§_-61k§.length == 0)
         {
            return;
         }
         var _loc3_:* = int(this.§_-61k§.length - 1);
         while(_loc3_ >= 0)
         {
            if(this.§_-61k§[_loc3_]["playerId"] == param2 && this.§_-61k§[_loc3_]["mode"] == param1)
            {
               this.§_-61k§.splice(_loc3_,1);
            }
            _loc3_--;
         }
         if(this.§_-61k§.length != 0)
         {
            this.mode = this.§_-61k§[this.§_-61k§.length - 1]["mode"];
            return;
         }
         this.§_-n2r§();
      }
      
      private function init() : void
      {
         this.§_-z2h§.addEventListener(TimerEvent.TIMER,this.§_-CV§);
         this.§_-sh§.addEventListener(TimerEvent.TIMER,this.snowGenerator2);
         this.§_-Iy§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-Ty§);
         this.§_-eB§.addEventListener(TimerEvent.TIMER,this.§_-pu§);
      }
      
      private function §_-a2d§() : void
      {
         this.init();
         this.§_-A3G§[§_-S6§] = [FlowerFlakeImage2,FlowerFlakeImage3];
         this.§_-R2M§[§_-S6§] = [FlowerFlakeImage1,FlowerFlakeImage4,FlowerFlakeImage5];
         this.§_-A3G§[§_-jM§] = [NewYearFlakeImage];
         this.§_-R2M§[§_-jM§] = [NewYearFlakeImage];
      }
      
      private function §_-n2r§() : void
      {
         this.§_-z2h§.stop();
         this.§_-sh§.stop();
         this.§_-Iy§.stop();
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
      }
      
      private function §_-CV§(param1:TimerEvent) : void
      {
         var _loc2_:§_-h2I§ = null;
         switch(this.mode)
         {
            case §_-nd§.§_-J2D§:
               return;
            default:
               _loc2_ = new §_-h2I§(new this.§_-R2M§[this.mode][int(Math.random() * this.§_-R2M§[this.mode].length)]());
               _loc2_.rotation = Math.random() * 360;
               var _loc3_:§_-02h§ = new §_-02h§(this,_loc2_);
               _loc3_.x = -30 + Math.random() * (Game.starling.stage.stageWidth + 30);
               _loc3_.y = -30;
               §_-83v§(_loc3_);
               return;
         }
      }
      
      private function snowGenerator2(param1:TimerEvent) : void
      {
         var _loc2_:§_-h2I§ = null;
         switch(this.mode)
         {
            case §_-nd§.§_-J2D§:
               return;
            default:
               _loc2_ = new §_-h2I§(new this.§_-A3G§[this.mode][int(Math.random() * this.§_-A3G§[this.mode].length)]());
               _loc2_.rotation = Math.random() * 360;
               var _loc3_:§_-02h§ = new §_-02h§(this,_loc2_);
               _loc3_.x = -30 + Math.random() * (§_-a9§.§_-9o§ + 30);
               _loc3_.y = -30;
               §_-83v§(_loc3_);
               return;
         }
      }
      
      private function §_-Ty§(param1:TimerEvent) : void
      {
         this.§_-Qy§ = Math.random() * 2 - Math.random() * 2;
         this.deltaX = (this.§_-Qy§ - this.§_-t1A§) / (50 + Math.random() * 20);
         this.§_-eB§.reset();
         this.§_-eB§.start();
      }
      
      private function §_-pu§(param1:TimerEvent) : void
      {
         this.§_-l2N§ += this.deltaX;
         if(Math.round(this.§_-l2N§ * 10) / 10 == Math.round(this.§_-Qy§ * 10) / 10)
         {
            this.§_-eB§.stop();
            this.§_-Iy§.reset();
            this.§_-Iy§.start();
         }
      }
   }
}

