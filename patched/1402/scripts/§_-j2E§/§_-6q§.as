package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-X1k§.§_-P2x§;
   import flash.display.Sprite;
   
   public class §_-6q§ extends §_-92f§
   {
      
      public function §_-6q§(param1:Hero)
      {
         super(param1);
         this.§_-i1J§ = true;
         this.§_-S2A§ = §_-7d§;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 6;
      }
      
      override public function get activeTime() : Number
      {
         return 3;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.hero.body.SetLinearVelocity(this.hero.body.GetWorldVector(new b2Vec2(this.hero.heroView.direction ? -75 : 75,-35)));
         this.hero.restitution = 1;
         this.hero.§_-IC§ = true;
         if(Boolean(this.hero.player) && "worn_packages" in this.hero.player)
         {
            this.hero.changeView((this.hero.player["worn_packages"] as Array).indexOf(§_-P2x§.§_-A2N§) != -1 ? new AmyRoseMagicView() : new SonicMagicView());
         }
         else
         {
            this.hero.changeView(new SonicMagicView());
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.restitution = 0.1;
         this.hero.§_-IC§ = true;
         this.hero.changeView();
      }
   }
}

