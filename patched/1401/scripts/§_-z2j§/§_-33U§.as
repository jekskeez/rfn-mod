package §_-z2j§
{
   import §_-S2§.§_-5x§;
   
   public class §_-33U§ extends §_-5x§
   {
      
      public function §_-33U§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.hero.isHare;
      }
   }
}

