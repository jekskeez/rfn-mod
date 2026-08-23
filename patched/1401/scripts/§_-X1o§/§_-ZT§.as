package §_-X1o§
{
   import §_-5C§.ListDataEvent;
   
   public class §_-ZT§ extends §_-a2j§
   {
      
      public function §_-ZT§()
      {
         super(21);
      }
      
      override protected function §_-83H§() : void
      {
         var _loc3_:§_-jo§ = null;
         clear();
         if(this.data == null)
         {
            return;
         }
         super.§_-83H§();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         for each(_loc3_ in this.data.objects)
         {
            _loc3_.number = _loc1_;
            _loc3_.y = _loc2_;
            _loc2_ += this.§_-G2j§;
            if(!_loc3_.shaman)
            {
               _loc1_++;
            }
         }
         this.data.dispatchEvent(new ListDataEvent(ListDataEvent.SORTED,this.data));
      }
   }
}

