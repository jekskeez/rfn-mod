package §_-D2k§
{
   import §_-83V§.GameBody;
   import flash.events.TimerEvent;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-K1R§ extends Cast
   {
      
      private static const §_-W2E§:int = 25;
      
      public function §_-K1R§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-JG§ = §_-W2E§;
         if(this.§_-n1Q§.parentStarling)
         {
            this.§_-n1Q§.removeFromParent();
         }
      }
      
      override protected function §_-23§(param1:TimerEvent = null) : void
      {
         var _loc2_:Class = §_-03s§.§_-F1T§(§_-03s§.§_-X21§(this.castObject));
         super.§_-23§(param1);
         if(_loc2_ != null)
         {
            this.castObject = new _loc2_();
         }
      }
      
      override protected function §_-Hw§() : void
      {
         (this.castObject as GameBody).playerId = Hero.§_-74§;
         super.§_-Hw§();
      }
   }
}

