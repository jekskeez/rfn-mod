package §_-83V§
{
   import §_-I10§.§_-k1C§;
   import §_-P2b§.§_-6L§;
   import §_-R1w§.DetectHeroEvent;
   import §_-Rj§.§_-A32§;
   import §_-qJ§.§_-f2w§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-n19§ extends §_-o29§
   {
      
      private var §_-C5§:§_-f2w§ = null;
      
      public function §_-n19§()
      {
         super();
         if(Boolean(Hero.self) && Boolean(Hero.self.perkController) && Hero.self.perkController.§_-e4§(§_-6L§.§_-61p§) != -1)
         {
            this.getStarlingView().alpha = 0.5;
            this.alpha = 0.5;
            this.filters = [];
         }
         Connection.listen(this.§_-X24§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-X24§,[§_-S2I§.§_-b1y§]);
         if(this.§_-C5§)
         {
            this.§_-C5§.dispose();
         }
      }
      
      override protected function §_-5d§(param1:DetectHeroEvent) : void
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
         if(§_-k1C§.§_-G1c§[this.itemId].count >= §_-e2Z§ || this.§_-42S§ || §_-k1C§.§_-Zy§)
         {
            return;
         }
         if(!param1.hero.isHare)
         {
            _loc2_ = Math.random() * §_-43Z§.§_-K1K§.length;
            GameSounds.play(§_-43Z§.§_-K1K§[_loc2_]);
         }
         this.§_-42S§ = true;
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-yk§(param1.hero);
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"CollectMirage":[this.id,param1.hero.id]}));
      }
      
      override protected function §_-b16§() : void
      {
         this.alpha = 0;
         this.§_-C5§ = new §_-f2w§(this.itemId,super.§_-b16§);
         this.§_-C5§.alpha = 0.2;
         §_-83v§(this.§_-C5§);
      }
      
      private function §_-X24§(param1:§_-S2I§) : void
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
         var _loc3_:Hero = this.§_-H2D§.squirrels.get(_loc2_["CollectMirage"][1]);
         this.§_-yk§(_loc3_);
      }
      
      private function §_-yk§(param1:Hero) : void
      {
         if(Boolean(param1) && Boolean(!param1.isDead) && !param1.inHollow)
         {
            param1.heroView.§_-Hl§(param1,this.itemId);
         }
         if(Boolean(this.§_-H2D§) && Boolean(this.§_-H2D§.map))
         {
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
   }
}

