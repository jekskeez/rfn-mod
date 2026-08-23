package §_-1§
{
   import §_-S1D§.§_-O1M§;
   import §_-S2§.Perk;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-P1Y§;
   import flash.display.SimpleButton;
   import protocol.§_-S2I§;
   
   public class §_-K19§ extends Perk
   {
      
      private static const §_-o1Z§:int = 3;
      
      protected var delay:int;
      
      public function §_-K19§(param1:Hero)
      {
         super(param1);
         this.delay = §_-o1Z§;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get available() : Boolean
      {
         var _loc1_:Boolean = §_-71o§.active is §_-92z§ || §_-71o§.active is §_-F29§ && this.§_-i2D§ in §_-F29§.§_-Vx§ || §_-71o§.active is §_-P1Y§ && this.§_-i2D§ in §_-P1Y§.§_-Vx§;
         return super.available && !this.hero.isHare && _loc1_;
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:Class = §_-tY§.§_-D2L§(this.§_-i2D§);
         this.hero.heroView.§_-A2O§(new _loc1_() as SimpleButton,this.delay);
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-w1R§];
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[2] == §_-S2I§.§_-L2G§)
         {
            return;
         }
         if(param1[2] == §_-S2I§.§_-EY§ && param1[1] == this.§_-i2D§)
         {
            §_-O1M§.§_-f2q§(false);
         }
         if(this.hero != null && param1[1] == this.§_-i2D§ && param1[0] == this.hero.id)
         {
            this.active = param1[2] == §_-S2I§.§_-EY§;
         }
      }
   }
}

