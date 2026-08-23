package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-I10§.§_-g2W§;
   import flash.display.Sprite;
   
   public class §_-t1i§ extends §_-H2N§
   {
      
      public function §_-t1i§(param1:Hero)
      {
         super(param1);
         this.§_-mw§ = true;
         this.§_-it§ = §_-VU§;
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
         this.hero.§_-zZ§ = true;
         if(Boolean(this.hero.player) && "worn_packages" in this.hero.player)
         {
            this.hero.changeView((this.hero.player["worn_packages"] as Array).indexOf(§_-g2W§.§_-z1z§) != -1 ? new AmyRoseMagicView() : new SonicMagicView());
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
         this.hero.§_-zZ§ = true;
         this.hero.changeView();
      }
   }
}

