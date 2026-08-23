package §_-U19§
{
   import §_-61C§.§_-a2p§;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-XH§ extends §_-k2u§
   {
      
      private var §_-p1f§:Number = 0;
      
      public function §_-XH§(param1:Hero, param2:int)
      {
         super(param1,param2);
         this.§_-s19§ = §_-su§.§_-R1y§;
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-N1Y§]);
         var _loc3_:Number = this.hero.player["respawn_totem"] + this.hero.player["respawn_totem_last_update"] - getTimer() / 1000;
         if(_loc3_ <= 0)
         {
            §_-a2p§.§_-bG§(true);
            this.§_-p1f§ = 0;
         }
         else
         {
            §_-a2p§.§_-bG§(false);
            this.§_-p1f§ = _loc3_;
         }
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-N1Y§]);
         if(this.hero.id == Game.selfId)
         {
            §_-a2p§.§_-bG§(false);
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
         if(this.§_-p1f§ > 0)
         {
            this.§_-p1f§ -= param1;
            if(this.§_-p1f§ <= 0)
            {
               this.§_-p1f§ = 0;
            }
         }
         §_-a2p§.§_-bG§(this.§_-p1f§ <= 0);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(Game.selfId != param1[1])
         {
            return;
         }
         if(param1[2] != §_-s2l§.§_-33E§)
         {
            return;
         }
         if(param1[0] == §_-s2l§.§_-Y2§)
         {
            Game.request(Game.selfId,§_-Y2E§.§_-L1b§ | §_-Y2E§.§_-HV§);
            §_-B2U§.request(Game.self["clan_id"],§_-eT§.§_-t1d§,true);
            §_-a2p§.§_-bG§(false);
            this.§_-p1f§ = 0;
            return;
         }
         Game.self["respawn_totem"] = this.bonus * 60;
         Game.self["respawn_totem_last_update"] = getTimer() / 1000;
         §_-a2p§.§_-bG§(false);
         this.§_-p1f§ = this.bonus * 60;
      }
   }
}

