package §_-X1o§
{
   public class §_-u1R§ extends §_-a2j§
   {
      
      public function §_-u1R§()
      {
         super(17);
      }
      
      override protected function §_-83H§() : void
      {
         super.§_-83H§();
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
               (this.data.objects[_loc2_] as §_-OP§).number = _loc1_;
               _loc1_++;
            }
            _loc2_++;
         }
      }
   }
}

