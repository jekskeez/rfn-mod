package §_-dc§
{
   import §_-k1c§.§_-Q13§;
   import §_-xm§.§_-53k§;
   import §_-xm§.§_-hX§;
   import events.§_-E2i§;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import views.§_-K13§;
   
   public class §_-51P§ extends Sprite
   {
      
      private static const §_-Z2E§:int = 100;
      
      private static const §_-h1B§:int = 10;
      
      private static const §_-42K§:int = 60;
      
      private var §_-G2C§:§_-hX§ = null;
      
      private var §_-y4§:§_-Q13§ = null;
      
      private var §_-X1j§:int = 0;
      
      private var §_-81t§:Clan = null;
      
      private var §_-31Z§:int = 0;
      
      private var §_-bH§:Boolean = false;
      
      public var §_-y2y§:Vector.<§_-K13§> = new Vector.<§_-K13§>();
      
      public function §_-51P§()
      {
         super();
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.BUY]);
      }
      
      public function §_-Ra§(param1:Clan) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-y2y§.length)
         {
            if(§_-d1q§.§_-63t§(_loc2_,param1.level))
            {
               this.§_-y2y§[_loc2_].§_-1l§();
            }
            _loc2_++;
         }
         this.§_-81t§ = param1;
         this.§_-31Z§ = this.§_-81t§.size * §_-42K§;
         this.§_-y4§ = new §_-Q13§(gls("Купить новый слот"),gls("Купить новый слот за {0}\nна 24 часа?",this.§_-31Z§),true,this.§_-03a§);
         var _loc3_:ImageIconNut = new ImageIconNut();
         _loc3_.x = 204 + this.§_-31Z§.toString().length * 3;
         _loc3_.y = 13;
         this.§_-y4§.addChild(_loc3_);
         if(this.§_-G2C§)
         {
            this.§_-G2C§.§_-g1B§();
         }
         this.§_-52a§();
      }
      
      public function §_-7g§() : void
      {
         var _loc1_:§_-K13§ = null;
         for each(_loc1_ in this.§_-y2y§)
         {
            _loc1_.§_-o4§();
         }
      }
      
      public function §_-ll§(param1:Boolean) : void
      {
         this.§_-bH§ = param1;
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < §_-d1q§.§_-120§)
         {
            this.§_-y2y§[_loc2_] = new §_-K13§(_loc2_);
            this.§_-y2y§[_loc2_].x = _loc1_;
            this.§_-y2y§[_loc2_].§_-D1v§(§_-d1q§.§_-317§(_loc2_));
            this.§_-y2y§[_loc2_].addEventListener(§_-E2i§.§_-52B§,this.§_-K1p§);
            this.§_-y2y§[_loc2_].addEventListener(§_-E2i§.§_-hS§,this.§_-K1p§);
            addChild(this.§_-y2y§[_loc2_]);
            _loc1_ += §_-Z2E§ + §_-h1B§;
            _loc2_++;
         }
      }
      
      private function §_-52a§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         for each(_loc1_ in this.§_-81t§.§_-G2I§.§_-y2y§)
         {
            this.§_-y2y§[_loc1_["slot_id"]].expires = _loc1_["expires"] + this.§_-81t§.§_-G2I§.§_-rg§;
            this.§_-y2y§[_loc1_["slot_id"]].id = _loc1_["totem_id"];
            if(_loc1_["totem_id"] >= 0)
            {
               _loc2_ = this.§_-81t§.totems.§_-N2m§(_loc1_["totem_id"]);
               if(_loc2_ != null)
               {
                  this.§_-y2y§[_loc1_["slot_id"]].bonus = _loc2_["bonus"];
                  this.§_-y2y§[_loc1_["slot_id"]].§_-a2t§(_loc2_["level"],_loc2_["exp"],_loc2_["max_exp"]);
               }
            }
         }
         if(this.§_-G2C§)
         {
            this.§_-G2C§.§_-g1B§();
         }
      }
      
      private function §_-03a§() : void
      {
         if(Game.self["clan_duty"] == Clan.§_-k1P§ || Game.self["clan_duty"] == Clan.§_-jY§)
         {
            if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).acorns < this.§_-31Z§)
            {
               new §_-53k§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки слота.\nПополните бюджет вашего клана.")).show();
               return;
            }
            Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-D2l§,0,this.§_-31Z§,0,this.§_-X1j§);
            return;
         }
         Game.buy(§_-h2B§.§_-D2l§,0,this.§_-31Z§,0,this.§_-X1j§);
      }
      
      private function §_-K1p§(param1:§_-E2i§) : void
      {
         switch(param1.type)
         {
            case §_-E2i§.§_-52B§:
               this.§_-y4§.show();
               this.§_-X1j§ = param1.number;
               break;
            case §_-E2i§.§_-hS§:
               if(this.§_-G2C§ == null || this.§_-G2C§.§_-11Z§)
               {
                  this.§_-G2C§ = new §_-hX§(param1.number,this.§_-81t§,this.§_-bH§);
               }
               if(this.§_-G2C§.§_-g2O§ != param1.number)
               {
                  this.§_-G2C§.§_-Fp§(param1.number);
               }
               this.§_-G2C§.show();
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1[2])
         {
            case §_-h2B§.§_-D2l§:
               if(param1[0] != §_-S2I§.§_-k2l§)
               {
                  break;
               }
               §_-e2W§.request(this.§_-81t§.id,§_-Oy§.§_-TZ§,true);
         }
      }
   }
}

