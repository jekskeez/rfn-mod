package §_-Oc§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-I1q§.§_-B3§;
   import sounds.GameSounds;
   
   public class §_-H1Y§ extends §_-WE§
   {
      
      public function §_-H1Y§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-t2V§ as §_-23o§).stomp && !(this.hero.heroView.§_-t2V§ as §_-23o§).§_-b2J§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         (this.hero.heroView.§_-t2V§ as §_-23o§).§_-Y1A§ = true;
         this.hero.isStopped = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         (this.hero.heroView.§_-t2V§ as §_-23o§).§_-Y1A§ = false;
         this.hero.isStopped = false;
         this.§_-9O§();
      }
      
      private function §_-9O§() : void
      {
         GameSounds.play("spit");
         GameSounds.playUnrepeatable("hare_gum",§_-23o§.§_-Q0§);
         if(!this.isSelf)
         {
            return;
         }
         var _loc1_:§_-B3§ = new §_-B3§();
         _loc1_.angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         _loc1_.playerId = Game.selfId;
         var _loc2_:b2Vec2 = this.hero.§_-11E§;
         _loc2_.Multiply(this.hero.heroView.direction ? -4 : 4);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         this.hero.game.map.§_-TP§(_loc1_,true);
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

