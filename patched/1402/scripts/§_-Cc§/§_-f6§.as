package §_-Cc§
{
   import Box2D.Dynamics.Contacts.b2ContactEdge;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2FilterData;
   import §_-j4§.§_-43y§;
   import flash.events.Event;
   import game.mainGame.§_-n2T§;
   import game.mainGame.§_-q2c§;
   
   public class §_-f6§ extends §_-pp§
   {
      
      private var controller:b2ConstantAccelController;
      
      public function §_-f6§(param1:Number)
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
         var _loc5_:§_-43y§ = null;
         var _loc6_:b2ContactEdge = null;
         if(param2)
         {
            _loc5_ = null;
            _loc6_ = param1.body.GetContactList();
            while(_loc6_)
            {
               _loc5_ = _loc6_.contact.GetFixtureA().GetUserData() as §_-43y§;
               if(!_loc5_)
               {
                  _loc5_ = _loc6_.contact.GetFixtureB().GetUserData() as §_-43y§;
               }
               if(_loc5_)
               {
                  _loc5_.endContact(_loc6_.contact);
               }
               _loc6_ = _loc6_.next;
            }
            §_-n2T§.§_-L4§(param1.body);
         }
         else
         {
            §_-n2T§.§_-U2D§(param1.body);
         }
         param1.dispatchEvent(new Event(Hero.§_-N2i§));
         param1.dispatchEvent(new Event(Hero.§_-J2F§));
         var _loc3_:b2FilterData = param1.§_-s2i§.GetFilterData();
         _loc3_.categoryBits = !param2 ? uint(_loc3_.categoryBits | §_-q2c§.§_-rT§) : uint(_loc3_.categoryBits & ~§_-q2c§.§_-rT§);
         _loc3_.maskBits = !param2 ? uint(_loc3_.maskBits | §_-q2c§.§_-wI§ | §_-q2c§.§_-ti§) : uint(_loc3_.maskBits & ~§_-q2c§.§_-wI§ & ~§_-q2c§.§_-ti§);
         param1.§_-s2i§.SetFilterData(_loc3_);
         var _loc4_:b2FilterData = param1.§_-L1G§.GetFilterData();
         _loc4_.categoryBits = !param2 ? uint(_loc4_.categoryBits | §_-q2c§.§_-rT§ | §_-q2c§.§_-y2Y§) : uint(_loc4_.categoryBits & ~§_-q2c§.§_-rT§ & ~§_-q2c§.§_-y2Y§);
         _loc4_.maskBits = !param2 ? uint(_loc4_.maskBits | §_-q2c§.§_-wI§ | §_-q2c§.§_-ti§) : uint(_loc4_.maskBits & ~§_-q2c§.§_-wI§ & ~§_-q2c§.§_-ti§);
         param1.§_-L1G§.SetFilterData(_loc4_);
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

