package §_-F1E§
{
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-H2u§;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-41e§
   {
      
      public static const §_-b1y§:int = 0;
      
      public static const §_-325§:int = 1;
      
      public static const §_-G20§:int = 4;
      
      public static const §_-C1c§:int = 5;
      
      public static const §_-C28§:int = -1;
      
      public var §_-o2Q§:Boolean = false;
      
      public var §_-A3w§:Boolean = false;
      
      public var §_-I1w§:Boolean = false;
      
      public var actions:Array = [];
      
      public var §_-E22§:int = 0;
      
      public var playerId:int = -1;
      
      private var §_-4U§:int = 0;
      
      private var §_-51u§:Function;
      
      public function §_-41e§()
      {
         super();
         §_-H2u§.add(this);
      }
      
      public function dispose() : void
      {
         this.actions = [];
         §_-H2u§.remove(this);
      }
      
      public function §_-710§() : void
      {
         if(this.§_-A3w§)
         {
            return;
         }
         if(this.§_-o2Q§)
         {
            this.§_-k29§();
         }
         this.§_-E22§ = getTimer();
         this.§_-o2Q§ = true;
      }
      
      public function §_-k29§() : void
      {
         this.§_-o2Q§ = false;
      }
      
      public function §_-L1C§() : void
      {
         this.§_-4U§ = 0;
         this.§_-E22§ = getTimer();
         this.§_-o2Q§ = false;
         this.§_-A3w§ = true;
         §_-01Y§.§_-h1R§(this.§_-r5§);
      }
      
      public function §_-w24§() : void
      {
         §_-01Y§.§_-t1s§(this.§_-r5§);
         this.§_-A3w§ = false;
         if(this.§_-51u§ != null && this.§_-51u§ is Function)
         {
            this.§_-51u§.apply();
         }
      }
      
      public function §_-k25§(param1:Function) : void
      {
         this.§_-51u§ = param1;
      }
      
      public function add(param1:Array) : void
      {
         this.actions.push(param1);
      }
      
      public function §_-q5§(param1:int, param2:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         if(!this.§_-o2Q§)
         {
            return;
         }
         switch(param1)
         {
            case §_-h2B§.§_-b1y§:
               _loc3_ = param2[1];
               if("Create" in _loc3_ || "Destroy" in _loc3_)
               {
                  return;
               }
            case §_-h2B§.§_-325§:
               this.actions.push([getTimer() - this.§_-E22§,this.§_-93S§(param1),this.§_-L§(param1,param2)]);
               break;
            case §_-h2B§.§_-G20§:
            case §_-h2B§.§_-C1c§:
               if(this.§_-I1w§)
               {
                  return;
               }
               _loc4_ = this.§_-93S§(param1);
               _loc5_ = this.§_-L§(param1,param2);
               this.actions.push([getTimer() - this.§_-E22§,_loc4_,_loc5_]);
               Connection.§_-R1M§(this.§_-g1v§(_loc4_),_loc5_);
         }
      }
      
      public function §_-t2O§(param1:§_-S2I§) : void
      {
         if(!this.§_-o2Q§)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(this.§_-J2h§(param1[_loc3_]));
            _loc3_++;
         }
         _loc2_ = this.§_-Q1L§(param1.type,_loc2_);
         if(!_loc2_)
         {
            return;
         }
         this.add([getTimer() - this.§_-E22§,param1.type,param1]);
      }
      
      protected function §_-Q1L§(param1:int, param2:Array) : Array
      {
         switch(param1)
         {
            case §_-S2I§.§_-G20§:
            case §_-S2I§.§_-C1c§:
               break;
            case §_-S2I§.§_-Vs§:
               if(param2[1] != this.playerId)
               {
                  return null;
               }
               break;
            default:
               return null;
         }
         return param2;
      }
      
      protected function §_-A2z§(param1:int, param2:Array) : Array
      {
         switch(param1)
         {
            case §_-S2I§.§_-b1y§:
               param2[1] = JSON.parse(param2[1]);
         }
         return param2;
      }
      
      protected function §_-L§(param1:int, param2:Array) : Array
      {
         var _loc3_:Array = param2.concat();
         switch(param1)
         {
            case §_-h2B§.§_-b1y§:
            case §_-h2B§.§_-325§:
            case §_-h2B§.§_-G20§:
            case §_-h2B§.§_-C1c§:
               _loc3_.unshift(this.playerId);
         }
         return _loc3_;
      }
      
      protected function §_-93S§(param1:int) : int
      {
         switch(param1)
         {
            case §_-h2B§.§_-b1y§:
               return §_-b1y§;
            case §_-h2B§.§_-325§:
               return §_-325§;
            case §_-h2B§.§_-G20§:
               return §_-G20§;
            case §_-h2B§.§_-C1c§:
               return §_-C1c§;
            default:
               return 0;
         }
      }
      
      protected function §_-g1v§(param1:int) : int
      {
         switch(param1)
         {
            case §_-b1y§:
               return §_-S2I§.§_-b1y§;
            case §_-325§:
               return §_-S2I§.§_-325§;
            case §_-G20§:
               return §_-S2I§.§_-G20§;
            case §_-C1c§:
               return §_-S2I§.§_-C1c§;
            default:
               return 0;
         }
      }
      
      private function §_-J2h§(param1:*) : *
      {
         var _loc2_:ByteArray = null;
         if(param1 is Array)
         {
            return (param1 as Array).concat();
         }
         if(param1 is ByteArray)
         {
            _loc2_ = new ByteArray();
            (param1 as ByteArray).readBytes(_loc2_,0,(param1 as ByteArray).length);
            _loc2_.position = 0;
            param1.position = 0;
            return _loc2_;
         }
         return param1;
      }
      
      private function §_-r5§() : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc1_:int = getTimer();
         while(this.§_-4U§ < this.actions.length && this.actions[this.§_-4U§][0] <= _loc1_ - this.§_-E22§)
         {
            _loc2_ = this.actions[this.§_-4U§];
            ++this.§_-4U§;
            _loc3_ = this.§_-g1v§(_loc2_[1]);
            Connection.§_-R1M§(_loc3_,this.§_-A2z§(_loc3_,_loc2_[2]));
         }
         if(this.§_-4U§ >= this.actions.length)
         {
            this.§_-w24§();
         }
      }
   }
}

