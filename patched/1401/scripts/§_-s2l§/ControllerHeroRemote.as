package §_-s2l§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.ui.Keyboard;
   import game.mainGame.§_-v0§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class ControllerHeroRemote extends §_-z2c§
   {
      
      private static const §_-u1q§:Number = 0.5;
      
      private static const §_-zE§:Number = 5;
      
      private var playerId:int;
      
      public function ControllerHeroRemote(param1:§_-11k§, param2:int)
      {
         §_-TQ§.add("ControllerHeroRemote.ControllerHeroRemote " + param2);
         super(param1);
         param1.§_-T1T§(this);
         this.playerId = param2;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-G20§,§_-S2I§.§_-325§,§_-S2I§.§_-F2m§,§_-S2I§.§_-j1U§]);
      }
      
      override public function remove() : void
      {
         §_-TQ§.add("ControllerHeroRemote.remove " + this.playerId);
         super.remove();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-G20§,§_-S2I§.§_-325§,§_-S2I§.§_-F2m§,§_-S2I§.§_-j1U§]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         switch(param1.type)
         {
            case §_-S2I§.§_-G20§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               this.hero.§_-I5§();
               break;
            case §_-S2I§.§_-325§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               _loc2_ = new b2Vec2(param1[2],param1[3]);
               _loc3_ = _loc2_.Copy();
               _loc3_.Subtract(this.hero.position);
               if(_loc3_.Length() > §_-u1q§ && _loc3_.Length() < §_-zE§)
               {
                  this.hero.§_-dq§(_loc3_);
               }
               else
               {
                  this.hero.§_-dq§(null);
                  this.hero.position = _loc2_;
               }
               this.hero.velocity = new b2Vec2(param1[4],param1[5]);
               this.hero.§_-I5§();
               if(6 in param1 && this.hero is §_-v0§)
               {
                  (this.hero as §_-v0§).health = param1[6];
               }
               _loc4_ = param1[1] << 24 >> 24;
               _loc5_ = _loc4_ > 0;
               _loc4_ = (_loc4_ ^ _loc4_ >> 31) - (_loc4_ >> 31);
               switch(_loc4_)
               {
                  case Keyboard.W:
                  case Keyboard.SPACE:
                  case Keyboard.UP:
                     if(this.§_-i1y§)
                     {
                        return;
                     }
                     this.hero.jump(_loc5_);
                     break;
                  case Keyboard.A:
                  case Keyboard.LEFT:
                     if(this.§_-i1y§)
                     {
                        return;
                     }
                     this.hero.moveLeft(_loc5_);
                     break;
                  case Keyboard.D:
                  case Keyboard.RIGHT:
                     if(this.§_-i1y§)
                     {
                        return;
                     }
                     this.hero.moveRight(_loc5_);
                     break;
                  case Keyboard.F1:
                  case Keyboard.F2:
                  case Keyboard.F3:
                  case Keyboard.F4:
                     this.hero.§_-Ci§(_loc4_ - 111);
               }
               break;
            case §_-S2I§.§_-F2m§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               this.hero.§_-dq§(null);
               hero.position = new b2Vec2(param1[1],param1[2]);
               hero.velocity = new b2Vec2();
               break;
            case §_-S2I§.§_-j1U§:
               if(param1[0] != this.playerId)
               {
                  break;
               }
               this.hero.§_-Ci§(param1[1] + Hero.§_-wo§);
         }
      }
   }
}

