package chat
{
   import §_-I10§.§_-My§;
   import com.api.Player;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import utils.StringUtil;
   import utils.§_-c10§;
   
   public class §_-dd§ extends EventDispatcher
   {
      
      private static const §_-03g§:uint = §_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-329§ | §_-hF§.§_-P13§ | §_-hF§.§_-sK§;
      
      protected var player:Player;
      
      protected var message:String;
      
      public function §_-dd§(param1:Player, param2:String)
      {
         super();
         this.player = param1;
         this.message = Boolean(param1) && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) ? §_-019§.§_-l2k§(StringUtil.§_-T2i§(param2)) : param2;
         if(this.canAdd)
         {
            return;
         }
         this.player.addEventListener(§_-03g§,this.§_-P9§);
         Game.request(param1.id,§_-03g§);
      }
      
      public function get text() : String
      {
         return (this.player ? this.§_-uc§() : "") + this.message;
      }
      
      public function get userId() : int
      {
         return this.player ? int(this.player.id) : -1;
      }
      
      public function get canAdd() : Boolean
      {
         return !this.player || Boolean(this.player.isLoaded(§_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-329§ | §_-hF§.§_-P13§)) || this.player["id"] == 0;
      }
      
      protected function §_-uc§() : String
      {
         var _loc1_:String = "";
         if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-MR§))
         {
            _loc1_ += "[A]";
         }
         else if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-639§))
         {
            _loc1_ += "[M]";
         }
         return this.player.name + " [" + §_-My§.§_-n1z§(this.player.exp) + "]" + _loc1_ + ": ";
      }
      
      private function §_-P9§(param1:Player) : void
      {
         if(!this.canAdd)
         {
            return;
         }
         this.dispatchEvent(new Event("MESSAGE_UPDATE"));
         param1.removeEventListener(this.§_-P9§);
      }
   }
}

