package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   import §_-S1D§.§_-O1M§;
   import §_-b1B§.§_-gf§;
   import buttons.§_-Uo§;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-E1o§ extends §_-O2o§
   {
      
      private static const §_-A3F§:int = 15000;
      
      private var §_-7k§:§_-Uo§;
      
      public function §_-E1o§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-a1o§;
         if(!this.§_-41W§ || !this.hero.isSelf)
         {
            return;
         }
         this.§_-7k§ = new §_-Uo§(new PerkShamanButton40());
         this.§_-7k§.scaleX = this.§_-7k§.scaleY = 0.75;
         this.§_-7k§.addEventListener(MouseEvent.CLICK,this.§_-63I§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.§_-7k§)
         {
            return;
         }
         §_-O1M§.§_-q1z§(this.§_-7k§);
         this.§_-7k§.removeEventListener(MouseEvent.CLICK,this.§_-63I§);
         this.§_-7k§ = null;
      }
      
      override public function reset() : void
      {
         super.reset();
         if(this.§_-7k§)
         {
            §_-O1M§.§_-q1z§(this.§_-7k§);
         }
      }
      
      override public function get maxCountUse() : int
      {
         return §_-Nu§();
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-b1y§]);
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.§_-7k§)
         {
            §_-O1M§.§_-82o§(this.§_-7k§,gls("Перевернуть балку"),Keyboard.Y);
         }
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-gf§ = new §_-gf§();
         _loc1_.aging = !this.§_-41W§;
         if(_loc1_.aging)
         {
            _loc1_.lifeTime = §_-A3F§;
         }
         this.castObject = _loc1_;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-b1y§:
               _loc2_ = param1[1];
               if(param1[0] != this.hero.id || !("oneWayTicketTurn" in _loc2_))
               {
                  super.§_-o2C§(param1);
                  return;
               }
               this.§_-q18§(param1[0]);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override protected function §_-S2Z§(param1:SquirrelEvent) : void
      {
         var _loc3_:§_-gf§ = null;
         super.§_-S2Z§(param1);
         if(!this.hero.shaman)
         {
            return;
         }
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Array = this.hero.game.map.get(§_-gf§);
         if(_loc2_.length == 0)
         {
            return;
         }
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.playerId == this.hero.id)
            {
               §_-O1M§.§_-82o§(this.§_-7k§,gls("Перевернуть балку"),Keyboard.Y);
               return;
            }
         }
      }
      
      private function §_-63I§(param1:MouseEvent) : void
      {
         if(!this.hero.game || this.hero.isDead)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"oneWayTicketTurn":[this.hero.id]}));
      }
      
      private function §_-q18§(param1:int) : void
      {
         var _loc3_:§_-gf§ = null;
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Array = this.hero.game.map.get(§_-gf§);
         if(_loc2_.length == 0)
         {
            return;
         }
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.playerId == param1)
            {
               _loc3_.§_-g2S§();
            }
         }
      }
   }
}

