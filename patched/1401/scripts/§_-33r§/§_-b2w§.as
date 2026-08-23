package §_-33r§
{
   import Box2D.Dynamics.Contacts.b2ContactEdge;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2FilterData;
   import §_-51g§.§_-z12§;
   import flash.events.Event;
   import game.mainGame.§_-V§;
   import game.mainGame.§_-w2F§;
   
   public class §_-b2w§ extends §_-AP§
   {
      
      private var controller:b2ConstantAccelController;
      
      public function §_-b2w§(param1:Number)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.apply(this.hero,false);
         }
         else
         {
            this.apply(param1,true);
         }
         super.hero = param1;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         this.hero.body.SetAngularVelocity(0);
         this.hero.body.SetAngle(0);
      }
      
      protected function apply(param1:Hero, param2:Boolean) : void
      {
         var _loc5_:§_-z12§ = null;
         var _loc6_:b2ContactEdge = null;
         if(param2)
         {
            _loc5_ = null;
            _loc6_ = param1.body.GetContactList();
            while(_loc6_)
            {
               _loc5_ = _loc6_.contact.GetFixtureA().GetUserData() as §_-z12§;
               if(!_loc5_)
               {
                  _loc5_ = _loc6_.contact.GetFixtureB().GetUserData() as §_-z12§;
               }
               if(_loc5_)
               {
                  _loc5_.endContact(_loc6_.contact);
               }
               _loc6_ = _loc6_.next;
            }
            §_-w2F§.§_-41c§(param1.body);
         }
         else
         {
            §_-w2F§.§_-aE§(param1.body);
         }
         param1.dispatchEvent(new Event(Hero.§_-g1O§));
         param1.dispatchEvent(new Event(Hero.§_-n2S§));
         var _loc3_:b2FilterData = param1.§_-b1Y§.GetFilterData();
         _loc3_.categoryBits = !param2 ? uint(_loc3_.categoryBits | §_-V§.§_-qV§) : uint(_loc3_.categoryBits & ~§_-V§.§_-qV§);
         _loc3_.maskBits = !param2 ? uint(_loc3_.maskBits | §_-V§.§_-j1I§ | §_-V§.§_-31M§) : uint(_loc3_.maskBits & ~§_-V§.§_-j1I§ & ~§_-V§.§_-31M§);
         param1.§_-b1Y§.SetFilterData(_loc3_);
         var _loc4_:b2FilterData = param1.§_-Fn§.GetFilterData();
         _loc4_.categoryBits = !param2 ? uint(_loc4_.categoryBits | §_-V§.§_-qV§ | §_-V§.§_-11o§) : uint(_loc4_.categoryBits & ~§_-V§.§_-qV§ & ~§_-V§.§_-11o§);
         _loc4_.maskBits = !param2 ? uint(_loc4_.maskBits | §_-V§.§_-j1I§ | §_-V§.§_-31M§) : uint(_loc4_.maskBits & ~§_-V§.§_-j1I§ & ~§_-V§.§_-31M§);
         param1.§_-Fn§.SetFilterData(_loc4_);
         if(param2)
         {
            this.controller = new b2ConstantAccelController();
            this.controller.A = param1.game.world.GetGravity().GetNegative();
            this.controller.AddBody(param1.body);
            param1.game.world.AddController(this.controller);
         }
         else if(this.controller)
         {
            param1.game.world.RemoveController(this.controller);
            this.controller.Clear();
            this.controller = null;
         }
      }
   }
}

