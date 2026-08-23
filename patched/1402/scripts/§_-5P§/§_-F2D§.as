package §_-5P§
{
   import §_-o1W§.§_-Qz§;
   
   public class §_-F2D§ extends §_-H2l§
   {
      
      public function §_-F2D§(param1:Hero)
      {
         super(param1);
         this.delay = 0;
         this.§_-T2a§ = §_-Z1f§.§_-fl§;
      }
      
      override public function get switchable() : Boolean
      {
         return false;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.shaman && !(this.hero is §_-Qz§);
      }
      
      override protected function activate() : void
      {
         if(this.hero.isDead)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.hero.teleport(Hero.§_-L1F§);
         this.active = false;
      }
   }
}

