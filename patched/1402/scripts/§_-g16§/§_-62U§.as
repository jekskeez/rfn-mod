package §_-g16§
{
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.CastEvent;
   import §_-cm§.§_-V1t§;
   import game.§_-53v§;
   import game.mainGame.§_-v1N§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-62U§ extends §_-XJ§
   {
      
      private static const §_-t5§:int = 15;
      
      public static const §_-G1v§:int = 3;
      
      public function §_-62U§()
      {
         super();
      }
      
      override protected function §_-AD§() : void
      {
         this.view = new §_-53v§(new GravityPoiseRespawnImage());
         this.view.x = -14;
         this.view.y = -14;
         §_-J2J§(this.view);
      }
      
      override protected function §_-x2V§(param1:DetectHeroEvent) : Boolean
      {
         var _loc2_:§_-v1N§ = param1.hero.§_-h1z§.§_-815§(§_-L1n§,§_-v1N§.§_-W29§);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.count >= §_-v1N§.§_-O2d§(§_-L1n§);
         return !_loc3_;
      }
      
      override protected function §_-q1Y§(param1:DetectHeroEvent) : void
      {
         param1.hero.§_-h1z§.add(new §_-v1N§(§_-L1n§,§_-v1N§.§_-W29§,§_-G1v§));
         if(this.§_-21H§.cast.castObject == null)
         {
            this.§_-21H§.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-L1n§));
         }
      }
      
      override protected function §_-E6§(param1:§_-V1t§) : void
      {
         if(param1 != Hero.self)
         {
            return;
         }
         Hero.self.§_-h1z§.add(new §_-v1N§(§_-L1n§,§_-v1N§.§_-W29§,§_-G1v§));
         if(this.§_-21H§.cast.castObject == null)
         {
            this.§_-21H§.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-L1n§));
         }
      }
      
      override protected function §_-91m§(param1:DetectHeroEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"GetGravityPoise":[this.id,param1.hero.id]}));
         if(param1.hero.id == Game.selfId)
         {
            Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-O16§,1);
         }
      }
      
      override protected function §_-92O§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"RespawnGravityPoise":[this.id]}));
      }
      
      override protected function §_-Gu§(param1:Object) : Array
      {
         if("GetGravityPoise" in param1)
         {
            return param1["GetGravityPoise"];
         }
         return null;
      }
      
      override protected function §_-p2D§(param1:Object) : Array
      {
         if("RespawnGravityPoise" in param1)
         {
            return param1["RespawnGravityPoise"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-t5§;
      }
   }
}

