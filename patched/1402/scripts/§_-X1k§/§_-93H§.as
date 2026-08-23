package §_-X1k§
{
   public class §_-93H§
   {
      
      private static var config:Object;
      
      public static var §_-sX§:Boolean = true;
      
      public function §_-93H§()
      {
         super();
      }
      
      public static function load() : void
      {
         config = §_-i1A§.data;
      }
      
      public static function §_-z1K§(param1:int) : int
      {
         if(!("coins_price" in VIP[param1]))
         {
            return 0;
         }
         return int(VIP[param1]["coins_price"]);
      }
      
      public static function §_-b14§(param1:int) : int
      {
         if(!("duration" in VIP[param1]))
         {
            return 0;
         }
         return VIP[param1]["duration"];
      }
      
      public static function §_-p2p§() : int
      {
         return 5;
      }
      
      public static function §_-te§() : int
      {
         return 5;
      }
      
      public static function §_-63a§(param1:int) : int
      {
         return param1 == 0 ? 49 : 239;
      }
      
      public static function §_-21I§(param1:int) : int
      {
         return smiles[param1]["coins_price"];
      }
      
      public static function §_-23K§(param1:int) : Array
      {
         return smiles[param1]["elements"];
      }
      
      public static function §_-V2W§(param1:int, param2:int) : int
      {
         return leagues[param2][param1]["min_scores"];
      }
      
      public static function §_-XY§(param1:int, param2:int) : String
      {
         return leagues[param2][param1]["name"];
      }
      
      public static function §_-B39§(param1:int) : int
      {
         if(param1 >= leagues.length)
         {
            return 0;
         }
         return (leagues[param1] as Array).length;
      }
      
      public static function §_-82Y§(param1:int) : int
      {
         return collections["regular_coins_price"][param1];
      }
      
      public static function §_-i1o§(param1:int) : Array
      {
         return collections["trophy_set"][param1];
      }
      
      public static function §_-B1Q§(param1:int) : int
      {
         return collections["unique_experience"][param1];
      }
      
      public static function §_-Z21§(param1:int) : Array
      {
         return collections["unique_set"][param1];
      }
      
      public static function §_-B3b§(param1:int) : int
      {
         return decorations[param1]["coins_price"];
      }
      
      public static function §_-j1l§(param1:int) : int
      {
         return decorations[param1]["nuts_price"];
      }
      
      public static function §_-wj§(param1:int) : int
      {
         return decorations[param1]["type"];
      }
      
      public static function get §_-517§() : int
      {
         return 1;
      }
      
      public static function get §_-e1V§() : int
      {
         return 10;
      }
      
      public static function §_-m2N§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["nuts_price"];
      }
      
      public static function §_-g1T§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["coins_set_price"];
      }
      
      public static function §_-72A§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["fast_coins_price"];
      }
      
      public static function §_-m17§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["fast_count"];
      }
      
      public static function get §_-w2u§() : Array
      {
         return bans["bans"];
      }
      
      public static function get §_-g13§() : Array
      {
         return shaman["levels"];
      }
      
      public static function get §_-f2W§() : int
      {
         return shaman["MAX_LEVEL"];
      }
      
      private static function get VIP() : Array
      {
         return config["vip"];
      }
      
      private static function get smiles() : Array
      {
         return config["smiles"]["packages"];
      }
      
      private static function get leagues() : Array
      {
         return ratings["leagues"];
      }
      
      private static function get ratings() : Object
      {
         return config["ratings"];
      }
      
      private static function get collections() : Object
      {
         return config["collections"];
      }
      
      private static function get decorations() : Object
      {
         return config["interior"];
      }
      
      private static function get locations() : Object
      {
         return config["maps"];
      }
      
      private static function get items() : Array
      {
         return config["items"]["info"];
      }
      
      private static function get bans() : Object
      {
         return config["bans"];
      }
      
      private static function get quests() : Object
      {
         return config["quest"];
      }
      
      private static function get shaman() : Object
      {
         return config["shaman"];
      }
   }
}

