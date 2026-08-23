package §_-J1i§
{
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-X2k§;
   import §_-c2C§.Screen;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-gc§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-c2C§.§_-x2y§;
   import §_-t1c§.§_-R1P§;
   import §_-t1c§.§_-r8§;
   import buttons.§_-Z2B§;
   import buttons.§_-c6§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import views.§_-H1B§;
   import views.§_-N1t§;
   import views.§_-P1G§;
   import views.§_-y27§;
   
   public class §_-H1z§ extends Sprite
   {
      
      private static const §_-f2n§:int = 0;
      
      private static const §_-x1k§:int = 1;
      
      private static const §_-h1a§:int = 2;
      
      private static const §_-V2B§:int = 3;
      
      private static const §_-qc§:int = 0;
      
      private static const §_-vK§:int = 1;
      
      private static const §_-Y1i§:int = 2;
      
      private static const §_-Ln§:Number = 750;
      
      private static const §_-A2C§:Number = 780;
      
      private static const §_-W2I§:Number = 806;
      
      private static var _instance:§_-H1z§;
      
      private var §_-U3§:int = -1;
      
      private var §_-zF§:§_-c6§;
      
      private var §_-Oo§:§_-Z2B§;
      
      private var settings:§_-y27§;
      
      private var balance:§_-H1B§;
      
      private var §_-91q§:§_-P1G§;
      
      private var §_-f2b§:§_-N1t§;
      
      private var §_-u2k§:int = 0;
      
      public function §_-H1z§()
      {
         _instance = this;
         super();
         this.init();
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
      }
      
      public static function get instance() : §_-H1z§
      {
         return _instance;
      }
      
      public function §_-22v§(param1:Event) : void
      {
         if(!_instance)
         {
            return;
         }
         if(§_-73Q§.§_-R1R§)
         {
            this.§_-zF§.on();
         }
         else
         {
            this.§_-zF§.off();
         }
         §_-W1v§.§_-22v§();
         §_-k1U§.§_-22v§();
         §_-91y§.§_-22v§();
         this.§_-sH§();
      }
      
      private function init() : void
      {
         addChild(new §_-W1v§());
         addChild(new §_-k1U§());
         addChild(new §_-91y§());
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
         this.§_-zF§ = §_-73Q§.§_-ng§();
         addChild(this.§_-zF§);
         this.§_-Oo§ = new §_-Z2B§(true);
         this.§_-Oo§.visible = false;
         addChild(this.§_-Oo§);
         this.settings = new §_-y27§();
         addChild(this.settings);
         this.§_-91q§ = new §_-P1G§();
         addChild(this.§_-91q§);
         this.§_-f2b§ = new §_-N1t§();
         addChild(this.§_-f2b§);
         this.balance = new §_-H1B§();
         addChild(this.balance);
         §_-r8§.instance.§_-23S§(§_-R1P§.§_-Q19§,this.§_-91q§);
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         var _loc2_:int = this.§_-A14§(param1.screen);
         if(this.§_-U3§ == _loc2_)
         {
            return;
         }
         this.§_-U3§ = _loc2_;
         if(param1.screen is §_-gc§)
         {
            this.visible = false;
            return;
         }
         §_-W1v§.hide();
         §_-k1U§.hide();
         §_-91y§.hide();
         §_-k1U§.§_-o21§ = true;
         §_-k1U§.§_-42x§ = true;
         this.§_-f2b§.visible = true;
         switch(this.§_-U3§)
         {
            case §_-f2n§:
               §_-W1v§.show();
               this.§_-P2U§(true,false);
               this.§_-Y2r§(true);
               this.move(§_-qc§);
               break;
            case §_-h1a§:
               §_-91y§.show();
               this.§_-P2U§(true,true);
               this.§_-Y2r§(false);
               this.move(§_-Y1i§);
               break;
            case -1:
               §_-k1U§.hide();
               §_-W1v§.hide();
               this.§_-P2U§(false,false);
               this.§_-Y2r§(false);
               break;
            case §_-x1k§:
               §_-k1U§.show();
               this.§_-P2U§(true,true);
               this.§_-Y2r§(true);
               this.move(§_-vK§);
               break;
            case §_-V2B§:
               §_-k1U§.show();
               this.§_-P2U§(true,true);
               this.§_-Y2r§(true);
               this.§_-f2b§.visible = false;
               §_-k1U§.§_-42x§ = false;
               §_-k1U§.§_-o21§ = false;
               this.move(§_-vK§);
         }
      }
      
      private function §_-sH§() : void
      {
         var _loc1_:Number = NaN;
         switch(this.§_-u2k§)
         {
            case §_-Y1i§:
               _loc1_ = §_-91y§.instance.x;
               this.§_-zF§.scaleX = this.§_-zF§.scaleY = 1.2;
               this.§_-zF§.x = _loc1_ + §_-Ln§;
               this.§_-zF§.y = 2;
               this.§_-Oo§.x = _loc1_ + §_-A2C§;
               this.§_-Oo§.y = 1;
               this.settings.x = _loc1_ + §_-W2I§;
               this.settings.y = 1;
               break;
            case §_-vK§:
               this.§_-zF§.scaleX = this.§_-zF§.scaleY = 1;
               this.§_-zF§.x = Game.starling.stage.stageWidth - 145;
               this.§_-zF§.y = 14;
               this.§_-Oo§.x = Game.starling.stage.stageWidth - 121;
               this.§_-Oo§.y = 10;
               this.settings.x = Game.starling.stage.stageWidth - 95;
               this.settings.y = 10;
               break;
            default:
               this.§_-zF§.scaleX = this.§_-zF§.scaleY = 1;
               this.§_-zF§.x = Game.starling.stage.stageWidth - 30;
               this.§_-zF§.y = 15;
               this.settings.x = Game.starling.stage.stageWidth - 35;
               this.settings.y = 40;
         }
      }
      
      private function move(param1:int) : void
      {
         this.§_-u2k§ = param1;
         this.§_-sH§();
         var _loc2_:Boolean = param1 != §_-qc§;
         this.balance.x = _loc2_ ? 120 : 210;
         this.balance.y = _loc2_ ? 10 : 15;
         this.balance.notify.visible = !_loc2_ && §_-X2k§.§_-c2S§ && §_-Ac§.§_-V26§;
         this.§_-f2b§.x = _loc2_ ? 5 : 100;
         this.§_-f2b§.y = _loc2_ ? 51 : 56;
         this.§_-91q§.x = _loc2_ ? 5 : 95;
         this.§_-91q§.y = _loc2_ ? 5 : 10;
      }
      
      private function §_-P2U§(param1:Boolean, param2:Boolean) : void
      {
         this.settings.visible = param1;
         this.§_-zF§.visible = param1;
         this.§_-Oo§.visible = param2;
      }
      
      private function §_-Y2r§(param1:Boolean) : void
      {
         this.balance.visible = param1;
         this.§_-f2b§.visible = param1;
         this.§_-91q§.visible = param1;
      }
      
      private function §_-A14§(param1:Screen) : int
      {
         if(param1 is §_-si§ || param1 is §_-51A§ || param1 is §_-P1w§ || param1 is §_-x2y§)
         {
            return §_-f2n§;
         }
         if(param1 is §_-u24§ || param1 is §_-S2E§)
         {
            return §_-x1k§;
         }
         if(param1 is §_-fx§)
         {
            return §_-V2B§;
         }
         if(param1 is §_-H1k§)
         {
            return §_-h1a§;
         }
         return -1;
      }
   }
}

