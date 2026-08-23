package tape
{
   import §_-r2Y§.TapeDataEvent;
   import §_-r2Y§.§_-33e§;
   import com.api.Services;
   import utils.§_-t2g§;
   
   public class §_-gE§ extends §_-xc§
   {
      
      public static const §_-82h§:int = 8;
      
      public static const §_-U2U§:int = 5;
      
      public function §_-gE§(param1:Boolean = false)
      {
         var _loc4_:§_-32t§ = null;
         super();
         var _loc2_:Array = Game.§_-B2U§.filter(this.§_-j2l§);
         var _loc3_:int = int(_loc2_.length);
         var _loc5_:int = param1 ? §_-U2U§ : §_-82h§;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_ && _loc6_ < _loc5_)
         {
            _loc4_ = new §_-32t§(_loc2_[_loc6_],param1);
            _loc4_.listen(this.onLoad);
            _loc6_++;
         }
         Services.friends.loadInfo(_loc2_.slice(0,_loc6_));
      }
      
      public function §_-Lj§() : Array
      {
         var _loc2_:§_-32t§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.objects)
         {
            if(_loc2_.selected)
            {
               _loc1_.push(_loc2_.id);
            }
         }
         return _loc1_;
      }
      
      public function §_-WG§() : void
      {
         var _loc1_:§_-32t§ = null;
         for each(_loc1_ in this.objects)
         {
            _loc1_.selected = true;
         }
      }
      
      private function onLoad(param1:§_-33e§) : void
      {
         addObject(param1.element);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-j2l§(param1:*, param2:int, param3:Array) : Boolean
      {
         var _loc5_:§_-t2g§ = null;
         var _loc4_:§_-t2g§ = param1 as §_-t2g§;
         for each(_loc5_ in Game.§_-B3t§)
         {
            if(_loc5_.highValue == _loc4_.highValue && _loc5_.lowValue == _loc4_.lowValue)
            {
               return false;
            }
         }
         return true;
      }
   }
}

