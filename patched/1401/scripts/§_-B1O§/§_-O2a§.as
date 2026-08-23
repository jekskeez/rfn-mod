package §_-B1O§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-R2m§;
   import game.mainGame.entity.§_-YY§;
   import utils.§_-41A§;
   
   public class §_-O2a§ extends GameBody implements §_-R2m§, §_-YY§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,500,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-LB§:uint = 50 / Game.§_-x2P§;
      
      private static const §_-U2D§:uint = 500 / Game.§_-x2P§;
      
      protected static const §_-T2h§:uint = 300 / Game.§_-x2P§;
      
      private var §_-s1Y§:b2Vec2 = new b2Vec2(§_-T2h§,§_-T2h§);
      
      private var view:§_-h2I§ = new §_-h2I§();
      
      private var §_-T2u§:b2FixtureDef;
      
      private var §_-xM§:Number;
      
      private var §_-P2a§:Number;
      
      private var bitmapData:BitmapData = null;
      
      private var §_-x1X§:§_-h2I§;
      
      public function §_-O2a§(param1:DisplayObject = null, param2:b2FixtureDef = null, param3:Number = NaN, param4:Number = NaN)
      {
         super();
         if(param1 == null)
         {
            this.§_-x1X§ = new §_-h2I§(new MountView());
         }
         else
         {
            this.§_-x1X§ = new §_-h2I§(param1);
         }
         this.§_-T2u§ = param2 ? param2 : §_-03A§;
         this.§_-xM§ = !isNaN(param3) ? param3 : §_-T2h§;
         this.§_-P2a§ = !isNaN(param4) ? param4 : §_-T2h§;
         this.§_-s1Y§ = new b2Vec2(this.§_-xM§,this.§_-P2a§);
         §_-83v§(this.§_-x1X§);
         this.fixed = true;
      }
      
      public function get landSound() : String
      {
         return "belka_land";
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
      }
      
      override public function hitTestObject(param1:DisplayObject) : Boolean
      {
         var _loc2_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y);
         var _loc3_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y + param1.height);
         var _loc4_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y);
         var _loc5_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y + param1.height);
         var _loc6_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(-this.§_-s1Y§.x * 0.5,this.§_-s1Y§.y * 0.5));
         var _loc7_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(0,-this.§_-s1Y§.y * 0.5));
         var _loc8_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(this.§_-s1Y§.x * 0.5,this.§_-s1Y§.y * 0.5));
         _loc6_.Multiply(Game.§_-x2P§);
         _loc7_.Multiply(Game.§_-x2P§);
         _loc8_.Multiply(Game.§_-x2P§);
         if(this.hitTestPoint(_loc2_.x,_loc2_.y,true) || _loc6_.x > _loc2_.x && _loc6_.x < _loc4_.x && _loc6_.y > _loc2_.y && _loc6_.y < _loc3_.y)
         {
            return true;
         }
         return this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc6_
         .x,_loc6_.y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:Vector.<b2Vec2> = this.points;
         var _loc3_:b2PolygonShape = b2PolygonShape.AsVector(_loc2_,_loc2_.length);
         this.§_-T2u§.shape = _loc3_;
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.§_-T2u§);
         super.build(param1);
         this.rotation = rotation;
         this.ghost = ghost;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([[this.size.x,this.size.y]]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(GameBody.§_-u1P§(param1))
         {
            this.size = new b2Vec2(param1[3][0],param1[3][1]);
         }
         else
         {
            this.size = new b2Vec2(param1[1][0][0],param1[1][0][1]);
         }
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-s1Y§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         this.§_-s1Y§.x = Math.max(Math.min(§_-U2D§,param1.x),§_-LB§);
         this.§_-s1Y§.y = Math.max(Math.min(§_-U2D§,param1.y),§_-LB§);
         this.§_-x1X§.scaleX = this.size.x / this.§_-xM§;
         this.§_-x1X§.scaleY = this.size.y / this.§_-P2a§;
      }
      
      protected function get points() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(0,-this.size.y * 0.5));
         _loc1_.push(new b2Vec2(this.size.x * 0.5,this.size.y * 0.5));
         _loc1_.push(new b2Vec2(-this.size.x * 0.5,this.size.y * 0.5));
         return _loc1_;
      }
      
      private function §_-e2n§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
      }
   }
}

