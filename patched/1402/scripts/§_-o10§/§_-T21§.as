package §_-o10§
{
   import §_-61C§.§_-a2p§;
   import §_-Q2§.§_-N1y§;
   import §_-X2V§.SquirrelEvent;
   import buttons.§_-11d§;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-T21§ extends §_-Z23§
   {
      
      private static const §_-a1F§:int = 15000;
      
      private var §_-I2G§:§_-11d§;
      
      public function §_-T21§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-q1x§;
         if(!this.§_-53U§ || !this.hero.isSelf)
         {
            return;
         }
         this.§_-I2G§ = new §_-11d§(new PerkShamanButton40());
         this.§_-I2G§.scaleX = this.§_-I2G§.scaleY = 0.75;
         this.§_-I2G§.addEventListener(MouseEvent.CLICK,this.§_-w8§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.§_-I2G§)
         {
            return;
         }
         §_-a2p§.§_-M25§(this.§_-I2G§);
         this.§_-I2G§.removeEventListener(MouseEvent.CLICK,this.§_-w8§);
         this.§_-I2G§ = null;
      }
      
      override public function reset() : void
      {
         super.reset();
         if(this.§_-I2G§)
         {
            §_-a2p§.§_-M25§(this.§_-I2G§);
         }
      }
      
      override public function get maxCountUse() : int
      {
         return §_-bx§();
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-1q§]);
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.§_-I2G§)
         {
            §_-a2p§.§_-Hi§(this.§_-I2G§,gls("Перевернуть балку"),Keyboard.Y);
         }
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-N1y§ = new §_-N1y§();
         _loc1_.aging = !this.§_-53U§;
         if(_loc1_.aging)
         {
            _loc1_.lifeTime = §_-a1F§;
         }
         this.castObject = _loc1_;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if(param1[0] != this.hero.id || !("oneWayTicketTurn" in _loc2_))
               {
                  super.§_-x2f§(param1);
                  return;
               }
               this.§_-j1q§(param1[0]);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function §_-BS§(param1:SquirrelEvent) : void
      {
         var _loc3_:§_-N1y§ = null;
         super.§_-BS§(param1);
         if(!this.hero.shaman)
         {
            return;
         }
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Array = this.hero.game.map.get(§_-N1y§);
         if(_loc2_.length == 0)
         {
            return;
         }
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.playerId == this.hero.id)
            {
               §_-a2p§.§_-Hi§(this.§_-I2G§,gls("Перевернуть балку"),Keyboard.Y);
               return;
            }
         }
      }
      
      private function §_-w8§(param1:MouseEvent) : void
      {
         if(!this.hero.game || this.hero.isDead)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"oneWayTicketTurn":[this.hero.id]}));
      }
      
      private function §_-j1q§(param1:int) : void
      {
         var _loc3_:§_-N1y§ = null;
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Array = this.hero.game.map.get(§_-N1y§);
         if(_loc2_.length == 0)
         {
            return;
         }
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.playerId == param1)
            {
               _loc3_.§_-s2N§();
            }
         }
      }
   }
}

