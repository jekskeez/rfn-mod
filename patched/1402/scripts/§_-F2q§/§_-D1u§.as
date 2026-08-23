package §_-F2q§
{
   import §_-s2e§.§_-13B§;
   
   public class §_-D1u§
   {
      
      private static var base:§_-e2Y§ = null;
      
      public function §_-D1u§()
      {
         super();
      }
      
      public static function gls(param1:String, ... rest) : String
      {
         if(base == null)
         {
            base = new §_-e2Y§(§_-Zy§.§_-dm§,§_-13B§.data);
         }
         return base.gls(param1,rest);
      }
   }
}

