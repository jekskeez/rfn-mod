package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-F1B§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-Z1J§ extends §_-92f§
   {
      
      public function §_-Z1J§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override public function get target() : int
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(_loc1_.isDead || _loc1_.isHare || _loc1_.isScrat || !_loc1_.§_-62F§ || _loc1_.id == this.hero.id))
            {
               _loc2_ = _loc1_.position.Copy();
               _loc2_.Subtract(this.hero.position);
               if(_loc2_.Length() <= 9)
               {
                  return _loc1_.id;
               }
            }
         }
         return super.target;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.§_-62F§ && this.target != 0;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  break;
               }
               if(param1[1] != this.§_-T2a§)
               {
                  return;
               }
               if(this.hero.id != param1[0])
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               if("4" in param1)
               {
                  if(this.isSelf)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
                     this.hero.§_-I1u§(Hero.§_-43e§);
                  }
                  _loc2_ = this.hero.game.squirrels.get(param1[4]);
                  if(param1[4] == Game.selfId)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-D7§);
                     GameSounds.play(§_-7d§);
                     _loc2_.§_-I1u§(Hero.§_-z2T§);
                  }
               }
               else
               {
                  _loc2_ = this.hero;
               }
               §_-u24§.sendMessage(this.hero.id,"","4" in param1 ? §_-g1j§.§_-62i§ : §_-g1j§.§_-X6§);
               _loc2_.behaviourController.§_-W10§(new §_-F1B§(2));
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
   }
}

