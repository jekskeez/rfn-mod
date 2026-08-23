package §_-L2s§
{
   import §_-68§.§_-j2J§;
   
   public class §_-W3§
   {
      
      private static var base:§_-oI§ = null;
      
      public function §_-W3§()
      {
         super();
      }
      
      public static function gls(param1:String, ... rest) : String
      {
         if(base == null)
         {
            base = new §_-oI§(§_-a9§.§_-S4§,§_-j2J§.data);
         }
         return base.gls(param1,rest);
      }
   }
}

