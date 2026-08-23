package views
{
   import §_-I10§.§_-My§;
   import §_-dc§.Clan;
   import com.api.Player;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import utils.§_-Y1S§;
   
   public class §_-82F§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 10px;","}","a {","color: #FFFFFF;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,16763904,true);
      
      private static const §_-d1x§:TextFormat = new TextFormat(null,10,16777215);
      
      private var §_-Qr§:§_-22V§;
      
      private var §_-V2v§:§_-22V§;
      
      private var place:§_-ho§;
      
      public var playerId:int = -1;
      
      public function §_-82F§()
      {
         super();
         this.init();
      }
      
      public function §_-031§(param1:Player) : void
      {
         this.place.§_-q1C§(param1);
         this.place.§_-031§(param1);
         this.place.mouseChildren = Game.self["clan_duty"] != Clan.§_-k1P§;
         this.place.mouseEnabled = Game.self["clan_duty"] != Clan.§_-k1P§;
         this.§_-V2v§.mouseEnabled = Game.self["clan_duty"] != Clan.§_-k1P§;
         this.§_-V2v§.name = param1.id.toString();
         §_-Y1S§.§_-uc§(this.§_-V2v§,param1,88,true,Game.self["clan_duty"] != Clan.§_-k1P§,true);
         this.§_-Qr§.text = gls("{0} уровень",§_-My§.§_-n1z§(param1["exp"]));
      }
      
      public function §_-P2v§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(param1.target.name);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.place = new §_-ho§(new TopFrame());
         addChild(this.place);
         addChild(new §_-22V§(gls("Вождь клана").toUpperCase(),62,8,§_-i2c§));
         this.§_-V2v§ = new §_-22V§("",64,21,_loc1_);
         this.§_-V2v§.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         addChild(this.§_-V2v§);
         this.§_-Qr§ = new §_-22V§("",64,33,§_-d1x§);
         this.§_-Qr§.mouseEnabled = false;
         addChild(this.§_-Qr§);
      }
   }
}

