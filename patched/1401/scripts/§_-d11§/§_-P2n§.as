package §_-d11§
{
   import §_-8I§.CastEvent;
   import §_-R1w§.DetectHeroEvent;
   import §_-T1r§.§_-i1L§;
   import game.§_-s2v§;
   import game.mainGame.§_-bM§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-P2n§ extends §_-72C§
   {
      
      public static const §_-535§:int = 2;
      
      private static const §_-S12§:Number = 15;
      
      public function §_-P2n§()
      {
         super();
      }
      
      override protected function §_-b2H§() : void
      {
         this.view = new §_-s2v§(new GrenadePoiseRespawnImage());
         this.view.x = -17;
         this.view.y = -17;
         §_-83v§(this.view);
      }
      
      override protected function §_-33j§(param1:DetectHeroEvent) : Boolean
      {
         var _loc2_:§_-bM§ = param1.hero.§_-l2U§.§_-43X§(§_-UT§,§_-bM§.§_-t2G§);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.count >= §_-bM§.§_-a2a§(§_-UT§);
         return !_loc3_;
      }
      
      override protected function §_-O1L§(param1:DetectHeroEvent) : void
      {
         param1.hero.§_-l2U§.add(new §_-bM§(§_-UT§,§_-bM§.§_-t2G§,§_-535§));
         if(this.§_-H2D§.cast.castObject == null)
         {
            this.§_-H2D§.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-UT§));
         }
      }
      
      override protected function §_-91c§(param1:§_-i1L§) : void
      {
         if(!param1.isSelf)
         {
            return;
         }
         param1.§_-l2U§.add(new §_-bM§(§_-UT§,§_-bM§.§_-t2G§,§_-535§));
         if(this.§_-H2D§.cast.castObject == null)
         {
            this.§_-H2D§.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-UT§));
         }
      }
      
      override protected function §_-Dm§(param1:DetectHeroEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"GetGrenadePoise":[this.id,param1.hero.id]}));
         if(param1.hero.isSelf)
         {
            Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-Y2p§,1);
         }
      }
      
      override protected function §_-N24§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"RespawnGrenadePoise":[this.id]}));
      }
      
      override protected function §_-7P§(param1:Object) : Array
      {
         if("GetGrenadePoise" in param1)
         {
            return param1["GetGrenadePoise"];
         }
         return null;
      }
      
      override protected function §_-Q1b§(param1:Object) : Array
      {
         if("RespawnGrenadePoise" in param1)
         {
            return param1["RespawnGrenadePoise"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-S12§;
      }
   }
}

