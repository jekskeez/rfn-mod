package §_-n1h§
{
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import protocol.§_-s2l§;
   
   public class §_-C21§ extends Perk
   {
      
      public function §_-C21§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "";
         this.§_-E2q§ = false;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function §_-V1z§() : void
      {
         if(§_-t2c§.active is §_-H1k§)
         {
            this.active = !this.active;
            return;
         }
         super.§_-V1z§();
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-C1i§];
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[2] == §_-s2l§.§_-j2o§)
         {
            return;
         }
         if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
         {
            return;
         }
         this.active = param1[2] == §_-s2l§.§_-x2Y§;
      }
   }
}

