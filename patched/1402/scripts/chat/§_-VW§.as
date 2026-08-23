package chat
{
   import com.api.Player;
   import com.api.PlayerEvent;
   import protocol.§_-u1O§;
   import utils.§_-B1d§;
   import utils.§_-jb§;
   
   public class §_-VW§ extends §_-g1j§
   {
      
      private var §_-X2q§:Player;
      
      private var §_-pT§:Player;
      
      private var §_-Y1R§:int;
      
      private var §_-j1f§:int;
      
      private var §_-S1e§:int;
      
      private var §_-d2o§:Boolean = false;
      
      private var §_-N0§:Boolean = false;
      
      public function §_-VW§(param1:Player, param2:Player, param3:int, param4:int, param5:int)
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
         super(Game.self,"",§_-j1p§);
         Game.listen(this.§_-v2Z§);
         Game.request(_loc6_,§_-Y2E§.§_-n2H§);
      }
      
      override public function get isNull() : Boolean
      {
         return false;
      }
      
      override protected function draw(param1:Boolean = true) : void
      {
         switch(this.§_-Y1R§)
         {
            case §_-u1O§.§_-K1q§:
               this.text = gls("Игроку {0} заблокирован чат{1}{2}",this.§_-X2q§.name,this.§_-j1f§ > 0 ? gls(" на {0}",§_-B1d§.§_-j1x§(this.§_-j1f§)) : "",!this.§_-pT§ ? "" : gls(" модератором c ID{0}. Причина: {1}",this.§_-pT§.id,§_-jb§.§_-tJ§(this.§_-S1e§)));
               break;
            case §_-u1O§.§_-oH§:
            case §_-u1O§.§_-03D§:
               this.text = gls("Игрок {0} заблокирован{1} модератором c ID{2}. Причина: {3}",this.§_-X2q§.name,this.§_-j1f§ > 0 ? gls(" на {0}",§_-B1d§.§_-j1x§(this.§_-j1f§)) : "",this.§_-pT§.id,§_-jb§.§_-tJ§(this.§_-S1e§));
         }
         super.draw(param1);
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
         _loc2_.removeEventListener(§_-Y16§);
         if(!this.§_-d2o§ || !this.§_-N0§)
         {
            return;
         }
         this.draw();
         Game.forget(this.§_-v2Z§);
      }
   }
}

