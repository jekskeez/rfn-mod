package §_-1§
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-P1Y§;
   
   public class §_-vk§ extends §_-K19§
   {
      
      public function §_-vk§(param1:Hero)
      {
         super(param1);
         this.delay = 0;
         this.§_-i2D§ = §_-tY§.§_-Yi§;
      }
      
      override public function get switchable() : Boolean
      {
         return false;
      }
      
      override public function get available() : Boolean
      {
         var _loc1_:Boolean = §_-71o§.active is §_-92z§ || §_-71o§.active is §_-F29§ && this.§_-i2D§ in §_-F29§.§_-Vx§ || §_-71o§.active is §_-P1Y§ && this.§_-i2D§ in §_-P1Y§.§_-Vx§;
         return this.hero && this.hero.isDead && !this.hero.inHollow && _loc1_;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.teleport(Hero.§_-98§);
         this.active = false;
      }
   }
}

