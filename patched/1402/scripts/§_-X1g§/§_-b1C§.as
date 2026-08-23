package §_-X1g§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-A1d§;
   
   public class §_-b1C§ extends §_-M8§
   {
      
      public function §_-b1C§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "PerkFire";
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.swim;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.isStopped = true;
         (this.hero.heroView.§_-R9§ as §_-Pu§).fire = true;
         if(this.isSelf)
         {
            this.§_-t1Z§();
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         (this.hero.heroView.§_-R9§ as §_-Pu§).fire = false;
         this.hero.isStopped = false;
      }
      
      private function §_-t1Z§() : void
      {
         var _loc1_:§_-A1d§ = new §_-A1d§();
         _loc1_.playerId = this.hero.id;
         _loc1_.angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-11E§;
         _loc2_.Multiply(this.hero.heroView.direction ? -5 * this.hero.scale : 5 * this.hero.scale);
         var _loc3_:b2Vec2 = this.hero.§_-d2u§;
         _loc3_.Multiply(-1 * this.hero.scale);
         _loc2_.Add(_loc3_);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         _loc1_.scale = this.hero.scale;
         this.hero.game.map.§_-TP§(_loc1_,true);
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

