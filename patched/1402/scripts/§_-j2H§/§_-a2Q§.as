package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-w1u§;
   import utils.§_-11I§;
   
   public class §_-a2Q§ extends GameBody implements §_-41O§, §_-w1u§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,500,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-B1r§:uint = 50 / Game.§_-12A§;
      
      private static const §_-731§:uint = 500 / Game.§_-12A§;
      
      protected static const §_-V2H§:uint = 300 / Game.§_-12A§;
      
      private var §_-y1d§:b2Vec2 = new b2Vec2(§_-V2H§,§_-V2H§);
      
      private var view:§_-aS§ = new §_-aS§();
      
      private var §_-Ru§:b2FixtureDef;
      
      private var §_-H2y§:Number;
      
      private var §_-kb§:Number;
      
      private var bitmapData:BitmapData = null;
      
      private var §_-vC§:§_-aS§;
      
      public function §_-a2Q§(param1:DisplayObject = null, param2:b2FixtureDef = null, param3:Number = NaN, param4:Number = NaN)
      {
         super();
         if(param1 == null)
         {
            this.§_-vC§ = new §_-aS§(new MountView());
         }
         else
         {
            this.§_-vC§ = new §_-aS§(param1);
         }
         this.§_-Ru§ = param2 ? param2 : §_-ql§;
         this.§_-H2y§ = !isNaN(param3) ? param3 : §_-V2H§;
         this.§_-kb§ = !isNaN(param4) ? param4 : §_-V2H§;
         this.§_-y1d§ = new b2Vec2(this.§_-H2y§,this.§_-kb§);
         §_-J2J§(this.§_-vC§);
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
         var _loc6_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(-this.§_-y1d§.x * 0.5,this.§_-y1d§.y * 0.5));
         var _loc7_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(0,-this.§_-y1d§.y * 0.5));
         var _loc8_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(this.§_-y1d§.x * 0.5,this.§_-y1d§.y * 0.5));
         _loc6_.Multiply(Game.§_-12A§);
         _loc7_.Multiply(Game.§_-12A§);
         _loc8_.Multiply(Game.§_-12A§);
         if(this.hitTestPoint(_loc2_.x,_loc2_.y,true) || _loc6_.x > _loc2_.x && _loc6_.x < _loc4_.x && _loc6_.y > _loc2_.y && _loc6_.y < _loc3_.y)
         {
            return true;
         }
         return this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc6_.x,_loc6_
         .y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:Vector.<b2Vec2> = this.points;
         var _loc3_:b2PolygonShape = b2PolygonShape.AsVector(_loc2_,_loc2_.length);
         this.§_-Ru§.shape = _loc3_;
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.§_-Ru§);
         super.build(param1);
         this.rotation = rotation;
         this.ghost = ghost;
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
         if(GameBody.§_-W1F§(param1))
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
         return this.§_-y1d§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         this.§_-y1d§.x = Math.max(Math.min(§_-731§,param1.x),§_-B1r§);
         this.§_-y1d§.y = Math.max(Math.min(§_-731§,param1.y),§_-B1r§);
         this.§_-vC§.scaleX = this.size.x / this.§_-H2y§;
         this.§_-vC§.scaleY = this.size.y / this.§_-kb§;
      }
      
      protected function get points() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(0,-this.size.y * 0.5));
         _loc1_.push(new b2Vec2(this.size.x * 0.5,this.size.y * 0.5));
         _loc1_.push(new b2Vec2(-this.size.x * 0.5,this.size.y * 0.5));
         return _loc1_;
      }
      
      private function §_-hn§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
      }
   }
}

