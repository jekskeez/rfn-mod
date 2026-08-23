package chat
{
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import flash.text.TextFormat;
   import utils.StringUtil;
   import utils.§_-33I§;
   import utils.§_-r1G§;
   
   public class §_-EU§ extends §_-e28§
   {
      
      private static var textField:§_-i5§ = new §_-i5§("",0,0,new TextFormat(§_-i5§.§_-c10§,12,null,true));
      
      public function §_-EU§(param1:Player, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get userId() : int
      {
         return int(player ? player.id : -1);
      }
      
      override public function get text() : String
      {
         return "<body>" + (this.player ? this.§_-hB§() : "") + this.§_-i1l§(message) + "</body>";
      }
      
      override protected function §_-hB§() : String
      {
         var _loc1_:String = this.§_-j1g§();
         var _loc2_:String = "";
         if(§_-33I§.§_-V1O§(player.rights,§_-33I§.§_-42W§))
         {
            _loc2_ += "[A]";
         }
         else if(§_-33I§.§_-V1O§(player.rights,§_-33I§.§_-AJ§))
         {
            _loc2_ += "[M]";
         }
         _loc1_ += " [" + §_-XW§.§_-Wh§(this.player["exp"]) + "]" + _loc2_ + ": ";
         return this.§_-f1w§(_loc1_);
      }
      
      protected function §_-i1l§(param1:String) : String
      {
         if(this.player == null)
         {
            param1 = §_-r1G§.span(param1,"service_message");
         }
         else if(this.player["vip_exist"] > 0)
         {
            param1 = §_-r1G§.span(param1,"vip_message");
         }
         return param1;
      }
      
      private function §_-j1g§() : String
      {
         textField.text = this.player.name;
         StringUtil.§_-a2b§(textField,96);
         var _loc1_:String = textField.text + (textField.text.length < this.player.name.length ? "..." : "");
         if(this.player.id != Game.selfId)
         {
            _loc1_ = §_-r1G§.§_-fU§(_loc1_,"event:" + this.player.id);
         }
         return _loc1_;
      }
      
      private function §_-f1w§(param1:String = "") : String
      {
         if(!param1)
         {
            param1 = this.§_-j1g§();
         }
         if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-42W§))
         {
            return §_-r1G§.span(param1,"name_leader");
         }
         if(§_-33I§.§_-V1O§(player.rights,§_-33I§.§_-AJ§))
         {
            return §_-r1G§.span(param1,"name_moderator");
         }
         if(this.player["vip_exist"] > 0)
         {
            return §_-r1G§.span(param1,"color" + this.player["vip_color"]);
         }
         return §_-r1G§.span(param1,"name");
      }
   }
}

