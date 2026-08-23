package views
{
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-F1Z§;
   import flash.events.MouseEvent;
   
   public class §_-q2a§ extends §_-NG§
   {
      
      public function §_-q2a§()
      {
         super();
      }
      
      override protected function buy(param1:MouseEvent) : void
      {
         super.buy(param1);
         §_-F1Z§.buy(this.value);
      }
      
      override protected function §_-J2d§(param1:int) : int
      {
         return §_-93H§.§_-z1K§(param1);
      }
      
      override protected function get names() : Array
      {
         return [gls("1д."),gls("7д."),gls("30д.")];
      }
      
      override protected function get discounts() : Array
      {
         return [0,20,33];
      }
   }
}

