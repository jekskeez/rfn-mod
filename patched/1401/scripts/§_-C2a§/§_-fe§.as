package §_-C2a§
{
   import §_-8I§.SquirrelEvent;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-fe§ extends §_-W10§
   {
      
      public function §_-fe§(param1:Hero)
      {
         super(param1);
         this.hero.addEventListener(SquirrelEvent.§_-z1B§,this.§_-RB§);
      }
      
      override public function get available() : Boolean
      {
         return false;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.addEventListener(SquirrelEvent.§_-f13§,this.§_-a1t§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-f13§,this.§_-a1t§);
         if(this.isSelf)
         {
            Connection.§_-Li§(§_-h2B§.§_-03G§);
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
      
      private function §_-RB§(param1:SquirrelEvent) : void
      {
         this.active = this.hero.isDragon && this.hero.isDead && !this.hero.inHollow && this.§_-01h§;
      }
      
      private function §_-a1t§(param1:SquirrelEvent) : void
      {
         this.§_-f1z§ = 0;
         §_-Z1A§();
      }
   }
}

