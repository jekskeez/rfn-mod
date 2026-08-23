package §_-H1l§
{
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Transform;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.Controllers.b2ControllerEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2TimeStep;
   import §_-8Q§.GameBody;
   import §_-j2H§.ClickButton;
   import §_-j2H§.Sensor;
   import §_-j2H§.§_-d2T§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-n2T§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-ho§ extends b2Controller
   {
      
      public var G:Number = 1;
      
      public var body:§_-xn§;
      
      public var affectHero:Boolean = true;
      
      public var affectObjects:Boolean;
      
      public var §_-f10§:b2Vec2;
      
      public var §_-P16§:b2Vec2;
      
      public var outSize:b2Vec2;
      
      public var direction:b2Vec2;
      
      public var addExtGrav:Boolean = true;
      
      public var disableGlobalGravity:Boolean = true;
      
      private var §_-Rv§:b2Vec2 = new b2Vec2();
      
      private var vel:b2Vec2 = new b2Vec2();
      
      private var §_-021§:b2Vec2 = new b2Vec2();
      
      public function §_-ho§()
      {
         super();
      }
      
      public function dispose() : void
      {
         this.G = 0;
         this.affectHero = this.affectObjects = false;
         this.GetWorld().RemoveController(this);
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         var _loc4_:b2Body = null;
         var _loc5_:* = undefined;
         var _loc6_:b2Vec2 = null;
         var _loc7_:b2Vec2 = null;
         var _loc8_:b2Vec2 = null;
         var _loc9_:b2ControllerEdge = null;
         var _loc10_:Boolean = false;
         var _loc11_:b2Vec2 = null;
         if(!this.affectHero && !this.affectObjects || this.G == 0)
         {
            return;
         }
         var _loc2_:b2Mat22 = new b2Mat22();
         _loc2_.Set(this.body.angle);
         var _loc3_:b2Transform = new b2Transform(b2Math.AddVV(this.§_-f10§,this.body.position.Copy()),_loc2_);
         for each(_loc4_ in §_-n2T§.§_-Y1B§)
         {
            if(!(Boolean(this.body is §_-d2T§ && (this.body as §_-d2T§).§_-RC§) && Boolean((this.body as §_-d2T§).§_-RC§.body) && (this.body as §_-d2T§).§_-RC§.body == _loc4_))
            {
               _loc5_ = _loc4_.GetUserData();
               if(!(!this.affectHero && _loc5_ is Hero))
               {
                  if(!(!this.affectObjects && (!(_loc5_ is Hero) || _loc5_ is Sensor || _loc5_ is ClickButton)))
                  {
                     if(_loc4_.IsAwake())
                     {
                        if(!(_loc5_ is GameBody && (_loc5_ as GameBody).fixed))
                        {
                           this.§_-Rv§.x = _loc4_.GetLinearVelocity().x;
                           this.§_-Rv§.y = _loc4_.GetLinearVelocity().y;
                           this.vel.x = 0;
                           this.vel.y = 0;
                           this.§_-021§.x = _loc4_.GetPosition().x;
                           this.§_-021§.y = _loc4_.GetPosition().y;
                           _loc7_ = b2Math.MulXT(_loc3_,this.§_-021§);
                           if(!(_loc7_.x < -this.outSize.x * 0.5 || _loc7_.x > this.outSize.x * 0.5 || (_loc7_.y < -this.outSize.y * 0.5 || _loc7_.y > this.outSize.y * 0.5)))
                           {
                              if(this.direction.x == 0 && this.direction.y == 0)
                              {
                                 _loc8_ = new b2Vec2();
                                 if(_loc7_.x > -this.§_-P16§.x * 0.5 && _loc7_.x < this.§_-P16§.x * 0.5)
                                 {
                                    _loc8_.x = _loc7_.x;
                                 }
                                 if(_loc7_.y > -this.§_-P16§.y * 0.5 && _loc7_.y < this.§_-P16§.y * 0.5)
                                 {
                                    _loc8_.y = _loc7_.y;
                                 }
                                 _loc8_ = b2Math.MulX(_loc3_,_loc8_);
                                 _loc6_ = b2Math.SubtractVV(this.§_-021§,_loc8_);
                              }
                              else
                              {
                                 _loc6_ = this.direction.Copy();
                              }
                              _loc6_.Normalize();
                              _loc6_.Multiply(param1.dt * this.G);
                              this.vel.Add(_loc6_);
                              if(this.addExtGrav && _loc5_ is Hero)
                              {
                                 (_loc5_ as Hero).§_-X1b§(this.vel.Copy());
                                 (_loc5_ as Hero).useGravity = !this.disableGlobalGravity;
                              }
                              if(this.disableGlobalGravity)
                              {
                                 _loc9_ = _loc4_.GetControllerList();
                                 _loc10_ = true;
                                 while(_loc9_ != null)
                                 {
                                    if(_loc9_.controller is b2ConstantAccelController)
                                    {
                                       _loc10_ = false;
                                       break;
                                    }
                                    _loc9_ = _loc9_.nextController;
                                 }
                                 if(_loc10_)
                                 {
                                    _loc11_ = this.§_-k1p§.GetNegative();
                                    _loc11_.Multiply(param1.dt);
                                    this.vel.Add(_loc11_);
                                 }
                              }
                              this.§_-Rv§.Add(this.vel);
                              _loc4_.SetLinearVelocity(this.§_-Rv§.Copy());
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function get §_-k1p§() : b2Vec2
      {
         if(!this.GetWorld() || !this.GetWorld().userData)
         {
            return new b2Vec2();
         }
         return (this.GetWorld().userData as SquirrelGame).gravity;
      }
   }
}

