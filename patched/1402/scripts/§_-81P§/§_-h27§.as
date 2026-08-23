package §_-81P§
{
   import §_-f1T§.Event;
   import §_-f1T§.EventDispatcher;
   import starling.core.starling_internal;
   
   use namespace starling_internal;
   
   public class §_-h27§ extends EventDispatcher implements §_-93Y§
   {
      
      private static var §_-Q1N§:Vector.<§_-h27§> = new Vector.<§_-h27§>(0);
      
      private var §_-Y2q§:Number;
      
      private var §_-SV§:Number;
      
      private var §_-l2h§:Function;
      
      private var §_-m2B§:Array;
      
      private var §_-h1c§:int;
      
      public function §_-h27§(param1:Function, param2:Number, param3:Array = null)
      {
         super();
         this.reset(param1,param2,param3);
      }
      
      starling_internal static function §_-11t§(param1:Function, param2:Number, param3:Array = null) : §_-h27§
      {
         if(§_-Q1N§.length)
         {
            return §_-Q1N§.pop().reset(param1,param2,param3);
         }
         return new §_-h27§(param1,param2,param3);
      }
      
      starling_internal static function §_-b3§(param1:§_-h27§) : void
      {
         param1.§_-l2h§ = null;
         param1.§_-m2B§ = null;
         param1.§_-b1M§();
         §_-Q1N§.push(param1);
      }
      
      public function reset(param1:Function, param2:Number, param3:Array = null) : §_-h27§
      {
         this.§_-Y2q§ = 0;
         this.§_-SV§ = Math.max(param2,0.0001);
         this.§_-l2h§ = param1;
         this.§_-m2B§ = param3;
         this.§_-h1c§ = 1;
         return this;
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc3_:Function = null;
         var _loc4_:Array = null;
         var _loc2_:Number = this.§_-Y2q§;
         this.§_-Y2q§ += param1;
         if(this.§_-Y2q§ > this.§_-SV§)
         {
            this.§_-Y2q§ = this.§_-SV§;
         }
         if(_loc2_ < this.§_-SV§ && this.§_-Y2q§ >= this.§_-SV§)
         {
            if(this.§_-h1c§ == 0 || this.§_-h1c§ > 1)
            {
               this.§_-l2h§.apply(null,this.§_-m2B§);
               if(this.§_-h1c§ > 0)
               {
                  --this.§_-h1c§;
               }
               this.§_-Y2q§ = 0;
               this.§_-a1Q§(_loc2_ + param1 - this.§_-SV§);
            }
            else
            {
               _loc3_ = this.§_-l2h§;
               _loc4_ = this.§_-m2B§;
               §_-12v§(Event.§_-a2X§);
               _loc3_.apply(null,_loc4_);
            }
         }
      }
      
      public function complete() : void
      {
         var _loc1_:Number = this.§_-SV§ - this.§_-Y2q§;
         if(_loc1_ > 0)
         {
            this.§_-a1Q§(_loc1_);
         }
      }
      
      public function get §_-HU§() : Boolean
      {
         return this.§_-h1c§ == 1 && this.§_-Y2q§ >= this.§_-SV§;
      }
      
      public function get §_-R1Z§() : Number
      {
         return this.§_-SV§;
      }
      
      public function get currentTime() : Number
      {
         return this.§_-Y2q§;
      }
      
      public function get repeatCount() : int
      {
         return this.§_-h1c§;
      }
      
      public function set repeatCount(param1:int) : void
      {
         this.§_-h1c§ = param1;
      }
   }
}

