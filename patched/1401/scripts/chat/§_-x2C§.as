package chat
{
   import com.api.Player;
   import com.api.PlayerEvent;
   import protocol.§_-h2B§;
   import utils.§_-d1C§;
   import utils.§_-ex§;
   
   public class §_-x2C§ extends §_-A1n§
   {
      
      private var §_-L25§:Player;
      
      private var §_-736§:Player;
      
      private var §_-Gu§:int;
      
      private var §_-31l§:int;
      
      private var §_-u2Q§:int;
      
      private var §_-P2O§:Boolean = false;
      
      private var §_-R1S§:Boolean = false;
      
      public function §_-x2C§(param1:Player, param2:Player, param3:int, param4:int, param5:int)
      {
         this.§_-L25§ = param1;
         this.§_-736§ = param2;
         this.§_-31l§ = param3;
         this.§_-Gu§ = param4;
         this.§_-u2Q§ = param5;
         var _loc6_:Array = [this.§_-L25§["id"]];
         if(param2 != null)
         {
            _loc6_.push(this.§_-736§["id"]);
         }
         else
         {
            this.§_-R1S§ = true;
         }
         super(Game.self,"",§_-N1c§);
         Game.listen(this.§_-eA§);
         Game.request(_loc6_,§_-hF§.§_-31q§);
      }
      
      override public function get isNull() : Boolean
      {
         return false;
      }
      
      override protected function draw(param1:Boolean = true) : void
      {
         switch(this.§_-Gu§)
         {
            case §_-h2B§.§_-c26§:
               this.text = gls("Игроку {0} заблокирован чат{1}{2}",this.§_-L25§.name,this.§_-31l§ > 0 ? gls(" на {0}",§_-ex§.§_-M1D§(this.§_-31l§)) : "",!this.§_-736§ ? "" : gls(" модератором c ID{0}. Причина: {1}",this.§_-736§.id,§_-d1C§.§_-is§(this.§_-u2Q§)));
               break;
            case §_-h2B§.§_-YT§:
            case §_-h2B§.§_-03c§:
               this.text = gls("Игрок {0} заблокирован{1} модератором c ID{2}. Причина: {3}",this.§_-L25§.name,this.§_-31l§ > 0 ? gls(" на {0}",§_-ex§.§_-M1D§(this.§_-31l§)) : "",this.§_-736§.id,§_-d1C§.§_-is§(this.§_-u2Q§));
         }
         super.draw(param1);
      }
      
      private function §_-eA§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!_loc2_.isLoaded(§_-hF§.§_-31q§))
         {
            return;
         }
         if(this.§_-L25§["id"] == _loc2_["id"])
         {
            this.§_-P2O§ = true;
            this.§_-L25§ = _loc2_;
         }
         if(Boolean(this.§_-736§) && this.§_-736§["id"] == _loc2_["id"])
         {
            this.§_-R1S§ = true;
            this.§_-736§ = _loc2_;
         }
         _loc2_.removeEventListener(§_-P9§);
         if(!this.§_-P2O§ || !this.§_-R1S§)
         {
            return;
         }
         this.draw();
         Game.forget(this.§_-eA§);
      }
   }
}

