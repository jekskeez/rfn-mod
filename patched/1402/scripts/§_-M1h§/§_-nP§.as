package §_-M1h§
{
   import §_-8Q§.GameBody;
   import flash.events.TimerEvent;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-nP§ extends Cast
   {
      
      private static const §_-u10§:int = 25;
      
      public function §_-nP§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-G2O§ = §_-u10§;
         if(this.§_-kH§.parentStarling)
         {
            this.§_-kH§.removeFromParent();
         }
      }
      
      override protected function §_-Va§(param1:TimerEvent = null) : void
      {
         var _loc2_:Class = §_-f1b§.§_-N1m§(§_-f1b§.§_-q2W§(this.castObject));
         super.§_-Va§(param1);
         if(_loc2_ != null)
         {
            this.castObject = new _loc2_();
         }
      }
      
      override protected function §_-w2B§() : void
      {
         (this.castObject as GameBody).playerId = Hero.§_-M1O§;
         super.§_-w2B§();
      }
   }
}

