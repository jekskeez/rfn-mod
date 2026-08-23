package tape
{
   import §_-X1k§.§_-Q2l§;
   
   public class §_-OO§ extends §_-h2f§
   {
      
      public static const §_-sy§:String = gls("Установить приложение");
      
      public static const §_-O1w§:String = gls("Вступить в сообщество Трагедия Белок");
      
      public static const §_-n2s§:String = gls("Добавить приложение в «левое меню»");
      
      public static const §_-Re§:String = gls("Пригласить друга");
      
      public static const §_-Uc§:String = gls("Включть уведомления");
      
      public static const §_-gg§:String = gls("Достигни {0} уровня",§_-Q2l§.§_-M2n§);
      
      public static const §_-62r§:String = gls("Установи приложение в избранные");
      
      private static const DATA:Object = {
         "vk":[§_-sy§,§_-O1w§,§_-n2s§,§_-gg§,§_-Uc§],
         "fb":[§_-sy§,§_-gg§,§_-62r§],
         "sa":[§_-sy§,§_-O1w§,§_-gg§],
         "default":[§_-sy§,§_-O1w§,§_-gg§]
      };
      
      public function §_-OO§(param1:String)
      {
         var _loc4_:§_-X2Q§ = null;
         super();
         var _loc2_:Array = DATA[param1] || DATA["default"];
         var _loc3_:Array = §_-Q2l§.§_-pY§[param1] || §_-Q2l§.§_-pY§["default"];
         var _loc5_:* = int(_loc2_.length);
         while(_loc5_--)
         {
            _loc4_ = new §_-X2Q§(_loc2_[_loc5_],_loc3_[_loc5_],_loc5_);
            _loc4_.selected = false;
            addObject(_loc4_);
         }
      }
      
      public function §_-71G§(param1:uint, param2:Boolean) : void
      {
         var _loc3_:§_-X2Q§ = null;
         for each(_loc3_ in this.objects)
         {
            if(_loc3_.§_-k2N§ == param1)
            {
               _loc3_.selected = param2;
               break;
            }
         }
      }
   }
}

