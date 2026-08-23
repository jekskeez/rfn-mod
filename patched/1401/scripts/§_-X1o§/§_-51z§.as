package §_-X1o§
{
   import §_-5C§.ListDataEvent;
   import §_-5C§.ListElementEvent;
   
   public class §_-51z§ extends §_-93Q§
   {
      
      public function §_-51z§()
      {
         super();
      }
      
      private static function §_-S1t§(param1:§_-Lf§, param2:§_-Lf§) : int
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
      
      override public function setData(param1:Vector.<§_-X27§>) : void
      {
         super.setData(param1);
         this.sort();
      }
      
      override public function §_-YC§(param1:ListElementEvent) : void
      {
         this.sort();
      }
      
      private function sort() : void
      {
         var _loc1_:§_-X27§ = null;
         for each(_loc1_ in this.objects)
         {
            if(!_loc1_.canAdd)
            {
               return;
            }
         }
         this.objects.sort(§_-S1t§);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
   }
}

