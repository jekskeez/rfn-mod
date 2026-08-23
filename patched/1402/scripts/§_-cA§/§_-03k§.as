package §_-cA§
{
   public class §_-03k§ extends §_-933§
   {
      
      public function §_-03k§()
      {
         super(17);
      }
      
      override protected function §_-nZ§() : void
      {
         super.§_-nZ§();
         if(this.data == null)
         {
            return;
         }
         var _loc1_:int = 1;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            if(this.data.objects[_loc2_].canAdd)
            {
               (this.data.objects[_loc2_] as §_-H2w§).number = _loc1_;
               _loc1_++;
            }
            _loc2_++;
         }
      }
   }
}

