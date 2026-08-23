package §_-d11§
{
   import §_-8I§.CastEvent;
   import §_-R1w§.DetectHeroEvent;
   import §_-T1r§.§_-i1L§;
   import game.§_-s2v§;
   import game.mainGame.§_-bM§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-a26§ extends §_-72C§
   {
      
      private static const §_-S12§:int = 15;
      
      public static const §_-535§:int = 3;
      
      public function §_-a26§()
      {
         super();
      }
      
      override protected function §_-b2H§() : void
      {
         this.view = new §_-s2v§(new GravityPoiseRespawnImage());
         this.view.x = -14;
         this.view.y = -14;
         §_-83v§(this.view);
      }
      
      override protected function §_-33j§(param1:DetectHeroEvent) : Boolean
      {
         var _loc2_:§_-bM§ = param1.hero.§_-l2U§.§_-43X§(§_-sS§,§_-bM§.§_-t2G§);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.count >= §_-bM§.§_-a2a§(§_-sS§);
         return !_loc3_;
      }
      
      override protected function §_-O1L§(param1:DetectHeroEvent) : void
      {
         param1.hero.§_-l2U§.add(new §_-bM§(§_-sS§,§_-bM§.§_-t2G§,§_-535§));
         if(this.§_-H2D§.cast.castObject == null)
         {
            this.§_-H2D§.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-sS§));
         }
      }
      
      override protected function §_-91c§(param1:§_-i1L§) : void
      {
         if(param1 != Hero.self)
         {
            return;
         }
         Hero.self.§_-l2U§.add(new §_-bM§(§_-sS§,§_-bM§.§_-t2G§,§_-535§));
         if(this.§_-H2D§.cast.castObject == null)
         {
            this.§_-H2D§.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-sS§));
         }
      }
      
      override protected function §_-Dm§(param1:DetectHeroEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"GetGravityPoise":[this.id,param1.hero.id]}));
         if(param1.hero.id == Game.selfId)
         {
            Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-Y2p§,1);
         }
      }
      
      override protected function §_-N24§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"RespawnGravityPoise":[this.id]}));
      }
      
      override protected function §_-7P§(param1:Object) : Array
      {
         if("GetGravityPoise" in param1)
         {
            return param1["GetGravityPoise"];
         }
         return null;
      }
      
      override protected function §_-Q1b§(param1:Object) : Array
      {
         if("RespawnGravityPoise" in param1)
         {
            return param1["RespawnGravityPoise"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-S12§;
      }
   }
}

