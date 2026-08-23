package §_-I1q§
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-8Q§.§_-P1H§;
   import §_-TK§.§_-aS§;
   import flash.events.Event;
   
   public class §_-m25§ extends §_-P1H§
   {
      
      private var §_-U2Q§:§_-aS§;
      
      public function §_-m25§()
      {
         super();
      }
      
      override public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         if(!param2)
         {
         }
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc3_ == this)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc3_ is §_-m25§)
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc4_:Hero = _loc3_ as Hero;
         if(!_loc4_)
         {
            if(!this.fixed)
            {
               this.fixed = true;
               this.§_-V2l§.visible = false;
               this.§_-U2Q§ = new §_-aS§(new TuxedoMaskRoseHit());
               this.§_-U2Q§.getStarlingView().scaleX = §_-V2l§.getStarlingView().scaleX;
               this.§_-U2Q§.pivotX = §_-V2l§.scaleX >= 0 ? this.§_-U2Q§.width * 0.5 - 15 : (this.§_-U2Q§.pivotX = 0);
               this.§_-U2Q§.y = 7;
               this.§_-U2Q§.addEventListener(Event.CHANGE,this.§_-t2H§);
               §_-J2J§(this.§_-U2Q§);
               this.§_-h14§ = true;
            }
         }
      }
      
      override protected function init() : void
      {
         §_-uY§ = new TuxedoMaskRoseView();
         super.init();
      }
      
      private function §_-t2H§(param1:Event) : void
      {
         if(this.§_-U2Q§)
         {
            this.§_-U2Q§.removeEventListener(Event.CHANGE,this.§_-t2H§);
            if(§_-U2E§(this.§_-U2Q§))
            {
               removeChildStarling(this.§_-U2Q§);
            }
            this.§_-U2Q§ = null;
         }
         this.§_-V2l§.visible = true;
      }
   }
}

