package §_-cm§
{
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.§_-h25§;
   
   public class §_-r2F§ extends Sprite
   {
      
      private var §_-22B§:§_-h25§ = new §_-h25§(new DamageMovie());
      
      public function §_-r2F§()
      {
         super();
         this.§_-22B§.loop = false;
         addChild(this.§_-22B§);
         this.visible = false;
      }
      
      public function play() : void
      {
         this.visible = true;
         if(!this.§_-22B§.isPlaying)
         {
            this.§_-22B§.addEventListener("Complete",this.dispose);
         }
         this.§_-22B§.gotoAndPlay(0);
      }
      
      private function dispose(param1:Event) : void
      {
         this.§_-22B§.removeEventListener("Complete",this.dispose);
         this.visible = false;
      }
   }
}

