package chat
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import com.api.Player;
   import utils.§_-r1G§;
   
   public class §_-S24§ extends §_-e28§
   {
      
      public function §_-S24§(param1:Player, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get text() : String
      {
         return this.§_-hB§() + §_-r1G§.span(this.message,"message");
      }
      
      override protected function §_-hB§() : String
      {
         var _loc4_:String = null;
         var _loc1_:Clan = §_-B2U§.§_-Q2g§(this.player.clan_id);
         var _loc2_:Boolean = _loc1_.§_-W2t§ == this.player.id;
         var _loc3_:String = "";
         if(this.player.id == Game.selfId)
         {
            _loc3_ = super.§_-hB§();
         }
         else
         {
            _loc3_ = §_-r1G§.§_-fU§(super.§_-hB§(),"event:id=" + this.player.id);
         }
         if(_loc2_)
         {
            _loc4_ = "leaderName";
         }
         else if(this.player.clan_duty == Clan.§_-HJ§)
         {
            _loc4_ = "subLeaderName";
         }
         else
         {
            _loc4_ = "playerName";
         }
         return §_-r1G§.span(_loc3_,_loc4_);
      }
   }
}

