package §_-Oc§
{
   import §_-X2V§.SquirrelEvent;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-CE§ extends §_-WE§
   {
      
      public function §_-CE§(param1:Hero)
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
         GameSounds.playUnrepeatable("hare_reborn",§_-23o§.§_-Q0§);
         if(this.isSelf)
         {
            Connection.§_-e2T§(§_-u1O§.§_-N1Y§);
         }
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      private function §_-tw§(param1:SquirrelEvent) : void
      {
         this.active = true;
      }
      
      private function §_-B35§(param1:SquirrelEvent) : void
      {
         this.§_-h1§ = 0;
         §_-k1J§();
      }
   }
}

