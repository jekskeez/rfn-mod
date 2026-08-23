package chat
{
   import com.api.Player;
   import com.api.PlayerEvent;
   import protocol.§_-u1O§;
   import utils.§_-B1d§;
   import utils.§_-jb§;
   
   public class §_-N2p§ extends §_-EU§
   {
      
      private var §_-X2q§:Player;
      
      private var §_-pT§:Player;
      
      private var §_-Y1R§:int;
      
      private var §_-j1f§:int;
      
      private var §_-S1e§:int;
      
      private var §_-d2o§:Boolean = false;
      
      private var §_-N0§:Boolean = false;
      
      public function §_-N2p§(param1:Player, param2:Player, param3:int, param4:int, param5:int)
      {
         this.§_-X2q§ = param1;
         this.§_-pT§ = param2;
         this.§_-j1f§ = param3;
         this.§_-Y1R§ = param4;
         this.§_-S1e§ = param5;
         var _loc6_:Array = [this.§_-X2q§["id"]];
         if(param2 != null)
         {
            _loc6_.push(this.§_-pT§["id"]);
         }
         else
         {
            this.§_-N0§ = true;
         }
         super(Game.self,"");
         Game.listen(this.§_-v2Z§);
         Game.request(_loc6_,§_-Y2E§.§_-n2H§);
      }
      
      override public function get canAdd() : Boolean
      {
         return this.§_-d2o§ && this.§_-N0§;
      }
      
      override public function get text() : String
      {
         switch(this.§_-Y1R§)
         {
            case §_-u1O§.§_-K1q§:
               this.message = gls("Игроку {0} заблокирован чат{1}{2}",this.§_-X2q§.name,this.§_-j1f§ > 0 ? gls(" на {0}",§_-B1d§.§_-j1x§(this.§_-j1f§)) : "",!this.§_-pT§ ? "" : gls(" модератором c ID{0}. Причина: {1}",this.§_-pT§.id,§_-jb§.§_-tJ§(this.§_-S1e§)));
               break;
            case §_-u1O§.§_-oH§:
            case §_-u1O§.§_-03D§:
               this.message = gls("Игрок {0} заблокирован{1} модератором c ID{2}. Причина: {3}",this.§_-X2q§.name,this.§_-j1f§ > 0 ? gls(" на {0}",§_-B1d§.§_-j1x§(this.§_-j1f§)) : "",this.§_-pT§.id,§_-jb§.§_-tJ§(this.§_-S1e§));
         }
         return "<body><span class = \'service_message\'>" + this.message + "</span></body>";
      }
      
      private function §_-v2Z§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!_loc2_.isLoaded(§_-Y2E§.§_-n2H§))
         {
            return;
         }
         if(this.§_-X2q§["id"] == _loc2_["id"])
         {
            this.§_-d2o§ = true;
            this.§_-X2q§ = _loc2_;
         }
         if(Boolean(this.§_-pT§) && this.§_-pT§["id"] == _loc2_["id"])
         {
            this.§_-N0§ = true;
            this.§_-pT§ = _loc2_;
         }
         if(!this.§_-d2o§ || !this.§_-N0§)
         {
            return;
         }
         Game.forget(this.§_-v2Z§);
      }
   }
}

