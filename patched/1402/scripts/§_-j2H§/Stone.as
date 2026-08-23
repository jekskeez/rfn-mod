package §_-j2H§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import flash.display.BitmapData;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import game.mainGame.entity.§_-w1u§;
   
   public class Stone extends GameBody implements §_-41O§, §_-e2t§, §_-w1u§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,3,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-U2y§:uint = 10 / Game.§_-12A§;
      
      private static const §_-dx§:uint = 300 / Game.§_-12A§;
      
      private static const §_-V2H§:Number = 45 / Game.§_-12A§;
      
      private static const §_-t2E§:Array = [[0,0]];
      
      private var §_-y1d§:b2Vec2 = new b2Vec2(§_-V2H§,§_-V2H§);
      
      private var view:§_-aS§ = new §_-aS§(new StoneView());
      
      private var bitmapData:BitmapData = null;
      
      public function Stone()
      {
         super();
         §_-J2J§(this.view);
      }
      
      public function get landSound() : String
      {
         return "belka_land";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         var _loc2_:b2CircleShape = new b2CircleShape(this.size.x * 0.5);
         §_-ql§.shape = _loc2_;
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([[this.size.x,this.size.y]]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:int = GameBody.§_-W1F§(param1) ? 3 : 1;
         this.size = new b2Vec2(param1[_loc2_][0][0],param1[_loc2_][0][1]);
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-y1d§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = param1.y = Math.max(Math.min(Math.max(param1.x,param1.y),§_-dx§),§_-U2y§);
         this.§_-y1d§ = param1;
         this.view.scaleX = this.size.x / §_-V2H§;
         this.view.scaleY = this.size.y / §_-V2H§;
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.bitmapData)
         {
            return;
         }
         this.bitmapData.dispose();
         this.bitmapData = null;
         this.removeFromParent();
      }
   }
}

