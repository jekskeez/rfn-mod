package views
{
   import §_-cm§.§_-Q2h§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class §_-83a§ extends Sprite
   {
      
      private const §_-u1w§:int = 50;
      
      private const §_-g1I§:int = 42;
      
      private var §_-L2d§:Array = [];
      
      private var §_-j2d§:Dictionary = new Dictionary();
      
      private var §_-V2C§:Dictionary = new Dictionary();
      
      public function §_-83a§()
      {
         super();
         this.x = §_-Zy§.§_-21V§ - 42;
         this.y = 50;
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         this.§_-W1N§();
      }
      
      private function §_-W1N§(param1:Event = null) : void
      {
         this.x = Game.starling.stage.stageWidth - 42;
         this.y = 50;
      }
      
      public function §_-W1T§(param1:§_-Q2h§, param2:Timer) : void
      {
         var _loc3_:§_-Q2h§ = null;
         for each(_loc3_ in this.§_-L2d§)
         {
            _loc3_.x -= 40;
         }
         param1.x = 0;
         param1.y = 0;
         param1.update(0);
         this.§_-L2d§.unshift(param1);
         addChild(param1);
         if(!param2)
         {
            return;
         }
         param2.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         this.§_-j2d§[param2] = param1;
         param2.addEventListener(TimerEvent.TIMER,this.§_-Gw§);
         this.§_-V2C§[param2] = param1;
      }
      
      public function §_-P1T§(param1:§_-Q2h§, param2:Timer) : void
      {
         this.removeBuff(param1);
         if(!(param2 in this.§_-j2d§))
         {
            return;
         }
         param2.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         delete this.§_-j2d§[param2];
         if(!(param2 in this.§_-V2C§))
         {
            return;
         }
         param2.removeEventListener(TimerEvent.TIMER,this.§_-Gw§);
         delete this.§_-V2C§[param2];
      }
      
      public function dispose() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§_-j2d§)
         {
            _loc1_.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         }
         for(_loc1_ in this.§_-V2C§)
         {
            _loc1_.removeEventListener(TimerEvent.TIMER,this.§_-Gw§);
         }
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.target as Timer;
         if(!(_loc2_ in this.§_-j2d§))
         {
            return;
         }
         _loc2_.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         this.removeBuff(this.§_-j2d§[_loc2_]);
         delete this.§_-j2d§[_loc2_];
         if(!(_loc2_ in this.§_-V2C§))
         {
            return;
         }
         _loc2_.removeEventListener(TimerEvent.TIMER,this.§_-Gw§);
         delete this.§_-V2C§[_loc2_];
      }
      
      private function removeBuff(param1:§_-Q2h§) : void
      {
         var _loc2_:int = this.§_-L2d§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-L2d§.splice(_loc2_,1);
         if(contains(param1))
         {
            removeChild(param1);
         }
         var _loc3_:int = _loc2_;
         while(_loc3_ < this.§_-L2d§.length)
         {
            this.§_-L2d§[_loc3_].x += 40;
            _loc3_++;
         }
      }
      
      private function §_-Gw§(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.target as Timer;
         if(!(_loc2_ in this.§_-V2C§))
         {
            return;
         }
         this.§_-V2C§[_loc2_].update(int(_loc2_.currentCount / _loc2_.repeatCount * 100));
      }
   }
}

