package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-I1q§.§_-VQ§;
   import §_-p2L§.§_-j1k§;
   import sounds.GameSounds;
   
   public class §_-b1F§ extends §_-j1k§
   {
      
      private var point:b2Vec2 = null;
      
      public function §_-b1F§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
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
      
      override protected function get §_-L2b§() : Class
      {
         return §_-VQ§;
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
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
         GameSounds.play(§_-N2T§);
      }
   }
}

