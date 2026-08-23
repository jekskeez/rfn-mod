package §_-AY§
{
   import §_-X1k§.§_-P2x§;
   import §_-us§.ClothesHidingItem;
   import §_-us§.§_-9G§;
   
   public class ClothesFactory
   {
      
      public function ClothesFactory()
      {
         super();
      }
      
      public static function create(param1:String) : §_-Su§
      {
         §_-p2U§.add("ClothesFactory.create",param1);
         var _loc2_:Object = §_-P2x§.getBones(param1) || null;
         if(!_loc2_)
         {
            §_-p2U§.add("item not found");
            return null;
         }
         §_-p2U§.add("params",JSON.stringify(_loc2_));
         _loc2_["skeleton"] = param1;
         return §_-sb§(§_-s1X§(§_-zR§(_loc2_) || §_-Q2m§(_loc2_)));
      }
      
      private static function §_-Q2m§(param1:Object) : §_-Su§
      {
         return new §_-Su§(param1);
      }
      
      private static function §_-zR§(param1:Object) : §_-Su§
      {
         return param1.hasOwnProperty("upper") ? new §_-b2C§(param1) : null;
      }
      
      private static function §_-sb§(param1:§_-Su§) : §_-Su§
      {
         return param1.params.hasOwnProperty("zOrderBones") ? new §_-9G§(param1) : param1;
      }
      
      private static function §_-s1X§(param1:§_-Su§) : §_-Su§
      {
         return param1.params.hasOwnProperty("hiddenBones") ? new ClothesHidingItem(param1) : param1;
      }
   }
}

