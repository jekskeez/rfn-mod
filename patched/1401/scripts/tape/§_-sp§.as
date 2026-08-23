package tape
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-r2Y§.TapeDataEvent;
   import events.§_-n13§;
   
   public class §_-sp§ extends §_-xc§
   {
      
      private static const §_-03g§:int = §_-Oy§.§_-g2n§ | §_-Oy§.§_-Ng§;
      
      private var §_-o1A§:Array = [];
      
      public function §_-sp§()
      {
         super();
         §_-e2W§.listen(this.onClanLoaded);
      }
      
      override public function clear() : void
      {
         var _loc1_:§_-K2k§ = null;
         for each(_loc1_ in this.objects)
         {
            if(_loc1_ is §_-628§)
            {
               §_-628§.§_-3h§(_loc1_ as §_-628§);
            }
         }
         super.clear();
      }
      
      override protected function §_-hN§(param1:int) : §_-K2k§
      {
         return new §_-628§();
      }
      
      override protected function sort() : void
      {
         this.objects.sort(this.§_-C1O§);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      public function §_-814§(param1:Array) : void
      {
         var _loc6_:Clan = null;
         var _loc7_:int = 0;
         var _loc8_:Clan = null;
         this.clear();
         this.§_-o1A§ = [];
         var _loc2_:int = int(param1.length);
         if(_loc2_ == 0)
         {
            dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
            return;
         }
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc7_ = int(param1[_loc5_]);
            _loc8_ = §_-e2W§.§_-W2X§(_loc7_);
            if(_loc8_ != null && _loc8_.isLoaded(§_-03g§) && _loc8_.name != null)
            {
               _loc4_.push(_loc8_);
            }
            else
            {
               _loc3_.push(_loc7_);
               this.§_-o1A§.push(_loc7_);
            }
            _loc5_++;
         }
         for each(_loc6_ in _loc4_)
         {
            this.§_-t2s§(_loc6_.id,_loc6_.name,_loc6_.§_-cy§);
         }
         if(_loc3_.length > 0)
         {
            §_-e2W§.request(_loc3_,§_-03g§);
         }
         else if(_loc4_.length > 0)
         {
            this.sort();
         }
      }
      
      public function dispose() : void
      {
         §_-e2W§.forget(this.onClanLoaded);
         §_-628§.§_-F21§();
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         var _loc3_:int = this.§_-o1A§.indexOf(_loc2_.id);
         if(_loc3_ == -1)
         {
            return;
         }
         this.§_-o1A§.splice(_loc3_,1);
         if(_loc2_.isLoaded(§_-Oy§.§_-g2n§) && Boolean(_loc2_.name))
         {
            this.§_-t2s§(_loc2_.id,_loc2_.name,_loc2_.§_-cy§);
         }
         if(this.§_-o1A§.length == 0)
         {
            this.sort();
         }
      }
      
      private function §_-t2s§(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:§_-628§ = §_-628§.§_-11x§();
         _loc4_.§_-Ra§(param1,param2,param3);
         addObject(_loc4_);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-C1O§(param1:§_-628§, param2:§_-628§) : int
      {
         var _loc3_:Clan = §_-e2W§.§_-W2X§(param1.clanId);
         var _loc4_:Clan = §_-e2W§.§_-W2X§(param2.clanId);
         if(_loc3_ == null || _loc4_ == null)
         {
            return 0;
         }
         if(_loc3_.§_-t2n§ < _loc4_.§_-t2n§)
         {
            return 1;
         }
         if(_loc3_.§_-t2n§ > _loc4_.§_-t2n§)
         {
            return -1;
         }
         return 0;
      }
   }
}

