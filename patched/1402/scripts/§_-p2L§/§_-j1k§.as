package §_-p2L§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-j2E§.§_-92f§;
   
   public class §_-j1k§ extends §_-92f§
   {
      
      public function §_-j1k§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      protected function get §_-L2b§() : Class
      {
         return null;
      }
      
      protected function get §_-m1g§() : Number
      {
         return 0;
      }
      
      protected function get §_-532§() : Number
      {
         return 1;
      }
      
      protected function §_-6u§(param1:GameBody) : void
      {
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-8x§ = false;
            return;
         }
         super.activate();
         if(!this.isSelf)
         {
            return;
         }
         var _loc1_:GameBody = new this.§_-L2b§();
         _loc1_.angle = this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-11E§;
         _loc2_.Multiply(this.hero.heroView.direction ? -this.§_-m1g§ : this.§_-m1g§);
         var _loc3_:b2Vec2 = this.hero.§_-d2u§;
         _loc3_.Multiply(this.§_-532§);
         _loc2_.Add(_loc3_);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         _loc1_.playerId = this.hero.id;
         this.§_-6u§(_loc1_);
         this.hero.game.map.§_-TP§(_loc1_,true);
      }
   }
}

