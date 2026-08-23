package tape
{
   import §_-r2Y§.§_-33e§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-A3s§ extends §_-K2k§
   {
      
      protected var §_-4A§:int;
      
      protected var §_-L2v§:Boolean = false;
      
      protected var back:MovieClip = null;
      
      protected var §_-Nh§:MovieClip = null;
      
      public function §_-A3s§(param1:int)
      {
         super();
         this.§_-4A§ = param1;
         this.buttonMode = true;
         this.init();
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-L2v§ = param1;
         this.§_-Nh§.visible = this.§_-L2v§;
         this.back.visible = !this.§_-L2v§;
      }
      
      public function get selected() : Boolean
      {
         return this.§_-L2v§;
      }
      
      protected function init() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-33y§);
      }
      
      protected function §_-33y§(param1:MouseEvent) : void
      {
         dispatchEvent(new §_-33e§(this,§_-33e§.STICKED));
      }
   }
}

