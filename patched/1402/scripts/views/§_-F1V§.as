package views
{
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class §_-F1V§ extends §_-81K§
   {
      
      public function §_-F1V§(param1:DisplayObject)
      {
         super(param1);
      }
      
      public function §_-vP§(param1:DisplayObject) : void
      {
         if(this.button.parent != null)
         {
            this.button.removeEventListener(MouseEvent.MOUSE_UP,§_-H1h§);
            removeChild(this.button);
         }
         param1["name"] = this.button["name"];
         this.button = param1;
         addChildAt(this.button,1);
         this.button.addEventListener(MouseEvent.MOUSE_UP,§_-H1h§);
      }
   }
}

