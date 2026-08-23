package §_-qJ§
{
   import §_-Rj§.§_-A32§;
   import §_-Rj§.§_-K15§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-1j§;
   
   public class §_-kU§ extends §_-K15§
   {
      
      public function §_-kU§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         this.§_-O11§(param1,true);
      }
      
      override public function remove(param1:*, param2:Boolean = false) : void
      {
         this.§_-O11§(param1,false);
         super.remove(param1,param2);
      }
      
      override public function clear() : void
      {
         this.§_-f8§();
         super.clear();
      }
      
      override public function §_-w1B§() : void
      {
         super.§_-w1B§();
         this.§_-L2l§();
      }
      
      override public function §_-z2l§() : void
      {
         this.§_-f8§();
         super.§_-z2l§();
      }
      
      private function §_-L2l§() : void
      {
         var _loc1_:§_-z1C§ = this.thirstController;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.§_-Pm§();
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            if(this.objects[_loc2_] is §_-1j§)
            {
               _loc1_.add(this.objects[_loc2_] as §_-1j§);
            }
            _loc2_++;
         }
      }
      
      private function §_-f8§() : void
      {
         var _loc1_:§_-z1C§ = this.thirstController;
         if(_loc1_)
         {
            _loc1_.§_-Pm§();
         }
      }
      
      private function get thirstController() : §_-z1C§
      {
         return (this.game as §_-A32§).squirrels is §_-J2k§ ? ((this.game as §_-A32§).squirrels as §_-J2k§).thirstController : null;
      }
      
      private function §_-O11§(param1:*, param2:Boolean) : void
      {
         var _loc3_:§_-z1C§ = this.thirstController;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:§_-1j§ = param1 as §_-1j§;
         if(!_loc4_ && param1 is int && this.objects[param1] is §_-1j§)
         {
            _loc4_ = this.objects[param1] as §_-1j§;
         }
         if(!_loc4_)
         {
            return;
         }
         if(param2)
         {
            _loc3_.add(_loc4_);
         }
         else
         {
            _loc3_.remove(_loc4_);
         }
      }
   }
}

