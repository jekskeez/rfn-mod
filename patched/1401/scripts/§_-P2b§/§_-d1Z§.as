package §_-P2b§
{
   import §_-33r§.§_-ev§;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   
   public class §_-d1Z§ extends §_-71e§
   {
      
      public function §_-d1Z§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "vader";
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
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
               if(param1[2] == §_-S2I§.§_-EY§)
               {
                  _loc2_ = this.hero.game.squirrels.get(param1[4]);
                  if(param1[4] == Game.self.id)
                  {
                     GameSounds.play("vader");
                  }
                  if(_loc2_)
                  {
                     _loc2_.behaviourController.§_-gz§(new §_-ev§(7,3,0.1));
                  }
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override protected function §_-qu§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.isDead && !param1.inHollow;
      }
   }
}

