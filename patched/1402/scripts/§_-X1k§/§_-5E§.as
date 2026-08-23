package §_-X1k§
{
   import flash.events.Event;
   import utils.§_-fE§;
   
   public class §_-5E§
   {
      
      private static var §_-C3d§:Object = {};
      
      private static var §_-MM§:Boolean = false;
      
      private static var §_-v2m§:Function = null;
      
      public function §_-5E§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-fE§.load(§_-Zy§.§_-72b§ + "?" + Math.random(),false,null,§_-FT§,§_-n2y§);
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
      
      public static function get offers() : Object
      {
         return §_-C3d§;
      }
      
      public static function §_-W2r§(param1:int) : Object
      {
         return §_-C3d§[param1];
      }
      
      private static function §_-FT§(param1:Event) : void
      {
         var offer:Object = null;
         var e:Event = param1;
         try
         {
            for each(offer in JSON.parse(e.target.data))
            {
               §_-C3d§[offer.offer_id] = offer;
            }
         }
         catch(err:Error)
         {
            §_-p2U§.add("BundleData parse error: " + err);
         }
         §_-MM§ = true;
         if(§_-v2m§ != null)
         {
            §_-v2m§();
         }
      }
      
      private static function §_-n2y§(param1:Event) : void
      {
         §_-p2U§.add("BundleData load error: " + param1);
         if(§_-MM§)
         {
            return;
         }
         §_-MM§ = true;
         if(§_-v2m§ != null)
         {
            §_-v2m§();
         }
      }
   }
}

