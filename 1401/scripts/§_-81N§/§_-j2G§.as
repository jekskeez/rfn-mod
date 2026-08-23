package §_-81N§
{
   public class §_-j2G§ extends §_-92L§
   {
      
      public var playerId:int;
      
      public function §_-j2G§()
      {
         super();
      }
      
      override protected function §_-qu§(param1:Hero) : Boolean
      {
         if(param1 == null)
         {
            return true;
         }
         return param1.id == this.playerId;
      }
   }
}

