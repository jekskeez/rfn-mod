package §_-u2r§
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-83V§.§_-K2Q§;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   
   public class §_-zP§ extends §_-K2Q§
   {
      
      private var §_-w1d§:§_-h2I§;
      
      public function §_-zP§()
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
         if(_loc3_ is §_-zP§)
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
               this.§_-81u§.visible = false;
               this.§_-w1d§ = new §_-h2I§(new TuxedoMaskRoseHit());
               this.§_-w1d§.getStarlingView().scaleX = §_-81u§.getStarlingView().scaleX;
               this.§_-w1d§.pivotX = §_-81u§.scaleX >= 0 ? this.§_-w1d§.width * 0.5 - 15 : (this.§_-w1d§.pivotX = 0);
               this.§_-w1d§.y = 7;
               this.§_-w1d§.addEventListener(Event.CHANGE,this.§_-o1L§);
               §_-83v§(this.§_-w1d§);
               this.§_-Y6§ = true;
            }
         }
      }
      
      override protected function init() : void
      {
         §_-z1L§ = new TuxedoMaskRoseView();
         super.init();
      }
      
      private function §_-o1L§(param1:Event) : void
      {
         if(this.§_-w1d§)
         {
            this.§_-w1d§.removeEventListener(Event.CHANGE,this.§_-o1L§);
            if(§_-ws§(this.§_-w1d§))
            {
               removeChildStarling(this.§_-w1d§);
            }
            this.§_-w1d§ = null;
         }
         this.§_-81u§.visible = true;
      }
   }
}

