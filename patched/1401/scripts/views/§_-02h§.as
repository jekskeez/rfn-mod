package views
{
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   
   public class §_-02h§ extends §_-h2I§
   {
      
      private var §_-t1B§:Number;
      
      private var §_-v2i§:Number;
      
      private var §_-l2N§:Number;
      
      private var §_-9R§:Number;
      
      private var §_-v2H§:Number;
      
      private var §_-925§:§_-nd§ = null;
      
      public function §_-02h§(param1:§_-nd§, param2:§_-h2I§)
      {
         super();
         this.§_-925§ = param1;
         this.init(param2);
      }
      
      private function init(param1:§_-h2I§) : void
      {
         var _loc2_:§_-h2I§ = param1;
         _loc2_.scaleX = _loc2_.scaleY = 0.4 + Math.random() * 0.75;
         §_-83v§(_loc2_);
         this.§_-t1B§ = Math.random() * 2 - Math.random() * 2;
         this.§_-v2i§ = 0.5 + _loc2_.scaleX;
         this.§_-v2H§ = this.§_-v2i§ + this.scaleX * this.§_-925§.§_-u2x§;
         addEventListener(Event.ENTER_FRAME,this.move);
      }
      
      private function move(param1:Event) : void
      {
         if(this.§_-l2N§ != this.§_-925§.§_-l2N§)
         {
            this.§_-l2N§ = this.§_-925§.§_-l2N§;
            this.§_-9R§ = this.§_-t1B§ + this.§_-925§.§_-l2N§ * this.scaleX;
         }
         this.x += this.§_-9R§;
         this.y += this.§_-v2H§;
         if(this.y < §_-a9§.§_-31m§)
         {
            return;
         }
         if(Boolean(this.§_-925§) && this.§_-925§.§_-ws§(this))
         {
            this.removeFromParent();
         }
         this.§_-925§ = null;
         removeEventListener(Event.ENTER_FRAME,this.move);
      }
   }
}

