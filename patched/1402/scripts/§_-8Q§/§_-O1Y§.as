package §_-8Q§
{
   import §_-WJ§.DetectHeroEvent;
   import flash.display.DisplayObject;
   
   public class §_-O1Y§ extends §_-t20§
   {
      
      public function §_-O1Y§()
      {
         super();
         this.type = Hero.§_-l1B§;
      }
      
      override protected function get hollowIcon() : DisplayObject
      {
         return new HollowRed();
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

