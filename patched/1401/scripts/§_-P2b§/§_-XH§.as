package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-u2r§.§_-8W§;
   import flash.geom.Point;
   import game.mainGame.entity.§_-314§;
   import protocol.§_-S2I§;
   
   public class §_-XH§ extends §_-x2Q§
   {
      
      protected var §_-Xv§:§_-8W§ = null;
      
      public function §_-XH§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "spider";
         this.§_-mw§ = true;
      }
      
      override public function get json() : String
      {
         if(this.active)
         {
            return "";
         }
         var _loc1_:Point = this.hero.heroView.localToGlobal(new Point(0,-20));
         var _loc2_:Point = new Point(this.hero.position.x,this.hero.position.y);
         return JSON.stringify([this.§_-k2C§,new Point(_loc1_.x,_loc1_.y),_loc2_]);
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:§_-8W§ = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               if(param1[2] != §_-S2I§.§_-EY§)
               {
                  return;
               }
               _loc2_ = new b2Vec2(param1[5][0].x,param1[5][0].y);
               _loc3_ = new Point(param1[5][1].x,param1[5][1].y);
               _loc4_ = Math.atan2(_loc2_.y - _loc3_.y,_loc2_.x - _loc3_.x);
               _loc5_ = new §_-8W§();
               _loc5_.angle = _loc4_;
               _loc5_.position = new b2Vec2(param1[5][2].x,param1[5][2].y);
               _loc5_.playerId = this.hero.id;
               _loc5_.§_-4d§ = this.§_-Xv§;
               (_loc5_ as GameBody).linearVelocity = new b2Vec2(Math.cos(_loc4_) * (_loc5_ as §_-314§).maxVelocity,Math.sin(_loc4_) * (_loc5_ as §_-314§).maxVelocity);
               this.hero.game.map.add(_loc5_);
               _loc5_.build(this.hero.game.world);
               this.§_-Xv§ = _loc5_;
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
   }
}

