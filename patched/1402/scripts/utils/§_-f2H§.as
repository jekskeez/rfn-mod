package utils
{
   import flash.ui.Keyboard;
   
   public class §_-f2H§
   {
      
      public function §_-f2H§()
      {
         super();
      }
      
      public static function §_-d2k§(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case Keyboard.BACKSPACE:
               _loc2_ = "Backspace";
               break;
            case Keyboard.TAB:
               _loc2_ = "Tab";
               break;
            case Keyboard.ENTER:
               _loc2_ = "Enter";
               break;
            case Keyboard.SHIFT:
               _loc2_ = "Shift";
               break;
            case Keyboard.CONTROL:
               _loc2_ = "Ctrl";
               break;
            case Keyboard.ALTERNATE:
               _loc2_ = "Alt";
               break;
            case Keyboard.ESCAPE:
               _loc2_ = "Esc";
               break;
            case Keyboard.SPACE:
               _loc2_ = "└┘";
               break;
            case Keyboard.LEFT:
               _loc2_ = "←";
               break;
            case Keyboard.UP:
               _loc2_ = "↑";
               break;
            case Keyboard.RIGHT:
               _loc2_ = "→";
               break;
            case Keyboard.DOWN:
               _loc2_ = "↓";
               break;
            default:
               _loc2_ = String.fromCharCode(param1);
         }
         return _loc2_;
      }
   }
}

