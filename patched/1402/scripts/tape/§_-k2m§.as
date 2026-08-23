package tape
{
   import §_-bN§.§_-M1x§;
   import flash.events.Event;
   import views.§_-K1S§;
   
   public class §_-k2m§ extends TapePlayer
   {
      
      public function §_-k2m§(param1:int)
      {
         super(param1,TapePlayer.§_-M1a§);
         (this.§_-n12§ as §_-K1S§).addEventListener("TOGGLE_SELECTED",this.§_-E1q§);
      }
      
      public function set selected(param1:Boolean) : void
      {
         (this.§_-n12§ as §_-K1S§).selected = param1;
      }
      
      public function get selected() : Boolean
      {
         return (this.§_-n12§ as §_-K1S§).selected;
      }
      
      private function §_-E1q§(param1:Event) : void
      {
         §_-M1x§.§_-41j§(this.playerId,this.selected);
      }
   }
}

