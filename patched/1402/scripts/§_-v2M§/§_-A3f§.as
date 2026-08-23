package §_-v2M§
{
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-Y2M§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-A3f§
   {
      
      public static const §_-1q§:int = 0;
      
      public static const §_-D1P§:int = 1;
      
      public static const §_-P24§:int = 4;
      
      public static const §_-gQ§:int = 5;
      
      public static const §_-73z§:int = -1;
      
      public var §_-RR§:Boolean = false;
      
      public var §_-hY§:Boolean = false;
      
      public var §_-Rr§:Boolean = false;
      
      public var actions:Array = [];
      
      public var §_-yn§:int = 0;
      
      public var playerId:int = -1;
      
      private var §_-L2X§:int = 0;
      
      private var §_-v6§:Function;
      
      public function §_-A3f§()
      {
         super();
         §_-Y2M§.add(this);
      }
      
      public function dispose() : void
      {
         this.actions = [];
         §_-Y2M§.remove(this);
      }
      
      public function §_-D2C§() : void
      {
         if(this.§_-hY§)
         {
            return;
         }
         if(this.§_-RR§)
         {
            this.§_-H2G§();
         }
         this.§_-yn§ = getTimer();
         this.§_-RR§ = true;
      }
      
      public function §_-H2G§() : void
      {
         this.§_-RR§ = false;
      }
      
      public function §_-dP§() : void
      {
         this.§_-L2X§ = 0;
         this.§_-yn§ = getTimer();
         this.§_-RR§ = false;
         this.§_-hY§ = true;
         §_-p1V§.§_-A3z§(this.§_-52w§);
      }
      
      public function §_-N2u§() : void
      {
         §_-p1V§.§_-DO§(this.§_-52w§);
         this.§_-hY§ = false;
         if(this.§_-v6§ != null && this.§_-v6§ is Function)
         {
            this.§_-v6§.apply();
         }
      }
      
      public function §_-H1E§(param1:Function) : void
      {
         this.§_-v6§ = param1;
      }
      
      public function add(param1:Array) : void
      {
         this.actions.push(param1);
      }
      
      public function §_-S1u§(param1:int, param2:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         if(!this.§_-RR§)
         {
            return;
         }
         switch(param1)
         {
            case §_-u1O§.§_-1q§:
               _loc3_ = param2[1];
               if("Create" in _loc3_ || "Destroy" in _loc3_)
               {
                  return;
               }
            case §_-u1O§.§_-D1P§:
               this.actions.push([getTimer() - this.§_-yn§,this.§_-kO§(param1),this.§_-n2e§(param1,param2)]);
               break;
            case §_-u1O§.§_-P24§:
            case §_-u1O§.§_-gQ§:
               if(this.§_-Rr§)
               {
                  return;
               }
               _loc4_ = this.§_-kO§(param1);
               _loc5_ = this.§_-n2e§(param1,param2);
               this.actions.push([getTimer() - this.§_-yn§,_loc4_,_loc5_]);
               Connection.§_-u2v§(this.§_-U2L§(_loc4_),_loc5_);
         }
      }
      
      public function §_-51x§(param1:§_-s2l§) : void
      {
         if(!this.§_-RR§)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(this.§_-W7§(param1[_loc3_]));
            _loc3_++;
         }
         _loc2_ = this.§_-F1X§(param1.type,_loc2_);
         if(!_loc2_)
         {
            return;
         }
         this.add([getTimer() - this.§_-yn§,param1.type,param1]);
      }
      
      protected function §_-F1X§(param1:int, param2:Array) : Array
      {
         switch(param1)
         {
            case §_-s2l§.§_-P24§:
            case §_-s2l§.§_-gQ§:
               break;
            case §_-s2l§.§_-n1f§:
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
      
      protected function §_-hi§(param1:int, param2:Array) : Array
      {
         switch(param1)
         {
            case §_-s2l§.§_-1q§:
               param2[1] = JSON.parse(param2[1]);
         }
         return param2;
      }
      
      protected function §_-n2e§(param1:int, param2:Array) : Array
      {
         var _loc3_:Array = param2.concat();
         switch(param1)
         {
            case §_-u1O§.§_-1q§:
            case §_-u1O§.§_-D1P§:
            case §_-u1O§.§_-P24§:
            case §_-u1O§.§_-gQ§:
               _loc3_.unshift(this.playerId);
         }
         return _loc3_;
      }
      
      protected function §_-kO§(param1:int) : int
      {
         switch(param1)
         {
            case §_-u1O§.§_-1q§:
               return §_-1q§;
            case §_-u1O§.§_-D1P§:
               return §_-D1P§;
            case §_-u1O§.§_-P24§:
               return §_-P24§;
            case §_-u1O§.§_-gQ§:
               return §_-gQ§;
            default:
               return 0;
         }
      }
      
      protected function §_-U2L§(param1:int) : int
      {
         switch(param1)
         {
            case §_-1q§:
               return §_-s2l§.§_-1q§;
            case §_-D1P§:
               return §_-s2l§.§_-D1P§;
            case §_-P24§:
               return §_-s2l§.§_-P24§;
            case §_-gQ§:
               return §_-s2l§.§_-gQ§;
            default:
               return 0;
         }
      }
      
      private function §_-W7§(param1:*) : *
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
      
      private function §_-52w§() : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc1_:int = getTimer();
         while(this.§_-L2X§ < this.actions.length && this.actions[this.§_-L2X§][0] <= _loc1_ - this.§_-yn§)
         {
            _loc2_ = this.actions[this.§_-L2X§];
            ++this.§_-L2X§;
            _loc3_ = this.§_-U2L§(_loc2_[1]);
            Connection.§_-u2v§(_loc3_,this.§_-hi§(_loc3_,_loc2_[2]));
         }
         if(this.§_-L2X§ >= this.actions.length)
         {
            this.§_-N2u§();
         }
      }
   }
}

