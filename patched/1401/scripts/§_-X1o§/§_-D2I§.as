package §_-X1o§
{
   import §_-5C§.ListElementEvent;
   import §_-I10§.§_-My§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import com.api.Player;
   import events.§_-n13§;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import menu.§_-927§;
   import views.§_-Z2N§;
   
   public class §_-D2I§ extends §_-X27§ implements §_-OP§
   {
      
      private static const §_-I2U§:String = [".default {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","}",".shaman {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #0078EA;","font-weight: bold;","}",".redShaman {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #ff3a33;","font-weight: bold;","}","a {","font-size: 11px;","text-decoration: underline;","}",".bold {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      private static const §_-03g§:uint = §_-hF§.§_-329§ | §_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-P13§;
      
      private var §_-3P§:§_-22V§ = null;
      
      private var §_-uu§:§_-22V§ = null;
      
      private var clanEmblem:§_-Z2N§ = null;
      
      private var §_-O1y§:Boolean = false;
      
      public var player:Player = null;
      
      public var team:int = Hero.§_-114§;
      
      public function §_-D2I§(param1:int, param2:int)
      {
         super();
         this.init();
         this.team = param2;
         this.player = Game.getPlayer(param1);
         this.player.addEventListener(§_-03g§,this.§_-P9§);
         Game.request(param1,§_-03g§);
      }
      
      public function set number(param1:int) : void
      {
         this.§_-uu§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-17§ ? "redShaman" : "shaman") : "default") + "\"><b>" + param1.toString() + ".</b></span></body>";
      }
      
      override public function get canAdd() : Boolean
      {
         return this.player.isLoaded(§_-03g§);
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-O1y§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.shaman == param1)
         {
            return;
         }
         this.§_-O1y§ = param1;
         this.§_-3P§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-17§ ? "redShaman" : "shaman") : "default") + "\">" + this.§_-9u§(this.player["id"],this.§_-3P§.text) + "</span></body>";
         this.§_-uu§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-17§ ? "redShaman" : "shaman") : "default") + "\"><b>" + this.§_-uu§.text + "</b></span></body>";
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-3P§ = new §_-22V§("",17,0,_loc1_);
         this.§_-3P§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-i2I§);
         addChild(this.§_-3P§);
         this.§_-uu§ = new §_-22V§("<body><span class=\'defaultNumber\'><b>13.</b></span></body>",0,0,_loc1_,20);
         addChild(this.§_-uu§);
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         var _loc2_:§_-22V§ = param1.currentTarget as §_-22V§;
         if(!_loc2_.visible)
         {
            return;
         }
         §_-927§.§_-i2I§(this.player.id);
      }
      
      private function §_-A2B§(param1:TextField, param2:String, param3:String, param4:int) : void
      {
         do
         {
            param1.htmlText = "<body><span class=\'default\'>" + param2 + param3 + "</span></body>";
            param2 = param2.substr(0,param2.length - 1);
         }
         while(param1.textWidth > param4);
      }
      
      private function §_-9u§(param1:int, param2:String) : String
      {
         if(param1 == Game.selfId)
         {
            return param2;
         }
         return "<a href=\'event:" + param1 + "\'>" + param2 + "</a>";
      }
      
      private function §_-P9§(param1:Player) : void
      {
         this.§_-A2B§(this.§_-3P§,param1.name," [" + (§_-My§.§_-51r§(param1["exp"]) + 1) + "]",this.player["clan_id"] != 0 ? 95 : 107);
         var _loc2_:String = this.§_-3P§.text.split("\r")[0];
         this.§_-3P§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-17§ ? "redShaman" : "shaman") : "default") + "\">" + this.§_-9u§(this.player["id"],_loc2_) + "</span></body>";
         dispatchEvent(new ListElementEvent(ListElementEvent.CHANGED,this));
         this.player.removeEventListener(this.§_-P9§);
         if(this.player["clan_id"] == 0)
         {
            return;
         }
         this.§_-3P§.x = 30;
         var _loc3_:Clan = §_-e2W§.§_-W2X§(param1["clan_id"]);
         if(_loc3_ != null && _loc3_.isLoaded())
         {
            this.clanEmblem = new §_-Z2N§(_loc3_.§_-M24§,20,2);
            addChild(this.clanEmblem);
            return;
         }
         this.clanEmblem = new §_-Z2N§("",20,2);
         addChild(this.clanEmblem);
         §_-e2W§.listen(this.onClanLoaded);
         §_-e2W§.request(this.player["clan_id"],§_-Oy§.ALL);
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         if(param1.§_-81t§.id != this.player["clan_id"])
         {
            return;
         }
         §_-e2W§.forget(this.onClanLoaded);
         this.clanEmblem.load(param1.§_-81t§.§_-M24§);
      }
   }
}

