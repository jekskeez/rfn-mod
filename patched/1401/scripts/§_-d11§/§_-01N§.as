package §_-d11§
{
   import §_-Dn§.§_-a2C§;
   import §_-R1w§.DetectHeroEvent;
   import §_-T1r§.§_-i1L§;
   import game.§_-s2v§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-01N§ extends §_-72C§
   {
      
      private static const §_-S12§:Number = 40;
      
      public function §_-01N§()
      {
         super();
      }
      
      override protected function §_-b2H§() : void
      {
         this.view = new §_-s2v§(new GodModeImage());
         this.view.x = -12;
         this.view.y = -15;
         §_-83v§(this.view);
      }
      
      override protected function §_-33j§(param1:DetectHeroEvent) : Boolean
      {
         return param1.hero is §_-i1L§;
      }
      
      override protected function §_-O1L§(param1:DetectHeroEvent) : void
      {
         new §_-a2C§(gls("НЕУЯЗВИМОСТЬ"),param1.hero.game.squirrels,param1.hero.x + 15,param1.hero.y - 42);
         (param1.hero as §_-i1L§).§_-47§ = true;
      }
      
      override protected function §_-91c§(param1:§_-i1L§) : void
      {
         if(Boolean(param1) && Boolean(param1.game))
         {
            new §_-a2C§(gls("НЕУЯЗВИМОСТЬ"),param1.game.squirrels,param1.x + 15,param1.y - 42);
            param1.§_-47§ = true;
         }
      }
      
      override protected function §_-Dm§(param1:DetectHeroEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"GetGodMode":[this.id,param1.hero.id]}));
      }
      
      override protected function §_-N24§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"RespawnGodMode":[this.id]}));
      }
      
      override protected function §_-7P§(param1:Object) : Array
      {
         if("GetGodMode" in param1)
         {
            return param1["GetGodMode"];
         }
         return null;
      }
      
      override protected function §_-Q1b§(param1:Object) : Array
      {
         if("RespawnGodMode" in param1)
         {
            return param1["RespawnGodMode"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-S12§;
      }
   }
}

