package
{
   import §_-T2y§.§_-92z§;
   import utils.StringUtil;
   
   public class §_-q1p§
   {
      
      public static const §_-8Z§:int = 0;
      
      public static const §_-kZ§:int = 1;
      
      public static const §_-C25§:int = 0;
      
      public static const §_-w2u§:int = 1;
      
      public static const §_-sL§:int = 2;
      
      public static const §_-P4§:int = 3;
      
      public static const §_-u2u§:int = 4;
      
      public static const §_-k2B§:int = 5;
      
      public static const §_-l2I§:int = 6;
      
      public static const §_-G1z§:int = 7;
      
      public static const §_-u2f§:int = 8;
      
      public static const §_-A3z§:int = 9;
      
      public static const §_-M1m§:int = 10;
      
      public static const §_-k2m§:int = 11;
      
      public static const §_-73i§:int = 12;
      
      public static const §_-Q1s§:int = 13;
      
      public static const §_-427§:int = 15;
      
      public static const §_-B2D§:int = 16;
      
      public static const §_-X1n§:int = 18;
      
      public static const §_-2Z§:int = 2147483647;
      
      public static const §_-z1r§:int = 0;
      
      public static const §_-13I§:int = 1;
      
      public static const §_-SF§:int = 2;
      
      public static const §_-cq§:int = 3;
      
      public static const §_-w1Y§:int = 4;
      
      public static const §_-l1M§:int = 5;
      
      public static const §_-h2d§:int = 6;
      
      public static const §_-G21§:int = 7;
      
      public static const §_-3F§:int = 8;
      
      public static const §_-u1F§:int = 9;
      
      public static const §_-sJ§:int = 10;
      
      public static const §_-81M§:int = 11;
      
      public static const §_-lZ§:int = 15;
      
      public static const §_-ri§:int = 16;
      
      public static const §_-Q1Q§:int = 17;
      
      public static const §_-32i§:int = 18;
      
      public static const §_-hb§:int = 19;
      
      public static const §_-42U§:int = 4;
      
      public static const §_-C3X§:int = 3;
      
      public static const §_-q2b§:Array = [{
         "name":gls("Кручёные белки"),
         "modes":[0]
      },{
         "name":gls("Грави-белки"),
         "modes":[0]
      },{
         "name":gls("Прыгай"),
         "modes":[0]
      },{
         "name":gls("Турбобелки"),
         "modes":[0]
      },{
         "name":gls("Альпинизм"),
         "modes":[0]
      },{
         "name":gls("Самолётики"),
         "modes":[0]
      },{
         "name":gls("Ниндзи"),
         "modes":[0]
      },{
         "name":gls("Прыжок с парашютом"),
         "modes":[0]
      },{
         "name":gls("Равновесие"),
         "modes":[0]
      },{
         "name":gls("Пузыри"),
         "modes":[0]
      }];
      
      public static const §_-82i§:Array = [{
         "value":§_-2Z§,
         "name":gls("Редактор карт"),
         "game":false,
         "level":0
      },{
         "value":§_-X1n§,
         "name":gls("Песочница"),
         "game":false,
         "level":0,
         "cost":10,
         "nonHare":true
      },{
         "value":§_-C25§,
         "name":gls("Солнечная долина"),
         "game":true,
         "level":0,
         "cost":10,
         "award":2500,
         "nonHare":true,
         "mapModes":[0,17,18]
      },{
         "value":§_-M1m§,
         "name":gls("Битва"),
         "game":true,
         "level":7,
         "cost":10,
         "award":10000,
         "nonHare":false,
         "nonItems":true,
         "nonPerk":true,
         "nonClothes":true,
         "respawn":true,
         "teamMode":true
      },{
         "value":§_-sL§,
         "name":gls("Топи"),
         "game":true,
         "level":12,
         "cost":10,
         "award":5000,
         "nonHare":false
      },{
         "value":§_-k2B§,
         "name":gls("Дикие земли"),
         "game":false,
         "level":15,
         "cost":10,
         "nonHare":true,
         "nonItems":true,
         "modes":[15,16],
         "mapModes":[15,16]
      },{
         "value":§_-Q1s§,
         "name":gls("Шторм"),
         "game":true,
         "level":18,
         "cost":10,
         "award":6500,
         "nonHare":false,
         "modes":[2,3,4,5,6,7,8,9],
         "mapModes":[2,3,4,5,6,7,9]
      },{
         "value":§_-A3z§,
         "name":gls("Испытания"),
         "game":true,
         "level":20,
         "cost":15,
         "award":10000,
         "nonHare":false
      },{
         "value":§_-P4§,
         "name":gls("Пустыня"),
         "game":true,
         "level":25,
         "cost":10,
         "award":7500,
         "nonHare":false,
         "modes":[0,3],
         "mapModes":[0,3]
      },{
         "value":§_-u2u§,
         "name":gls("Аномальная зона"),
         "game":true,
         "level":32,
         "cost":10,
         "award":6500,
         "nonHare":false
      },{
         "value":§_-427§,
         "name":gls("Стадион"),
         "game":false,
         "level":202,
         "cost":10,
         "nonHare":true,
         "nonItems":true,
         "nonPerk":true,
         "nonClothes":true,
         "respawn":true,
         "subs":§_-q2b§
      },{
         "value":§_-G1z§,
         "name":gls("Школа")
      },{
         "value":§_-k2m§,
         "name":gls("Конкурс карт")
      },{
         "value":§_-l2I§,
         "name":gls("На модерации"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      },{
         "value":§_-u2f§,
         "name":gls("Одобренные"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      },{
         "value":§_-73i§,
         "name":gls("Плохие карты"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      },{
         "value":§_-B2D§,
         "name":gls("Релиз"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      }];
      
      public static const §_-m15§:Array = [{
         "name":gls("Классический"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":true,
         "dragonButton":true,
         "caption":gls("Классический"),
         "text":gls("Возьми орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Испытания"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Классический"),
         "text":gls("Возьми орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Все дракоши"),
         "nonClothes":true,
         "nonShamanPerks":true,
         "shamanButton":false,
         "hareButton":true,
         "dragonButton":false,
         "caption":gls("Все дракоши"),
         "text":gls("Возьми орех, беги в дупло!")
      },{
         "name":gls("Кромешная тьма"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Кромешная тьма"),
         "text":gls("Пройди сквозь тьму, остерегаясь препятствий!\nШаман, помоги белкам! Они ничего не видят!")
      },{
         "name":gls("Безумный шаман"),
         "nonClothes":false,
         "nonShamanPerks":true,
         "shamanButton":true,
         "hareButton":false,
         "dragonButton":true,
         "caption":gls("Безумный шаман"),
         "text":gls("Спасайся! Шаман хочет тебя убить!\nШаман, убей белок!")
      },{
         "name":gls("Два шамана"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":false,
         "dragonButton":true,
         "caption":gls("Два шамана"),
         "text":gls("Возьми орех, беги в дупло!\nШаман, помоги белкам первым!")
      },{
         "name":gls("Связанные"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Связанные"),
         "text":gls("Белки связаны! Возьми орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Летающий орех"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":true,
         "dragonButton":true,
         "caption":gls("Летающий орех"),
         "text":gls("Поймай орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Змейка"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Связанные"),
         "text":gls("Белки связаны! Возьми орех, беги в дупло! \nШаман, помоги белкам!")
      },{
         "name":gls("Колодец"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":false,
         "dragonButton":true,
         "caption":gls("Колодец"),
         "text":gls("Уровень кислоты поднимается! Скорее поднимайся вверх!")
      },{"name":gls("Интерактивный")},{
         "name":gls("Снеговик"),
         "nonClothes":false,
         "nonShamanPerks":true,
         "shamanButton":false,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Снеговик"),
         "text":gls("Бери снег, тащи к Снеговику!\nБери блоки, строй путь!")
      },{
         "name":gls("Механизмы"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":true,
         "dragonButton":true,
         "caption":gls("Классический"),
         "text":gls("Возьми орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Логические"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":true,
         "dragonButton":true,
         "caption":gls("Классический"),
         "text":gls("Возьми орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Ловушки"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":true,
         "dragonButton":true,
         "caption":gls("Классический"),
         "text":gls("Возьми орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Зомби"),
         "nonClothes":false,
         "nonShamanPerks":true,
         "shamanButton":false,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Зомби"),
         "text":gls("Белка, не дай зомби себя поймать!\nЗомби, зарази белок!")
      },{
         "name":gls("Гейзеры"),
         "nonClothes":false,
         "nonShamanPerks":true,
         "shamanButton":false,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Гейзеры"),
         "text":gls("Опасайся гейзеров!\nУвидел пар - беги!")
      },{
         "name":gls("Снежные хребты"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":true,
         "dragonButton":true,
         "caption":gls("Классический"),
         "text":gls("Возьми орех, беги в дупло!\nШаман, помоги белкам!")
      },{
         "name":gls("Безумие"),
         "nonClothes":false,
         "nonShamanPerks":false,
         "shamanButton":true,
         "hareButton":true,
         "dragonButton":true,
         "caption":gls("Безумие"),
         "text":gls("Нет времени объяснять!\nДумай быстро и действуй!")
      },{
         "name":gls("Ферма"),
         "nonClothes":false,
         "nonShamanPerks":true,
         "shamanButton":false,
         "hareButton":false,
         "dragonButton":false,
         "caption":gls("Ферма"),
         "text":gls("Бери воду, поливай растение!\nБери доски, строй путь!")
      }];
      
      private static var data:Object = {};
      
      public function §_-q1p§()
      {
         var _loc1_:Object = null;
         super();
         for each(_loc1_ in §_-q1p§.§_-82i§)
         {
            §_-q1p§.data[_loc1_["value"]] = new Location(_loc1_);
         }
      }
      
      public static function §_-N16§(param1:int) : Vector.<int>
      {
         var _loc3_:Location = null;
         var _loc2_:Vector.<int> = new Vector.<int>(0);
         for each(_loc3_ in list)
         {
            if(param1 >= _loc3_.level)
            {
               _loc2_.push(_loc3_.id);
            }
         }
         _loc2_.sort(Array.NUMERIC);
         return _loc2_;
      }
      
      public static function §_-l29§(param1:int) : Location
      {
         if(param1 in §_-q1p§.data)
         {
            return §_-q1p§.data[param1];
         }
         return new Location();
      }
      
      public static function §_-4N§(param1:int) : Boolean
      {
         var _loc2_:Object = §_-m15§[param1];
         return Boolean(_loc2_ && _loc2_["dragonButton"]);
      }
      
      public static function §_-xI§(param1:int, param2:int) : Boolean
      {
         var _loc3_:Object = §_-m15§[param1];
         if(!_loc3_ || !_loc3_["hareButton"])
         {
            return false;
         }
         return !§_-l29§(param2).nonHare;
      }
      
      public static function get §_-Vz§() : Location
      {
         return §_-l29§(§_-92z§.location);
      }
      
      public static function §_-Cc§(param1:int) : String
      {
         var _loc3_:Location = null;
         var _loc2_:Array = [];
         for each(_loc3_ in §_-q1p§.list)
         {
            if(_loc3_.level == param1)
            {
               _loc2_.push(_loc3_.name);
            }
         }
         return StringUtil.§_-Ke§(_loc2_);
      }
      
      public static function get list() : Object
      {
         return §_-q1p§.data;
      }
   }
}

