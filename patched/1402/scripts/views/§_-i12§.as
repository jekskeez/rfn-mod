package views
{
   import §_-U19§.Clan;
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import tape.§_-I2Z§;
   import utils.§_-S1m§;
   
   public class §_-i12§ extends Sprite implements §_-I2Z§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 10px;","}","a {","color: #FFFFFF;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,9,16763904,true);
      
      private static const §_-D1j§:TextFormat = new TextFormat(null,10,16777215);
      
      private var §_-D2w§:§_-i5§;
      
      private var §_-EC§:§_-i5§;
      
      private var photo:§_-V2O§;
      
      private var §_-118§:§_-z§;
      
      private var button:SimpleButton;
      
      private var §_-a2H§:§_-i5§;
      
      private var playerId:int = -1;
      
      private var exp:int = -1;
      
      private var online:Boolean = false;
      
      private var §_-Mi§:int = -1;
      
      public function §_-i12§()
      {
         super();
         this.init();
      }
      
      public function §_-o2c§(param1:Player) : Boolean
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
            param1.clan_duty = Clan.§_-Y2B§;
         }
         if(this.§_-Mi§ != param1.clan_duty)
         {
            return true;
         }
         return "name" in param1 && this.§_-EC§.htmlText == "";
      }
      
      public function §_-63H§(param1:Player) : void
      {
         this.photo.§_-yC§(param1);
      }
      
      public function §_-yC§(param1:Player) : void
      {
         this.§_-Mi§ = param1.clan_duty;
         this.exp = param1.exp;
         this.online = Boolean(param1.online);
         this.playerId = param1.id;
         this.§_-118§.§_-yC§(param1);
         var _loc2_:Boolean = param1.id == Game.selfId;
         this.button.mouseEnabled = !_loc2_;
         this.§_-D2w§.text = param1["clan_duty"] == Clan.§_-HJ§ ? gls("({0} ур.)",§_-XW§.§_-Wh§(param1["exp"])) : gls("{0} уровень",§_-XW§.§_-Wh§(param1["exp"]));
         this.§_-D2w§.x = param1["clan_duty"] == Clan.§_-HJ§ ? 97 : 32;
         if(param1["clan_duty"] == Clan.§_-HJ§ && !(this.button is SubLeaderPlaceClan))
         {
            removeChild(this.button);
            this.button.removeEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
            this.button = new SubLeaderPlaceClan();
            this.button["name"] = -1;
            this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
            addChild(this.button);
            this.§_-a2H§ = new §_-i5§(gls("Опора клана").toUpperCase(),32,15,§_-W2P§);
            addChild(this.§_-a2H§);
         }
         if(param1["clan_duty"] != Clan.§_-HJ§ && this.button is SubLeaderPlaceClan)
         {
            removeChild(this.button);
            this.button.removeEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
            this.button = new TopPlaceClan();
            this.button["name"] = -1;
            this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
            addChild(this.button);
            removeChild(this.§_-a2H§);
         }
         this.button.name = param1.id.toString();
         this.§_-EC§.name = param1.id.toString();
         §_-S1m§.§_-hB§(this.§_-EC§,param1,88,true,!_loc2_,true);
      }
      
      public function §_-H1h§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(param1.target.name);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.photo = new §_-V2O§(25);
         this.photo.x = 2;
         this.photo.y = 2;
         addChild(this.photo);
         this.button = new TopPlaceClan();
         this.button["name"] = -1;
         addChild(this.button);
         this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         this.§_-118§ = new §_-z§();
         this.§_-118§.x = 32;
         this.§_-118§.y = 4;
         addChild(this.§_-118§);
         this.§_-EC§ = new §_-i5§("",42,1,_loc1_);
         this.§_-EC§.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         addChild(this.§_-EC§);
         this.§_-D2w§ = new §_-i5§("",32,13,§_-D1j§);
         this.§_-D2w§.mouseEnabled = false;
         addChild(this.§_-D2w§);
      }
   }
}

