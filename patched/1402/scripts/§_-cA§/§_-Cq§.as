package §_-cA§
{
   import §_-48§.ListElementEvent;
   import com.api.Player;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import utils.§_-L2J§;
   
   public class §_-Cq§ extends §_-3b§ implements §_-H2w§
   {
      
      public static const §_-i2u§:int = 20;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 13px;","color: #000000;","}","a {","text-decoration: none;","margin-right: 0px;","}","a:hover {","text-decoration: underline;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private static const §_-A24§:uint = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§;
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,0,true);
      
      private static const §_-V2k§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,16391453,true,null,null,null,null,"center");
      
      private static const §_-916§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,2643905,true,null,null,null,null,"center");
      
      private var view:BattleListItem = null;
      
      private var §_-Mt§:§_-i5§ = null;
      
      private var §_-N2m§:§_-i5§ = null;
      
      private var §_-w2R§:§_-i5§ = null;
      
      public var player:Player = null;
      
      public var team:int = Hero.§_-i1Y§;
      
      public var frags:int = 0;
      
      public function §_-Cq§(param1:Player, param2:int, param3:int)
      {
         super();
         this.team = param3;
         this.frags = param2;
         this.init();
         this.§_-w2R§.text = param2.toString();
         this.player = param1;
         this.player.addEventListener(§_-A24§,this.§_-Y16§);
         Game.request(this.player.id,§_-A24§);
      }
      
      public function set number(param1:int) : void
      {
         this.§_-Mt§.text = param1.toString() + ".";
      }
      
      override public function get canAdd() : Boolean
      {
         return this.player.isLoaded(§_-A24§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.view = new BattleListItem();
         this.§_-Mt§ = new §_-i5§("",0,0,§_-W2P§);
         this.view.addChild(this.§_-Mt§);
         this.§_-N2m§ = new §_-i5§("",18,0,_loc1_);
         this.§_-N2m§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-e25§);
         this.view.addChild(this.§_-N2m§);
         this.§_-w2R§ = new §_-i5§("",140,0,this.team == Hero.§_-l1B§ ? §_-V2k§ : §_-916§,24);
         this.view.addChild(this.§_-w2R§);
         addChild(this.view);
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(this.player.id);
      }
      
      private function §_-Y16§(param1:Player) : void
      {
         if(!param1)
         {
         }
         §_-L2J§.§_-CS§(this.§_-N2m§,this.player.name,115,true,this.player.id != Game.selfId,this.player.id);
         if(this.player.id == Game.selfId)
         {
            this.§_-N2m§.htmlText = "<body><b>" + this.§_-N2m§.text + "</b></body>";
         }
         dispatchEvent(new ListElementEvent(ListElementEvent.CHANGED,this));
         this.player.removeEventListener(this.§_-Y16§);
      }
   }
}

