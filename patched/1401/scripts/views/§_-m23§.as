package views
{
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-Br§;
   import flash.events.MouseEvent;
   
   public class §_-m23§ extends §_-x13§
   {
      
      public function §_-m23§()
      {
         super();
      }
      
      override protected function buy(param1:MouseEvent) : void
      {
         super.buy(param1);
         §_-Br§.buy(this.value);
      }
      
      override protected function §_-G2v§(param1:int) : int
      {
         return §_-8S§.§_-7h§(param1);
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

