package views
{
   import §_-TK§.§_-aS§;
   import flash.events.Event;
   
   public class §_-13f§ extends §_-aS§
   {
      
      private var §_-m1g§:Number;
      
      private var §_-532§:Number;
      
      private var §_-a2R§:Number;
      
      private var §_-e2j§:Number;
      
      private var §_-W§:Number;
      
      private var §_-h1M§:§_-TE§ = null;
      
      public function §_-13f§(param1:§_-TE§, param2:§_-aS§)
      {
         super();
         this.§_-h1M§ = param1;
         this.init(param2);
      }
      
      private function init(param1:§_-aS§) : void
      {
         var _loc2_:§_-aS§ = param1;
         _loc2_.scaleX = _loc2_.scaleY = 0.4 + Math.random() * 0.75;
         §_-J2J§(_loc2_);
         this.§_-m1g§ = Math.random() * 2 - Math.random() * 2;
         this.§_-532§ = 0.5 + _loc2_.scaleX;
         this.§_-W§ = this.§_-532§ + this.scaleX * this.§_-h1M§.§_-GP§;
         addEventListener(Event.ENTER_FRAME,this.move);
      }
      
      private function move(param1:Event) : void
      {
         if(this.§_-a2R§ != this.§_-h1M§.§_-a2R§)
         {
            this.§_-a2R§ = this.§_-h1M§.§_-a2R§;
            this.§_-e2j§ = this.§_-m1g§ + this.§_-h1M§.§_-a2R§ * this.scaleX;
         }
         this.x += this.§_-e2j§;
         this.y += this.§_-W§;
         if(this.y < §_-Zy§.§_-02T§)
         {
            return;
         }
         if(Boolean(this.§_-h1M§) && this.§_-h1M§.§_-U2E§(this))
         {
            this.removeFromParent();
         }
         this.§_-h1M§ = null;
         removeEventListener(Event.ENTER_FRAME,this.move);
      }
   }
}

