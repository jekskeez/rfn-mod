package §_-I10§
{
   import flash.events.Event;
   import utils.§_-2Y§;
   
   public class §_-t2V§
   {
      
      private static const §_-b2G§:String = "clothes";
      
      private static const §_-CU§:String = "skills";
      
      private static const §_-B2r§:String = "bank";
      
      private static const §_-n23§:String = "word_filter";
      
      private static const §_-X17§:String = "news";
      
      private static const §_-ip§:String = "player";
      
      private static const §_-TG§:String = "nutty_pass";
      
      private static var §_-G2R§:Object;
      
      private static var §_-5R§:Object;
      
      private static var §_-T26§:Object;
      
      private static var §_-H2h§:Object;
      
      private static var §_-aJ§:Array;
      
      private static var §_-H29§:Object;
      
      private static var §_-N1z§:Object;
      
      private static var §_-B1a§:Boolean = false;
      
      private static var §_-J2§:Function = null;
      
      public function §_-t2V§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-2Y§.load(§_-a9§.§_-Af§ + "?" + Math.random(),false,null,§_-a0§,§_-93n§);
      }
      
      public static function get §_-v2e§() : Boolean
      {
         return §_-B1a§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-B1a§)
         {
            if(param1 != null)
            {
               param1();
            }
            return;
         }
         if(param1 == null)
         {
            return;
         }
         §_-J2§ = param1;
      }
      
      public static function get clothes() : Object
      {
         return §_-G2R§;
      }
      
      public static function get skills() : Object
      {
         return §_-5R§;
      }
      
      public static function get bank() : Object
      {
         return §_-T26§;
      }
      
      public static function get §_-J2X§() : Object
      {
         return §_-H2h§;
      }
      
      public static function get news() : Array
      {
         return §_-aJ§;
      }
      
      public static function get player() : Object
      {
         return §_-H29§;
      }
      
      public static function get §_-N1v§() : Object
      {
         return §_-N1z§;
      }
      
      private static function §_-a0§(param1:Event) : void
      {
         var config:Object = null;
         var e:Event = param1;
         try
         {
            config = JSON.parse(e.target.data);
            §_-G2R§ = config[§_-b2G§];
            §_-5R§ = config[§_-CU§];
            §_-T26§ = config[§_-B2r§];
            §_-H2h§ = config[§_-n23§];
            §_-aJ§ = config[§_-X17§];
            §_-H29§ = config[§_-ip§];
            §_-N1z§ = config[§_-TG§];
         }
         catch(e:Error)
         {
            §_-TQ§.add("ContentData parse error:",e);
            return;
         }
         §_-B1a§ = true;
         §_-J2§();
      }
      
      private static function §_-93n§(param1:Event) : void
      {
         §_-TQ§.add("ContentData load error:",param1);
      }
   }
}

