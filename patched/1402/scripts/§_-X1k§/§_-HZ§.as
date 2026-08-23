package §_-X1k§
{
   import flash.events.Event;
   import utils.§_-fE§;
   
   public class §_-HZ§
   {
      
      private static const §_-93d§:String = "clothes";
      
      private static const §_-62t§:String = "skills";
      
      private static const §_-V1U§:String = "bank";
      
      private static const §_-ib§:String = "word_filter";
      
      private static const §_-j2S§:String = "news";
      
      private static const §_-v2X§:String = "player";
      
      private static const §_-z1w§:String = "nutty_pass";
      
      private static var §_-G2x§:Object;
      
      private static var §_-51M§:Object;
      
      private static var §_-21S§:Object;
      
      private static var §_-52o§:Object;
      
      private static var §_-r2s§:Array;
      
      private static var §_-p6§:Object;
      
      private static var §_-m2j§:Object;
      
      private static var §_-MM§:Boolean = false;
      
      private static var §_-v2m§:Function = null;
      
      public function §_-HZ§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-fE§.load(§_-Zy§.§_-N2d§ + "?" + Math.random(),false,null,§_-FT§,§_-n2y§);
      }
      
      public static function get §_-Xh§() : Boolean
      {
         return §_-MM§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-MM§)
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
         §_-v2m§ = param1;
      }
      
      public static function get clothes() : Object
      {
         return §_-G2x§;
      }
      
      public static function get skills() : Object
      {
         return §_-51M§;
      }
      
      public static function get bank() : Object
      {
         return §_-21S§;
      }
      
      public static function get §_-q1z§() : Object
      {
         return §_-52o§;
      }
      
      public static function get news() : Array
      {
         return §_-r2s§;
      }
      
      public static function get player() : Object
      {
         return §_-p6§;
      }
      
      public static function get §_-C2g§() : Object
      {
         return §_-m2j§;
      }
      
      private static function §_-FT§(param1:Event) : void
      {
         var config:Object = null;
         var e:Event = param1;
         try
         {
            config = JSON.parse(e.target.data);
            §_-G2x§ = config[§_-93d§];
            §_-51M§ = config[§_-62t§];
            §_-21S§ = config[§_-V1U§];
            §_-52o§ = config[§_-ib§];
            §_-r2s§ = config[§_-j2S§];
            §_-p6§ = config[§_-v2X§];
            §_-m2j§ = config[§_-z1w§];
         }
         catch(e:Error)
         {
            §_-p2U§.add("ContentData parse error:",e);
            return;
         }
         §_-MM§ = true;
         §_-v2m§();
      }
      
      private static function §_-n2y§(param1:Event) : void
      {
         §_-p2U§.add("ContentData load error:",param1);
      }
   }
}

