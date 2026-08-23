package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-PN§;
   import flash.geom.Point;
   import game.mainGame.entity.§_-sn§;
   import protocol.§_-s2l§;
   
   public class §_-R1v§ extends §_-is§
   {
      
      protected var §_-g1a§:§_-PN§ = null;
      
      public function §_-R1v§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "spider";
         this.§_-i1J§ = true;
      }
      
      override public function get json() : String
      {
         if(this.active)
         {
            return "";
         }
         var _loc1_:Point = this.hero.heroView.localToGlobal(new Point(0,-20));
         var _loc2_:Point = new Point(this.hero.position.x,this.hero.position.y);
         return JSON.stringify([this.§_-z2x§,new Point(_loc1_.x,_loc1_.y),_loc2_]);
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:§_-PN§ = null;
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
               _loc2_ = new b2Vec2(param1[5][0].x,param1[5][0].y);
               _loc3_ = new Point(param1[5][1].x,param1[5][1].y);
               _loc4_ = Math.atan2(_loc2_.y - _loc3_.y,_loc2_.x - _loc3_.x);
               _loc5_ = new §_-PN§();
               _loc5_.angle = _loc4_;
               _loc5_.position = new b2Vec2(param1[5][2].x,param1[5][2].y);
               _loc5_.playerId = this.hero.id;
               _loc5_.§_-JU§ = this.§_-g1a§;
               (_loc5_ as GameBody).linearVelocity = new b2Vec2(Math.cos(_loc4_) * (_loc5_ as §_-sn§).maxVelocity,Math.sin(_loc4_) * (_loc5_ as §_-sn§).maxVelocity);
               this.hero.game.map.add(_loc5_);
               _loc5_.build(this.hero.game.world);
               this.§_-g1a§ = _loc5_;
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
   }
}

