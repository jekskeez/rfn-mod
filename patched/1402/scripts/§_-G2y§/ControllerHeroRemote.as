package §_-G2y§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.ui.Keyboard;
   import game.mainGame.§_-R2k§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class ControllerHeroRemote extends §_-53o§
   {
      
      private static const §_-318§:Number = 0.5;
      
      private static const §_-QL§:Number = 5;
      
      private var playerId:int;
      
      public function ControllerHeroRemote(param1:§_-V2D§, param2:int)
      {
         §_-p2U§.add("ControllerHeroRemote.ControllerHeroRemote " + param2);
         super(param1);
         param1.§_-21b§(this);
         this.playerId = param2;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-P24§,§_-s2l§.§_-D1P§,§_-s2l§.§_-v1r§,§_-s2l§.§_-q13§]);
      }
      
      override public function remove() : void
      {
         §_-p2U§.add("ControllerHeroRemote.remove " + this.playerId);
         super.remove();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-P24§,§_-s2l§.§_-D1P§,§_-s2l§.§_-v1r§,§_-s2l§.§_-q13§]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         switch(param1.type)
         {
            case §_-s2l§.§_-P24§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               this.hero.§_-RM§();
               break;
            case §_-s2l§.§_-D1P§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               _loc2_ = new b2Vec2(param1[2],param1[3]);
               _loc3_ = _loc2_.Copy();
               _loc3_.Subtract(this.hero.position);
               if(_loc3_.Length() > §_-318§ && _loc3_.Length() < §_-QL§)
               {
                  this.hero.§_-k2Y§(_loc3_);
               }
               else
               {
                  this.hero.§_-k2Y§(null);
                  this.hero.position = _loc2_;
               }
               this.hero.velocity = new b2Vec2(param1[4],param1[5]);
               this.hero.§_-RM§();
               if(6 in param1 && this.hero is §_-R2k§)
               {
                  (this.hero as §_-R2k§).health = param1[6];
               }
               _loc4_ = param1[1] << 24 >> 24;
               _loc5_ = _loc4_ > 0;
               _loc4_ = (_loc4_ ^ _loc4_ >> 31) - (_loc4_ >> 31);
               switch(_loc4_)
               {
                  case Keyboard.W:
                  case Keyboard.SPACE:
                  case Keyboard.UP:
                     if(this.§_-22g§)
                     {
                        return;
                     }
                     this.hero.jump(_loc5_);
                     break;
                  case Keyboard.A:
                  case Keyboard.LEFT:
                     if(this.§_-22g§)
                     {
                        return;
                     }
                     this.hero.moveLeft(_loc5_);
                     break;
                  case Keyboard.D:
                  case Keyboard.RIGHT:
                     if(this.§_-22g§)
                     {
                        return;
                     }
                     this.hero.moveRight(_loc5_);
                     break;
                  case Keyboard.F1:
                  case Keyboard.F2:
                  case Keyboard.F3:
                  case Keyboard.F4:
                     this.hero.§_-73j§(_loc4_ - 111);
               }
               break;
            case §_-s2l§.§_-v1r§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               this.hero.§_-k2Y§(null);
               hero.position = new b2Vec2(param1[1],param1[2]);
               hero.velocity = new b2Vec2();
               break;
            case §_-s2l§.§_-q13§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               this.hero.§_-73j§(param1[1] + Hero.§_-113§);
         }
      }
   }
}

