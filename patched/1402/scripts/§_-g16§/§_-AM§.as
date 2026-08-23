package §_-g16§
{
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.CastEvent;
   import §_-cm§.§_-V1t§;
   import game.§_-53v§;
   import game.mainGame.§_-v1N§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-AM§ extends §_-XJ§
   {
      
      private static const §_-t5§:Number = 15;
      
      public static const §_-G1v§:int = 5;
      
      public function §_-AM§()
      {
         super();
      }
      
      override protected function §_-AD§() : void
      {
         this.view = new §_-53v§(new BouncingPoiseRespawnImage());
         this.view.x = -27;
         this.view.y = -17;
         §_-J2J§(this.view);
      }
      
      override protected function §_-x2V§(param1:DetectHeroEvent) : Boolean
      {
         var _loc2_:§_-v1N§ = param1.hero.§_-h1z§.§_-815§(§_-713§,§_-v1N§.§_-W29§);
         var _loc3_:Boolean = _loc2_ != null && _loc2_.count >= §_-v1N§.§_-O2d§(§_-713§);
         return !_loc3_;
      }
      
      override protected function §_-q1Y§(param1:DetectHeroEvent) : void
      {
         param1.hero.§_-h1z§.add(new §_-v1N§(§_-713§,§_-v1N§.§_-W29§,§_-G1v§));
         if(this.§_-21H§.cast.castObject == null)
         {
            this.§_-21H§.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-713§));
         }
      }
      
      override protected function §_-E6§(param1:§_-V1t§) : void
      {
         if(param1 != Hero.self)
         {
            return;
         }
         Hero.self.§_-h1z§.add(new §_-v1N§(§_-713§,§_-v1N§.§_-W29§,§_-G1v§));
         if(this.§_-21H§.cast.castObject == null)
         {
            this.§_-21H§.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-713§));
         }
      }
      
      override protected function §_-91m§(param1:DetectHeroEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"GetBouncingPoise":[this.id,param1.hero.id]}));
         if(param1.hero.id == Game.selfId)
         {
            Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-O16§,1);
         }
      }
      
      override protected function §_-92O§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"RespawnBouncingPoise":[this.id]}));
      }
      
      override protected function §_-Gu§(param1:Object) : Array
      {
         if("GetBouncingPoise" in param1)
         {
            return param1["GetBouncingPoise"];
         }
         return null;
      }
      
      override protected function §_-p2D§(param1:Object) : Array
      {
         if("RespawnBouncingPoise" in param1)
         {
            return param1["RespawnBouncingPoise"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-t5§;
      }
   }
}

