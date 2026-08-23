package
{
   import §_-c2C§.§_-u24§;
   import utils.StringUtil;
   
   public class §_-at§
   {
      
      public static const §_-L1l§:int = 0;
      
      public static const §_-e2M§:int = 1;
      
      public static const §_-I6§:int = 0;
      
      public static const §_-vr§:int = 1;
      
      public static const §_-D18§:int = 2;
      
      public static const §_-92b§:int = 3;
      
      public static const §_-j1i§:int = 4;
      
      public static const §_-G1K§:int = 5;
      
      public static const §_-lg§:int = 6;
      
      public static const §_-Uf§:int = 7;
      
      public static const §_-22E§:int = 8;
      
      public static const §_-e2a§:int = 9;
      
      public static const §_-N2g§:int = 10;
      
      public static const §_-31L§:int = 11;
      
      public static const §_-Lt§:int = 12;
      
      public static const §_-U1s§:int = 13;
      
      public static const §_-nq§:int = 15;
      
      public static const §_-820§:int = 16;
      
      public static const §_-B2t§:int = 18;
      
      public static const §_-V1H§:int = 2147483647;
      
      public static const §_-81Z§:int = 0;
      
      public static const §_-q1I§:int = 1;
      
      public static const §_-R2V§:int = 2;
      
      public static const §_-Tj§:int = 3;
      
      public static const §_-F15§:int = 4;
      
      public static const §_-83q§:int = 5;
      
      public static const §_-n1O§:int = 6;
      
      public static const §_-x19§:int = 7;
      
      public static const §_-dH§:int = 8;
      
      public static const §_-H1T§:int = 9;
      
      public static const §_-X1§:int = 10;
      
      public static const §_-A1y§:int = 11;
      
      public static const §_-O2n§:int = 15;
      
      public static const §_-r1j§:int = 16;
      
      public static const §_-v1M§:int = 17;
      
      public static const §_-S2Z§:int = 18;
      
      public static const §_-A2q§:int = 19;
      
      public static const §_-M21§:int = 4;
      
      public static const §_-ue§:int = 3;
      
      public static const §_-Cr§:Array = [{
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
      
      public static const §_-11z§:Array = [{
         "value":§_-V1H§,
         "name":gls("Редактор карт"),
         "game":false,
         "level":0
      },{
         "value":§_-B2t§,
         "name":gls("Песочница"),
         "game":false,
         "level":0,
         "cost":10,
         "nonHare":true
      },{
         "value":§_-I6§,
         "name":gls("Солнечная долина"),
         "game":true,
         "level":0,
         "cost":10,
         "award":2500,
         "nonHare":true,
         "mapModes":[0,17,18]
      },{
         "value":§_-N2g§,
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
         "value":§_-D18§,
         "name":gls("Топи"),
         "game":true,
         "level":12,
         "cost":10,
         "award":5000,
         "nonHare":false
      },{
         "value":§_-G1K§,
         "name":gls("Дикие земли"),
         "game":false,
         "level":15,
         "cost":10,
         "nonHare":true,
         "nonItems":true,
         "modes":[15,16],
         "mapModes":[15,16]
      },{
         "value":§_-U1s§,
         "name":gls("Шторм"),
         "game":true,
         "level":18,
         "cost":10,
         "award":6500,
         "nonHare":false,
         "modes":[2,3,4,5,6,7,8,9],
         "mapModes":[2,3,4,5,6,7,9]
      },{
         "value":§_-e2a§,
         "name":gls("Испытания"),
         "game":true,
         "level":20,
         "cost":15,
         "award":10000,
         "nonHare":false
      },{
         "value":§_-92b§,
         "name":gls("Пустыня"),
         "game":true,
         "level":25,
         "cost":10,
         "award":7500,
         "nonHare":false,
         "modes":[0,3],
         "mapModes":[0,3]
      },{
         "value":§_-j1i§,
         "name":gls("Аномальная зона"),
         "game":true,
         "level":32,
         "cost":10,
         "award":6500,
         "nonHare":false
      },{
         "value":§_-nq§,
         "name":gls("Стадион"),
         "game":false,
         "level":202,
         "cost":10,
         "nonHare":true,
         "nonItems":true,
         "nonPerk":true,
         "nonClothes":true,
         "respawn":true,
         "subs":§_-Cr§
      },{
         "value":§_-Uf§,
         "name":gls("Школа")
      },{
         "value":§_-31L§,
         "name":gls("Конкурс карт")
      },{
         "value":§_-lg§,
         "name":gls("На модерации"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      },{
         "value":§_-22E§,
         "name":gls("Одобренные"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      },{
         "value":§_-Lt§,
         "name":gls("Плохие карты"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      },{
         "value":§_-820§,
         "name":gls("Релиз"),
         "game":false,
         "mapModes":[0,1,2,3,4,5,6,7,9,12,13,14]
      }];
      
      public static const §_-02X§:Array = [{
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
      
      public function §_-at§()
      {
         var _loc1_:Object = null;
         super();
         for each(_loc1_ in §_-at§.§_-11z§)
         {
            §_-at§.data[_loc1_["value"]] = new Location(_loc1_);
         }
      }
      
      public static function §_-vv§(param1:int) : Vector.<int>
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
      
      public static function §_-13l§(param1:int) : Location
      {
         if(param1 in §_-at§.data)
         {
            return §_-at§.data[param1];
         }
         return new Location();
      }
      
      public static function §_-N2l§(param1:int) : Boolean
      {
         var _loc2_:Object = §_-02X§[param1];
         return Boolean(_loc2_ && _loc2_["dragonButton"]);
      }
      
      public static function §_-y1P§(param1:int, param2:int) : Boolean
      {
         var _loc3_:Object = §_-02X§[param1];
         if(!_loc3_ || !_loc3_["hareButton"])
         {
            return false;
         }
         return !§_-13l§(param2).nonHare;
      }
      
      public static function get §_-F2u§() : Location
      {
         return §_-13l§(§_-u24§.location);
      }
      
      public static function §_-h1b§(param1:int) : String
      {
         var _loc3_:Location = null;
         var _loc2_:Array = [];
         for each(_loc3_ in §_-at§.list)
         {
            if(_loc3_.level == param1)
            {
               _loc2_.push(_loc3_.name);
            }
         }
         return StringUtil.§_-H1n§(_loc2_);
      }
      
      public static function get list() : Object
      {
         return §_-at§.data;
      }
   }
}

