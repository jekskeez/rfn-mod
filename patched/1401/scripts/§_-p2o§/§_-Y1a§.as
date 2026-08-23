package §_-p2o§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2TimeStep;
   import §_-42p§.§_-01t§;
   import §_-42p§.§_-Mq§;
   import §_-83V§.GameBody;
   import §_-83V§.§_-12R§;
   import §_-I10§.§_-g2W§;
   import §_-P2b§.§_-6L§;
   import §_-u2r§.§_-mo§;
   import game.mainGame.§_-w2F§;
   
   public class §_-Y1a§ extends §_-Mq§
   {
      
      public var viscosity:Number = 1.4;
      
      public function §_-Y1a§(param1:§_-01t§)
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
         var _loc20_:§_-12R§ = null;
         var _loc21_:§_-mo§ = null;
         if(!param1)
         {
         }
         if(!this.§_-42G§)
         {
            return;
         }
         for each(_loc2_ in §_-w2F§.§_-O2v§)
         {
            _loc3_ = _loc2_;
            _loc4_ = _loc3_.GetUserData();
            if(_loc3_.IsAwake())
            {
               if(!(_loc4_ is GameBody && (_loc4_ as GameBody).fixed))
               {
                  _loc5_ = this.§_-42G§.§_-V1z§(_loc3_.GetPosition().x,_loc3_.GetPosition().y);
                  if(_loc5_[2])
                  {
                     _loc6_ = _loc3_.GetFixtureList();
                     if(_loc6_)
                     {
                        _loc7_ = _loc5_[0];
                        _loc8_ = Number(_loc5_[1]);
                        _loc9_ = this.§_-O2v§[_loc3_] != null;
                        _loc10_ = new b2Vec2();
                        _loc11_ = new b2Vec2();
                        _loc12_ = 0;
                        _loc13_ = 0;
                        _loc14_ = new b2Vec2();
                        _loc15_ = Number(_loc6_.GetShape().ComputeSubmergedArea(_loc7_,_loc8_,_loc3_.GetTransform(),_loc14_));
                        _loc12_ += _loc15_;
                        _loc10_.x += _loc15_ * _loc14_.x;
                        _loc10_.y += _loc15_ * _loc14_.y;
                        _loc16_ = this.§_-HF§ ? Number(_loc6_.GetDensity()) : 1;
                        _loc13_ += _loc15_ * _loc16_;
                        _loc11_.x += _loc15_ * _loc14_.x * _loc16_;
                        _loc11_.y += _loc15_ * _loc14_.y * _loc16_;
                        _loc10_.x /= _loc12_;
                        _loc10_.y /= _loc12_;
                        _loc11_.x /= _loc13_;
                        _loc11_.y /= _loc13_;
                        if(_loc12_ < Number.MIN_VALUE)
                        {
                           this.§_-O2v§[_loc3_] = false;
                        }
                        else
                        {
                           this.§_-O2v§[_loc3_] = true;
                           if(_loc4_ is §_-12R§)
                           {
                              _loc20_ = _loc4_ as §_-12R§;
                              if(_loc12_ >= Number.MIN_VALUE && this.§_-42G§.allowSwim)
                              {
                                 _loc20_.§_-b16§();
                              }
                           }
                           else if(_loc4_ is §_-mo§)
                           {
                              _loc21_ = _loc4_ as §_-mo§;
                              if(_loc12_ >= Number.MIN_VALUE && this.§_-42G§.allowSwim)
                              {
                                 _loc21_.§_-b16§();
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
                                 _loc17_.§_-o1T§ = _loc12_ >= Number.MIN_VALUE && this.§_-42G§.allowSwim;
                                 if(_loc17_.§_-G5§ && _loc17_.§_-o1T§ && (_loc17_.player["worn_packages"] as Array).indexOf(§_-g2W§.§_-bo§) < 0)
                                 {
                                    _loc17_.§_-t25§(false);
                                 }
                                 if(Boolean(_loc17_.§_-o1T§) && Boolean((this.§_-42G§ as §_-m2F§).§_-D1a§) && _loc17_.y + Hero.§_-YH§ >= (this.§_-42G§ as §_-m2F§).§_-D1a§)
                                 {
                                    _loc17_.§_-L1A§ = Hero.§_-T1s§;
                                    _loc17_.§_-h2r§();
                                    continue;
                                 }
                              }
                              if(!_loc9_)
                              {
                                 this.§_-42G§.§_-UF§(_loc3_.GetPosition(),_loc3_.GetLinearVelocity());
                              }
                              _loc18_ = (_loc17_ && _loc17_.up && _loc17_.isSquirrel) as Boolean;
                              _loc18_ &&= _loc17_.perkController.§_-e4§(§_-6L§.§_-61p§) != -1;
                              _loc3_.SetLinearVelocity(new b2Vec2(_loc3_.GetLinearVelocity().x / this.§_-z2S§,_loc18_ ? -5 : 1 / this.viscosity));
                              _loc19_ = GetWorld().GetGravity().Copy();
                              _loc19_.Multiply(_loc3_.GetMass());
                              _loc19_.NegativeSelf();
                              _loc3_.ApplyForce(_loc19_,_loc10_);
                              _loc3_.SetAngularVelocity(_loc3_.GetAngularVelocity() / this.§_-B1Y§);
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

