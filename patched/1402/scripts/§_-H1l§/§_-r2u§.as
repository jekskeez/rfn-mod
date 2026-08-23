package §_-H1l§
{
   public class §_-r2u§ extends §_-f28§
   {
      
      public var playerId:int;
      
      public function §_-r2u§()
      {
         super();
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         if(param1 == null)
         {
            return true;
         }
         return param1.id == this.playerId;
      }
   }
}

