package §_-P2b§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-L2a§;
   import §_-u2r§.§_-k1Q§;
   import sounds.GameSounds;
   
   public class §_-3G§ extends §_-H2N§
   {
      
      private static const §_-5s§:int = 1;
      
      private static const §_-px§:int = 2;
      
      private static const §_-kR§:int = 3;
      
      private static const §_-H1r§:int = 4;
      
      private static const §_-p2O§:int = 5;
      
      private static const §_-s1p§:int = 10;
      
      private static const CD:int = 60;
      
      private static const §_-DV§:int = 45;
      
      private static const §_-b1G§:Array = [69];
      
      public function §_-3G§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
      }
      
      override public function get totalCooldown() : Number
      {
         return Boolean(this.hero) && this.§_-j2Y§ >= §_-5s§ ? §_-DV§ : CD;
      }
      
      override public function get startCooldown() : Number
      {
         return Boolean(this.hero) && this.§_-j2Y§ >= §_-5s§ ? §_-DV§ : CD;
      }
      
      override protected function activate() : void
      {
         var _loc4_:Hero = null;
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-c1w§ = false;
            return;
         }
         super.activate();
         GameSounds.play("blizzard_create");
         this.active = false;
         if(this.§_-j2Y§ >= §_-H1r§)
         {
            for each(_loc4_ in this.hero.game.squirrels.players)
            {
               if(!(_loc4_ == this.hero || !_loc4_.isSquirrel || _loc4_.isDead || _loc4_.inHollow))
               {
                  _loc4_.behaviourController.§_-gz§(new §_-L2a§(this.§_-j2Y§ >= §_-kR§ ? §_-s1p§ : §_-p2O§,§_-b1G§,true));
               }
            }
         }
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         var _loc1_:§_-k1Q§ = new §_-k1Q§();
         _loc1_.angle = this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-s1l§;
         _loc2_.Multiply(this.hero.heroView.direction ? -5 : 5);
         var _loc3_:b2Vec2 = this.hero.§_-x2h§;
         _loc3_.Multiply(-1);
         _loc2_.Add(_loc3_);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         _loc1_.playerId = this.hero.id;
         _loc1_.lifeTime = this.§_-j2Y§ >= §_-kR§ ? §_-s1p§ : §_-p2O§;
         _loc1_.§_-QJ§ = this.§_-j2Y§ >= §_-px§;
         _loc1_.size = this.§_-j2Y§ >= §_-kR§ ? 6 : 5;
         this.hero.game.map.§_-nA§(_loc1_,true);
      }
   }
}

