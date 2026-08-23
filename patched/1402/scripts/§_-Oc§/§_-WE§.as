package §_-Oc§
{
   import §_-n1h§.§_-C21§;
   
   public class §_-WE§ extends §_-C21§
   {
      
      public function §_-WE§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.hero.isHare;
      }
   }
}

