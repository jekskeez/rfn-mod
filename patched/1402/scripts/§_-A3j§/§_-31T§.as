package §_-A3j§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2TimeStep;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-A1d§;
   import §_-I1q§.§_-B3§;
   import §_-I1q§.§_-N2K§;
   import §_-X1k§.§_-P2x§;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import game.mainGame.§_-n2T§;
   import sounds.GameSounds;
   
   public class §_-31T§ extends b2Controller
   {
      
      public var §_-91l§:Boolean = false;
      
      public var §_-D1X§:§_-b1N§;
      
      public var density:Number = 1;
      
      public var velocity:b2Vec2 = new b2Vec2(0,0);
      
      public var §_-E2a§:Number = 2;
      
      public var §_-zT§:Number = 1;
      
      public var §_-o24§:Boolean = true;
      
      public var §_-J2o§:Boolean = true;
      
      public var gravity:b2Vec2 = new b2Vec2();
      
      public var §_-H1W§:int = 0;
      
      protected var §_-Y1B§:Dictionary = new Dictionary(false);
      
      public function §_-31T§(param1:§_-b1N§)
      {
         super();
         this.§_-D1X§ = param1;
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         var _loc2_:b2Body = null;
         var _loc3_:b2Body = null;
         var _loc4_:* = undefined;
         var _loc5_:Boolean = false;
         var _loc6_:Array = null;
         var _loc7_:b2Fixture = null;
         var _loc8_:b2Vec2 = null;
         var _loc9_:Number = NaN;
         var _loc10_:Boolean = false;
         var _loc11_:b2Vec2 = null;
         var _loc12_:b2Vec2 = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:b2Vec2 = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:b2Vec2 = null;
         var _loc20_:b2Vec2 = null;
         var _loc21_:Hero = null;
         var _loc22_:b2Vec2 = null;
         var _loc23_:§_-A1d§ = null;
         var _loc24_:§_-N2K§ = null;
         var _loc25_:Number = NaN;
         if(!param1)
         {
         }
         if(this.§_-J2o§)
         {
            this.gravity = GetWorld().GetGravity().Copy();
         }
         if(!this.§_-D1X§)
         {
            return;
         }
         for each(_loc2_ in §_-n2T§.§_-Y1B§)
         {
            _loc3_ = _loc2_;
            if(_loc3_.IsAwake())
            {
               _loc4_ = _loc3_.GetUserData();
               if(!(_loc4_ is GameBody && (_loc4_ as GameBody).fixed))
               {
                  _loc5_ = _loc4_ is Hero;
                  _loc6_ = this.§_-D1X§.§_-r2c§(_loc3_.GetPosition().x,_loc3_.GetPosition().y);
                  if(!_loc6_[2])
                  {
                     _loc21_ = _loc4_ as Hero;
                     if(_loc5_ && _loc21_.id == Game.selfId)
                     {
                        _loc21_.§_-xS§ = false;
                     }
                  }
                  else
                  {
                     _loc7_ = _loc3_.GetFixtureList();
                     if(_loc7_)
                     {
                        _loc8_ = _loc6_[0];
                        _loc9_ = Number(_loc6_[1]);
                        _loc10_ = Boolean(this.§_-Y1B§[_loc3_]);
                        if(_loc5_)
                        {
                           _loc21_ = _loc4_ as Hero;
                           if(Math.random() > 0.9999)
                           {
                              _loc22_ = _loc21_.position.Copy();
                              _loc22_.Add(new b2Vec2(0,-1));
                              _loc22_.Add(new b2Vec2(_loc21_.heroView.direction ? -1 : 1));
                              this.§_-D1X§.§_-92g§(_loc22_,Math.random() * 0.5 + 0.5);
                           }
                        }
                        _loc11_ = new b2Vec2();
                        _loc12_ = new b2Vec2();
                        _loc13_ = 0;
                        _loc14_ = 0;
                        _loc15_ = new b2Vec2();
                        _loc16_ = Number(_loc7_.GetShape().ComputeSubmergedArea(_loc8_,_loc9_,_loc3_.GetTransform(),_loc15_));
                        _loc13_ += _loc16_;
                        _loc11_.x += _loc16_ * _loc15_.x;
                        _loc11_.y += _loc16_ * _loc15_.y;
                        _loc17_ = this.§_-o24§ ? Number(_loc7_.GetDensity()) : 1;
                        _loc14_ += _loc16_ * _loc17_;
                        _loc12_.x += _loc16_ * _loc15_.x * _loc17_;
                        _loc12_.y += _loc16_ * _loc15_.y * _loc17_;
                        _loc11_.x /= _loc13_;
                        _loc11_.y /= _loc13_;
                        _loc12_.x /= _loc14_;
                        _loc12_.y /= _loc14_;
                        if(_loc13_ < Number.MIN_VALUE)
                        {
                           this.§_-Y1B§[_loc3_] = false;
                        }
                        else
                        {
                           this.§_-Y1B§[_loc3_] = true;
                           if(_loc4_ is §_-A1d§)
                           {
                              _loc23_ = _loc4_ as §_-A1d§;
                              if(_loc13_ >= Number.MIN_VALUE && this.§_-D1X§.allowSwim)
                              {
                                 _loc23_.§_-th§();
                              }
                           }
                           else if(_loc4_ is §_-N2K§)
                           {
                              _loc24_ = _loc4_ as §_-N2K§;
                              if(_loc13_ >= Number.MIN_VALUE && this.§_-D1X§.allowSwim)
                              {
                                 _loc24_.§_-th§();
                              }
                           }
                           else
                           {
                              if(_loc5_)
                              {
                                 _loc21_ = _loc4_ as Hero;
                                 if(_loc21_.ghost)
                                 {
                                    continue;
                                 }
                                 _loc25_ = getTimer();
                                 _loc21_.swim = _loc13_ >= Number.MIN_VALUE && this.§_-D1X§.allowSwim;
                                 if(!_loc21_.§_-xS§ && _loc21_.swim && _loc21_.id == Game.selfId && _loc25_ - this.§_-H1W§ > 730)
                                 {
                                    this.§_-H1W§ = _loc25_;
                                    GameSounds.play("water");
                                 }
                                 _loc21_.§_-xS§ = _loc21_.swim;
                                 if(_loc21_.§_-a1w§ && _loc21_.swim && (_loc21_.player["worn_packages"] as Array).indexOf(§_-P2x§.§_-FC§) < 0)
                                 {
                                    _loc21_.§_-X1O§(false);
                                 }
                              }
                              if(!_loc10_)
                              {
                                 this.§_-D1X§.§_-uS§(_loc3_.GetPosition(),_loc3_.GetLinearVelocity());
                              }
                              _loc18_ = _loc5_ && _loc21_.swim ? _loc21_.swimFactor : 1;
                              _loc19_ = this.gravity.Copy();
                              _loc19_.NegativeSelf();
                              _loc19_.Multiply(this.density * _loc13_ * (_loc5_ ? _loc18_ / (3 * (_loc21_.scale * _loc21_.scale)) : 1) * 2);
                              if(!_loc5_ && !(_loc4_ is §_-B3§) || _loc5_ && (_loc4_ as Hero).up && this.§_-D1X§.allowSwim)
                              {
                                 _loc3_.ApplyForce(_loc19_,_loc12_);
                              }
                              _loc20_ = _loc3_.GetLinearVelocityFromWorldPoint(_loc11_);
                              _loc20_.Subtract(this.velocity);
                              _loc20_.Multiply(-this.§_-E2a§ * _loc13_);
                              _loc3_.ApplyForce(_loc20_,_loc11_);
                              _loc3_.ApplyTorque(-_loc3_.GetInertia() / _loc3_.GetMass() * _loc13_ * _loc3_.GetAngularVelocity() * this.§_-zT§);
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

