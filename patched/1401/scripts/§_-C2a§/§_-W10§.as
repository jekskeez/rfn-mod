package §_-C2a§
{
   import §_-S2§.§_-5x§;
   
   public class §_-W10§ extends §_-5x§
   {
      
      public function §_-W10§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.hero.isDragon;
      }
   }
}

