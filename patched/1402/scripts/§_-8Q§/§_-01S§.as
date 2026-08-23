package §_-8Q§
{
   import §_-921§.§_-U2R§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X1k§.§_-WS§;
   import §_-j2E§.§_-A11§;
   import §_-l2u§.§_-62b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-01S§ extends §_-u1i§
   {
      
      private var §_-m2M§:§_-U2R§ = null;
      
      public function §_-01S§()
      {
         super();
         if(Boolean(Hero.self) && Boolean(Hero.self.perkController) && Hero.self.perkController.§_-S1Q§(§_-A11§.§_-u11§) != -1)
         {
            this.getStarlingView().alpha = 0.5;
            this.alpha = 0.5;
            this.filters = [];
         }
         Connection.listen(this.§_-K29§,[§_-s2l§.§_-1q§]);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-K29§,[§_-s2l§.§_-1q§]);
         if(this.§_-m2M§)
         {
            this.§_-m2M§.dispose();
         }
      }
      
      override protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.hero.id != Game.selfId && param1.hero.id > 0)
         {
            return;
         }
         if(!this.available)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.shaman)
         {
            return;
         }
         if(this.itemId < 0)
         {
            return;
         }
         if(§_-WS§.§_-2P§[this.itemId].count >= §_-f1j§ || this.§_-D27§ || §_-WS§.§_-m1b§)
         {
            return;
         }
         if(!param1.hero.isHare)
         {
            _loc2_ = Math.random() * §_-RH§.§_-R22§.length;
            GameSounds.play(§_-RH§.§_-R22§[_loc2_]);
         }
         this.§_-D27§ = true;
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-J1l§(param1.hero);
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"CollectMirage":[this.id,param1.hero.id]}));
      }
      
      override protected function §_-th§() : void
      {
         this.alpha = 0;
         this.§_-m2M§ = new §_-U2R§(this.itemId,super.§_-th§);
         this.§_-m2M§.alpha = 0.2;
         §_-J2J§(this.§_-m2M§);
      }
      
      private function §_-K29§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if(!("CollectMirage" in _loc2_))
         {
            return;
         }
         if(_loc2_["CollectMirage"][0] != this.id)
         {
            return;
         }
         var _loc3_:Hero = this.§_-21H§.squirrels.get(_loc2_["CollectMirage"][1]);
         this.§_-J1l§(_loc3_);
      }
      
      private function §_-J1l§(param1:Hero) : void
      {
         if(Boolean(param1) && Boolean(!param1.isDead) && !param1.inHollow)
         {
            param1.heroView.§_-83Z§(param1,this.itemId);
         }
         if(Boolean(this.§_-21H§) && Boolean(this.§_-21H§.map))
         {
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
   }
}

