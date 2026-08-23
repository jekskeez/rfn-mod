package §_-T1r§
{
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.§_-i2C§;
   
   public class §_-Q2L§ extends Sprite
   {
      
      private var §_-n11§:§_-i2C§ = new §_-i2C§(new DamageMovie());
      
      public function §_-Q2L§()
      {
         super();
         this.§_-n11§.loop = false;
         addChild(this.§_-n11§);
         this.visible = false;
      }
      
      public function play() : void
      {
         this.visible = true;
         if(!this.§_-n11§.isPlaying)
         {
            this.§_-n11§.addEventListener("Complete",this.dispose);
         }
         this.§_-n11§.gotoAndPlay(0);
      }
      
      private function dispose(param1:Event) : void
      {
         this.§_-n11§.removeEventListener("Complete",this.dispose);
         this.visible = false;
      }
   }
}

