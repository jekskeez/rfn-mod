package
{
   import flash.utils.getDefinitionByName;
   
   public class §_-Vt§
   {
      
      public function §_-Vt§()
      {
         super();
      }
      
      public static function get §_-239§() : Boolean
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
      
      public static function §_-I1C§() : void
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
      
      public static function §_-T1z§() : void
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

