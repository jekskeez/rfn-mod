package §_-42p§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2TimeStep;
   import §_-83V§.GameBody;
   import §_-83V§.§_-12R§;
   import §_-I10§.§_-g2W§;
   import §_-u2r§.§_-mo§;
   import §_-u2r§.§_-qv§;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import game.mainGame.§_-w2F§;
   import sounds.GameSounds;
   
   public class §_-Mq§ extends b2Controller
   {
      
      public var §_-v1T§:Boolean = false;
      
      public var §_-42G§:§_-01t§;
      
      public var density:Number = 1;
      
      public var velocity:b2Vec2 = new b2Vec2(0,0);
      
      public var §_-z2S§:Number = 2;
      
      public var §_-B1Y§:Number = 1;
      
      public var §_-HF§:Boolean = true;
      
      public var §_-93x§:Boolean = true;
      
      public var gravity:b2Vec2 = new b2Vec2();
      
      public var §_-3D§:int = 0;
      
      protected var §_-O2v§:Dictionary = new Dictionary(false);
      
      public function §_-Mq§(param1:§_-01t§)
      {
         super();
         this.§_-42G§ = param1;
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
         var _loc23_:§_-12R§ = null;
         var _loc24_:§_-mo§ = null;
         var _loc25_:Number = NaN;
         if(!param1)
         {
         }
         if(this.§_-93x§)
         {
            this.gravity = GetWorld().GetGravity().Copy();
         }
         if(!this.§_-42G§)
         {
            return;
         }
         for each(_loc2_ in §_-w2F§.§_-O2v§)
         {
            _loc3_ = _loc2_;
            if(_loc3_.IsAwake())
            {
               _loc4_ = _loc3_.GetUserData();
               if(!(_loc4_ is GameBody && (_loc4_ as GameBody).fixed))
               {
                  _loc5_ = _loc4_ is Hero;
                  _loc6_ = this.§_-42G§.§_-V1z§(_loc3_.GetPosition().x,_loc3_.GetPosition().y);
                  if(!_loc6_[2])
                  {
                     _loc21_ = _loc4_ as Hero;
                     if(_loc5_ && _loc21_.id == Game.selfId)
                     {
                        _loc21_.§_-11a§ = false;
                     }
                  }
                  else
                  {
                     _loc7_ = _loc3_.GetFixtureList();
                     if(_loc7_)
                     {
                        _loc8_ = _loc6_[0];
                        _loc9_ = Number(_loc6_[1]);
                        _loc10_ = Boolean(this.§_-O2v§[_loc3_]);
                        if(_loc5_)
                        {
                           _loc21_ = _loc4_ as Hero;
                           if(Math.random() > 0.9999)
                           {
                              _loc22_ = _loc21_.position.Copy();
                              _loc22_.Add(new b2Vec2(0,-1));
                              _loc22_.Add(new b2Vec2(_loc21_.heroView.direction ? -1 : 1));
                              this.§_-42G§.§_-t2E§(_loc22_,Math.random() * 0.5 + 0.5);
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
                        _loc17_ = this.§_-HF§ ? Number(_loc7_.GetDensity()) : 1;
                        _loc14_ += _loc16_ * _loc17_;
                        _loc12_.x += _loc16_ * _loc15_.x * _loc17_;
                        _loc12_.y += _loc16_ * _loc15_.y * _loc17_;
                        _loc11_.x /= _loc13_;
                        _loc11_.y /= _loc13_;
                        _loc12_.x /= _loc14_;
                        _loc12_.y /= _loc14_;
                        if(_loc13_ < Number.MIN_VALUE)
                        {
                           this.§_-O2v§[_loc3_] = false;
                        }
                        else
                        {
                           this.§_-O2v§[_loc3_] = true;
                           if(_loc4_ is §_-12R§)
                           {
                              _loc23_ = _loc4_ as §_-12R§;
                              if(_loc13_ >= Number.MIN_VALUE && this.§_-42G§.allowSwim)
                              {
                                 _loc23_.§_-b16§();
                              }
                           }
                           else if(_loc4_ is §_-mo§)
                           {
                              _loc24_ = _loc4_ as §_-mo§;
                              if(_loc13_ >= Number.MIN_VALUE && this.§_-42G§.allowSwim)
                              {
                                 _loc24_.§_-b16§();
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
                                 _loc21_.swim = _loc13_ >= Number.MIN_VALUE && this.§_-42G§.allowSwim;
                                 if(!_loc21_.§_-11a§ && _loc21_.swim && _loc21_.id == Game.selfId && _loc25_ - this.§_-3D§ > 730)
                                 {
                                    this.§_-3D§ = _loc25_;
                                    GameSounds.play("water");
                                 }
                                 _loc21_.§_-11a§ = _loc21_.swim;
                                 if(_loc21_.§_-G5§ && _loc21_.swim && (_loc21_.player["worn_packages"] as Array).indexOf(§_-g2W§.§_-bo§) < 0)
                                 {
                                    _loc21_.§_-t25§(false);
                                 }
                              }
                              if(!_loc10_)
                              {
                                 this.§_-42G§.§_-UF§(_loc3_.GetPosition(),_loc3_.GetLinearVelocity());
                              }
                              _loc18_ = _loc5_ && _loc21_.swim ? _loc21_.swimFactor : 1;
                              _loc19_ = this.gravity.Copy();
                              _loc19_.NegativeSelf();
                              _loc19_.Multiply(this.density * _loc13_ * (_loc5_ ? _loc18_ / (3 * (_loc21_.scale * _loc21_.scale)) : 1) * 2);
                              if(!_loc5_ && !(_loc4_ is §_-qv§) || _loc5_ && (_loc4_ as Hero).up && this.§_-42G§.allowSwim)
                              {
                                 _loc3_.ApplyForce(_loc19_,_loc12_);
                              }
                              _loc20_ = _loc3_.GetLinearVelocityFromWorldPoint(_loc11_);
                              _loc20_.Subtract(this.velocity);
                              _loc20_.Multiply(-this.§_-z2S§ * _loc13_);
                              _loc3_.ApplyForce(_loc20_,_loc11_);
                              _loc3_.ApplyTorque(-_loc3_.GetInertia() / _loc3_.GetMass() * _loc13_ * _loc3_.GetAngularVelocity() * this.§_-B1Y§);
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

