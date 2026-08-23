package chat
{
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import utils.StringUtil;
   import utils.§_-33I§;
   
   public class §_-e28§ extends EventDispatcher
   {
      
      private static const §_-A24§:uint = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-L1b§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-T5§;
      
      protected var player:Player;
      
      protected var message:String;
      
      public function §_-e28§(param1:Player, param2:String)
      {
         super();
         this.player = param1;
         this.message = Boolean(param1) && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) ? §_-Qw§.§_-73w§(StringUtil.§_-U2s§(param2)) : param2;
         if(this.canAdd)
         {
            return;
         }
         this.player.addEventListener(§_-A24§,this.§_-Y16§);
         Game.request(param1.id,§_-A24§);
      }
      
      public function get text() : String
      {
         return (this.player ? this.§_-hB§() : "") + this.message;
      }
      
      public function get userId() : int
      {
         return this.player ? int(this.player.id) : -1;
      }
      
      public function get canAdd() : Boolean
      {
         return !this.player || Boolean(this.player.isLoaded(§_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-L1b§ | §_-Y2E§.§_-V2n§)) || this.player["id"] == 0;
      }
      
      protected function §_-hB§() : String
      {
         var _loc1_:String = "";
         if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-42W§))
         {
            _loc1_ += "[A]";
         }
         else if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-AJ§))
         {
            _loc1_ += "[M]";
         }
         return this.player.name + " [" + §_-XW§.§_-Wh§(this.player.exp) + "]" + _loc1_ + ": ";
      }
      
      private function §_-Y16§(param1:Player) : void
      {
         if(!this.canAdd)
         {
            return;
         }
         this.dispatchEvent(new Event("MESSAGE_UPDATE"));
         param1.removeEventListener(this.§_-Y16§);
      }
   }
}

