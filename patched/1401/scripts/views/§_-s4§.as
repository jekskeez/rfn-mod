package views
{
   import §_-T1r§.§_-03i§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class §_-s4§ extends Sprite
   {
      
      private const §_-m24§:int = 50;
      
      private const §_-U1U§:int = 42;
      
      private var §_-r2D§:Array = [];
      
      private var §_-DN§:Dictionary = new Dictionary();
      
      private var §_-22i§:Dictionary = new Dictionary();
      
      public function §_-s4§()
      {
         super();
         this.x = §_-a9§.§_-9o§ - 42;
         this.y = 50;
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         this.§_-A3q§();
      }
      
      private function §_-A3q§(param1:Event = null) : void
      {
         this.x = Game.starling.stage.stageWidth - 42;
         this.y = 50;
      }
      
      public function §_-Aj§(param1:§_-03i§, param2:Timer) : void
      {
         var _loc3_:§_-03i§ = null;
         for each(_loc3_ in this.§_-r2D§)
         {
            _loc3_.x -= 40;
         }
         param1.x = 0;
         param1.y = 0;
         param1.update(0);
         this.§_-r2D§.unshift(param1);
         addChild(param1);
         if(!param2)
         {
            return;
         }
         param2.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         this.§_-DN§[param2] = param1;
         param2.addEventListener(TimerEvent.TIMER,this.§_-r1N§);
         this.§_-22i§[param2] = param1;
      }
      
      public function §_-73u§(param1:§_-03i§, param2:Timer) : void
      {
         this.removeBuff(param1);
         if(!(param2 in this.§_-DN§))
         {
            return;
         }
         param2.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         delete this.§_-DN§[param2];
         if(!(param2 in this.§_-22i§))
         {
            return;
         }
         param2.removeEventListener(TimerEvent.TIMER,this.§_-r1N§);
         delete this.§_-22i§[param2];
      }
      
      public function dispose() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§_-DN§)
         {
            _loc1_.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         }
         for(_loc1_ in this.§_-22i§)
         {
            _loc1_.removeEventListener(TimerEvent.TIMER,this.§_-r1N§);
         }
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.target as Timer;
         if(!(_loc2_ in this.§_-DN§))
         {
            return;
         }
         _loc2_.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         this.removeBuff(this.§_-DN§[_loc2_]);
         delete this.§_-DN§[_loc2_];
         if(!(_loc2_ in this.§_-22i§))
         {
            return;
         }
         _loc2_.removeEventListener(TimerEvent.TIMER,this.§_-r1N§);
         delete this.§_-22i§[_loc2_];
      }
      
      private function removeBuff(param1:§_-03i§) : void
      {
         var _loc2_:int = this.§_-r2D§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-r2D§.splice(_loc2_,1);
         if(contains(param1))
         {
            removeChild(param1);
         }
         var _loc3_:int = _loc2_;
         while(_loc3_ < this.§_-r2D§.length)
         {
            this.§_-r2D§[_loc3_].x += 40;
            _loc3_++;
         }
      }
      
      private function §_-r1N§(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.target as Timer;
         if(!(_loc2_ in this.§_-22i§))
         {
            return;
         }
         this.§_-22i§[_loc2_].update(int(_loc2_.currentCount / _loc2_.repeatCount * 100));
      }
   }
}

