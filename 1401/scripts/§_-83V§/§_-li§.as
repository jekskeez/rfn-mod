package §_-83V§
{
   import §_-I10§.§_-vy§;
   import §_-R1w§.DetectHeroEvent;
   import §_-T2y§.§_-w17§;
   import flash.events.Event;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-li§ extends §_-r1o§
   {
      
      public function §_-li§()
      {
         super(§_-vy§.§_-z2p§(0));
         this.view.play();
      }
      
      override protected function §_-5d§(param1:DetectHeroEvent) : void
      {
         if(param1.hero.id != Game.selfId)
         {
            return;
         }
         var _loc2_:int = Math.random() * §_-43Z§.§_-K1K§.length;
         GameSounds.play(§_-43Z§.§_-K1K§[_loc2_]);
         dispatchEvent(new Event(§_-w17§.EVENT_COLLECT));
         §_-b16§();
      }
   }
}

