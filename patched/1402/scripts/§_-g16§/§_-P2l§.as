package §_-g16§
{
   import §_-WJ§.DetectHeroEvent;
   import §_-cm§.§_-V1t§;
   import §_-y1V§.§_-W12§;
   import game.§_-53v§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-P2l§ extends §_-XJ§
   {
      
      private static const §_-t5§:Number = 40;
      
      public function §_-P2l§()
      {
         super();
      }
      
      override protected function §_-AD§() : void
      {
         this.view = new §_-53v§(new GodModeImage());
         this.view.x = -12;
         this.view.y = -15;
         §_-J2J§(this.view);
      }
      
      override protected function §_-x2V§(param1:DetectHeroEvent) : Boolean
      {
         return param1.hero is §_-V1t§;
      }
      
      override protected function §_-q1Y§(param1:DetectHeroEvent) : void
      {
         new §_-W12§(gls("НЕУЯЗВИМОСТЬ"),param1.hero.game.squirrels,param1.hero.x + 15,param1.hero.y - 42);
         (param1.hero as §_-V1t§).§_-91W§ = true;
      }
      
      override protected function §_-E6§(param1:§_-V1t§) : void
      {
         if(Boolean(param1) && Boolean(param1.game))
         {
            new §_-W12§(gls("НЕУЯЗВИМОСТЬ"),param1.game.squirrels,param1.x + 15,param1.y - 42);
            param1.§_-91W§ = true;
         }
      }
      
      override protected function §_-91m§(param1:DetectHeroEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"GetGodMode":[this.id,param1.hero.id]}));
      }
      
      override protected function §_-92O§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"RespawnGodMode":[this.id]}));
      }
      
      override protected function §_-Gu§(param1:Object) : Array
      {
         if("GetGodMode" in param1)
         {
            return param1["GetGodMode"];
         }
         return null;
      }
      
      override protected function §_-p2D§(param1:Object) : Array
      {
         if("RespawnGodMode" in param1)
         {
            return param1["RespawnGodMode"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-t5§;
      }
   }
}

