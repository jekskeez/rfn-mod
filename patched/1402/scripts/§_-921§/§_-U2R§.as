package §_-921§
{
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-X1k§.§_-42H§;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   
   public class §_-U2R§ extends §_-aS§
   {
      
      private static const §_-61w§:int = 25;
      
      private var §_-1g§:§_-aS§ = null;
      
      private var §_-M1M§:§_-f1u§ = null;
      
      private var onComplete:Function = null;
      
      public function §_-U2R§(param1:int, param2:Function = null)
      {
         super();
         this.onComplete = param2;
         var _loc3_:Class = §_-42H§.§_-D1U§(param1);
         this.§_-1g§ = new §_-aS§(new _loc3_());
         this.§_-1g§.scaleXY(0.5);
         this.§_-1g§.filters = [new GlowFilter(16763955,1,4,4,3.08)];
         §_-J2J§(this.§_-1g§);
         this.§_-M1M§ = new §_-f1u§(new MirageClip());
         this.§_-M1M§.x = int(this.§_-1g§.width * 0.5);
         this.§_-M1M§.y = int(this.§_-1g§.height * 0.5);
         this.§_-M1M§.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
         §_-J2J§(this.§_-M1M§);
         this.§_-M1M§.play();
      }
      
      public function dispose() : void
      {
         this.§_-M1M§.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.§_-M1M§.stop();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.removeFromParent();
      }
      
      private function §_-52w§(param1:Event) : void
      {
         if(this.§_-M1M§.currentFrame < §_-61w§)
         {
            this.§_-1g§.alpha -= 1 / §_-61w§;
         }
         else if(this.§_-M1M§.currentFrame == §_-61w§)
         {
            this.§_-1g§.alpha = 0;
         }
         if(this.§_-M1M§.currentFrame == this.§_-M1M§.totalFrames - 1)
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

