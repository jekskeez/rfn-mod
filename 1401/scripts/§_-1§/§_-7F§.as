package §_-1§
{
   import §_-TX§.§_-LR§;
   
   public class §_-7F§ extends §_-K19§
   {
      
      public function §_-7F§(param1:Hero)
      {
         super(param1);
         this.delay = 0;
         this.§_-i2D§ = §_-tY§.§_-Mr§;
      }
      
      override public function get switchable() : Boolean
      {
         return false;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.shaman && !(this.hero is §_-LR§);
      }
      
      override protected function activate() : void
      {
         if(this.hero.isDead)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.hero.teleport(Hero.§_-98§);
         this.active = false;
      }
   }
}

