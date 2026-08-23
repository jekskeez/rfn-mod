package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   import §_-S2§.§_-22A§;
   
   public class §_-q4§ extends §_-qC§ implements §_-22A§
   {
      
      public function §_-q4§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-it§ = "";
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.buff)
         {
            this.buff = §_-T1G§(0);
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.hero)
         {
            this.hero.removeBuff(this.buff);
         }
      }
      
      override protected function §_-S2Z§(param1:SquirrelEvent) : void
      {
         if(!param1.player.shaman || this.active || !this.available)
         {
            return;
         }
         this.active = true;
      }
   }
}

