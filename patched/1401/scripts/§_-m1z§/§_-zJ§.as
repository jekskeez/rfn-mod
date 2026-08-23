package §_-m1z§
{
   import §_-K2c§.Event;
   import §_-K2c§.EventDispatcher;
   import starling.core.starling_internal;
   
   use namespace starling_internal;
   
   public class §_-zJ§ extends EventDispatcher implements §_-N1Q§
   {
      
      private static var §_-I8§:Vector.<§_-zJ§> = new Vector.<§_-zJ§>(0);
      
      private var §_-61r§:Number;
      
      private var §_-GP§:Number;
      
      private var §_-Q2O§:Function;
      
      private var §_-R1b§:Array;
      
      private var §_-7a§:int;
      
      public function §_-zJ§(param1:Function, param2:Number, param3:Array = null)
      {
         super();
         this.reset(param1,param2,param3);
      }
      
      starling_internal static function §_-11x§(param1:Function, param2:Number, param3:Array = null) : §_-zJ§
      {
         if(§_-I8§.length)
         {
            return §_-I8§.pop().reset(param1,param2,param3);
         }
         return new §_-zJ§(param1,param2,param3);
      }
      
      starling_internal static function §_-3h§(param1:§_-zJ§) : void
      {
         param1.§_-Q2O§ = null;
         param1.§_-R1b§ = null;
         param1.§_-b8§();
         §_-I8§.push(param1);
      }
      
      public function reset(param1:Function, param2:Number, param3:Array = null) : §_-zJ§
      {
         this.§_-61r§ = 0;
         this.§_-GP§ = Math.max(param2,0.0001);
         this.§_-Q2O§ = param1;
         this.§_-R1b§ = param3;
         this.§_-7a§ = 1;
         return this;
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc3_:Function = null;
         var _loc4_:Array = null;
         var _loc2_:Number = this.§_-61r§;
         this.§_-61r§ += param1;
         if(this.§_-61r§ > this.§_-GP§)
         {
            this.§_-61r§ = this.§_-GP§;
         }
         if(_loc2_ < this.§_-GP§ && this.§_-61r§ >= this.§_-GP§)
         {
            if(this.§_-7a§ == 0 || this.§_-7a§ > 1)
            {
               this.§_-Q2O§.apply(null,this.§_-R1b§);
               if(this.§_-7a§ > 0)
               {
                  --this.§_-7a§;
               }
               this.§_-61r§ = 0;
               this.§_-ld§(_loc2_ + param1 - this.§_-GP§);
            }
            else
            {
               _loc3_ = this.§_-Q2O§;
               _loc4_ = this.§_-R1b§;
               §_-g11§(Event.§_-P2F§);
               _loc3_.apply(null,_loc4_);
            }
         }
      }
      
      public function complete() : void
      {
         var _loc1_:Number = this.§_-GP§ - this.§_-61r§;
         if(_loc1_ > 0)
         {
            this.§_-ld§(_loc1_);
         }
      }
      
      public function get §_-Y2w§() : Boolean
      {
         return this.§_-7a§ == 1 && this.§_-61r§ >= this.§_-GP§;
      }
      
      public function get §_-D2C§() : Number
      {
         return this.§_-GP§;
      }
      
      public function get currentTime() : Number
      {
         return this.§_-61r§;
      }
      
      public function get repeatCount() : int
      {
         return this.§_-7a§;
      }
      
      public function set repeatCount(param1:int) : void
      {
         this.§_-7a§ = param1;
      }
   }
}

