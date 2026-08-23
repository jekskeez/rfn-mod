package views
{
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class §_-cU§ extends §_-ho§
   {
      
      public function §_-cU§(param1:DisplayObject)
      {
         super(param1);
      }
      
      public function §_-p1Z§(param1:DisplayObject) : void
      {
         if(this.button.parent != null)
         {
            this.button.removeEventListener(MouseEvent.MOUSE_UP,§_-P2v§);
            removeChild(this.button);
         }
         param1["name"] = this.button["name"];
         this.button = param1;
         addChildAt(this.button,1);
         this.button.addEventListener(MouseEvent.MOUSE_UP,§_-P2v§);
      }
   }
}

