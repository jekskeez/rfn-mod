package §_-o10§
{
   import §_-X2V§.SquirrelEvent;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-45§;
   
   public class §_-OL§ extends §_-Vd§
   {
      
      private static const §_-lj§:int = 3;
      
      public static const §_-hp§:int = 120;
      
      private var delayTime:Number = 0;
      
      private var §_-Vi§:§_-45§ = new §_-45§();
      
      private var §_-p1R§:Boolean = false;
      
      private var §_-F17§:int = 0;
      
      public function §_-OL§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-01V§;
      }
      
      override public function dispose() : void
      {
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-Xw§,this.§_-I26§);
         }
         super.dispose();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-Vi§.start = 0;
         this.§_-Vi§.radius = 18;
         this.§_-Vi§.x = 17;
         this.§_-Vi§.y = 17;
         this.§_-Vi§.color = 16711680;
         this.§_-Vi§.alpha = 0.5;
         this.buff.addChild(this.§_-Vi§);
         this.hero.addEventListener(SquirrelEvent.§_-Xw§,this.§_-I26§);
         this.§_-71S§();
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-p1K§,§_-s2l§.§_-n1f§,§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§];
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
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
            case §_-s2l§.§_-p1K§:
               if(param1[0] != §_-s2l§.§_-F2f§)
               {
                  this.§_-p1R§ = false;
                  this.§_-F17§ = 0;
               }
               if(param1[0] != §_-s2l§.ROUND_START)
               {
                  return;
               }
               this.§_-71S§();
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1 || param1[1] == this.hero.id)
               {
                  return;
               }
               if(++this.§_-F17§ >= §_-lj§)
               {
                  this.§_-p1R§ = true;
               }
               this.§_-I26§();
               break;
            case §_-s2l§.§_-V1b§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               this.§_-I26§();
               break;
            case §_-s2l§.§_-v1r§:
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
                     while(_loc4_ < _loc3_.§_-ov§.length)
                     {
                        if(_loc3_.§_-ov§[_loc4_] is §_-K2e§ && _loc3_.§_-ov§[_loc4_] != this && _loc3_.§_-ov§[_loc4_].active)
                        {
                           return;
                        }
                        _loc4_++;
                     }
                  }
               }
               this.§_-I26§();
         }
      }
      
      private function §_-I26§(param1:Event = null) : void
      {
         if(!this.active || !this.§_-p1R§)
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
         if(!this.§_-53U§ && !this.hero.§_-62F§)
         {
            return;
         }
         if(!this.hero.game || !this.hero.game.squirrels || !this.hero.game.map)
         {
            return;
         }
         if(this.hero.game.squirrels.§_-qb§().length != 0)
         {
            return;
         }
         if(this.§_-53U§ && !this.hero.§_-62F§ && this.§_-F17§ >= §_-lj§)
         {
            this.hero.§_-I1u§(Hero.§_-43e§);
            Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
         }
         setTimeout(this.§_-Mb§,0);
      }
      
      private function §_-Mb§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.onHollow(this.hero.team);
         Connection.§_-e2T§(§_-u1O§.§_-n1f§,this.hero.team);
      }
      
      private function get §_-h2V§() : int
      {
         return §_-hp§ - §_-bx§();
      }
      
      private function §_-71S§() : void
      {
         this.delayTime = this.§_-h2V§;
         this.§_-p1R§ = false;
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
            this.§_-Vi§.end = Math.PI * 2 * (1 - this.delayTime / this.§_-h2V§);
         }
         else
         {
            this.§_-I26§();
         }
      }
   }
}

