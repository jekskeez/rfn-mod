package §_-81N§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.Controllers.b2ControllerEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2TimeStep;
   import §_-33r§.§_-b2w§;
   import §_-83V§.GameBody;
   import §_-B1O§.ClickButton;
   import §_-B1O§.Sensor;
   import game.mainGame.SquirrelGame;
   
   public class §_-92L§ extends b2Controller
   {
      
      public var G:Number = 1;
      
      public var body:b2Body;
      
      public var invSqr:Boolean = true;
      
      public var affectHero:Boolean = true;
      
      public var affectObjects:Boolean;
      
      public var maxDistance:Number = 1.7976931348623157e+308;
      
      public var addExtGrav:Boolean = true;
      
      public var biDirectional:Boolean = false;
      
      public var disableGlobalGravity:Boolean = true;
      
      public function §_-92L§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         var _loc13_:* = undefined;
         var _loc14_:b2ControllerEdge = null;
         var _loc15_:Boolean = false;
         var _loc16_:b2Vec2 = null;
         var _loc17_:b2Vec2 = null;
         var _loc18_:b2Vec2 = null;
         if(!this.affectHero && !this.affectObjects || this.G == 0 || this.body == null)
         {
            return;
         }
         var _loc2_:b2Body = null;
         var _loc3_:b2Body = this.body;
         var _loc4_:b2Vec2 = _loc3_.GetWorldCenter().Copy();
         var _loc5_:Number = Number(_loc3_.GetMass());
         var _loc6_:b2Body = null;
         var _loc7_:b2Body = null;
         var _loc8_:b2Vec2 = null;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:b2Vec2 = null;
         _loc6_ = this.GetWorld().GetBodyList();
         while(_loc6_ != _loc2_)
         {
            if(_loc6_ != this.body)
            {
               _loc13_ = _loc6_.GetUserData();
               if(!(_loc13_ is Hero && (!this.affectHero || (_loc13_ as Hero).behaviourController.getState(§_-b2w§) != null)))
               {
                  if(!(!this.affectObjects && (!(_loc13_ is Hero) || !this.§_-qu§(_loc13_ as Hero) || _loc13_ is Sensor || _loc13_ is ClickButton)))
                  {
                     if(_loc6_.IsAwake())
                     {
                        if(!(_loc13_ is GameBody && (_loc13_ as GameBody).fixed && !this.biDirectional))
                        {
                           _loc7_ = _loc6_;
                           _loc8_ = _loc7_.GetWorldCenter().Copy();
                           _loc9_ = _loc8_.x - _loc4_.x;
                           _loc10_ = _loc8_.y - _loc4_.y;
                           _loc11_ = _loc9_ * _loc9_ + _loc10_ * _loc10_;
                           if(_loc11_ >= Number.MIN_VALUE)
                           {
                              if(Math.sqrt(_loc11_) <= this.maxDistance)
                              {
                                 _loc12_ = new b2Vec2(_loc9_,_loc10_);
                                 _loc12_.Multiply(this.G / _loc11_ / Math.sqrt(_loc11_) * _loc5_ * _loc7_.GetMass());
                                 if(this.biDirectional)
                                 {
                                    _loc3_.ApplyForce(_loc12_.Copy(),_loc4_);
                                 }
                                 _loc12_.Multiply(-1);
                                 _loc7_.ApplyForce(_loc12_.Copy(),_loc8_);
                                 if(this.disableGlobalGravity)
                                 {
                                    _loc14_ = _loc7_.GetControllerList();
                                    _loc15_ = true;
                                    while(_loc14_ != null)
                                    {
                                       if(_loc14_.controller is b2ConstantAccelController)
                                       {
                                          _loc15_ = false;
                                          break;
                                       }
                                       _loc14_ = _loc14_.nextController;
                                    }
                                    if(_loc15_)
                                    {
                                       _loc16_ = _loc7_.GetLinearVelocity().Copy();
                                       _loc17_ = this.§_-51N§.GetNegative();
                                       _loc17_.Multiply(param1.dt);
                                       _loc16_.Add(_loc17_);
                                       _loc7_.SetLinearVelocity(_loc16_.Copy());
                                       if(_loc7_.GetUserData() is Hero)
                                       {
                                          (_loc7_.GetUserData() as Hero).useGravity = false;
                                       }
                                    }
                                 }
                                 if(this.addExtGrav && _loc7_.GetUserData() is Hero)
                                 {
                                    _loc18_ = new b2Vec2(_loc12_.x,_loc12_.y);
                                    _loc18_.Multiply(param1.dt / _loc7_.GetMass());
                                    (_loc7_.GetUserData() as Hero).§_-p1Q§(_loc18_);
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
            _loc6_ = _loc6_.GetNext();
         }
      }
      
      protected function §_-qu§(param1:Hero) : Boolean
      {
         if(!param1)
         {
         }
         return true;
      }
      
      private function get §_-51N§() : b2Vec2
      {
         if(!this.GetWorld() || !this.GetWorld().userData)
         {
            return new b2Vec2();
         }
         return (this.GetWorld().userData as SquirrelGame).gravity;
      }
   }
}

