package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import flash.display.BitmapData;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-R2m§;
   import game.mainGame.entity.§_-f2A§;
   
   public class §_-2R§ extends GameBody implements §_-R2m§, §_-21e§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.2,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-T2h§:Number = 65 / Game.§_-x2P§;
      
      private static const §_-LB§:uint = 30 / Game.§_-x2P§;
      
      private static const §_-U2D§:Number = 300 / Game.§_-x2P§;
      
      private static const §_-u2I§:Array = [[0,0]];
      
      private var §_-s1Y§:b2Vec2 = new b2Vec2(§_-T2h§,§_-T2h§);
      
      private var view:§_-h2I§ = null;
      
      private var bitmapData:BitmapData = null;
      
      public var density:Number = 1;
      
      public function §_-2R§()
      {
         super();
         this.view = new §_-h2I§(new WheelImg());
         §_-83v§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         var _loc2_:b2CircleShape = new b2CircleShape(this.size.x * 0.5);
         §_-03A§.shape = _loc2_;
         §_-03A§.density = this.density;
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([[this.size.x,this.size.y],this.density]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.size = new b2Vec2(param1[1][0][0],param1[1][0][1]);
         this.density = param1[1][1];
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-s1Y§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = param1.y = Math.max(Math.min(Math.max(param1.x,param1.y),§_-U2D§),§_-LB§);
         this.§_-s1Y§ = param1;
         this.view.scaleX = this.size.x / §_-T2h§;
         this.view.scaleY = this.size.y / §_-T2h§;
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.removeFromParent();
         if(!this.bitmapData)
         {
            return;
         }
         this.bitmapData.dispose();
         this.bitmapData = null;
      }
   }
}

