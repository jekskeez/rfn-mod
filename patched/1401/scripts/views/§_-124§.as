package views
{
   import §_-I10§.§_-My§;
   import §_-dc§.Clan;
   import com.api.Player;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import tape.§_-U15§;
   import utils.§_-Y1S§;
   
   public class §_-124§ extends Sprite implements §_-U15§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 10px;","}","a {","color: #FFFFFF;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,9,16763904,true);
      
      private static const §_-d1x§:TextFormat = new TextFormat(null,10,16777215);
      
      private var §_-Qr§:§_-22V§;
      
      private var §_-V2v§:§_-22V§;
      
      private var photo:§_-s1A§;
      
      private var §_-Gg§:§_-B1w§;
      
      private var button:SimpleButton;
      
      private var §_-R1s§:§_-22V§;
      
      private var playerId:int = -1;
      
      private var exp:int = -1;
      
      private var online:Boolean = false;
      
      private var §_-z2M§:int = -1;
      
      public function §_-124§()
      {
         super();
         this.init();
      }
      
      public function §_-51I§(param1:Player) : Boolean
      {
         if(this.playerId != param1.id)
         {
            return true;
         }
         if(this.exp != param1.exp)
         {
            return true;
         }
         if(this.online != param1.online)
         {
            return true;
         }
         if(!("clan_duty" in param1))
         {
            param1.clan_duty = Clan.§_-73C§;
         }
         if(this.§_-z2M§ != param1.clan_duty)
         {
            return true;
         }
         return "name" in param1 && this.§_-V2v§.htmlText == "";
      }
      
      public function §_-q1C§(param1:Player) : void
      {
         this.photo.§_-031§(param1);
      }
      
      public function §_-031§(param1:Player) : void
      {
         this.§_-z2M§ = param1.clan_duty;
         this.exp = param1.exp;
         this.online = Boolean(param1.online);
         this.playerId = param1.id;
         this.§_-Gg§.§_-031§(param1);
         var _loc2_:Boolean = param1.id == Game.selfId;
         this.button.mouseEnabled = !_loc2_;
         this.§_-Qr§.text = param1["clan_duty"] == Clan.§_-jY§ ? gls("({0} ур.)",§_-My§.§_-n1z§(param1["exp"])) : gls("{0} уровень",§_-My§.§_-n1z§(param1["exp"]));
         this.§_-Qr§.x = param1["clan_duty"] == Clan.§_-jY§ ? 97 : 32;
         if(param1["clan_duty"] == Clan.§_-jY§ && !(this.button is SubLeaderPlaceClan))
         {
            removeChild(this.button);
            this.button.removeEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
            this.button = new SubLeaderPlaceClan();
            this.button["name"] = -1;
            this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
            addChild(this.button);
            this.§_-R1s§ = new §_-22V§(gls("Опора клана").toUpperCase(),32,15,§_-i2c§);
            addChild(this.§_-R1s§);
         }
         if(param1["clan_duty"] != Clan.§_-jY§ && this.button is SubLeaderPlaceClan)
         {
            removeChild(this.button);
            this.button.removeEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
            this.button = new TopPlaceClan();
            this.button["name"] = -1;
            this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
            addChild(this.button);
            removeChild(this.§_-R1s§);
         }
         this.button.name = param1.id.toString();
         this.§_-V2v§.name = param1.id.toString();
         §_-Y1S§.§_-uc§(this.§_-V2v§,param1,88,true,!_loc2_,true);
      }
      
      public function §_-P2v§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(param1.target.name);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.photo = new §_-s1A§(25);
         this.photo.x = 2;
         this.photo.y = 2;
         addChild(this.photo);
         this.button = new TopPlaceClan();
         this.button["name"] = -1;
         addChild(this.button);
         this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         this.§_-Gg§ = new §_-B1w§();
         this.§_-Gg§.x = 32;
         this.§_-Gg§.y = 4;
         addChild(this.§_-Gg§);
         this.§_-V2v§ = new §_-22V§("",42,1,_loc1_);
         this.§_-V2v§.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         addChild(this.§_-V2v§);
         this.§_-Qr§ = new §_-22V§("",32,13,§_-d1x§);
         this.§_-Qr§.mouseEnabled = false;
         addChild(this.§_-Qr§);
      }
   }
}

