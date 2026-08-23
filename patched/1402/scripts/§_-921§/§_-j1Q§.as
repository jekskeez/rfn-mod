package §_-921§
{
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-62b§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-636§;
   
   public class §_-j1Q§ extends §_-53A§
   {
      
      public function §_-j1Q§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         this.§_-4M§(param1,true);
      }
      
      override public function remove(param1:*, param2:Boolean = false) : void
      {
         this.§_-4M§(param1,false);
         super.remove(param1,param2);
      }
      
      override public function clear() : void
      {
         this.§_-e1D§();
         super.clear();
      }
      
      override public function §_-Q1J§() : void
      {
         super.§_-Q1J§();
         this.§_-L27§();
      }
      
      override public function §_-y1S§() : void
      {
         this.§_-e1D§();
         super.§_-y1S§();
      }
      
      private function §_-L27§() : void
      {
         var _loc1_:§_-x1c§ = this.thirstController;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.§_-B1o§();
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            if(this.objects[_loc2_] is §_-636§)
            {
               _loc1_.add(this.objects[_loc2_] as §_-636§);
            }
            _loc2_++;
         }
      }
      
      private function §_-e1D§() : void
      {
         var _loc1_:§_-x1c§ = this.thirstController;
         if(_loc1_)
         {
            _loc1_.§_-B1o§();
         }
      }
      
      private function get thirstController() : §_-x1c§
      {
         return (this.game as §_-62b§).squirrels is §_-u1h§ ? ((this.game as §_-62b§).squirrels as §_-u1h§).thirstController : null;
      }
      
      private function §_-4M§(param1:*, param2:Boolean) : void
      {
         var _loc3_:§_-x1c§ = this.thirstController;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:§_-636§ = param1 as §_-636§;
         if(!_loc4_ && param1 is int && this.objects[param1] is §_-636§)
         {
            _loc4_ = this.objects[param1] as §_-636§;
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

