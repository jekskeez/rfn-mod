package §_-C2a§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.§_-12R§;
   
   public class §_-Iq§ extends §_-W10§
   {
      
      public function §_-Iq§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "PerkFire";
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.swim;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.isStopped = true;
         (this.hero.heroView.§_-D2D§ as §_-21X§).fire = true;
         if(this.isSelf)
         {
            this.§_-r1T§();
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         (this.hero.heroView.§_-D2D§ as §_-21X§).fire = false;
         this.hero.isStopped = false;
      }
      
      private function §_-r1T§() : void
      {
         var _loc1_:§_-12R§ = new §_-12R§();
         _loc1_.playerId = this.hero.id;
         _loc1_.angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-s1l§;
         _loc2_.Multiply(this.hero.heroView.direction ? -5 * this.hero.scale : 5 * this.hero.scale);
         var _loc3_:b2Vec2 = this.hero.§_-x2h§;
         _loc3_.Multiply(-1 * this.hero.scale);
         _loc2_.Add(_loc3_);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         _loc1_.scale = this.hero.scale;
         this.hero.game.map.§_-nA§(_loc1_,true);
      }
      
      override public function get activeTime() : Number
      {
         return 1.3;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
   }
}

