package
{
   import flash.utils.getDefinitionByName;
   
   public class §_-b1M§
   {
      
      public function §_-b1M§()
      {
         super();
      }
      
      public static function get §_-Ea§() : Boolean
      {
         try
         {
            getDefinitionByName("clientLoader.Main");
            return true;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public static function §_-W1o§() : void
      {
         var _loc1_:Class = null;
         try
         {
            _loc1_ = getDefinitionByName("clientLoader.Main") as Class;
            _loc1_["showLoader"]();
         }
         catch(e:Error)
         {
         }
      }
      
      public static function §_-a2h§() : void
      {
         var _loc1_:Class = null;
         try
         {
            _loc1_ = getDefinitionByName("clientLoader.Main") as Class;
            _loc1_["hideLoader"]();
         }
         catch(e:Error)
         {
         }
      }
   }
}

