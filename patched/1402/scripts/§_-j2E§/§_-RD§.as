package §_-j2E§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-N2K§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-RD§ extends §_-j1k§
   {
      
      public function §_-RD§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "PerkFire";
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
      
      override protected function get §_-532§() : Number
      {
         return -1;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-N2K§).playerId = Game.selfId;
         (param1 as §_-N2K§).angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         var _loc2_:b2Vec2 = this.hero.§_-11E§;
         _loc2_.Multiply(this.hero.heroView.direction ? -5 * this.hero.scale : 5 * this.hero.scale);
         var _loc3_:b2Vec2 = this.hero.§_-d2u§;
         _loc3_.Multiply(-1 * this.hero.scale);
         _loc2_.Add(_loc3_);
         (param1 as §_-N2K§).position = b2Math.AddVV(this.hero.position,_loc2_);
         (param1 as §_-N2K§).scale = this.hero.scale;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-N2K§;
      }
   }
}

