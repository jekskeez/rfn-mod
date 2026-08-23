package §_-j2E§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import §_-TK§.§_-aS§;
   
   public class §_-gJ§ extends §_-92f§
   {
      
      public static const §_-hM§:Number = 900;
      
      public static const §_-C2O§:Number = 100;
      
      public static const §_-G26§:Number = 500;
      
      public static const §_-c2M§:Number = 0.5;
      
      private var §_-w1N§:§_-aS§ = null;
      
      private var §_-V1k§:Number = 0;
      
      public function §_-gJ§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "ironman";
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-V1k§ <= 0)
         {
            return;
         }
         this.§_-V1k§ -= param1;
         this.§_-w1N§.alpha = Math.max(0,this.§_-V1k§ / §_-c2M§);
         if(this.§_-V1k§ > 0)
         {
            return;
         }
         this.hero.game.map.removeChildStarling(this.§_-w1N§);
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override protected function activate() : void
      {
         var _loc6_:b2Fixture = null;
         var _loc7_:b2Body = null;
         super.activate();
         var _loc1_:b2Vec2 = this.hero.position.Copy();
         var _loc2_:b2Vec2 = this.hero.§_-11E§;
         _loc2_.Multiply(this.hero.heroView.direction ? -§_-hM§ : §_-hM§);
         _loc2_.Add(this.hero.§_-d2u§);
         _loc2_ = b2Math.AddVV(this.hero.position,_loc2_);
         var _loc3_:b2Vec2 = b2Math.SubtractVV(_loc2_,_loc1_);
         _loc3_.Normalize();
         _loc3_.Multiply(§_-C2O§);
         var _loc4_:b2Vec2 = b2Math.SubtractVV(_loc2_,_loc1_);
         _loc4_.Normalize();
         _loc4_.Multiply(§_-G26§);
         var _loc5_:Vector.<b2Fixture> = this.hero.game.world.RayCastAll(_loc1_,_loc2_);
         for each(_loc6_ in _loc5_)
         {
            _loc7_ = _loc6_.GetBody();
            if(_loc7_.GetUserData() != this.hero)
            {
               if(_loc7_.GetUserData() is Hero)
               {
                  _loc7_.ApplyImpulse(_loc3_,_loc7_.GetWorldCenter());
               }
               else
               {
                  _loc7_.ApplyImpulse(_loc4_,_loc7_.GetWorldCenter());
               }
            }
         }
         this.§_-w1N§ = new §_-aS§(new Beam());
         this.§_-w1N§.mouseEnabled = false;
         this.§_-w1N§.mouseChildren = false;
         this.§_-w1N§.scaleX = Game.starling.stage.stageWidth / this.§_-w1N§.width;
         this.§_-w1N§.x = this.hero.x + (this.hero.heroView.direction ? -§_-hM§ : 0);
         this.§_-w1N§.y = this.hero.y;
         this.§_-w1N§.alpha = 1;
         this.§_-V1k§ = §_-c2M§;
         this.hero.game.map.§_-J2J§(this.§_-w1N§);
      }
   }
}

