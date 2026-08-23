package §_-61C§
{
   import §_-c2C§.Screen;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-im§ extends Sprite
   {
      
      public static const §_-G2M§:int = 115;
      
      public static const §_-u2F§:int = 505;
      
      private static const §_-23j§:int = 0;
      
      private static const §_-x1k§:int = 1;
      
      private static const §_-h1a§:int = 2;
      
      private static const §_-V2B§:int = 3;
      
      private static const §_-21h§:int = 4;
      
      private static var _instance:§_-im§ = null;
      
      private var §_-B2b§:Screen = null;
      
      public function §_-im§()
      {
         super();
         _instance = this;
         this.init();
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
      }
      
      public static function get instance() : §_-im§
      {
         return _instance;
      }
      
      public function §_-22v§(param1:Event = null) : void
      {
         this.x = (Game.starling.stage.stageWidth - §_-Zy§.§_-21V§) * 0.5;
         this.y = Game.starling.stage.stageHeight - §_-G2M§;
         §_-sg§.§_-22v§();
      }
      
      private function init() : void
      {
         addChild(new §_-z1J§());
         addChild(new §_-a2p§());
         addChild(new §_-z2v§());
         addChild(new §_-sg§());
         this.§_-22v§();
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(this.§_-Q1C§(this.§_-B2b§) == this.§_-Q1C§(param1.screen))
         {
            return;
         }
         this.hide();
         this.§_-B2b§ = param1.screen;
         switch(this.§_-Q1C§(param1.screen))
         {
            case §_-23j§:
               §_-z1J§.show(false);
               break;
            case §_-21h§:
               §_-z1J§.show(true);
               break;
            case §_-x1k§:
               §_-a2p§.show();
               break;
            case §_-V2B§:
               §_-z2v§.show();
               break;
            case §_-h1a§:
               §_-sg§.show();
         }
      }
      
      private function hide() : void
      {
         if(this.§_-B2b§ == null)
         {
            return;
         }
         switch(this.§_-Q1C§(this.§_-B2b§))
         {
            case §_-23j§:
            case §_-21h§:
               §_-z1J§.hide();
               break;
            case §_-x1k§:
               §_-a2p§.hide();
               break;
            case §_-V2B§:
               §_-z2v§.hide();
               break;
            case §_-h1a§:
               §_-sg§.deactivate();
         }
      }
      
      private function §_-Q1C§(param1:Screen) : int
      {
         if(param1 is §_-si§)
         {
            return §_-23j§;
         }
         if(param1 is §_-51A§ || param1 is §_-P1w§)
         {
            return §_-21h§;
         }
         if(param1 is §_-fx§)
         {
            return §_-V2B§;
         }
         if(param1 is §_-u24§ || param1 is §_-S2E§)
         {
            return §_-x1k§;
         }
         if(param1 is §_-H1k§)
         {
            return §_-h1a§;
         }
         return -1;
      }
   }
}

