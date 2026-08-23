package §_-8Q§
{
   import §_-WJ§.DetectHeroEvent;
   import §_-X1k§.§_-42H§;
   import §_-c2C§.§_-fx§;
   import flash.events.Event;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-i2W§ extends §_-r2M§
   {
      
      public function §_-i2W§()
      {
         super(§_-42H§.§_-D1U§(0));
         this.view.play();
      }
      
      override protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(param1.hero.id != Game.selfId)
         {
            return;
         }
         var _loc2_:int = Math.random() * §_-RH§.§_-R22§.length;
         GameSounds.play(§_-RH§.§_-R22§[_loc2_]);
         dispatchEvent(new Event(§_-fx§.EVENT_COLLECT));
         §_-th§();
      }
   }
}

