package §_-j2E§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-kj§;
   import §_-I1q§.§_-Lg§;
   import sounds.GameSounds;
   
   public class §_-r2r§ extends §_-92f§
   {
      
      private static const §_-D2e§:int = 1;
      
      private static const §_-uW§:int = 2;
      
      private static const §_-01G§:int = 3;
      
      private static const §_-dB§:int = 4;
      
      private static const §_-17§:int = 5;
      
      private static const §_-6j§:int = 10;
      
      private static const CD:int = 60;
      
      private static const §_-51n§:int = 45;
      
      private static const §_-R2Y§:Array = [69];
      
      public function §_-r2r§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
      }
      
      override public function get totalCooldown() : Number
      {
         return Boolean(this.hero) && this.§_-32l§ >= §_-D2e§ ? §_-51n§ : CD;
      }
      
      override public function get startCooldown() : Number
      {
         return Boolean(this.hero) && this.§_-32l§ >= §_-D2e§ ? §_-51n§ : CD;
      }
      
      override protected function activate() : void
      {
         var _loc4_:Hero = null;
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-8x§ = false;
            return;
         }
         super.activate();
         GameSounds.play("blizzard_create");
         this.active = false;
         if(this.§_-32l§ >= §_-dB§)
         {
            for each(_loc4_ in this.hero.game.squirrels.players)
            {
               if(!(_loc4_ == this.hero || !_loc4_.isSquirrel || _loc4_.isDead || _loc4_.inHollow))
               {
                  _loc4_.behaviourController.§_-W10§(new §_-kj§(this.§_-32l§ >= §_-01G§ ? §_-6j§ : §_-17§,§_-R2Y§,true));
               }
            }
         }
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         var _loc1_:§_-Lg§ = new §_-Lg§();
         _loc1_.angle = this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-11E§;
         _loc2_.Multiply(this.hero.heroView.direction ? -5 : 5);
         var _loc3_:b2Vec2 = this.hero.§_-d2u§;
         _loc3_.Multiply(-1);
         _loc2_.Add(_loc3_);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         _loc1_.playerId = this.hero.id;
         _loc1_.lifeTime = this.§_-32l§ >= §_-01G§ ? §_-6j§ : §_-17§;
         _loc1_.§_-B2v§ = this.§_-32l§ >= §_-uW§;
         _loc1_.size = this.§_-32l§ >= §_-01G§ ? 6 : 5;
         this.hero.game.map.§_-TP§(_loc1_,true);
      }
   }
}

