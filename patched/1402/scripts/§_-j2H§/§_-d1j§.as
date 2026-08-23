package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-X2V§.SquirrelEvent;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.entity.§_-p1Z§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-d1j§ extends §_-aS§ implements §_-xn§, §_-3l§, §_-l2r§, §_-F1c§, §_-p1Z§, §_-Q2d§
   {
      
      private static const SIZE:Number = 4;
      
      private var §_-21H§:SquirrelGame = null;
      
      private var §_-7J§:Boolean = true;
      
      public function §_-d1j§()
      {
         super();
         §_-J2J§(new §_-aS§(new RespawnPointView()));
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.visible = param1;
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      public function build(param1:b2World) : void
      {
         this.visible = false;
         this.§_-21H§ = param1.userData as SquirrelGame;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-7J§ || !Hero.self)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position;
         _loc2_.Subtract(Hero.self.position);
         if(_loc2_.Length() >= SIZE)
         {
            return;
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-L5§,Hero.self));
         this.§_-7J§ = false;
      }
      
      public function §_-m1Y§() : *
      {
         return [this.position.x,this.position.y];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0],param1[1]);
      }
      
      public function dispose() : void
      {
         if(this.parentStarling == null)
         {
            return;
         }
         this.parentStarling.removeChildStarling(this);
         this.removeFromParent(true);
      }
   }
}

