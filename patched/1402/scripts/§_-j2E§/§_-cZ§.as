package §_-j2E§
{
   import §_-Cc§.§_-nK§;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   
   public class §_-cZ§ extends §_-l2A§
   {
      
      public function §_-cZ§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "vader";
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
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
               if(param1[2] == §_-s2l§.§_-x2Y§)
               {
                  _loc2_ = this.hero.game.squirrels.get(param1[4]);
                  if(param1[4] == Game.self.id)
                  {
                     GameSounds.play("vader");
                  }
                  if(_loc2_)
                  {
                     _loc2_.behaviourController.§_-W10§(new §_-nK§(7,3,0.1));
                  }
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.isDead && !param1.inHollow;
      }
   }
}

