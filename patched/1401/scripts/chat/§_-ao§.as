package chat
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import com.api.Player;
   import utils.§_-xb§;
   
   public class §_-ao§ extends §_-dd§
   {
      
      public function §_-ao§(param1:Player, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get text() : String
      {
         return this.§_-uc§() + §_-xb§.span(this.message,"message");
      }
      
      override protected function §_-uc§() : String
      {
         var _loc4_:String = null;
         var _loc1_:Clan = §_-e2W§.§_-W2X§(this.player.clan_id);
         var _loc2_:Boolean = _loc1_.§_-R2z§ == this.player.id;
         var _loc3_:String = "";
         if(this.player.id == Game.selfId)
         {
            _loc3_ = super.§_-uc§();
         }
         else
         {
            _loc3_ = §_-xb§.§_-e1r§(super.§_-uc§(),"event:id=" + this.player.id);
         }
         if(_loc2_)
         {
            _loc4_ = "leaderName";
         }
         else if(this.player.clan_duty == Clan.§_-jY§)
         {
            _loc4_ = "subLeaderName";
         }
         else
         {
            _loc4_ = "playerName";
         }
         return §_-xb§.span(_loc3_,_loc4_);
      }
   }
}

