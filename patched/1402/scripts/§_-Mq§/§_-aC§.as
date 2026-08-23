package §_-Mq§
{
   import §_-TK§.§_-Z1n§;
   import starling.display.§_-I2q§;
   
   public class §_-aC§ extends §_-11l§
   {
      
      private static var _instance:§_-aC§;
      
      public function §_-aC§()
      {
         super();
      }
      
      public static function getInstance() : §_-aC§
      {
         if(!_instance)
         {
            _instance = new §_-aC§();
         }
         return _instance;
      }
      
      override public function add(param1:String, param2:*, param3:Boolean = true, param4:String = "") : §_-Z1n§
      {
         if(param2 is §_-I2q§)
         {
            return super.add(param1,param2,param3);
         }
         return null;
      }
   }
}

