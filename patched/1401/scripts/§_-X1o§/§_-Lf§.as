package §_-X1o§
{
   import §_-5C§.ListElementEvent;
   import com.api.Player;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import utils.§_-vo§;
   
   public class §_-Lf§ extends §_-X27§ implements §_-OP§
   {
      
      public static const §_-kI§:int = 20;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 13px;","color: #000000;","}","a {","text-decoration: none;","margin-right: 0px;","}","a:hover {","text-decoration: underline;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private static const §_-03g§:uint = §_-hF§.§_-31q§ | §_-hF§.§_-k2y§;
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,0,true);
      
      private static const §_-G2i§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,16391453,true,null,null,null,null,"center");
      
      private static const §_-v2T§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,2643905,true,null,null,null,null,"center");
      
      private var view:BattleListItem = null;
      
      private var §_-13L§:§_-22V§ = null;
      
      private var §_-Uk§:§_-22V§ = null;
      
      private var §_-11W§:§_-22V§ = null;
      
      public var player:Player = null;
      
      public var team:int = Hero.§_-114§;
      
      public var frags:int = 0;
      
      public function §_-Lf§(param1:Player, param2:int, param3:int)
      {
         super();
         this.team = param3;
         this.frags = param2;
         this.init();
         this.§_-11W§.text = param2.toString();
         this.player = param1;
         this.player.addEventListener(§_-03g§,this.§_-P9§);
         Game.request(this.player.id,§_-03g§);
      }
      
      public function set number(param1:int) : void
      {
         this.§_-13L§.text = param1.toString() + ".";
      }
      
      override public function get canAdd() : Boolean
      {
         return this.player.isLoaded(§_-03g§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.view = new BattleListItem();
         this.§_-13L§ = new §_-22V§("",0,0,§_-i2c§);
         this.view.addChild(this.§_-13L§);
         this.§_-Uk§ = new §_-22V§("",18,0,_loc1_);
         this.§_-Uk§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-i2I§);
         this.view.addChild(this.§_-Uk§);
         this.§_-11W§ = new §_-22V§("",140,0,this.team == Hero.§_-17§ ? §_-G2i§ : §_-v2T§,24);
         this.view.addChild(this.§_-11W§);
         addChild(this.view);
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(this.player.id);
      }
      
      private function §_-P9§(param1:Player) : void
      {
         if(!param1)
         {
         }
         §_-vo§.§_-A2B§(this.§_-Uk§,this.player.name,115,true,this.player.id != Game.selfId,this.player.id);
         if(this.player.id == Game.selfId)
         {
            this.§_-Uk§.htmlText = "<body><b>" + this.§_-Uk§.text + "</b></body>";
         }
         dispatchEvent(new ListElementEvent(ListElementEvent.CHANGED,this));
         this.player.removeEventListener(this.§_-P9§);
      }
   }
}

