package §_-cA§
{
   import §_-48§.ListElementEvent;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-XW§;
   import §_-c2C§.§_-u24§;
   import com.api.Player;
   import events.§_-a1V§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import utils.StringUtil;
   import utils.§_-33I§;
   import utils.§_-B1d§;
   import utils.§_-r1G§;
   import views.§_-SZ§;
   
   public class §_-tP§ extends §_-3b§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","}","a {","font-family: \"" + §_-i5§.§_-c10§ + "\";","}","a:hover {","text-decoration: underline;","}",".super {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #660000;","font-weight: bold;","}",".bold {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      public var player:Player;
      
      public var §_-A2M§:Boolean = false;
      
      private var §_-C1F§:Boolean = false;
      
      private var §_-n2c§:Boolean = false;
      
      private var §_-t2r§:Boolean = false;
      
      private var §_-E8§:Boolean = false;
      
      private var self:Boolean = false;
      
      private var §_-J1Z§:int = 2147483647;
      
      private var §_-d2D§:int = -1;
      
      private var background:Sprite;
      
      private var §_-73n§:§_-i5§;
      
      private var §_-N2m§:§_-i5§;
      
      private var §_-W2d§:§_-i5§;
      
      private var §_-11f§:IsDeathIcon;
      
      private var §_-x0§:ImageClock;
      
      private var §_-XP§:isExitIcon;
      
      private var clanEmblem:§_-SZ§ = null;
      
      public function §_-tP§(param1:Player)
      {
         this.player = param1;
         super();
         this.init();
      }
      
      public function get id() : int
      {
         return this.player.id;
      }
      
      public function set number(param1:int) : void
      {
         if(this.§_-d2D§ == param1)
         {
            return;
         }
         this.§_-d2D§ = param1;
         this.§_-73n§.htmlText = "<body><span class=\'bold\'>" + (this.§_-d2D§ + 1).toString() + "</span>.</body>";
      }
      
      public function get number() : int
      {
         return this.§_-d2D§;
      }
      
      public function set time(param1:int) : void
      {
         this.§_-A2M§ = true;
         if(this.§_-J1Z§ == param1)
         {
            return;
         }
         this.§_-xE§ = false;
         this.§_-J1Z§ = param1;
         this.§_-W2d§.text = §_-B1d§.§_-z2d§(param1);
         this.§_-S2K§();
      }
      
      public function get time() : int
      {
         return this.§_-J1Z§;
      }
      
      public function set isDead(param1:Boolean) : void
      {
         if(this.§_-n2c§ == param1)
         {
            return;
         }
         this.§_-n2c§ = param1;
         this.§_-11f§.visible = param1;
      }
      
      public function get isDead() : Boolean
      {
         return this.§_-n2c§;
      }
      
      public function set §_-xE§(param1:Boolean) : void
      {
         if(this.§_-t2r§ == param1)
         {
            return;
         }
         this.§_-t2r§ = param1;
         this.§_-x0§.visible = param1;
      }
      
      public function get §_-xE§() : Boolean
      {
         return this.§_-t2r§;
      }
      
      public function set exit(param1:Boolean) : void
      {
         if(this.§_-E8§ == param1)
         {
            return;
         }
         this.§_-E8§ = param1;
         this.§_-XP§.visible = param1;
      }
      
      public function get exit() : Boolean
      {
         return this.§_-E8§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.§_-C1F§ == param1)
         {
            return;
         }
         this.§_-C1F§ = param1;
         if(this.background.parent)
         {
            this.background.parent.removeChild(this.background);
         }
         if(param1)
         {
            if(§_-u24§.§_-bL§(this.player.id))
            {
               switch(§_-u24§.§_-M2t§(this.player.id))
               {
                  case Hero.§_-PM§:
                  case Hero.§_-i1Y§:
                     this.background = new ListElementBlue();
                     break;
                  case Hero.§_-l1B§:
                     this.background = new ListElementRed();
                     break;
                  case Hero.§_-m28§:
                     this.background = new ListElementBlack();
               }
            }
         }
         else
         {
            this.background = this.self ? new ListElementGreen() : new ListElementGrey();
         }
         addChildAt(this.background,0);
         this.§_-73n§.visible = !param1;
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-C1F§;
      }
      
      public function §_-S2K§() : void
      {
         dispatchEvent(new ListElementEvent(ListElementEvent.CHANGED,this));
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.self = this.player.id == Game.selfId;
         this.background = this.self ? new ListElementGreen() : new ListElementGrey();
         addChild(this.background);
         this.§_-W2d§ = new §_-i5§("",0,3,new TextFormat(§_-i5§.§_-c10§,12,1797846,true,null,null,null,null,"right"));
         this.§_-W2d§.width = 242;
         this.§_-W2d§.wordWrap = true;
         addChild(this.§_-W2d§);
         var _loc2_:String = StringUtil.§_-hB§(this.player.name,90);
         var _loc3_:String = "";
         if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-42W§))
         {
            _loc3_ = " [A]";
         }
         else if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-AJ§))
         {
            _loc3_ = " [M]";
         }
         this.§_-N2m§ = new §_-i5§("",30,2,_loc1_);
         this.§_-N2m§.name = String(this.player.id);
         this.§_-N2m§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-e25§);
         this.§_-N2m§.text = "<body>" + §_-r1G§.§_-fU§(_loc2_,"event:" + this.player["id"]) + " [" + §_-XW§.§_-Wh§(this.player["exp"]) + "]" + _loc3_ + "</body>";
         if(this.self)
         {
            this.§_-N2m§.text = "<body><span class=\'bold\'>" + _loc2_ + "</span>" + " [" + §_-XW§.§_-Wh§(this.player["exp"]) + "]" + _loc3_ + "</body>";
         }
         addChild(this.§_-N2m§);
         this.§_-11f§ = new IsDeathIcon();
         this.§_-11f§.visible = false;
         this.§_-11f§.x = 225;
         this.§_-11f§.y = 4;
         addChild(this.§_-11f§);
         this.§_-x0§ = new ImageClock();
         this.§_-x0§.visible = false;
         this.§_-x0§.x = 225;
         this.§_-x0§.y = 4;
         this.§_-x0§.scaleX = this.§_-x0§.scaleY = 0.75;
         addChild(this.§_-x0§);
         this.§_-XP§ = new isExitIcon();
         this.§_-XP§.visible = false;
         this.§_-XP§.x = 225;
         this.§_-XP§.y = 4;
         addChild(this.§_-XP§);
         this.§_-73n§ = new §_-i5§("",1,2,_loc1_);
         addChild(this.§_-73n§);
         if(this.player["clan_id"] == 0)
         {
            return;
         }
         var _loc4_:Clan = §_-B2U§.§_-Q2g§(this.player["clan_id"]);
         if(_loc4_ != null && _loc4_.isLoaded())
         {
            this.clanEmblem = new §_-SZ§(_loc4_.§_-o1p§,20,5);
            addChild(this.clanEmblem);
            return;
         }
         this.clanEmblem = new §_-SZ§("",20,5);
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
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         var _loc2_:§_-i5§ = param1.currentTarget as §_-i5§;
         if(!_loc2_.visible)
         {
            return;
         }
         §_-cD§.§_-e25§(this.player.id);
      }
   }
}

