package views
{
   import §_-TK§.§_-aS§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   
   public class §_-TE§ extends §_-aS§
   {
      
      public static const §_-J3§:int = 0;
      
      public static const §_-A1C§:int = 3;
      
      public static const §_-e2G§:int = 6;
      
      private static var _instance:§_-TE§ = null;
      
      private var §_-ja§:Number = 1;
      
      private var §_-217§:Number = 1;
      
      private var §_-02y§:Number = 0;
      
      private var deltaX:Number = 0;
      
      private var §_-x1M§:Timer = new Timer(2000);
      
      private var §_-Tr§:Timer = new Timer(2000);
      
      private var §_-g14§:Timer = new Timer(20 * 1000,1);
      
      private var §_-010§:Timer = new Timer(30);
      
      private var mode:int = 0;
      
      private var §_-nv§:Array = [];
      
      private var §_-93X§:Object = {};
      
      private var §_-F4§:Object = {};
      
      private var §_-Rm§:Boolean = false;
      
      public function §_-TE§()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public static function start(param1:int, param2:int) : void
      {
         if(!_instance)
         {
            _instance = new §_-TE§();
            SquirrelGame.instance.§_-J2J§(_instance.getStarlingView());
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
      
      public static function §_-82M§(param1:int = 0, param2:Boolean = false) : void
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
            while(_loc4_ < _instance.§_-nv§.length)
            {
               if(_instance.§_-nv§[_loc4_]["mode"] != param1)
               {
                  _loc3_.push(_instance.§_-nv§[_loc4_]);
               }
               _loc4_++;
            }
            _instance.§_-nv§ = _loc3_;
            if(_instance.§_-nv§.length != 0)
            {
               _instance.mode = _instance.§_-nv§[_instance.§_-nv§.length - 1];
               return;
            }
         }
         else
         {
            _instance.§_-nv§ = [];
         }
         _instance.§_-t2l§();
      }
      
      public function get §_-a2R§() : Number
      {
         return this.§_-ja§;
      }
      
      public function set §_-a2R§(param1:Number) : void
      {
         this.§_-ja§ = param1;
      }
      
      public function get §_-GP§() : int
      {
         return this.§_-217§;
      }
      
      public function set §_-GP§(param1:int) : void
      {
         this.§_-217§ = param1;
      }
      
      public function start(param1:int, param2:int) : void
      {
         var _loc3_:Boolean = this.§_-nv§.length != 0;
         this.§_-nv§.push({
            "mode":param1,
            "playerId":param2
         });
         this.mode = param1;
         if(_loc3_)
         {
            return;
         }
         if(!this.§_-Rm§)
         {
            this.§_-P2H§();
            this.§_-Rm§ = true;
         }
         this.§_-x1M§.reset();
         this.§_-x1M§.start();
         this.§_-g14§.reset();
         this.§_-g14§.start();
         setTimeout(this.§_-k19§,500);
      }
      
      private function §_-k19§() : void
      {
         this.§_-Tr§.reset();
         this.§_-Tr§.start();
      }
      
      public function stop(param1:int, param2:int) : void
      {
         if(this.§_-nv§.length == 0)
         {
            return;
         }
         var _loc3_:* = int(this.§_-nv§.length - 1);
         while(_loc3_ >= 0)
         {
            if(this.§_-nv§[_loc3_]["playerId"] == param2 && this.§_-nv§[_loc3_]["mode"] == param1)
            {
               this.§_-nv§.splice(_loc3_,1);
            }
            _loc3_--;
         }
         if(this.§_-nv§.length != 0)
         {
            this.mode = this.§_-nv§[this.§_-nv§.length - 1]["mode"];
            return;
         }
         this.§_-t2l§();
      }
      
      private function init() : void
      {
         this.§_-x1M§.addEventListener(TimerEvent.TIMER,this.§_-6t§);
         this.§_-Tr§.addEventListener(TimerEvent.TIMER,this.snowGenerator2);
         this.§_-g14§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-s2C§);
         this.§_-010§.addEventListener(TimerEvent.TIMER,this.§_-F1W§);
      }
      
      private function §_-P2H§() : void
      {
         this.init();
         this.§_-F4§[§_-A1C§] = [FlowerFlakeImage2,FlowerFlakeImage3];
         this.§_-93X§[§_-A1C§] = [FlowerFlakeImage1,FlowerFlakeImage4,FlowerFlakeImage5];
         this.§_-F4§[§_-e2G§] = [NewYearFlakeImage];
         this.§_-93X§[§_-e2G§] = [NewYearFlakeImage];
      }
      
      private function §_-t2l§() : void
      {
         this.§_-x1M§.stop();
         this.§_-Tr§.stop();
         this.§_-g14§.stop();
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
      }
      
      private function §_-6t§(param1:TimerEvent) : void
      {
         var _loc2_:§_-aS§ = null;
         switch(this.mode)
         {
            case §_-TE§.§_-J3§:
               return;
            default:
               _loc2_ = new §_-aS§(new this.§_-93X§[this.mode][int(Math.random() * this.§_-93X§[this.mode].length)]());
               _loc2_.rotation = Math.random() * 360;
               var _loc3_:§_-13f§ = new §_-13f§(this,_loc2_);
               _loc3_.x = -30 + Math.random() * (Game.starling.stage.stageWidth + 30);
               _loc3_.y = -30;
               §_-J2J§(_loc3_);
               return;
         }
      }
      
      private function snowGenerator2(param1:TimerEvent) : void
      {
         var _loc2_:§_-aS§ = null;
         switch(this.mode)
         {
            case §_-TE§.§_-J3§:
               return;
            default:
               _loc2_ = new §_-aS§(new this.§_-F4§[this.mode][int(Math.random() * this.§_-F4§[this.mode].length)]());
               _loc2_.rotation = Math.random() * 360;
               var _loc3_:§_-13f§ = new §_-13f§(this,_loc2_);
               _loc3_.x = -30 + Math.random() * (§_-Zy§.§_-21V§ + 30);
               _loc3_.y = -30;
               §_-J2J§(_loc3_);
               return;
         }
      }
      
      private function §_-s2C§(param1:TimerEvent) : void
      {
         this.§_-02y§ = Math.random() * 2 - Math.random() * 2;
         this.deltaX = (this.§_-02y§ - this.§_-ja§) / (50 + Math.random() * 20);
         this.§_-010§.reset();
         this.§_-010§.start();
      }
      
      private function §_-F1W§(param1:TimerEvent) : void
      {
         this.§_-a2R§ += this.deltaX;
         if(Math.round(this.§_-a2R§ * 10) / 10 == Math.round(this.§_-02y§ * 10) / 10)
         {
            this.§_-010§.stop();
            this.§_-g14§.reset();
            this.§_-g14§.start();
         }
      }
   }
}

