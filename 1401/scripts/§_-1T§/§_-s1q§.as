package §_-1T§
{
   import §_-RI§.§_-XK§;
   import starling.display.§_-jH§;
   
   public class §_-s1q§ extends §_-mu§
   {
      
      private static var _instance:§_-s1q§;
      
      public function §_-s1q§()
      {
         super();
      }
      
      public static function getInstance() : §_-s1q§
      {
         if(!_instance)
         {
            _instance = new §_-s1q§();
         }
         return _instance;
      }
      
      override public function add(param1:String, param2:*, param3:Boolean = true, param4:String = "") : §_-XK§
      {
         if(param2 is §_-jH§)
         {
            return super.add(param1,param2,param3);
         }
         return null;
      }
   }
}

