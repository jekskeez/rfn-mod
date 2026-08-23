package §_-cA§
{
   import §_-48§.ListElementEvent;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import events.§_-a1V§;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import menu.§_-cD§;
   import views.§_-SZ§;
   
   public class §_-wO§ extends §_-3b§ implements §_-H2w§
   {
      
      private static const §_-aD§:String = [".default {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","}",".shaman {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #0078EA;","font-weight: bold;","}",".redShaman {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #ff3a33;","font-weight: bold;","}","a {","font-size: 11px;","text-decoration: underline;","}",".bold {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      private static const §_-A24§:uint = §_-Y2E§.§_-L1b§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-V2n§;
      
      private var §_-92i§:§_-i5§ = null;
      
      private var §_-31f§:§_-i5§ = null;
      
      private var clanEmblem:§_-SZ§ = null;
      
      private var §_-C1F§:Boolean = false;
      
      public var player:Player = null;
      
      public var team:int = Hero.§_-i1Y§;
      
      public function §_-wO§(param1:int, param2:int)
      {
         super();
         this.init();
         this.team = param2;
         this.player = Game.getPlayer(param1);
         this.player.addEventListener(§_-A24§,this.§_-Y16§);
         Game.request(param1,§_-A24§);
      }
      
      public function set number(param1:int) : void
      {
         this.§_-31f§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-l1B§ ? "redShaman" : "shaman") : "default") + "\"><b>" + param1.toString() + ".</b></span></body>";
      }
      
      override public function get canAdd() : Boolean
      {
         return this.player.isLoaded(§_-A24§);
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-C1F§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.shaman == param1)
         {
            return;
         }
         this.§_-C1F§ = param1;
         this.§_-92i§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-l1B§ ? "redShaman" : "shaman") : "default") + "\">" + this.§_-f2Q§(this.player["id"],this.§_-92i§.text) + "</span></body>";
         this.§_-31f§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-l1B§ ? "redShaman" : "shaman") : "default") + "\"><b>" + this.§_-31f§.text + "</b></span></body>";
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-92i§ = new §_-i5§("",17,0,_loc1_);
         this.§_-92i§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-e25§);
         addChild(this.§_-92i§);
         this.§_-31f§ = new §_-i5§("<body><span class=\'defaultNumber\'><b>13.</b></span></body>",0,0,_loc1_,20);
         addChild(this.§_-31f§);
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         var _loc2_:§_-i5§ = param1.currentTarget as §_-i5§;
         if(!_loc2_.visible)
         {
            return;
         }
         §_-cD§.§_-e25§(this.player.id);
      }
      
      private function §_-CS§(param1:TextField, param2:String, param3:String, param4:int) : void
      {
         do
         {
            param1.htmlText = "<body><span class=\'default\'>" + param2 + param3 + "</span></body>";
            param2 = param2.substr(0,param2.length - 1);
         }
         while(param1.textWidth > param4);
      }
      
      private function §_-f2Q§(param1:int, param2:String) : String
      {
         if(param1 == Game.selfId)
         {
            return param2;
         }
         return "<a href=\'event:" + param1 + "\'>" + param2 + "</a>";
      }
      
      private function §_-Y16§(param1:Player) : void
      {
         this.§_-CS§(this.§_-92i§,param1.name," [" + (§_-XW§.§_-cO§(param1["exp"]) + 1) + "]",this.player["clan_id"] != 0 ? 95 : 107);
         var _loc2_:String = this.§_-92i§.text.split("\r")[0];
         this.§_-92i§.htmlText = "<body><span class=\"" + (this.shaman ? (this.team == Hero.§_-l1B§ ? "redShaman" : "shaman") : "default") + "\">" + this.§_-f2Q§(this.player["id"],_loc2_) + "</span></body>";
         dispatchEvent(new ListElementEvent(ListElementEvent.CHANGED,this));
         this.player.removeEventListener(this.§_-Y16§);
         if(this.player["clan_id"] == 0)
         {
            return;
         }
         this.§_-92i§.x = 30;
         var _loc3_:Clan = §_-B2U§.§_-Q2g§(param1["clan_id"]);
         if(_loc3_ != null && _loc3_.isLoaded())
         {
            this.clanEmblem = new §_-SZ§(_loc3_.§_-o1p§,20,2);
            addChild(this.clanEmblem);
            return;
         }
         this.clanEmblem = new §_-SZ§("",20,2);
         addChild(this.clanEmblem);
         §_-B2U§.listen(this.onClanLoaded);
         §_-B2U§.request(this.player["clan_id"],§_-eT§.ALL);
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         if(param1.§_-b19§.id != this.player["clan_id"])
         {
            return;
         }
         §_-B2U§.forget(this.onClanLoaded);
         this.clanEmblem.load(param1.§_-b19§.§_-o1p§);
      }
   }
}

