package
{
   public class §_-Zy§
   {
      
      public static const §_-dm§:String = "ru";
      
      public static const §_-o19§:String = "en";
      
      public static const §_-p1q§:int = 1;
      
      public static const §_-Z2H§:int = 832;
      
      public static const §_-R1A§:String = "sa";
      
      public static const §_-u2H§:int = 15;
      
      public static const §_-12p§:int = 199;
      
      public static const §_-21V§:int = 900;
      
      public static const §_-02T§:int = 620;
      
      public static var §_-z2c§:String;
      
      public static var §_-m1G§:int;
      
      public static var §_-G2Y§:int;
      
      public static var §_-p1y§:String;
      
      public static var §_-c11§:String;
      
      public static var §_-q2b§:String;
      
      public static var §_-y2I§:String;
      
      public static var §_-33D§:String;
      
      public static var §_-Y13§:String;
      
      public static var §_-q2K§:String;
      
      public static var §_-OF§:String;
      
      public static var §_-93l§:String;
      
      public static var §_-yw§:String;
      
      public static var §_-70§:String;
      
      public static var §_-Tc§:Object;
      
      public static var §_-S12§:String;
      
      public static var §_-N2d§:String;
      
      public static var §_-83§:String;
      
      public static var §_-72b§:String;
      
      public static var §_-a1s§:String;
      
      public static var §_-Q1M§:int;
      
      public static var §_-32G§:int;
      
      public static var §_-dV§:String;
      
      public static var §_-zE§:int;
      
      public static var §_-r1H§:String;
      
      public static var §_-s12§:int;
      
      public static var §_-01N§:String;
      
      public static var §_-i2N§:String;
      
      public static var §_-E2M§:String;
      
      public static var §_-S2j§:int;
      
      public static var §_-81C§:String;
      
      public static var §_-32c§:String;
      
      public static var §_-8J§:String;
      
      public static var §_-nn§:int;
      
      public static var §_-B3T§:int;
      
      public static var §_-Z1I§:String;
      
      public static var §_-r2m§:String;
      
      public static var §_-Y2T§:String;
      
      public static var §_-C36§:String;
      
      public static var §_-A1V§:String;
      
      public static var §_-214§:String;
      
      public static var §_-t2A§:Boolean;
      
      public static var §_-Bv§:Object;
      
      public static var §_-e2k§:Boolean = false;
      
      public static var §_-S2U§:String = "https://squirrels2.itsrealgames.com/config_release.json";
      
      public static var §_-73r§:String = §_-dm§;
      
      public static var §_-BO§:String = "https:";
      
      public function §_-Zy§()
      {
         super();
      }
      
      public static function get §_-BI§() : Boolean
      {
         return §_-73r§ == §_-dm§;
      }
      
      public static function load(param1:Object) : void
      {
         var _loc2_:String = null;
         §_-z2c§ = param1.host;
         §_-m1G§ = param1.port;
         §_-p1y§ = §_-BO§ + param1.urls.errors;
         §_-33D§ = §_-BO§ + param1.urls.photos.base;
         §_-c11§ = §_-BO§ + param1.urls.photos.save;
         §_-70§ = §_-BO§ + param1.urls.sounds;
         §_-Tc§ = param1.versions;
         §_-S12§ = §_-BO§ + param1.urls.libraries;
         §_-Y13§ = §_-BO§ + param1.urls.images;
         §_-q2K§ = §_-BO§ + param1.urls.previews;
         §_-OF§ = §_-BO§ + param1.urls.previewsCast;
         §_-93l§ = §_-BO§ + param1.urls.previewsClothes;
         §_-yw§ = §_-BO§ + param1.urls.previewsShaman;
         §_-q2b§ = §_-BO§ + param1.urls.screenshot;
         §_-y2I§ = §_-BO§ + param1.urls.emblem;
         §_-N2d§ = §_-BO§ + param1.urls.content;
         §_-83§ = §_-BO§ + param1.urls.events;
         §_-72b§ = §_-BO§ + param1.urls.offers;
         §_-a1s§ = §_-BO§ + param1.urls.rewards;
         §_-r2m§ = param1.urls.payments.xsolla_get_token_url;
         §_-Y2T§ = param1.urls.payments.yookassa_get_token_url;
         §_-C36§ = param1.urls.payments.yookassa_payment_url;
         §_-A1V§ = param1.urls.payments.robokassa_get_token_url;
         §_-214§ = param1.urls.payments.robokassa_payment_url;
         §_-t2A§ = param1.urls.payments.nats_enabled != "0";
         §_-Q1M§ = param1.networks.vk.id;
         §_-32G§ = param1.networks.mm.id;
         §_-dV§ = param1.networks.mm.secret;
         §_-zE§ = param1.networks.ok.id;
         §_-r1H§ = param1.networks.ok.secret;
         §_-s12§ = param1.networks.fb.id;
         §_-01N§ = param1.networks.fb.app;
         §_-i2N§ = param1.networks.fb.buy_url;
         §_-E2M§ = param1.networks.fb.products_url;
         §_-S2j§ = param1.networks.fs.id;
         §_-81C§ = param1.networks.fs.products_url;
         §_-32c§ = param1.networks.fs.app;
         §_-8J§ = param1.networks.fs.secret;
         §_-nn§ = param1.networks.sa.id;
         §_-B3T§ = param1.networks.sa.app;
         §_-Z1I§ = param1.networks.sa.api_url;
         §_-Bv§ = {};
         for(_loc2_ in param1.help_urls)
         {
            §_-Bv§[_loc2_.toLowerCase()] = param1.help_urls[_loc2_];
         }
      }
   }
}

