package §_-e2w§
{
   import §_-C3A§.§_-71U§;
   import §_-C3A§.§_-73K§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-m2t§;
   import §_-T2y§.Screen;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-F2y§;
   import §_-T2y§.§_-P1Y§;
   import §_-T2y§.§_-ac§;
   import §_-T2y§.§_-cG§;
   import §_-T2y§.§_-w17§;
   import buttons.§_-LD§;
   import buttons.§_-p1R§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import views.§_-5b§;
   import views.§_-QG§;
   import views.§_-f2L§;
   import views.§_-lb§;
   
   public class §_-B1d§ extends Sprite
   {
      
      private static const §_-930§:int = 0;
      
      private static const §_-cr§:int = 1;
      
      private static const §_-n1h§:int = 2;
      
      private static const §_-E2Q§:int = 3;
      
      private static const §_-E2k§:int = 0;
      
      private static const §_-b1c§:int = 1;
      
      private static const §_-n27§:int = 2;
      
      private static const §_-01B§:Number = 750;
      
      private static const §_-C2Z§:Number = 780;
      
      private static const §_-F2O§:Number = 806;
      
      private static var _instance:§_-B1d§;
      
      private var §_-G2s§:int = -1;
      
      private var §_-t2t§:§_-p1R§;
      
      private var §_-T16§:§_-LD§;
      
      private var settings:§_-5b§;
      
      private var balance:§_-f2L§;
      
      private var §_-96§:§_-QG§;
      
      private var §_-R2g§:§_-lb§;
      
      private var §_-aN§:int = 0;
      
      public function §_-B1d§()
      {
         _instance = this;
         super();
         this.init();
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
      }
      
      public static function get instance() : §_-B1d§
      {
         return _instance;
      }
      
      public function §_-V1Q§(param1:Event) : void
      {
         if(!_instance)
         {
            return;
         }
         if(§_-K1r§.§_-O1P§)
         {
            this.§_-t2t§.on();
         }
         else
         {
            this.§_-t2t§.off();
         }
         §_-1W§.§_-V1Q§();
         §_-52p§.§_-V1Q§();
         §_-I2t§.§_-V1Q§();
         this.§_-c1q§();
      }
      
      private function init() : void
      {
         addChild(new §_-1W§());
         addChild(new §_-52p§());
         addChild(new §_-I2t§());
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
         this.§_-t2t§ = §_-K1r§.§_-Ih§();
         addChild(this.§_-t2t§);
         this.§_-T16§ = new §_-LD§(true);
         this.§_-T16§.visible = false;
         addChild(this.§_-T16§);
         this.settings = new §_-5b§();
         addChild(this.settings);
         this.§_-96§ = new §_-QG§();
         addChild(this.§_-96§);
         this.§_-R2g§ = new §_-lb§();
         addChild(this.§_-R2g§);
         this.balance = new §_-f2L§();
         addChild(this.balance);
         §_-73K§.instance.§_-tK§(§_-71U§.§_-N2p§,this.§_-96§);
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         var _loc2_:int = this.§_-B1k§(param1.screen);
         if(this.§_-G2s§ == _loc2_)
         {
            return;
         }
         this.§_-G2s§ = _loc2_;
         if(param1.screen is §_-cG§)
         {
            this.visible = false;
            return;
         }
         §_-1W§.hide();
         §_-52p§.hide();
         §_-I2t§.hide();
         §_-52p§.§_-B1g§ = true;
         §_-52p§.§_-ot§ = true;
         this.§_-R2g§.visible = true;
         switch(this.§_-G2s§)
         {
            case §_-930§:
               §_-1W§.show();
               this.§_-g2s§(true,false);
               this.§_-aP§(true);
               this.move(§_-E2k§);
               break;
            case §_-n1h§:
               §_-I2t§.show();
               this.§_-g2s§(true,true);
               this.§_-aP§(false);
               this.move(§_-n27§);
               break;
            case -1:
               §_-52p§.hide();
               §_-1W§.hide();
               this.§_-g2s§(false,false);
               this.§_-aP§(false);
               break;
            case §_-cr§:
               §_-52p§.show();
               this.§_-g2s§(true,true);
               this.§_-aP§(true);
               this.move(§_-b1c§);
               break;
            case §_-E2Q§:
               §_-52p§.show();
               this.§_-g2s§(true,true);
               this.§_-aP§(true);
               this.§_-R2g§.visible = false;
               §_-52p§.§_-ot§ = false;
               §_-52p§.§_-B1g§ = false;
               this.move(§_-b1c§);
         }
      }
      
      private function §_-c1q§() : void
      {
         var _loc1_:Number = NaN;
         switch(this.§_-aN§)
         {
            case §_-n27§:
               _loc1_ = §_-I2t§.instance.x;
               this.§_-t2t§.scaleX = this.§_-t2t§.scaleY = 1.2;
               this.§_-t2t§.x = _loc1_ + §_-01B§;
               this.§_-t2t§.y = 2;
               this.§_-T16§.x = _loc1_ + §_-C2Z§;
               this.§_-T16§.y = 1;
               this.settings.x = _loc1_ + §_-F2O§;
               this.settings.y = 1;
               break;
            case §_-b1c§:
               this.§_-t2t§.scaleX = this.§_-t2t§.scaleY = 1;
               this.§_-t2t§.x = Game.starling.stage.stageWidth - 145;
               this.§_-t2t§.y = 14;
               this.§_-T16§.x = Game.starling.stage.stageWidth - 121;
               this.§_-T16§.y = 10;
               this.settings.x = Game.starling.stage.stageWidth - 95;
               this.settings.y = 10;
               break;
            default:
               this.§_-t2t§.scaleX = this.§_-t2t§.scaleY = 1;
               this.§_-t2t§.x = Game.starling.stage.stageWidth - 30;
               this.§_-t2t§.y = 15;
               this.settings.x = Game.starling.stage.stageWidth - 35;
               this.settings.y = 40;
         }
      }
      
      private function move(param1:int) : void
      {
         this.§_-aN§ = param1;
         this.§_-c1q§();
         var _loc2_:Boolean = param1 != §_-E2k§;
         this.balance.x = _loc2_ ? 120 : 210;
         this.balance.y = _loc2_ ? 10 : 15;
         this.balance.notify.visible = !_loc2_ && §_-m2t§.§_-Pd§ && §_-Q2v§.§_-91S§;
         this.§_-R2g§.x = _loc2_ ? 5 : 100;
         this.§_-R2g§.y = _loc2_ ? 51 : 56;
         this.§_-96§.x = _loc2_ ? 5 : 95;
         this.§_-96§.y = _loc2_ ? 5 : 10;
      }
      
      private function §_-g2s§(param1:Boolean, param2:Boolean) : void
      {
         this.settings.visible = param1;
         this.§_-t2t§.visible = param1;
         this.§_-T16§.visible = param2;
      }
      
      private function §_-aP§(param1:Boolean) : void
      {
         this.balance.visible = param1;
         this.§_-R2g§.visible = param1;
         this.§_-96§.visible = param1;
      }
      
      private function §_-B1k§(param1:Screen) : int
      {
         if(param1 is §_-5K§ || param1 is §_-5B§ || param1 is §_-F2y§ || param1 is §_-ac§)
         {
            return §_-930§;
         }
         if(param1 is §_-92z§ || param1 is §_-F29§)
         {
            return §_-cr§;
         }
         if(param1 is §_-w17§)
         {
            return §_-E2Q§;
         }
         if(param1 is §_-P1Y§)
         {
            return §_-n1h§;
         }
         return -1;
      }
   }
}

