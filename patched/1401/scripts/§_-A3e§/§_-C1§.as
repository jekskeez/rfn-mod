package §_-A3e§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-P2b§.§_-H2N§;
   
   public class §_-C1§ extends §_-H2N§
   {
      
      public function §_-C1§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      protected function get §_-l1R§() : Class
      {
         return null;
      }
      
      protected function get §_-t1B§() : Number
      {
         return 0;
      }
      
      protected function get §_-v2i§() : Number
      {
         return 1;
      }
      
      protected function §_-92Z§(param1:GameBody) : void
      {
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-c1w§ = false;
            return;
         }
         super.activate();
         if(!this.isSelf)
         {
            return;
         }
         var _loc1_:GameBody = new this.§_-l1R§();
         _loc1_.angle = this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-s1l§;
         _loc2_.Multiply(this.hero.heroView.direction ? -this.§_-t1B§ : this.§_-t1B§);
         var _loc3_:b2Vec2 = this.hero.§_-x2h§;
         _loc3_.Multiply(this.§_-v2i§);
         _loc2_.Add(_loc3_);
         _loc1_.position = b2Math.AddVV(this.hero.position,_loc2_);
         _loc1_.playerId = this.hero.id;
         this.§_-92Z§(_loc1_);
         this.hero.game.map.§_-nA§(_loc1_,true);
      }
   }
}

