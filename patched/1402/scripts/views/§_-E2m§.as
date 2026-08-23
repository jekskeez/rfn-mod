package views
{
   import §_-X1k§.§_-hO§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import utils.§_-8p§;
   import utils.§_-y1l§;
   
   public class §_-E2m§ extends Sprite
   {
      
      private static const §_-21n§:GlowFilter = new GlowFilter(39423,1,3,3,1);
      
      private var §_-43b§:§_-8p§;
      
      public function §_-E2m§()
      {
         super();
         this.init();
         §_-hO§.addEventListener(GameEvent.MANA_CHANGED,this.update);
         §_-hO§.addEventListener(GameEvent.MAX_POWERS_CHANGED,this.update);
         this.update();
      }
      
      private function init() : void
      {
         var _loc1_:ManaBarImage = new ManaBarImage();
         _loc1_.filters = §_-y1l§.§_-J2O§;
         var _loc2_:ManaBarImage = new ManaBarImage();
         _loc2_.filters = [§_-21n§];
         this.§_-43b§ = new §_-8p§([{
            "image":_loc1_,
            "X":0,
            "Y":0
         },{
            "image":_loc2_,
            "X":0,
            "Y":0
         }],75);
         addChild(this.§_-43b§);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-43b§.§_-d1Z§(§_-hO§.§_-Sy§,§_-hO§.§_-333§);
      }
   }
}

