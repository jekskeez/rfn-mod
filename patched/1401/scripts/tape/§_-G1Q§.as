package tape
{
   import §_-k1c§.§_-122§;
   import flash.events.Event;
   import views.§_-W2c§;
   
   public class §_-G1Q§ extends TapePlayer
   {
      
      public function §_-G1Q§(param1:int)
      {
         super(param1,TapePlayer.§_-sf§);
         (this.§_-M18§ as §_-W2c§).addEventListener("TOGGLE_SELECTED",this.§_-z2B§);
      }
      
      public function set selected(param1:Boolean) : void
      {
         (this.§_-M18§ as §_-W2c§).selected = param1;
      }
      
      public function get selected() : Boolean
      {
         return (this.§_-M18§ as §_-W2c§).selected;
      }
      
      private function §_-z2B§(param1:Event) : void
      {
         §_-122§.§_-B1L§(this.playerId,this.selected);
      }
   }
}

