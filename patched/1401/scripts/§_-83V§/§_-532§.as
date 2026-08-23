package §_-83V§
{
   import §_-R1w§.DetectHeroEvent;
   import flash.display.DisplayObject;
   
   public class §_-532§ extends §_-Q1J§
   {
      
      public function §_-532§()
      {
         super();
         this.type = Hero.§_-17§;
      }
      
      override protected function get hollowIcon() : DisplayObject
      {
         return new HollowRed();
      }
      
      override protected function §_-5d§(param1:DetectHeroEvent) : void
      {
         if(param1.hero.team != this.type && param1.hero.team != Hero.§_-JL§)
         {
            return;
         }
         super.§_-5d§(param1);
      }
   }
}

