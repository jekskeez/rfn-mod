package tape
{
   import §_-r2Y§.§_-33e§;
   import flash.display.Sprite;
   
   public class §_-K2k§ extends Sprite
   {
      
      public function §_-K2k§()
      {
         super();
      }
      
      public function get loaded() : Boolean
      {
         return true;
      }
      
      public function §_-027§() : void
      {
      }
      
      public function listen(param1:Function) : void
      {
         addEventListener(§_-33e§.CHANGED,param1);
      }
      
      public function forget(param1:Function) : void
      {
         removeEventListener(§_-33e§.CHANGED,param1);
      }
   }
}

