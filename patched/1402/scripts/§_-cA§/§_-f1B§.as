package §_-cA§
{
   import §_-48§.ListDataEvent;
   import §_-48§.ListElementEvent;
   
   public class §_-f1B§ extends §_-I2x§
   {
      
      public function §_-f1B§()
      {
         super();
      }
      
      private static function §_-52p§(param1:§_-Cq§, param2:§_-Cq§) : int
      {
         if(param1.frags > param2.frags)
         {
            return -1;
         }
         if(param1.frags < param2.frags)
         {
            return 1;
         }
         if(param1.player.name.toUpperCase() > param2.player.name.toUpperCase())
         {
            return 1;
         }
         return -1;
      }
      
      override public function setData(param1:Vector.<§_-3b§>) : void
      {
         super.setData(param1);
         this.sort();
      }
      
      override public function §_-Z1P§(param1:ListElementEvent) : void
      {
         this.sort();
      }
      
      private function sort() : void
      {
         var _loc1_:§_-3b§ = null;
         for each(_loc1_ in this.objects)
         {
            if(!_loc1_.canAdd)
            {
               return;
            }
         }
         this.objects.sort(§_-52p§);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
   }
}

