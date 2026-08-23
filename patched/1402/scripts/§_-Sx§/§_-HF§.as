package §_-Sx§
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   
   public final class §_-HF§ extends EventDispatcher
   {
      
      private static var _instance:§_-HF§;
      
      public function §_-HF§()
      {
         super();
         if(_instance)
         {
            throw new IllegalOperationError("Singleton already constructed!");
         }
      }
      
      public static function getInstance() : §_-HF§
      {
         if(!_instance)
         {
            _instance = new §_-HF§();
         }
         return _instance;
      }
   }
}

