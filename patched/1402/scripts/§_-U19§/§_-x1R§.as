package §_-U19§
{
   import §_-I18§.§_-D1n§;
   import §_-I18§.§_-hC§;
   import §_-bN§.§_-Fk§;
   import events.§_-52x§;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import views.§_-Q1m§;
   
   public class §_-x1R§ extends Sprite
   {
      
      private static const §_-2o§:int = 100;
      
      private static const §_-d2W§:int = 10;
      
      private static const §_-tH§:int = 60;
      
      private var §_-o11§:§_-D1n§ = null;
      
      private var §_-S2C§:§_-Fk§ = null;
      
      private var §_-y1j§:int = 0;
      
      private var §_-b19§:Clan = null;
      
      private var §_-d1O§:int = 0;
      
      private var §_-I1B§:Boolean = false;
      
      public var §_-42P§:Vector.<§_-Q1m§> = new Vector.<§_-Q1m§>();
      
      public function §_-x1R§()
      {
         super();
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.BUY]);
      }
      
      public function §_-4j§(param1:Clan) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-42P§.length)
         {
            if(§_-su§.§_-i2Z§(_loc2_,param1.level))
            {
               this.§_-42P§[_loc2_].§_-ZK§();
            }
            _loc2_++;
         }
         this.§_-b19§ = param1;
         this.§_-d1O§ = this.§_-b19§.size * §_-tH§;
         this.§_-S2C§ = new §_-Fk§(gls("Купить новый слот"),gls("Купить новый слот за {0}\nна 24 часа?",this.§_-d1O§),true,this.§_-i1q§);
         var _loc3_:ImageIconNut = new ImageIconNut();
         _loc3_.x = 204 + this.§_-d1O§.toString().length * 3;
         _loc3_.y = 13;
         this.§_-S2C§.addChild(_loc3_);
         if(this.§_-o11§)
         {
            this.§_-o11§.§_-m19§();
         }
         this.§_-o2j§();
      }
      
      public function §_-h2E§() : void
      {
         var _loc1_:§_-Q1m§ = null;
         for each(_loc1_ in this.§_-42P§)
         {
            _loc1_.§_-lh§();
         }
      }
      
      public function §_-l13§(param1:Boolean) : void
      {
         this.§_-I1B§ = param1;
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < §_-su§.§_-Z1p§)
         {
            this.§_-42P§[_loc2_] = new §_-Q1m§(_loc2_);
            this.§_-42P§[_loc2_].x = _loc1_;
            this.§_-42P§[_loc2_].§_-p1M§(§_-su§.§_-x2j§(_loc2_));
            this.§_-42P§[_loc2_].addEventListener(§_-52x§.§_-o2f§,this.§_-B13§);
            this.§_-42P§[_loc2_].addEventListener(§_-52x§.§_-825§,this.§_-B13§);
            addChild(this.§_-42P§[_loc2_]);
            _loc1_ += §_-2o§ + §_-d2W§;
            _loc2_++;
         }
      }
      
      private function §_-o2j§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         for each(_loc1_ in this.§_-b19§.§_-Af§.§_-42P§)
         {
            this.§_-42P§[_loc1_["slot_id"]].expires = _loc1_["expires"] + this.§_-b19§.§_-Af§.§_-H1m§;
            this.§_-42P§[_loc1_["slot_id"]].id = _loc1_["totem_id"];
            if(_loc1_["totem_id"] >= 0)
            {
               _loc2_ = this.§_-b19§.totems.§_-51c§(_loc1_["totem_id"]);
               if(_loc2_ != null)
               {
                  this.§_-42P§[_loc1_["slot_id"]].bonus = _loc2_["bonus"];
                  this.§_-42P§[_loc1_["slot_id"]].§_-eV§(_loc2_["level"],_loc2_["exp"],_loc2_["max_exp"]);
               }
            }
         }
         if(this.§_-o11§)
         {
            this.§_-o11§.§_-m19§();
         }
      }
      
      private function §_-i1q§() : void
      {
         if(Game.self["clan_duty"] == Clan.§_-01X§ || Game.self["clan_duty"] == Clan.§_-HJ§)
         {
            if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).acorns < this.§_-d1O§)
            {
               new §_-hC§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки слота.\nПополните бюджет вашего клана.")).show();
               return;
            }
            Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-d0§,0,this.§_-d1O§,0,this.§_-y1j§);
            return;
         }
         Game.buy(§_-u1O§.§_-d0§,0,this.§_-d1O§,0,this.§_-y1j§);
      }
      
      private function §_-B13§(param1:§_-52x§) : void
      {
         switch(param1.type)
         {
            case §_-52x§.§_-o2f§:
               this.§_-S2C§.show();
               this.§_-y1j§ = param1.number;
               break;
            case §_-52x§.§_-825§:
               if(this.§_-o11§ == null || this.§_-o11§.§_-015§)
               {
                  this.§_-o11§ = new §_-D1n§(param1.number,this.§_-b19§,this.§_-I1B§);
               }
               if(this.§_-o11§.§_-G1J§ != param1.number)
               {
                  this.§_-o11§.§_-9Q§(param1.number);
               }
               this.§_-o11§.show();
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1[2])
         {
            case §_-u1O§.§_-d0§:
               if(param1[0] != §_-s2l§.§_-v1E§)
               {
                  break;
               }
               §_-B2U§.request(this.§_-b19§.id,§_-eT§.§_-t1d§,true);
         }
      }
   }
}

