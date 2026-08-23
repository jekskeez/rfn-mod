package §_-j2E§
{
   public class §_-P23§ extends §_-m2v§
   {
      
      protected var §_-s2g§:int = 0;
      
      public function §_-P23§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-s2g§ = 3;
      }
      
      override protected function get useCooldown() : Number
      {
         return 0.01;
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override protected function §_-W2b§() : void
      {
         if(this.§_-Q2s§ || !this.hero)
         {
            return;
         }
         this.§_-Q2s§ = true;
         ++this.hero.§_-d22§;
         --this.§_-s2g§;
         if(this.§_-s2g§ <= 0)
         {
            this.active = false;
         }
      }
   }
}

