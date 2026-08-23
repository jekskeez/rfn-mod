package §_-cA§
{
   import §_-48§.ListDataEvent;
   
   public class §_-S2N§ extends §_-933§
   {
      
      public function §_-S2N§()
      {
         super(21);
      }
      
      override protected function §_-nZ§() : void
      {
         var _loc3_:§_-tP§ = null;
         clear();
         if(this.data == null)
         {
            return;
         }
         super.§_-nZ§();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         for each(_loc3_ in this.data.objects)
         {
            _loc3_.number = _loc1_;
            _loc3_.y = _loc2_;
            _loc2_ += this.§_-g2H§;
            if(!_loc3_.shaman)
            {
               _loc1_++;
            }
         }
         this.data.dispatchEvent(new ListDataEvent(ListDataEvent.SORTED,this.data));
      }
   }
}

