package §_-d11§
{
   import §_-R1w§.DetectHeroEvent;
   import §_-T1r§.§_-i1L§;
   import game.§_-s2v§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-Q2c§ extends §_-72C§
   {
      
      public static const §_-MV§:int = 5;
      
      private static const §_-S12§:Number = 20;
      
      public function §_-Q2c§()
      {
         super();
      }
      
      override protected function §_-b2H§() : void
      {
         this.view = new §_-s2v§(new MedicKitImage());
         this.view.x = -20;
         this.view.y = -17;
         §_-83v§(this.view);
      }
      
      override protected function §_-33j§(param1:DetectHeroEvent) : Boolean
      {
         if(!(param1.hero is §_-i1L§))
         {
            return false;
         }
         var _loc2_:§_-i1L§ = param1.hero as §_-i1L§;
         return _loc2_.health < §_-i1L§.§_-V6§;
      }
      
      override protected function §_-O1L§(param1:DetectHeroEvent) : void
      {
         (param1.hero as §_-i1L§).health += §_-MV§;
      }
      
      override protected function §_-91c§(param1:§_-i1L§) : void
      {
         param1.health += §_-MV§;
      }
      
      override protected function §_-Dm§(param1:DetectHeroEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"GetMedicKit":[this.id,param1.hero.id]}));
         if(param1.hero.id == Game.selfId)
         {
            Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-m2u§,1);
         }
      }
      
      override protected function §_-N24§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"RespawnMedicKit":[this.id]}));
      }
      
      override protected function §_-7P§(param1:Object) : Array
      {
         if("GetMedicKit" in param1)
         {
            return param1["GetMedicKit"];
         }
         return null;
      }
      
      override protected function §_-Q1b§(param1:Object) : Array
      {
         if("RespawnMedicKit" in param1)
         {
            return param1["RespawnMedicKit"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-S12§;
      }
   }
}

