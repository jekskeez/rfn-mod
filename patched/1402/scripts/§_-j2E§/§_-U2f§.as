package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-rK§;
   import flash.display.MovieClip;
   
   public class §_-U2f§ extends §_-92f§
   {
      
      private static const §_-t2z§:b2Vec2 = new b2Vec2(20,0);
      
      private static const §_-H8§:b2Vec2 = new b2Vec2(-20,0);
      
      private var §_-g1Q§:§_-rK§ = null;
      
      private var view:MovieClip = null;
      
      public function §_-U2f§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "logan";
         this.view = new LoganPerkView();
         this.view.addFrameScript(this.view.totalFrames - 1,this.§_-TZ§);
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
         this.§_-n1n§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-g1Q§ = new §_-rK§(0,0.2);
         this.hero.behaviourController.§_-W10§(this.§_-g1Q§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.behaviourController.removeState(this.§_-g1Q§);
         this.§_-g1Q§ = null;
      }
      
      private function §_-n1n§() : void
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
                  _loc1_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.hero.heroView.direction ? §_-t2z§ : §_-H8§));
                  this.hero.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.hero.heroView.direction ? §_-H8§ : §_-t2z§));
                  if(!this.view.isPlaying)
                  {
                     this.hero.§_-s28§(this.view);
                     this.view.play();
                  }
               }
            }
         }
      }
      
      private function §_-TZ§() : void
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

