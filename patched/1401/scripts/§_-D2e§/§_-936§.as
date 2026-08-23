package §_-D2e§
{
   import §_-k1c§.§_-Q13§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class §_-936§ extends §_-Q13§
   {
      
      public function §_-936§()
      {
         super(gls("Обучающий уровень"),gls("Для того, чтобы отправиться\nв приключение с другими белками,\nтебе необходимо пройти обучение."));
      }
      
      override protected function §_-21G§(param1:KeyboardEvent) : void
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

