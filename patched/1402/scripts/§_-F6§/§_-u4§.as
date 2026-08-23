package §_-F6§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2TimeStep;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-A1d§;
   import §_-A3j§.§_-31T§;
   import §_-A3j§.§_-b1N§;
   import §_-I1q§.§_-N2K§;
   import §_-X1k§.§_-P2x§;
   import §_-j2E§.§_-A11§;
   import game.mainGame.§_-n2T§;
   
   public class §_-u4§ extends §_-31T§
   {
      
      public var viscosity:Number = 1.4;
      
      public function §_-u4§(param1:§_-b1N§)
      {
         super(param1);
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         var _loc2_:b2Body = null;
         var _loc3_:b2Body = null;
         var _loc4_:* = undefined;
         var _loc5_:Array = null;
         var _loc6_:b2Fixture = null;
         var _loc7_:b2Vec2 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Boolean = false;
         var _loc10_:b2Vec2 = null;
         var _loc11_:b2Vec2 = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:b2Vec2 = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Hero = null;
         var _loc18_:Boolean = false;
         var _loc19_:b2Vec2 = null;
         var _loc20_:§_-A1d§ = null;
         var _loc21_:§_-N2K§ = null;
         if(!param1)
         {
         }
         if(!this.§_-D1X§)
         {
            return;
         }
         for each(_loc2_ in §_-n2T§.§_-Y1B§)
         {
            _loc3_ = _loc2_;
            _loc4_ = _loc3_.GetUserData();
            if(_loc3_.IsAwake())
            {
               if(!(_loc4_ is GameBody && (_loc4_ as GameBody).fixed))
               {
                  _loc5_ = this.§_-D1X§.§_-r2c§(_loc3_.GetPosition().x,_loc3_.GetPosition().y);
                  if(_loc5_[2])
                  {
                     _loc6_ = _loc3_.GetFixtureList();
                     if(_loc6_)
                     {
                        _loc7_ = _loc5_[0];
                        _loc8_ = Number(_loc5_[1]);
                        _loc9_ = this.§_-Y1B§[_loc3_] != null;
                        _loc10_ = new b2Vec2();
                        _loc11_ = new b2Vec2();
                        _loc12_ = 0;
                        _loc13_ = 0;
                        _loc14_ = new b2Vec2();
                        _loc15_ = Number(_loc6_.GetShape().ComputeSubmergedArea(_loc7_,_loc8_,_loc3_.GetTransform(),_loc14_));
                        _loc12_ += _loc15_;
                        _loc10_.x += _loc15_ * _loc14_.x;
                        _loc10_.y += _loc15_ * _loc14_.y;
                        _loc16_ = this.§_-o24§ ? Number(_loc6_.GetDensity()) : 1;
                        _loc13_ += _loc15_ * _loc16_;
                        _loc11_.x += _loc15_ * _loc14_.x * _loc16_;
                        _loc11_.y += _loc15_ * _loc14_.y * _loc16_;
                        _loc10_.x /= _loc12_;
                        _loc10_.y /= _loc12_;
                        _loc11_.x /= _loc13_;
                        _loc11_.y /= _loc13_;
                        if(_loc12_ < Number.MIN_VALUE)
                        {
                           this.§_-Y1B§[_loc3_] = false;
                        }
                        else
                        {
                           this.§_-Y1B§[_loc3_] = true;
                           if(_loc4_ is §_-A1d§)
                           {
                              _loc20_ = _loc4_ as §_-A1d§;
                              if(_loc12_ >= Number.MIN_VALUE && this.§_-D1X§.allowSwim)
                              {
                                 _loc20_.§_-th§();
                              }
                           }
                           else if(_loc4_ is §_-N2K§)
                           {
                              _loc21_ = _loc4_ as §_-N2K§;
                              if(_loc12_ >= Number.MIN_VALUE && this.§_-D1X§.allowSwim)
                              {
                                 _loc21_.§_-th§();
                              }
                           }
                           else
                           {
                              _loc17_ = _loc4_ as Hero;
                              if(_loc4_ is Hero && !_loc17_.isDead && !_loc17_.inHollow)
                              {
                                 if(_loc17_.ghost)
                                 {
                                    continue;
                                 }
                                 _loc17_.§_-I2V§ = _loc12_ >= Number.MIN_VALUE && this.§_-D1X§.allowSwim;
                                 if(_loc17_.§_-a1w§ && _loc17_.§_-I2V§ && (_loc17_.player["worn_packages"] as Array).indexOf(§_-P2x§.§_-FC§) < 0)
                                 {
                                    _loc17_.§_-X1O§(false);
                                 }
                                 if(Boolean(_loc17_.§_-I2V§) && Boolean((this.§_-D1X§ as §_-v2T§).§_-k2d§) && _loc17_.y + Hero.§_-a1A§ >= (this.§_-D1X§ as §_-v2T§).§_-k2d§)
                                 {
                                    _loc17_.§_-b2d§ = Hero.§_-P1u§;
                                    _loc17_.§_-kl§();
                                    continue;
                                 }
                              }
                              if(!_loc9_)
                              {
                                 this.§_-D1X§.§_-uS§(_loc3_.GetPosition(),_loc3_.GetLinearVelocity());
                              }
                              _loc18_ = (_loc17_ && _loc17_.up && _loc17_.isSquirrel) as Boolean;
                              _loc18_ &&= _loc17_.perkController.§_-S1Q§(§_-A11§.§_-u11§) != -1;
                              _loc3_.SetLinearVelocity(new b2Vec2(_loc3_.GetLinearVelocity().x / this.§_-E2a§,_loc18_ ? -5 : 1 / this.viscosity));
                              _loc19_ = GetWorld().GetGravity().Copy();
                              _loc19_.Multiply(_loc3_.GetMass());
                              _loc19_.NegativeSelf();
                              _loc3_.ApplyForce(_loc19_,_loc10_);
                              _loc3_.SetAngularVelocity(_loc3_.GetAngularVelocity() / this.§_-zT§);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

