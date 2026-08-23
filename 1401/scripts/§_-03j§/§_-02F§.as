package §_-03j§
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   
   public final class §_-02F§ extends EventDispatcher
   {
      
      private static var _instance:§_-02F§;
      
      public function §_-02F§()
      {
         super();
         if(_instance)
         {
            throw new IllegalOperationError("Singleton already constructed!");
         }
      }
      
      public static function getInstance() : §_-02F§
      {
         if(!_instance)
         {
            _instance = new §_-02F§();
         }
         return _instance;
      }
   }
}

