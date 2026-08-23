package §_-xr§
{
   import §_-bN§.§_-Fk§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class §_-32k§ extends §_-Fk§
   {
      
      public function §_-32k§()
      {
         super(gls("Обучающий уровень"),gls("Для того, чтобы отправиться\nв приключение с другими белками,\nтебе необходимо пройти обучение."));
      }
      
      override protected function §_-r1i§(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.W:
            case Keyboard.SPACE:
            case Keyboard.UP:
            case Keyboard.A:
            case Keyboard.LEFT:
            case Keyboard.D:
            case Keyboard.RIGHT:
               hide();
               return;
            default:
               return;
         }
      }
   }
}

