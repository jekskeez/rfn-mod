package views
{
   import §_-I10§.§_-Z1F§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import utils.§_-w2v§;
   import utils.§_-x1Z§;
   
   public class §_-X22§ extends Sprite
   {
      
      private static const §_-b23§:GlowFilter = new GlowFilter(39423,1,3,3,1);
      
      private var §_-61q§:§_-w2v§;
      
      public function §_-X22§()
      {
         super();
         this.init();
         §_-Z1F§.addEventListener(GameEvent.MANA_CHANGED,this.update);
         §_-Z1F§.addEventListener(GameEvent.MAX_POWERS_CHANGED,this.update);
         this.update();
      }
      
      private function init() : void
      {
         var _loc1_:ManaBarImage = new ManaBarImage();
         _loc1_.filters = §_-x1Z§.§_-jD§;
         var _loc2_:ManaBarImage = new ManaBarImage();
         _loc2_.filters = [§_-b23§];
         this.§_-61q§ = new §_-w2v§([{
            "image":_loc1_,
            "X":0,
            "Y":0
         },{
            "image":_loc2_,
            "X":0,
            "Y":0
         }],75);
         addChild(this.§_-61q§);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-61q§.§_-B1n§(§_-Z1F§.§_-bc§,§_-Z1F§.§_-t2P§);
      }
   }
}

