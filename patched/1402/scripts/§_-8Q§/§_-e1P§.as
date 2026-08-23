package §_-8Q§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   import flash.events.Event;
   
   public class §_-e1P§ extends §_-7A§
   {
      
      private static const §_-C2O§:Number = 100;
      
      private static const §_-A2L§:Number = 60 / Game.§_-12A§;
      
      private var world:b2World;
      
      public var radius:Number = §_-A2L§;
      
      public var power:Number = 100;
      
      public var §_-ZD§:Boolean = true;
      
      public function §_-e1P§()
      {
         super();
         this.view = new §_-f1u§(new BombPrepere());
         this.view.loop = true;
         this.view.play();
         §_-J2J§(this.view);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:b2Vec2 = null;
         super.build(param1);
         this.world = param1;
         this.view.stop();
         this.view.removeFromParent();
         this.view = new §_-f1u§(new BombExplode());
         this.view.loop = false;
         this.view.play();
         this.view.addEventListener(Event.COMPLETE,this.§_-i2Q§);
         §_-J2J§(this.view);
         var _loc2_:b2Body = this.world.GetBodyList();
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.GetPosition().Copy();
            _loc3_.Subtract(this.position);
            if(!(_loc3_.Length() > this.radius || _loc3_.Length() == 0 || _loc2_.GetUserData() is Hero && (_loc2_.GetUserData() as Hero).shaman && !this.§_-ZD§))
            {
               _loc4_ = new b2Vec2(this.power * (_loc3_.x / _loc3_.Length()),this.power * (_loc3_.y / _loc3_.Length()));
               _loc2_.SetAwake(true);
               _loc2_.SetLinearVelocity(_loc4_);
            }
            _loc2_ = _loc2_.GetNext();
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.radius,this.power,this.§_-ZD§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.radius = param1[1][0];
         this.power = param1[1][1];
         this.§_-ZD§ = Boolean(param1[1][2]);
      }
      
      private function §_-i2Q§(param1:Event) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         this.view.removeEventListener(Event.COMPLETE,this.§_-i2Q§);
         if(§_-U2E§(this.view))
         {
            removeChildStarling(this.view);
         }
         this.view = null;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

