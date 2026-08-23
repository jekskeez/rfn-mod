package §_-I10§
{
   import flash.events.Event;
   import utils.§_-2Y§;
   
   public class §_-B2§
   {
      
      private static var §_-KE§:Object = {};
      
      private static var §_-B1a§:Boolean = false;
      
      private static var §_-J2§:Function = null;
      
      public function §_-B2§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-2Y§.load(§_-a9§.§_-K27§ + "?" + Math.random(),false,null,§_-a0§,§_-93n§);
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
      
      public static function get offers() : Object
      {
         return §_-KE§;
      }
      
      public static function §_-P2D§(param1:int) : Object
      {
         return §_-KE§[param1];
      }
      
      private static function §_-a0§(param1:Event) : void
      {
         var offer:Object = null;
         var e:Event = param1;
         try
         {
            for each(offer in JSON.parse(e.target.data))
            {
               §_-KE§[offer.offer_id] = offer;
            }
         }
         catch(err:Error)
         {
            §_-TQ§.add("BundleData parse error: " + err);
         }
         §_-B1a§ = true;
         if(§_-J2§ != null)
         {
            §_-J2§();
         }
      }
      
      private static function §_-93n§(param1:Event) : void
      {
         §_-TQ§.add("BundleData load error: " + param1);
         if(§_-B1a§)
         {
            return;
         }
         §_-B1a§ = true;
         if(§_-J2§ != null)
         {
            §_-J2§();
         }
      }
   }
}

