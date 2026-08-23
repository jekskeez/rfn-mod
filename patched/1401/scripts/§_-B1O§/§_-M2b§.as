package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-o1s§;
   
   public class §_-M2b§ extends §_-h2I§ implements §_-63Q§, §_-03u§, §_-C2x§, §_-Tm§, §_-o1s§, §_-8B§
   {
      
      private static const SIZE:Number = 4;
      
      private var §_-H2D§:SquirrelGame = null;
      
      private var §_-E1S§:Boolean = true;
      
      public function §_-M2b§()
      {
         super();
         §_-83v§(new §_-h2I§(new RespawnPointView()));
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
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
         this.§_-H2D§ = param1.userData as SquirrelGame;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-E1S§ || !Hero.self)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position;
         _loc2_.Subtract(Hero.self.position);
         if(_loc2_.Length() >= SIZE)
         {
            return;
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-8E§,Hero.self));
         this.§_-E1S§ = false;
      }
      
      public function §_-A1X§() : *
      {
         return [this.position.x,this.position.y];
      }
      
      public function §_-41M§(param1:*) : void
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

