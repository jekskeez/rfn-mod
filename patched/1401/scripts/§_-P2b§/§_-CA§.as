package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-m2U§;
   import flash.display.MovieClip;
   
   public class §_-CA§ extends §_-H2N§
   {
      
      private static const §_-C1H§:b2Vec2 = new b2Vec2(20,0);
      
      private static const §_-dM§:b2Vec2 = new b2Vec2(-20,0);
      
      private var §_-rA§:§_-m2U§ = null;
      
      private var view:MovieClip = null;
      
      public function §_-CA§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "logan";
         this.view = new LoganPerkView();
         this.view.addFrameScript(this.view.totalFrames - 1,this.§_-bY§);
         this.view.scaleX = this.view.scaleY = 0.5;
         this.view.y = -21;
         this.view.stop();
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.active || !this.hero.heroView.running)
         {
            return;
         }
         this.§_-R8§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-rA§ = new §_-m2U§(0,0.2);
         this.hero.behaviourController.§_-gz§(this.§_-rA§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.behaviourController.removeState(this.§_-rA§);
         this.§_-rA§ = null;
      }
      
      private function §_-R8§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(_loc1_.id == this.hero.id || _loc1_.isDead || _loc1_.inHollow))
            {
               _loc2_ = this.hero.position.Copy();
               _loc2_.Subtract(_loc1_.position);
               if(_loc2_.Length() <= 2)
               {
                  _loc1_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.hero.heroView.direction ? §_-C1H§ : §_-dM§));
                  this.hero.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.hero.heroView.direction ? §_-dM§ : §_-C1H§));
                  if(!this.view.isPlaying)
                  {
                     this.hero.§_-72F§(this.view);
                     this.view.play();
                  }
               }
            }
         }
      }
      
      private function §_-bY§() : void
      {
         if(this.view)
         {
            this.view.stop();
         }
         if(Boolean(this.hero) && Boolean(this.view))
         {
            this.hero.changeView();
         }
      }
   }
}

