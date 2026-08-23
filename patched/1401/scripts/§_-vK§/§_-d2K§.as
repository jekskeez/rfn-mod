package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-AR§;
   
   public class §_-d2K§ extends §_-q4§
   {
      
      private static const §_-P1o§:int = 3;
      
      public static const §_-P2q§:int = 120;
      
      private var delayTime:Number = 0;
      
      private var §_-vR§:§_-AR§ = new §_-AR§();
      
      private var §_-Z1i§:Boolean = false;
      
      private var §_-7c§:int = 0;
      
      public function §_-d2K§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-mg§;
      }
      
      override public function dispose() : void
      {
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-62z§,this.§_-U1m§);
         }
         super.dispose();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-vR§.start = 0;
         this.§_-vR§.radius = 18;
         this.§_-vR§.x = 17;
         this.§_-vR§.y = 17;
         this.§_-vR§.color = 16711680;
         this.§_-vR§.alpha = 0.5;
         this.buff.addChild(this.§_-vR§);
         this.hero.addEventListener(SquirrelEvent.§_-62z§,this.§_-U1m§);
         this.§_-230§();
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-W1O§,§_-S2I§.§_-Vs§,§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§];
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Hero = null;
         var _loc4_:int = 0;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-W1O§:
               if(param1[0] != §_-S2I§.§_-JF§)
               {
                  this.§_-Z1i§ = false;
                  this.§_-7c§ = 0;
               }
               if(param1[0] != §_-S2I§.ROUND_START)
               {
                  return;
               }
               this.§_-230§();
               break;
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1 || param1[1] == this.hero.id)
               {
                  return;
               }
               if(++this.§_-7c§ >= §_-P1o§)
               {
                  this.§_-Z1i§ = true;
               }
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-R28§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-F2m§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               if(!this.hero || !this.hero.game)
               {
                  return;
               }
               _loc2_ = this.hero.game.squirrels.players;
               for each(_loc3_ in _loc2_)
               {
                  if(!(!_loc3_ || _loc3_.isDead || _loc3_.inHollow || !_loc3_.shaman))
                  {
                     _loc4_ = 0;
                     while(_loc4_ < _loc3_.§_-515§.length)
                     {
                        if(_loc3_.§_-515§[_loc4_] is §_-Z1z§ && _loc3_.§_-515§[_loc4_] != this && _loc3_.§_-515§[_loc4_].active)
                        {
                           return;
                        }
                        _loc4_++;
                     }
                  }
               }
               this.§_-U1m§();
         }
      }
      
      private function §_-U1m§(param1:Event = null) : void
      {
         if(!this.active || !this.§_-Z1i§)
         {
            return;
         }
         if(this.delayTime > 0)
         {
            return;
         }
         if(!this.hero || !this.hero.isSelf)
         {
            return;
         }
         if(!this.§_-41W§ && !this.hero.§_-426§)
         {
            return;
         }
         if(!this.hero.game || !this.hero.game.squirrels || !this.hero.game.map)
         {
            return;
         }
         if(this.hero.game.squirrels.§_-k8§().length != 0)
         {
            return;
         }
         if(this.§_-41W§ && !this.hero.§_-426§ && this.§_-7c§ >= §_-P1o§)
         {
            this.hero.§_-4j§(Hero.§_-517§);
            Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
         }
         setTimeout(this.§_-42Q§,0);
      }
      
      private function §_-42Q§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.onHollow(this.hero.team);
         Connection.§_-Li§(§_-h2B§.§_-Vs§,this.hero.team);
      }
      
      private function get §_-22G§() : int
      {
         return §_-P2q§ - §_-Nu§();
      }
      
      private function §_-230§() : void
      {
         this.delayTime = this.§_-22G§;
         this.§_-Z1i§ = false;
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(!this.isSelf)
         {
            return;
         }
         if(!this.active)
         {
            return;
         }
         super.update(param1);
         if(this.delayTime >= 0)
         {
            this.delayTime -= param1;
            this.§_-vR§.end = Math.PI * 2 * (1 - this.delayTime / this.§_-22G§);
         }
         else
         {
            this.§_-U1m§();
         }
      }
   }
}

