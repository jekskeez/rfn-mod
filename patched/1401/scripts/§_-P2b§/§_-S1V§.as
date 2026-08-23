package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-u2r§.§_-t2L§;
   import protocol.§_-S2I§;
   
   public class §_-S1V§ extends §_-x2Q§
   {
      
      public function §_-S1V§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
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
         return JSON.stringify(this.§_-92A§);
      }
      
      override protected function get maxRadius() : Number
      {
         return 100;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:§_-t2L§ = null;
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
               _loc2_ = new b2Vec2(param1[5].x,param1[5].y);
               _loc3_ = new §_-t2L§();
               _loc3_.position = _loc2_;
               _loc3_.playerId = this.hero.id;
               this.hero.game.map.add(_loc3_);
               _loc3_.build(this.hero.game.world);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
   }
}

