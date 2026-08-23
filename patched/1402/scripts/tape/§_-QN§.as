package tape
{
   import §_-a11§.§_-h2m§;
   import flash.display.Sprite;
   
   public class §_-QN§ extends Sprite
   {
      
      public function §_-QN§()
      {
         super();
      }
      
      public function get loaded() : Boolean
      {
         return true;
      }
      
      public function §_-O1s§() : void
      {
      }
      
      public function listen(param1:Function) : void
      {
         addEventListener(§_-h2m§.CHANGED,param1);
      }
      
      public function forget(param1:Function) : void
      {
         removeEventListener(§_-h2m§.CHANGED,param1);
      }
   }
}

