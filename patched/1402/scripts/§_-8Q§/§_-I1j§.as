package §_-8Q§
{
   import §_-WJ§.DetectHeroEvent;
   import flash.display.DisplayObject;
   
   public class §_-I1j§ extends §_-t20§
   {
      
      public function §_-I1j§()
      {
         super();
         this.type = Hero.§_-i1Y§;
      }
      
      override protected function get hollowIcon() : DisplayObject
      {
         return new HollowBlue();
      }
      
      override protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(param1.hero.team != this.type && param1.hero.team != Hero.§_-PM§)
         {
            return;
         }
         super.§_-M2L§(param1);
      }
   }
}

