package §_-5P§
{
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   
   public class §_-A1n§ extends §_-H2l§
   {
      
      public function §_-A1n§(param1:Hero)
      {
         super(param1);
         this.delay = 0;
         this.§_-T2a§ = §_-Z1f§.§_-q1E§;
      }
      
      override public function get switchable() : Boolean
      {
         return false;
      }
      
      override public function get available() : Boolean
      {
         var _loc1_:Boolean = §_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-S2E§ && this.§_-T2a§ in §_-S2E§.§_-t1y§ || §_-t2c§.active is §_-H1k§ && this.§_-T2a§ in §_-H1k§.§_-t1y§;
         return this.hero && this.hero.isDead && !this.hero.inHollow && _loc1_;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.teleport(Hero.§_-L1F§);
         this.active = false;
      }
   }
}

