package §_-U19§
{
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   
   public class §_-su§
   {
      
      public static const §_-wS§:int = 0;
      
      public static const §_-R1y§:int = 1;
      
      public static const §_-Bs§:int = 2;
      
      public static const §_-y3§:int = 3;
      
      public static const §_-X2W§:int = 4;
      
      public static const §_-co§:int = 5;
      
      public static const NONE:int = 255;
      
      public static const §_-Z1p§:int = 3;
      
      public static const §_-R1U§:int = 10;
      
      private static const DATA:Array = [{
         "id":§_-wS§,
         "name":gls("Тотем искусности"),
         "level":[1,1,1,3,6,10,15,21,27,33],
         "image":"TotemExp",
         "icon":"TotemExpIcon",
         "tip":gls("Играй в трагедию белок,\nзабегай в дупло"),
         "description":gls("Увеличивает количество опыта, получаемого на локациях, на #%"),
         "common_description":gls("Увеличивает количетсво опыта, получаемого на локациях")
      },{
         "id":§_-R1y§,
         "perkClass":§_-XH§,
         "name":gls("Тотем жизненной силы"),
         "level":[2,2,4,7,11,16,22,28,34,39],
         "image":"TotemRespawn",
         "icon":"TotemRespawnIcon",
         "tip":gls("Возрождайся, используя\nмагию «реинкарнация»,\nвоскрешение от VIP-статуса\nи одежду с возможностью воскрешения."),
         "description":gls("Позволяет использовать магию «реинкарнация» без затрат маны раз в # минут"),
         "common_description":gls("Позволяет использовать магию «реинкарнация» без затрат маны")
      },{
         "id":§_-Bs§,
         "perkClass":§_-K2Z§,
         "name":gls("Тотем быстрых лапок"),
         "level":[5,5,8,12,17,23,29,35,40,44],
         "image":"TotemSpeed",
         "icon":"TotemSpeedIcon",
         "tip":gls("Используй магию «Белка-молния»"),
         "description":gls("Усиливает магию «Белка-молния» на #%"),
         "common_description":gls("Усиливает магию «Белка-молния»")
      },{
         "id":§_-y3§,
         "name":gls("Тотем магической силы"),
         "level":[9,9,13,18,24,30,36,41,45,48],
         "image":"TotemMagic",
         "icon":"TotemMagicIcon",
         "tip":gls("Восстанавливай ману с помощью\nКолдовских Отваров"),
         "description":gls("Генерирует дополнительную единицу маны за каждые # маны, потраченных на локациях"),
         "common_description":gls("Возвращает часть потраченной маны")
      },{
         "id":§_-X2W§,
         "perkClass":§_-21m§,
         "name":gls("Тотем невесомости"),
         "level":[14,14,19,25,31,37,42,46,49,49],
         "image":"TotemHighJump",
         "icon":"TotemHighJumpIcon",
         "tip":gls("Используй магию «Высокий прыжок»"),
         "description":gls("Усиливает магию «Высокий прыжок» на #%"),
         "common_description":gls("Усиливает магию «Высокий прыжок»")
      },{
         "id":§_-co§,
         "name":gls("Тотем роста орехов"),
         "level":[20,20,26,32,38,43,47,50,50,50],
         "image":"TotemNuts",
         "icon":"TotemNutsIcon",
         "tip":gls("Забегай в дупло раньше всех"),
         "description":gls("Увеличивает количество орехов, полученных на локации, на #%"),
         "common_description":gls("Увеличивает количество орехов, получаемых на локациях")
      }];
      
      public static const §_-a2w§:Array = [{
         "id":0,
         "level":1
      },{
         "id":1,
         "level":10
      },{
         "id":2,
         "level":20
      }];
      
      public function §_-su§()
      {
         super();
      }
      
      private static function get(param1:int) : Object
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-su§.DATA.length)
         {
            if(§_-su§.DATA[_loc2_]["id"] == param1)
            {
               return §_-su§.DATA[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function getSlotData(param1:int) : Object
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-su§.§_-a2w§.length)
         {
            if(§_-su§.§_-a2w§[_loc2_]["id"] == param1)
            {
               return §_-su§.§_-a2w§[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function §_-vW§(param1:int) : Class
      {
         if(param1 == NONE)
         {
            return null;
         }
         var _loc2_:Object = get(param1);
         if(!("perkClass" in _loc2_))
         {
            return null;
         }
         return _loc2_["perkClass"];
      }
      
      public static function §_-e14§(param1:int) : DisplayObject
      {
         if(param1 == NONE)
         {
            return null;
         }
         var _loc2_:Object = get(param1);
         return new (getDefinitionByName(_loc2_["image"]) as Class)();
      }
      
      public static function §_-C2h§(param1:int) : DisplayObject
      {
         if(param1 == NONE)
         {
            return null;
         }
         var _loc2_:Object = get(param1);
         return new (getDefinitionByName(_loc2_["icon"]) as Class)();
      }
      
      public static function getName(param1:int) : String
      {
         if(param1 == NONE)
         {
            return null;
         }
         var _loc2_:Object = get(param1);
         return _loc2_["name"];
      }
      
      public static function §_-ya§(param1:int, param2:int = 0) : String
      {
         if(param1 == NONE)
         {
            return null;
         }
         var _loc3_:Object = get(param1);
         if(param2 == 0)
         {
            return _loc3_["common_description"];
         }
         if(param1 == §_-wS§ || param1 == §_-co§)
         {
            param2 = int(100 / param2);
         }
         return (_loc3_["description"] as String).replace("#",param2);
      }
      
      public static function §_-P1j§(param1:int) : String
      {
         if(param1 == NONE)
         {
            return null;
         }
         var _loc2_:Object = get(param1);
         return _loc2_["tip"];
      }
      
      public static function §_-82P§(param1:int, param2:int = 0) : int
      {
         if(param1 == §_-su§.NONE)
         {
            return 0;
         }
         var _loc3_:Object = get(param1);
         if(param2 > _loc3_["level"].length)
         {
            return 0;
         }
         if(param2 < 1)
         {
            return _loc3_["level"][0];
         }
         return _loc3_["level"][param2 - 1];
      }
      
      public static function §_-6P§(param1:int, param2:int = 0) : int
      {
         if(param1 == NONE)
         {
            return 0;
         }
         var _loc3_:Object = get(param1);
         if(param2 > _loc3_["level"].length)
         {
            return 0;
         }
         if(param2 < 1)
         {
            return _loc3_["level"][0];
         }
         return _loc3_["level"][param2];
      }
      
      public static function §_-B3a§() : int
      {
         return DATA.length;
      }
      
      public static function §_-x2j§(param1:int) : int
      {
         if(param1 == NONE)
         {
            return 0;
         }
         var _loc2_:Object = getSlotData(param1);
         return _loc2_["level"];
      }
      
      public static function §_-i2Z§(param1:int, param2:int) : Boolean
      {
         if(param1 == NONE || param1 >= §_-Z1p§)
         {
            return false;
         }
         var _loc3_:Object = getSlotData(param1);
         return param2 >= _loc3_["level"];
      }
   }
}

