package views
{
   import §_-U19§.Clan;
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import utils.§_-S1m§;
   
   public class §_-BB§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 10px;","}","a {","color: #FFFFFF;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,16763904,true);
      
      private static const §_-D1j§:TextFormat = new TextFormat(null,10,16777215);
      
      private var §_-D2w§:§_-i5§;
      
      private var §_-EC§:§_-i5§;
      
      private var place:§_-81K§;
      
      public var playerId:int = -1;
      
      public function §_-BB§()
      {
         super();
         this.init();
      }
      
      public function §_-yC§(param1:Player) : void
      {
         this.place.§_-63H§(param1);
         this.place.§_-yC§(param1);
         this.place.mouseChildren = Game.self["clan_duty"] != Clan.§_-01X§;
         this.place.mouseEnabled = Game.self["clan_duty"] != Clan.§_-01X§;
         this.§_-EC§.mouseEnabled = Game.self["clan_duty"] != Clan.§_-01X§;
         this.§_-EC§.name = param1.id.toString();
         §_-S1m§.§_-hB§(this.§_-EC§,param1,88,true,Game.self["clan_duty"] != Clan.§_-01X§,true);
         this.§_-D2w§.text = gls("{0} уровень",§_-XW§.§_-Wh§(param1["exp"]));
      }
      
      public function §_-H1h§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(param1.target.name);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.place = new §_-81K§(new TopFrame());
         addChild(this.place);
         addChild(new §_-i5§(gls("Вождь клана").toUpperCase(),62,8,§_-W2P§));
         this.§_-EC§ = new §_-i5§("",64,21,_loc1_);
         this.§_-EC§.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         addChild(this.§_-EC§);
         this.§_-D2w§ = new §_-i5§("",64,33,§_-D1j§);
         this.§_-D2w§.mouseEnabled = false;
         addChild(this.§_-D2w§);
      }
   }
}

