package §_-X1g§
{
   import §_-n1h§.§_-C21§;
   
   public class §_-M8§ extends §_-C21§
   {
      
      public function §_-M8§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.hero.isDragon;
      }
   }
}

