package §_-I10§
{
   public class §_-8S§
   {
      
      private static var config:Object;
      
      public static var §_-k23§:Boolean = true;
      
      public function §_-8S§()
      {
         super();
      }
      
      public static function load() : void
      {
         config = §_-d3§.data;
      }
      
      public static function §_-7h§(param1:int) : int
      {
         if(!("coins_price" in VIP[param1]))
         {
            return 0;
         }
         return int(VIP[param1]["coins_price"]);
      }
      
      public static function §_-02q§(param1:int) : int
      {
         if(!("duration" in VIP[param1]))
         {
            return 0;
         }
         return VIP[param1]["duration"];
      }
      
      public static function §_-1E§() : int
      {
         return 5;
      }
      
      public static function §_-TA§() : int
      {
         return 5;
      }
      
      public static function §_-Ln§(param1:int) : int
      {
         return param1 == 0 ? 49 : 239;
      }
      
      public static function §_-q2J§(param1:int) : int
      {
         return smiles[param1]["coins_price"];
      }
      
      public static function §_-ic§(param1:int) : Array
      {
         return smiles[param1]["elements"];
      }
      
      public static function §_-B18§(param1:int, param2:int) : int
      {
         return leagues[param2][param1]["min_scores"];
      }
      
      public static function §_-11s§(param1:int, param2:int) : String
      {
         return leagues[param2][param1]["name"];
      }
      
      public static function §_-Oh§(param1:int) : int
      {
         if(param1 >= leagues.length)
         {
            return 0;
         }
         return (leagues[param1] as Array).length;
      }
      
      public static function §_-Z21§(param1:int) : int
      {
         return collections["regular_coins_price"][param1];
      }
      
      public static function §_-Sr§(param1:int) : Array
      {
         return collections["trophy_set"][param1];
      }
      
      public static function §_-g1m§(param1:int) : int
      {
         return collections["unique_experience"][param1];
      }
      
      public static function §_-T2x§(param1:int) : Array
      {
         return collections["unique_set"][param1];
      }
      
      public static function §_-22S§(param1:int) : int
      {
         return decorations[param1]["coins_price"];
      }
      
      public static function §_-R2o§(param1:int) : int
      {
         return decorations[param1]["nuts_price"];
      }
      
      public static function §_-L1q§(param1:int) : int
      {
         return decorations[param1]["type"];
      }
      
      public static function get §_-bF§() : int
      {
         return 1;
      }
      
      public static function get §_-035§() : int
      {
         return 10;
      }
      
      public static function §_-D2a§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["nuts_price"];
      }
      
      public static function §_-A1d§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["coins_set_price"];
      }
      
      public static function §_-CM§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["fast_coins_price"];
      }
      
      public static function §_-lO§(param1:int) : int
      {
         if(param1 >= items.length)
         {
            return 0;
         }
         return items[param1]["fast_count"];
      }
      
      public static function get §_-aD§() : Array
      {
         return bans["bans"];
      }
      
      public static function get §_-TO§() : Array
      {
         return shaman["levels"];
      }
      
      public static function get §_-P2m§() : int
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

