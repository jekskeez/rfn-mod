package tape
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-a11§.TapeDataEvent;
   import events.§_-a1V§;
   
   public class §_-cY§ extends §_-h2f§
   {
      
      private static const §_-A24§:int = §_-eT§.§_-P26§ | §_-eT§.§_-t1a§;
      
      private var §_-1T§:Array = [];
      
      public function §_-cY§()
      {
         super();
         §_-B2U§.listen(this.onClanLoaded);
      }
      
      override public function clear() : void
      {
         var _loc1_:§_-QN§ = null;
         for each(_loc1_ in this.objects)
         {
            if(_loc1_ is §_-b2T§)
            {
               §_-b2T§.§_-b3§(_loc1_ as §_-b2T§);
            }
         }
         super.clear();
      }
      
      override protected function §_-5p§(param1:int) : §_-QN§
      {
         return new §_-b2T§();
      }
      
      override protected function sort() : void
      {
         this.objects.sort(this.§_-e2m§);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      public function §_-Ls§(param1:Array) : void
      {
         var _loc6_:Clan = null;
         var _loc7_:int = 0;
         var _loc8_:Clan = null;
         this.clear();
         this.§_-1T§ = [];
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
            _loc8_ = §_-B2U§.§_-Q2g§(_loc7_);
            if(_loc8_ != null && _loc8_.isLoaded(§_-A24§) && _loc8_.name != null)
            {
               _loc4_.push(_loc8_);
            }
            else
            {
               _loc3_.push(_loc7_);
               this.§_-1T§.push(_loc7_);
            }
            _loc5_++;
         }
         for each(_loc6_ in _loc4_)
         {
            this.§_-m2A§(_loc6_.id,_loc6_.name,_loc6_.§_-51L§);
         }
         if(_loc3_.length > 0)
         {
            §_-B2U§.request(_loc3_,§_-A24§);
         }
         else if(_loc4_.length > 0)
         {
            this.sort();
         }
      }
      
      public function dispose() : void
      {
         §_-B2U§.forget(this.onClanLoaded);
         §_-b2T§.§_-4T§();
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         var _loc3_:int = this.§_-1T§.indexOf(_loc2_.id);
         if(_loc3_ == -1)
         {
            return;
         }
         this.§_-1T§.splice(_loc3_,1);
         if(_loc2_.isLoaded(§_-eT§.§_-P26§) && Boolean(_loc2_.name))
         {
            this.§_-m2A§(_loc2_.id,_loc2_.name,_loc2_.§_-51L§);
         }
         if(this.§_-1T§.length == 0)
         {
            this.sort();
         }
      }
      
      private function §_-m2A§(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:§_-b2T§ = §_-b2T§.§_-11t§();
         _loc4_.§_-4j§(param1,param2,param3);
         addObject(_loc4_);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-e2m§(param1:§_-b2T§, param2:§_-b2T§) : int
      {
         var _loc3_:Clan = §_-B2U§.§_-Q2g§(param1.clanId);
         var _loc4_:Clan = §_-B2U§.§_-Q2g§(param2.clanId);
         if(_loc3_ == null || _loc4_ == null)
         {
            return 0;
         }
         if(_loc3_.§_-u2q§ < _loc4_.§_-u2q§)
         {
            return 1;
         }
         if(_loc3_.§_-u2q§ > _loc4_.§_-u2q§)
         {
            return -1;
         }
         return 0;
      }
   }
}

