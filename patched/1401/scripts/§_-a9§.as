package
{
   public class §_-a9§
   {
      
      public static const §_-S4§:String = "ru";
      
      public static const §_-m2f§:String = "en";
      
      public static const §_-Ti§:int = 1;
      
      public static const §_-zD§:int = 831;
      
      public static const §_-63Z§:String = "sa";
      
      public static const §_-y1i§:int = 15;
      
      public static const §_-e2s§:int = 199;
      
      public static const §_-9o§:int = 900;
      
      public static const §_-31m§:int = 620;
      
      public static var §_-t4§:String;
      
      public static var §_-o2V§:int;
      
      public static var §_-8h§:int;
      
      public static var §_-e2c§:String;
      
      public static var §_-Z2l§:String;
      
      public static var §_-ru§:String;
      
      public static var §_-i2Y§:String;
      
      public static var §_-73§:String;
      
      public static var §_-t2x§:String;
      
      public static var §_-J2G§:String;
      
      public static var §_-E2P§:String;
      
      public static var §_-8k§:String;
      
      public static var §_-Fy§:String;
      
      public static var §_-g13§:String;
      
      public static var §_-gk§:Object;
      
      public static var §_-hL§:String;
      
      public static var §_-Af§:String;
      
      public static var §_-K2p§:String;
      
      public static var §_-K27§:String;
      
      public static var §_-c1i§:String;
      
      public static var §_-JO§:int;
      
      public static var §_-C3f§:int;
      
      public static var §_-q2p§:String;
      
      public static var §_-y1q§:int;
      
      public static var §_-q1U§:String;
      
      public static var §_-f15§:int;
      
      public static var §_-gC§:String;
      
      public static var §_-B3c§:String;
      
      public static var §_-11q§:String;
      
      public static var §_-kT§:int;
      
      public static var §_-81b§:String;
      
      public static var §_-7y§:String;
      
      public static var §_-u1Y§:String;
      
      public static var §_-3n§:int;
      
      public static var §_-Nc§:int;
      
      public static var §_-d1l§:String;
      
      public static var §_-R1L§:String;
      
      public static var §_-y1G§:String;
      
      public static var §_-w1x§:String;
      
      public static var §_-a2p§:String;
      
      public static var §_-QI§:String;
      
      public static var §_-73q§:Boolean;
      
      public static var §_-v1U§:Object;
      
      public static var §_-O1z§:Boolean = false;
      
      public static var §_-CC§:String = "https://squirrels2.itsrealgames.com/config_release.json";
      
      public static var §_-L2p§:String = §_-S4§;
      
      public static var §_-N2q§:String = "https:";
      
      public function §_-a9§()
      {
         super();
      }
      
      public static function get §_-sc§() : Boolean
      {
         return §_-L2p§ == §_-S4§;
      }
      
      public static function load(param1:Object) : void
      {
         var _loc2_:String = null;
         §_-t4§ = param1.host;
         §_-o2V§ = param1.port;
         §_-e2c§ = §_-N2q§ + param1.urls.errors;
         §_-73§ = §_-N2q§ + param1.urls.photos.base;
         §_-Z2l§ = §_-N2q§ + param1.urls.photos.save;
         §_-g13§ = §_-N2q§ + param1.urls.sounds;
         §_-gk§ = param1.versions;
         §_-hL§ = §_-N2q§ + param1.urls.libraries;
         §_-t2x§ = §_-N2q§ + param1.urls.images;
         §_-J2G§ = §_-N2q§ + param1.urls.previews;
         §_-E2P§ = §_-N2q§ + param1.urls.previewsCast;
         §_-8k§ = §_-N2q§ + param1.urls.previewsClothes;
         §_-Fy§ = §_-N2q§ + param1.urls.previewsShaman;
         §_-ru§ = §_-N2q§ + param1.urls.screenshot;
         §_-i2Y§ = §_-N2q§ + param1.urls.emblem;
         §_-Af§ = §_-N2q§ + param1.urls.content;
         §_-K2p§ = §_-N2q§ + param1.urls.events;
         §_-K27§ = §_-N2q§ + param1.urls.offers;
         §_-c1i§ = §_-N2q§ + param1.urls.rewards;
         §_-R1L§ = param1.urls.payments.xsolla_get_token_url;
         §_-y1G§ = param1.urls.payments.yookassa_get_token_url;
         §_-w1x§ = param1.urls.payments.yookassa_payment_url;
         §_-a2p§ = param1.urls.payments.robokassa_get_token_url;
         §_-QI§ = param1.urls.payments.robokassa_payment_url;
         §_-73q§ = param1.urls.payments.nats_enabled != "0";
         §_-JO§ = param1.networks.vk.id;
         §_-C3f§ = param1.networks.mm.id;
         §_-q2p§ = param1.networks.mm.secret;
         §_-y1q§ = param1.networks.ok.id;
         §_-q1U§ = param1.networks.ok.secret;
         §_-f15§ = param1.networks.fb.id;
         §_-gC§ = param1.networks.fb.app;
         §_-B3c§ = param1.networks.fb.buy_url;
         §_-11q§ = param1.networks.fb.products_url;
         §_-kT§ = param1.networks.fs.id;
         §_-81b§ = param1.networks.fs.products_url;
         §_-7y§ = param1.networks.fs.app;
         §_-u1Y§ = param1.networks.fs.secret;
         §_-3n§ = param1.networks.sa.id;
         §_-Nc§ = param1.networks.sa.app;
         §_-d1l§ = param1.networks.sa.api_url;
         §_-v1U§ = {};
         for(_loc2_ in param1.help_urls)
         {
            §_-v1U§[_loc2_.toLowerCase()] = param1.help_urls[_loc2_];
         }
      }
   }
}

