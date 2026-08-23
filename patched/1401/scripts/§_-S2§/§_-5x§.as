package §_-S2§
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-P1Y§;
   import protocol.§_-S2I§;
   
   public class §_-5x§ extends Perk
   {
      
      public function §_-5x§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "";
         this.§_-dj§ = false;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function §_-7J§() : void
      {
         if(§_-71o§.active is §_-P1Y§)
         {
            this.active = !this.active;
            return;
         }
         super.§_-7J§();
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
         if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
         {
            return;
         }
         this.active = param1[2] == §_-S2I§.§_-EY§;
      }
   }
}

