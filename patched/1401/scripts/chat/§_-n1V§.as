package chat
{
   import §_-I10§.§_-My§;
   import com.api.Player;
   import flash.text.TextFormat;
   import utils.StringUtil;
   import utils.§_-c10§;
   import utils.§_-xb§;
   
   public class §_-n1V§ extends §_-dd§
   {
      
      private static var textField:§_-22V§ = new §_-22V§("",0,0,new TextFormat(§_-22V§.§_-F2z§,12,null,true));
      
      public function §_-n1V§(param1:Player, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get userId() : int
      {
         return int(player ? player.id : -1);
      }
      
      override public function get text() : String
      {
         return "<body>" + (this.player ? this.§_-uc§() : "") + this.§_-d1F§(message) + "</body>";
      }
      
      override protected function §_-uc§() : String
      {
         var _loc1_:String = this.§_-F3§();
         var _loc2_:String = "";
         if(§_-c10§.§_-73j§(player.rights,§_-c10§.§_-MR§))
         {
            _loc2_ += "[A]";
         }
         else if(§_-c10§.§_-73j§(player.rights,§_-c10§.§_-639§))
         {
            _loc2_ += "[M]";
         }
         _loc1_ += " [" + §_-My§.§_-n1z§(this.player["exp"]) + "]" + _loc2_ + ": ";
         return this.§_-22Q§(_loc1_);
      }
      
      protected function §_-d1F§(param1:String) : String
      {
         if(this.player == null)
         {
            param1 = §_-xb§.span(param1,"service_message");
         }
         else if(this.player["vip_exist"] > 0)
         {
            param1 = §_-xb§.span(param1,"vip_message");
         }
         return param1;
      }
      
      private function §_-F3§() : String
      {
         textField.text = this.player.name;
         StringUtil.§_-016§(textField,96);
         var _loc1_:String = textField.text + (textField.text.length < this.player.name.length ? "..." : "");
         if(this.player.id != Game.selfId)
         {
            _loc1_ = §_-xb§.§_-e1r§(_loc1_,"event:" + this.player.id);
         }
         return _loc1_;
      }
      
      private function §_-22Q§(param1:String = "") : String
      {
         if(!param1)
         {
            param1 = this.§_-F3§();
         }
         if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-MR§))
         {
            return §_-xb§.span(param1,"name_leader");
         }
         if(§_-c10§.§_-73j§(player.rights,§_-c10§.§_-639§))
         {
            return §_-xb§.span(param1,"name_moderator");
         }
         if(this.player["vip_exist"] > 0)
         {
            return §_-xb§.span(param1,"color" + this.player["vip_color"]);
         }
         return §_-xb§.span(param1,"name");
      }
   }
}

