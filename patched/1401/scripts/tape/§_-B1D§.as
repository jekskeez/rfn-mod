package tape
{
   import §_-I10§.§_-3U§;
   
   public class §_-B1D§ extends §_-xc§
   {
      
      public static const §_-y2q§:String = gls("Установить приложение");
      
      public static const §_-Z1I§:String = gls("Вступить в сообщество Трагедия Белок");
      
      public static const §_-H2n§:String = gls("Добавить приложение в «левое меню»");
      
      public static const §_-C2j§:String = gls("Пригласить друга");
      
      public static const §_-025§:String = gls("Включть уведомления");
      
      public static const §_-p1r§:String = gls("Достигни {0} уровня",§_-3U§.§_-53§);
      
      public static const §_-p2J§:String = gls("Установи приложение в избранные");
      
      private static const DATA:Object = {
         "vk":[§_-y2q§,§_-Z1I§,§_-H2n§,§_-p1r§,§_-025§],
         "fb":[§_-y2q§,§_-p1r§,§_-p2J§],
         "sa":[§_-y2q§,§_-Z1I§,§_-p1r§],
         "default":[§_-y2q§,§_-Z1I§,§_-p1r§]
      };
      
      public function §_-B1D§(param1:String)
      {
         var _loc4_:§_-yU§ = null;
         super();
         var _loc2_:Array = DATA[param1] || DATA["default"];
         var _loc3_:Array = §_-3U§.§_-x2g§[param1] || §_-3U§.§_-x2g§["default"];
         var _loc5_:* = int(_loc2_.length);
         while(_loc5_--)
         {
            _loc4_ = new §_-yU§(_loc2_[_loc5_],_loc3_[_loc5_],_loc5_);
            _loc4_.selected = false;
            addObject(_loc4_);
         }
      }
      
      public function §_-e2t§(param1:uint, param2:Boolean) : void
      {
         var _loc3_:§_-yU§ = null;
         for each(_loc3_ in this.objects)
         {
            if(_loc3_.§_-X2j§ == param1)
            {
               _loc3_.selected = param2;
               break;
            }
         }
      }
   }
}

