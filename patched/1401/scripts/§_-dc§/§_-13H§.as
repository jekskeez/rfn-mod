package §_-dc§
{
   import §_-S1D§.§_-O1M§;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-13H§ extends §_-V17§
   {
      
      private var §_-LG§:Number = 0;
      
      public function §_-13H§(param1:Hero, param2:int)
      {
         super(param1,param2);
         this.§_-Qp§ = §_-d1q§.§_-f13§;
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-03G§]);
         var _loc3_:Number = this.hero.player["respawn_totem"] + this.hero.player["respawn_totem_last_update"] - getTimer() / 1000;
         if(_loc3_ <= 0)
         {
            §_-O1M§.§_-W2q§(true);
            this.§_-LG§ = 0;
         }
         else
         {
            §_-O1M§.§_-W2q§(false);
            this.§_-LG§ = _loc3_;
         }
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-03G§]);
         if(this.hero.id == Game.selfId)
         {
            §_-O1M§.§_-W2q§(false);
         }
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         if(this.§_-LG§ > 0)
         {
            this.§_-LG§ -= param1;
            if(this.§_-LG§ <= 0)
            {
               this.§_-LG§ = 0;
            }
         }
         §_-O1M§.§_-W2q§(this.§_-LG§ <= 0);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(Game.selfId != param1[1])
         {
            return;
         }
         if(param1[2] != §_-S2I§.§_-ry§)
         {
            return;
         }
         if(param1[0] == §_-S2I§.§_-8n§)
         {
            Game.request(Game.selfId,§_-hF§.§_-329§ | §_-hF§.§_-e1B§);
            §_-e2W§.request(Game.self["clan_id"],§_-Oy§.§_-TZ§,true);
            §_-O1M§.§_-W2q§(false);
            this.§_-LG§ = 0;
            return;
         }
         Game.self["respawn_totem"] = this.bonus * 60;
         Game.self["respawn_totem_last_update"] = getTimer() / 1000;
         §_-O1M§.§_-W2q§(false);
         this.§_-LG§ = this.bonus * 60;
      }
   }
}

