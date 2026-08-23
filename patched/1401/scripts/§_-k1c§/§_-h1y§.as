package §_-k1c§
{
   import §_-I10§.§_-My§;
   import §_-I10§.§_-W1e§;
   import §_-I10§.§_-d2x§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-cG§;
   import buttons.§_-j18§;
   import com.api.Services;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import tape.§_-W18§;
   
   public class §_-h1y§ extends Dialog
   {
      
      private static const §_-p2O§:int = 180;
      
      private static var _instance:§_-h1y§ = null;
      
      private static var time:int = 0;
      
      private static var §_-q1R§:Boolean = false;
      
      private var §_-S1k§:§_-W18§;
      
      private var §_-s1z§:Array = [];
      
      public function §_-h1y§()
      {
         super(gls("Заскучали?"));
         this.init();
      }
      
      public static function init() : void
      {
         if(§_-d2x§.§_-z2o§ <= §_-My§.§_-U1R§ || Game.self.type == §_-a9§.§_-3n§)
         {
            return;
         }
         if(!Game.§_-B2U§ || Game.§_-B2U§.length == 0 || Game.§_-B2U§.length == Game.§_-B3t§.length)
         {
            return;
         }
         §_-01Y§.§_-c9§(§_-A1b§);
         Game.stage.addEventListener(MouseEvent.CLICK,§_-u2§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,§_-u2§);
      }
      
      private static function §_-A1b§() : void
      {
         if(Boolean(_instance) && Boolean(_instance.visible) || §_-q1R§)
         {
            return;
         }
         ++time;
         if(time < §_-p2O§)
         {
            return;
         }
         if(§_-71o§.active is §_-cG§)
         {
            §_-01Y§.§_-l2K§(§_-A1b§);
            return;
         }
         if(!_instance)
         {
            _instance = new §_-h1y§();
         }
         if(!_instance.visible)
         {
            _instance.show();
         }
         §_-W1e§.§_-q1R§(§_-W1e§.§_-RU§);
         §_-q1R§ = true;
      }
      
      private static function §_-u2§(param1:Event = null) : void
      {
         time = 0;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-S1k§.§_-WG§();
      }
      
      private function init() : void
      {
         addChild(new §_-22V§(gls("Пригласи нас в игру, будем играть вместе!"),5,0,new TextFormat(null,14,0)));
         addChild(new §_-22V§(gls("За каждого приглашенного друга, который\nдостигнет {0} уровня, ты получишь",Game.§_-L1O§),§_-a9§.§_-sc§ ? 35 : 72,90,new TextFormat(null,11,0,null,null,null,null,null,"center")));
         addChild(new §_-22V§(gls("+15      в подарок"),§_-a9§.§_-sc§ ? 52 : 68,120,new TextFormat(§_-22V§.§_-pJ§,20,16743999))).filters = §_-7O§.§_-w1P§;
         var _loc1_:ImageIconCoins = new ImageIconCoins();
         _loc1_.x = §_-a9§.§_-sc§ ? 95 : 111;
         _loc1_.y = 120;
         addChild(_loc1_);
         this.§_-S1k§ = new §_-W18§(true);
         this.§_-S1k§.y = 25;
         addChild(this.§_-S1k§);
         var _loc2_:§_-j18§ = new §_-j18§(gls("Пригласить"));
         _loc2_.x = §_-a9§.§_-sc§ ? 80 : 110;
         _loc2_.y = 150;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(_loc2_);
         place();
         this.width = 330;
         this.height = 235;
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         this.§_-s1z§ = this.§_-S1k§.§_-Lj§().slice();
         this.onComplete();
         §_-W1e§.used(§_-W1e§.§_-RU§);
         hide();
      }
      
      private function onComplete(param1:Object = null) : void
      {
         if(this.§_-s1z§.length == 0)
         {
            return;
         }
         Services.inviteFriendsById(this.§_-s1z§.shift());
      }
   }
}

