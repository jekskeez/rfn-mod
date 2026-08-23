package §_-qJ§
{
   import §_-I10§.§_-vy§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   
   public class §_-f2w§ extends §_-h2I§
   {
      
      private static const §_-L2m§:int = 25;
      
      private var §_-717§:§_-h2I§ = null;
      
      private var §_-j2C§:§_-d2d§ = null;
      
      private var onComplete:Function = null;
      
      public function §_-f2w§(param1:int, param2:Function = null)
      {
         super();
         this.onComplete = param2;
         var _loc3_:Class = §_-vy§.§_-z2p§(param1);
         this.§_-717§ = new §_-h2I§(new _loc3_());
         this.§_-717§.scaleXY(0.5);
         this.§_-717§.filters = [new GlowFilter(16763955,1,4,4,3.08)];
         §_-83v§(this.§_-717§);
         this.§_-j2C§ = new §_-d2d§(new MirageClip());
         this.§_-j2C§.x = int(this.§_-717§.width * 0.5);
         this.§_-j2C§.y = int(this.§_-717§.height * 0.5);
         this.§_-j2C§.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
         §_-83v§(this.§_-j2C§);
         this.§_-j2C§.play();
      }
      
      public function dispose() : void
      {
         this.§_-j2C§.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.§_-j2C§.stop();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.removeFromParent();
      }
      
      private function §_-r5§(param1:Event) : void
      {
         if(this.§_-j2C§.currentFrame < §_-L2m§)
         {
            this.§_-717§.alpha -= 1 / §_-L2m§;
         }
         else if(this.§_-j2C§.currentFrame == §_-L2m§)
         {
            this.§_-717§.alpha = 0;
         }
         if(this.§_-j2C§.currentFrame == this.§_-j2C§.totalFrames - 1)
         {
            this.dispose();
            if(this.onComplete != null)
            {
               this.onComplete();
            }
         }
      }
   }
}

