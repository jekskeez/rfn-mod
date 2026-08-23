package §_-z2j§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-u2r§.§_-qv§;
   import sounds.GameSounds;
   
   public class §_-w13§ extends §_-33U§
   {
      
      public function §_-w13§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-Wk§ as §_-31F§).stomp && !(this.hero.heroView.§_-Wk§ as §_-31F§).§_-62l§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         (this.hero.heroView.§_-Wk§ as §_-31F§).§_-18§ = true;
         this.hero.isStopped = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         (this.hero.heroView.§_-Wk§ as §_-31F§).§_-18§ = false;
         this.hero.isStopped = false;
         this.§_-OG§();
      }
      
      private function §_-OG§() : void
      {
         GameSounds.play("spit");
         GameSounds.playUnrepeatable("hare_gum",§_-31F§.§_-Y2M§);
         if(!this.isSelf)
         {
            return;
         }
         var _loc1_:§_-qv§ = new §_-qv§();
         _loc1_.angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         _loc1_.playerId = Game.selfId;
         var _loc2_:b2Vec2 = this.hero.§_-s1l§;
         _loc2_.Multiply(this.hero.heroView.direction ? -4 : 4);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         this.hero.game.map.§_-nA§(_loc1_,true);
      }
      
      override public function get activeTime() : Number
      {
         return 1;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
   }
}

