package §_-S1D§
{
   import §_-T2y§.Screen;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-F2y§;
   import §_-T2y§.§_-P1Y§;
   import §_-T2y§.§_-w17§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-3m§ extends Sprite
   {
      
      public static const §_-22U§:int = 115;
      
      public static const §_-yL§:int = 505;
      
      private static const §_-az§:int = 0;
      
      private static const §_-cr§:int = 1;
      
      private static const §_-n1h§:int = 2;
      
      private static const §_-E2Q§:int = 3;
      
      private static const §_-01Q§:int = 4;
      
      private static var _instance:§_-3m§ = null;
      
      private var §_-52Z§:Screen = null;
      
      public function §_-3m§()
      {
         super();
         _instance = this;
         this.init();
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
      }
      
      public static function get instance() : §_-3m§
      {
         return _instance;
      }
      
      public function §_-V1Q§(param1:Event = null) : void
      {
         this.x = (Game.starling.stage.stageWidth - §_-a9§.§_-9o§) * 0.5;
         this.y = Game.starling.stage.stageHeight - §_-22U§;
         §_-C1G§.§_-V1Q§();
      }
      
      private function init() : void
      {
         addChild(new §_-V18§());
         addChild(new §_-O1M§());
         addChild(new §_-G1W§());
         addChild(new §_-C1G§());
         this.§_-V1Q§();
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(this.§_-O2Y§(this.§_-52Z§) == this.§_-O2Y§(param1.screen))
         {
            return;
         }
         this.hide();
         this.§_-52Z§ = param1.screen;
         switch(this.§_-O2Y§(param1.screen))
         {
            case §_-az§:
               §_-V18§.show(false);
               break;
            case §_-01Q§:
               §_-V18§.show(true);
               break;
            case §_-cr§:
               §_-O1M§.show();
               break;
            case §_-E2Q§:
               §_-G1W§.show();
               break;
            case §_-n1h§:
               §_-C1G§.show();
         }
      }
      
      private function hide() : void
      {
         if(this.§_-52Z§ == null)
         {
            return;
         }
         switch(this.§_-O2Y§(this.§_-52Z§))
         {
            case §_-az§:
            case §_-01Q§:
               §_-V18§.hide();
               break;
            case §_-cr§:
               §_-O1M§.hide();
               break;
            case §_-E2Q§:
               §_-G1W§.hide();
               break;
            case §_-n1h§:
               §_-C1G§.deactivate();
         }
      }
      
      private function §_-O2Y§(param1:Screen) : int
      {
         if(param1 is §_-5K§)
         {
            return §_-az§;
         }
         if(param1 is §_-5B§ || param1 is §_-F2y§)
         {
            return §_-01Q§;
         }
         if(param1 is §_-w17§)
         {
            return §_-E2Q§;
         }
         if(param1 is §_-92z§ || param1 is §_-F29§)
         {
            return §_-cr§;
         }
         if(param1 is §_-P1Y§)
         {
            return §_-n1h§;
         }
         return -1;
      }
   }
}

