package views
{
   import §_-I10§.§_-Z1F§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import utils.§_-w2v§;
   import utils.§_-x1Z§;
   
   public class §_-41k§ extends Sprite
   {
      
      private static const §_-b23§:GlowFilter = new GlowFilter(6749952,1,3,3,1);
      
      private var §_-H1A§:§_-w2v§ = null;
      
      public function §_-41k§()
      {
         super();
         this.init();
         §_-Z1F§.addEventListener(GameEvent.ENERGY_CHANGED,this.update);
         §_-Z1F§.addEventListener(GameEvent.MAX_POWERS_CHANGED,this.update);
         this.update();
      }
      
      private function init() : void
      {
         var _loc1_:EnergyBarImage = new EnergyBarImage();
         _loc1_.filters = §_-x1Z§.§_-jD§;
         var _loc2_:EnergyBarImage = new EnergyBarImage();
         _loc2_.filters = [§_-b23§];
         this.§_-H1A§ = new §_-w2v§([{
            "image":_loc1_,
            "X":0,
            "Y":0
         },{
            "image":_loc2_,
            "X":0,
            "Y":0
         }],75);
         addChild(this.§_-H1A§);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-H1A§.§_-B1n§(§_-Z1F§.§_-U1f§,§_-Z1F§.§_-u1t§);
      }
   }
}

