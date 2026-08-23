package §_-P2b§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-mo§;
   
   public class §_-v1R§ extends §_-C1§
   {
      
      public function §_-v1R§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "PerkFire";
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.swim;
      }
      
      override public function get totalCooldown() : Number
      {
         return 3.9;
      }
      
      override public function get activeTime() : Number
      {
         return 3.9;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return -1;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-mo§).playerId = Game.selfId;
         (param1 as §_-mo§).angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-s1l§;
         _loc2_.Multiply(this.hero.heroView.direction ? -5 * this.hero.scale : 5 * this.hero.scale);
         var _loc3_:b2Vec2 = this.hero.§_-x2h§;
         _loc3_.Multiply(-1 * this.hero.scale);
         _loc2_.Add(_loc3_);
         (param1 as §_-mo§).position = b2Math.AddVV(this.hero.position,_loc2_);
         (param1 as §_-mo§).scale = this.hero.scale;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-mo§;
      }
   }
}

