package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-I1q§.§_-d2U§;
   import protocol.§_-s2l§;
   
   public class §_-N1p§ extends §_-is§
   {
      
      public function §_-N1p§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get json() : String
      {
         if(this.active)
         {
            return "";
         }
         return JSON.stringify(this.§_-WP§);
      }
      
      override protected function get maxRadius() : Number
      {
         return 100;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:§_-d2U§ = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               if(param1[2] != §_-s2l§.§_-x2Y§)
               {
                  return;
               }
               _loc2_ = new b2Vec2(param1[5].x,param1[5].y);
               _loc3_ = new §_-d2U§();
               _loc3_.position = _loc2_;
               _loc3_.playerId = this.hero.id;
               this.hero.game.map.add(_loc3_);
               _loc3_.build(this.hero.game.world);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
   }
}

