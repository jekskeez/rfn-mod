package §_-P2b§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import §_-RI§.§_-h2I§;
   
   public class §_-P5§ extends §_-H2N§
   {
      
      public static const §_-X2c§:Number = 900;
      
      public static const §_-O1a§:Number = 100;
      
      public static const §_-t2F§:Number = 500;
      
      public static const §_-S1p§:Number = 0.5;
      
      private var §_-m2J§:§_-h2I§ = null;
      
      private var §_-M14§:Number = 0;
      
      public function §_-P5§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "ironman";
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-M14§ <= 0)
         {
            return;
         }
         this.§_-M14§ -= param1;
         this.§_-m2J§.alpha = Math.max(0,this.§_-M14§ / §_-S1p§);
         if(this.§_-M14§ > 0)
         {
            return;
         }
         this.hero.game.map.removeChildStarling(this.§_-m2J§);
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§;
      }
      
      override protected function activate() : void
      {
         var _loc6_:b2Fixture = null;
         var _loc7_:b2Body = null;
         super.activate();
         var _loc1_:b2Vec2 = this.hero.position.Copy();
         var _loc2_:b2Vec2 = this.hero.§_-s1l§;
         _loc2_.Multiply(this.hero.heroView.direction ? -§_-X2c§ : §_-X2c§);
         _loc2_.Add(this.hero.§_-x2h§);
         _loc2_ = b2Math.AddVV(this.hero.position,_loc2_);
         var _loc3_:b2Vec2 = b2Math.SubtractVV(_loc2_,_loc1_);
         _loc3_.Normalize();
         _loc3_.Multiply(§_-O1a§);
         var _loc4_:b2Vec2 = b2Math.SubtractVV(_loc2_,_loc1_);
         _loc4_.Normalize();
         _loc4_.Multiply(§_-t2F§);
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
         this.§_-m2J§ = new §_-h2I§(new Beam());
         this.§_-m2J§.mouseEnabled = false;
         this.§_-m2J§.mouseChildren = false;
         this.§_-m2J§.scaleX = Game.starling.stage.stageWidth / this.§_-m2J§.width;
         this.§_-m2J§.x = this.hero.x + (this.hero.heroView.direction ? -§_-X2c§ : 0);
         this.§_-m2J§.y = this.hero.y;
         this.§_-m2J§.alpha = 1;
         this.§_-M14§ = §_-S1p§;
         this.hero.game.map.§_-83v§(this.§_-m2J§);
      }
   }
}

