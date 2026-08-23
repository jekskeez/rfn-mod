package tape
{
   import §_-a11§.§_-h2m§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-2n§ extends §_-QN§
   {
      
      protected var §_-n2x§:int;
      
      protected var §_-n2P§:Boolean = false;
      
      protected var back:MovieClip = null;
      
      protected var §_-Oh§:MovieClip = null;
      
      public function §_-2n§(param1:int)
      {
         super();
         this.§_-n2x§ = param1;
         this.buttonMode = true;
         this.init();
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-n2P§ = param1;
         this.§_-Oh§.visible = this.§_-n2P§;
         this.back.visible = !this.§_-n2P§;
      }
      
      public function get selected() : Boolean
      {
         return this.§_-n2P§;
      }
      
      protected function init() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-p10§);
      }
      
      protected function §_-p10§(param1:MouseEvent) : void
      {
         dispatchEvent(new §_-h2m§(this,§_-h2m§.STICKED));
      }
   }
}

