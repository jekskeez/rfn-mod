package views
{
   import §_-X1k§.§_-hO§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import utils.§_-8p§;
   import utils.§_-y1l§;
   
   public class §_-c2I§ extends Sprite
   {
      
      private static const §_-21n§:GlowFilter = new GlowFilter(6749952,1,3,3,1);
      
      private var §_-XT§:§_-8p§ = null;
      
      public function §_-c2I§()
      {
         super();
         this.init();
         §_-hO§.addEventListener(GameEvent.ENERGY_CHANGED,this.update);
         §_-hO§.addEventListener(GameEvent.MAX_POWERS_CHANGED,this.update);
         this.update();
      }
      
      private function init() : void
      {
         var _loc1_:EnergyBarImage = new EnergyBarImage();
         _loc1_.filters = §_-y1l§.§_-J2O§;
         var _loc2_:EnergyBarImage = new EnergyBarImage();
         _loc2_.filters = [§_-21n§];
         this.§_-XT§ = new §_-8p§([{
            "image":_loc1_,
            "X":0,
            "Y":0
         },{
            "image":_loc2_,
            "X":0,
            "Y":0
         }],75);
         addChild(this.§_-XT§);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-XT§.§_-d1Z§(§_-hO§.§_-i2E§,§_-hO§.§_-g2y§);
      }
   }
}

