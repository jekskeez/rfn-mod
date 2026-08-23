package §_-P2b§
{
   public class §_-e1u§ extends §_-z5§
   {
      
      protected var §_-O2O§:int = 0;
      
      public function §_-e1u§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-O2O§ = 3;
      }
      
      override protected function get useCooldown() : Number
      {
         return 0.01;
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override protected function §_-lj§() : void
      {
         if(this.§_-C2B§ || !this.hero)
         {
            return;
         }
         this.§_-C2B§ = true;
         ++this.hero.§_-e2I§;
         --this.§_-O2O§;
         if(this.§_-O2O§ <= 0)
         {
            this.active = false;
         }
      }
   }
}

