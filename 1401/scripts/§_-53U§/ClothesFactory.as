package §_-53U§
{
   import §_-2V§.ClothesHidingItem;
   import §_-2V§.§_-ph§;
   import §_-I10§.§_-g2W§;
   
   public class ClothesFactory
   {
      
      public function ClothesFactory()
      {
         super();
      }
      
      public static function create(param1:String) : §_-M26§
      {
         §_-TQ§.add("ClothesFactory.create",param1);
         var _loc2_:Object = §_-g2W§.getBones(param1) || null;
         if(!_loc2_)
         {
            §_-TQ§.add("item not found");
            return null;
         }
         §_-TQ§.add("params",JSON.stringify(_loc2_));
         _loc2_["skeleton"] = param1;
         return §_-i2P§(§_-21c§(§_-T1Z§(_loc2_) || §_-EF§(_loc2_)));
      }
      
      private static function §_-EF§(param1:Object) : §_-M26§
      {
         return new §_-M26§(param1);
      }
      
      private static function §_-T1Z§(param1:Object) : §_-M26§
      {
         return param1.hasOwnProperty("upper") ? new §_-C13§(param1) : null;
      }
      
      private static function §_-i2P§(param1:§_-M26§) : §_-M26§
      {
         return param1.params.hasOwnProperty("zOrderBones") ? new §_-ph§(param1) : param1;
      }
      
      private static function §_-21c§(param1:§_-M26§) : §_-M26§
      {
         return param1.params.hasOwnProperty("hiddenBones") ? new ClothesHidingItem(param1) : param1;
      }
   }
}

