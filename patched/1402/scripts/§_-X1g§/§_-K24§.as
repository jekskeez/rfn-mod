package §_-X1g§
{
   import §_-X2V§.SquirrelEvent;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-K24§ extends §_-M8§
   {
      
      public function §_-K24§(param1:Hero)
      {
         super(param1);
         this.hero.addEventListener(SquirrelEvent.§_-E25§,this.§_-tw§);
      }
      
      override public function get available() : Boolean
      {
         return false;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.addEventListener(SquirrelEvent.§_-R1y§,this.§_-B35§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-R1y§,this.§_-B35§);
         if(this.isSelf)
         {
            Connection.§_-e2T§(§_-u1O§.§_-N1Y§);
         }
      }
      
      override public function get activeTime() : Number
      {
         return 8;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      private function §_-tw§(param1:SquirrelEvent) : void
      {
         this.active = this.hero.isDragon && this.hero.isDead && !this.hero.inHollow && this.§_-K2E§;
      }
      
      private function §_-B35§(param1:SquirrelEvent) : void
      {
         this.§_-h1§ = 0;
         §_-k1J§();
      }
   }
}

