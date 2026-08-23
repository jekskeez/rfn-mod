package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-U2k§;
   import sounds.GameSounds;
   
   public class §_-G2a§ extends §_-C1§
   {
      
      private var point:b2Vec2 = null;
      
      public function §_-G2a§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-U2k§;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         this.point = null;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.point = this.hero.position.Copy();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.point || !this.hero)
         {
            return;
         }
         this.hero.teleportTo(this.point);
         GameSounds.play(§_-Y1q§);
      }
   }
}

