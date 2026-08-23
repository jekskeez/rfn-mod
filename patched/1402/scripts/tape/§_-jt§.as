package tape
{
   import §_-a11§.TapeDataEvent;
   import §_-a11§.§_-h2m§;
   import com.api.Services;
   import utils.§_-X2n§;
   
   public class §_-jt§ extends §_-h2f§
   {
      
      public static const §_-s9§:int = 8;
      
      public static const §_-31H§:int = 5;
      
      public function §_-jt§(param1:Boolean = false)
      {
         var _loc4_:§_-Z1G§ = null;
         super();
         var _loc2_:Array = Game.§_-dj§.filter(this.§_-J1e§);
         var _loc3_:int = int(_loc2_.length);
         var _loc5_:int = param1 ? §_-31H§ : §_-s9§;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_ && _loc6_ < _loc5_)
         {
            _loc4_ = new §_-Z1G§(_loc2_[_loc6_],param1);
            _loc4_.listen(this.onLoad);
            _loc6_++;
         }
         Services.friends.loadInfo(_loc2_.slice(0,_loc6_));
      }
      
      public function §_-D1G§() : Array
      {
         var _loc2_:§_-Z1G§ = null;
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
      
      public function §_-W1L§() : void
      {
         var _loc1_:§_-Z1G§ = null;
         for each(_loc1_ in this.objects)
         {
            _loc1_.selected = true;
         }
      }
      
      private function onLoad(param1:§_-h2m§) : void
      {
         addObject(param1.element);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-J1e§(param1:*, param2:int, param3:Array) : Boolean
      {
         var _loc5_:§_-X2n§ = null;
         var _loc4_:§_-X2n§ = param1 as §_-X2n§;
         for each(_loc5_ in Game.§_-d1o§)
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

