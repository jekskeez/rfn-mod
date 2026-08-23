package §_-83V§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   
   public class §_-co§ extends §_-e2B§
   {
      
      private static const §_-O1a§:Number = 100;
      
      private static const §_-c1F§:Number = 60 / Game.§_-x2P§;
      
      private var world:b2World;
      
      public var radius:Number = §_-c1F§;
      
      public var power:Number = 100;
      
      public var §_-838§:Boolean = true;
      
      public function §_-co§()
      {
         super();
         this.view = new §_-d2d§(new BombPrepere());
         this.view.loop = true;
         this.view.play();
         §_-83v§(this.view);
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
         this.view = new §_-d2d§(new BombExplode());
         this.view.loop = false;
         this.view.play();
         this.view.addEventListener(Event.COMPLETE,this.§_-a1U§);
         §_-83v§(this.view);
         var _loc2_:b2Body = this.world.GetBodyList();
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.GetPosition().Copy();
            _loc3_.Subtract(this.position);
            if(!(_loc3_.Length() > this.radius || _loc3_.Length() == 0 || _loc2_.GetUserData() is Hero && (_loc2_.GetUserData() as Hero).shaman && !this.§_-838§))
            {
               _loc4_ = new b2Vec2(this.power * (_loc3_.x / _loc3_.Length()),this.power * (_loc3_.y / _loc3_.Length()));
               _loc2_.SetAwake(true);
               _loc2_.SetLinearVelocity(_loc4_);
            }
            _loc2_ = _loc2_.GetNext();
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.radius,this.power,this.§_-838§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.radius = param1[1][0];
         this.power = param1[1][1];
         this.§_-838§ = Boolean(param1[1][2]);
      }
      
      private function §_-a1U§(param1:Event) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         this.view.removeEventListener(Event.COMPLETE,this.§_-a1U§);
         if(§_-ws§(this.view))
         {
            removeChildStarling(this.view);
         }
         this.view = null;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

