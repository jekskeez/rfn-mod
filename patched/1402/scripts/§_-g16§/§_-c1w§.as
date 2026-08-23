package §_-g16§
{
   import §_-WJ§.DetectHeroEvent;
   import §_-cm§.§_-V1t§;
   import game.§_-53v§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-c1w§ extends §_-XJ§
   {
      
      public static const §_-zv§:int = 5;
      
      private static const §_-t5§:Number = 20;
      
      public function §_-c1w§()
      {
         super();
      }
      
      override protected function §_-AD§() : void
      {
         this.view = new §_-53v§(new MedicKitImage());
         this.view.x = -20;
         this.view.y = -17;
         §_-J2J§(this.view);
      }
      
      override protected function §_-x2V§(param1:DetectHeroEvent) : Boolean
      {
         if(!(param1.hero is §_-V1t§))
         {
            return false;
         }
         var _loc2_:§_-V1t§ = param1.hero as §_-V1t§;
         return _loc2_.health < §_-V1t§.§_-c2Z§;
      }
      
      override protected function §_-q1Y§(param1:DetectHeroEvent) : void
      {
         (param1.hero as §_-V1t§).health += §_-zv§;
      }
      
      override protected function §_-E6§(param1:§_-V1t§) : void
      {
         param1.health += §_-zv§;
      }
      
      override protected function §_-91m§(param1:DetectHeroEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"GetMedicKit":[this.id,param1.hero.id]}));
         if(param1.hero.id == Game.selfId)
         {
            Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-O2D§,1);
         }
      }
      
      override protected function §_-92O§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"RespawnMedicKit":[this.id]}));
      }
      
      override protected function §_-Gu§(param1:Object) : Array
      {
         if("GetMedicKit" in param1)
         {
            return param1["GetMedicKit"];
         }
         return null;
      }
      
      override protected function §_-p2D§(param1:Object) : Array
      {
         if("RespawnMedicKit" in param1)
         {
            return param1["RespawnMedicKit"];
         }
         return null;
      }
      
      override protected function get respawnTime() : Number
      {
         return §_-t5§;
      }
   }
}

