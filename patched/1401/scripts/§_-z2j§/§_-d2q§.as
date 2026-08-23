package §_-z2j§
{
   import §_-8I§.SquirrelEvent;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-d2q§ extends §_-33U§
   {
      
      public function §_-d2q§(param1:Hero)
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
         GameSounds.playUnrepeatable("hare_reborn",§_-31F§.§_-Y2M§);
         if(this.isSelf)
         {
            Connection.§_-Li§(§_-h2B§.§_-03G§);
         }
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      private function §_-RB§(param1:SquirrelEvent) : void
      {
         this.active = true;
      }
      
      private function §_-a1t§(param1:SquirrelEvent) : void
      {
         this.§_-f1z§ = 0;
         §_-Z1A§();
      }
   }
}

