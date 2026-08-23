package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-R§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-e1m§ extends §_-H2N§
   {
      
      public function §_-e1m§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
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
            if(!(_loc1_.isDead || _loc1_.isHare || _loc1_.isScrat || !_loc1_.§_-426§ || _loc1_.id == this.hero.id))
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
         return super.available && !this.hero.§_-426§ && this.target != 0;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  break;
               }
               if(param1[1] != this.§_-i2D§)
               {
                  return;
               }
               if(this.hero.id != param1[0])
               {
                  return;
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               if("4" in param1)
               {
                  if(this.isSelf)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
                     this.hero.§_-4j§(Hero.§_-517§);
                  }
                  _loc2_ = this.hero.game.squirrels.get(param1[4]);
                  if(param1[4] == Game.selfId)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-y2K§);
                     GameSounds.play(§_-VU§);
                     _loc2_.§_-4j§(Hero.§_-VP§);
                  }
               }
               else
               {
                  _loc2_ = this.hero;
               }
               §_-92z§.sendMessage(this.hero.id,"","4" in param1 ? §_-A1n§.§_-us§ : §_-A1n§.§_-61t§);
               _loc2_.behaviourController.§_-gz§(new §_-R§(2));
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
   }
}

