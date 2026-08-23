package §_-X1o§
{
   import §_-5C§.ListElementEvent;
   import §_-I10§.§_-My§;
   import §_-T2y§.§_-92z§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import com.api.Player;
   import events.§_-n13§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import utils.StringUtil;
   import utils.§_-c10§;
   import utils.§_-ex§;
   import utils.§_-xb§;
   import views.§_-Z2N§;
   
   public class §_-jo§ extends §_-X27§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","}","a {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","}","a:hover {","text-decoration: underline;","}",".super {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #660000;","font-weight: bold;","}",".bold {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      public var player:Player;
      
      public var §_-q2G§:Boolean = false;
      
      private var §_-O1y§:Boolean = false;
      
      private var §_-f1S§:Boolean = false;
      
      private var §_-M21§:Boolean = false;
      
      private var §_-O3§:Boolean = false;
      
      private var self:Boolean = false;
      
      private var §_-l20§:int = 2147483647;
      
      private var §_-n2I§:int = -1;
      
      private var background:Sprite;
      
      private var §_-wh§:§_-22V§;
      
      private var §_-Uk§:§_-22V§;
      
      private var §_-j2N§:§_-22V§;
      
      private var §_-l3§:IsDeathIcon;
      
      private var §_-d1j§:ImageClock;
      
      private var §_-g1i§:isExitIcon;
      
      private var clanEmblem:§_-Z2N§ = null;
      
      public function §_-jo§(param1:Player)
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
         if(this.§_-n2I§ == param1)
         {
            return;
         }
         this.§_-n2I§ = param1;
         this.§_-wh§.htmlText = "<body><span class=\'bold\'>" + (this.§_-n2I§ + 1).toString() + "</span>.</body>";
      }
      
      public function get number() : int
      {
         return this.§_-n2I§;
      }
      
      public function set time(param1:int) : void
      {
         this.§_-q2G§ = true;
         if(this.§_-l20§ == param1)
         {
            return;
         }
         this.§_-W2y§ = false;
         this.§_-l20§ = param1;
         this.§_-j2N§.text = §_-ex§.§_-p1x§(param1);
         this.§_-32w§();
      }
      
      public function get time() : int
      {
         return this.§_-l20§;
      }
      
      public function set isDead(param1:Boolean) : void
      {
         if(this.§_-f1S§ == param1)
         {
            return;
         }
         this.§_-f1S§ = param1;
         this.§_-l3§.visible = param1;
      }
      
      public function get isDead() : Boolean
      {
         return this.§_-f1S§;
      }
      
      public function set §_-W2y§(param1:Boolean) : void
      {
         if(this.§_-M21§ == param1)
         {
            return;
         }
         this.§_-M21§ = param1;
         this.§_-d1j§.visible = param1;
      }
      
      public function get §_-W2y§() : Boolean
      {
         return this.§_-M21§;
      }
      
      public function set exit(param1:Boolean) : void
      {
         if(this.§_-O3§ == param1)
         {
            return;
         }
         this.§_-O3§ = param1;
         this.§_-g1i§.visible = param1;
      }
      
      public function get exit() : Boolean
      {
         return this.§_-O3§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         if(this.§_-O1y§ == param1)
         {
            return;
         }
         this.§_-O1y§ = param1;
         if(this.background.parent)
         {
            this.background.parent.removeChild(this.background);
         }
         if(param1)
         {
            if(§_-92z§.§_-O21§(this.player.id))
            {
               switch(§_-92z§.§_-WW§(this.player.id))
               {
                  case Hero.§_-JL§:
                  case Hero.§_-114§:
                     this.background = new ListElementBlue();
                     break;
                  case Hero.§_-17§:
                     this.background = new ListElementRed();
                     break;
                  case Hero.§_-O18§:
                     this.background = new ListElementBlack();
               }
            }
         }
         else
         {
            this.background = this.self ? new ListElementGreen() : new ListElementGrey();
         }
         addChildAt(this.background,0);
         this.§_-wh§.visible = !param1;
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-O1y§;
      }
      
      public function §_-32w§() : void
      {
         dispatchEvent(new ListElementEvent(ListElementEvent.CHANGED,this));
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.self = this.player.id == Game.selfId;
         this.background = this.self ? new ListElementGreen() : new ListElementGrey();
         addChild(this.background);
         this.§_-j2N§ = new §_-22V§("",0,3,new TextFormat(§_-22V§.§_-F2z§,12,1797846,true,null,null,null,null,"right"));
         this.§_-j2N§.width = 242;
         this.§_-j2N§.wordWrap = true;
         addChild(this.§_-j2N§);
         var _loc2_:String = StringUtil.§_-uc§(this.player.name,90);
         var _loc3_:String = "";
         if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-MR§))
         {
            _loc3_ = " [A]";
         }
         else if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-639§))
         {
            _loc3_ = " [M]";
         }
         this.§_-Uk§ = new §_-22V§("",30,2,_loc1_);
         this.§_-Uk§.name = String(this.player.id);
         this.§_-Uk§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-i2I§);
         this.§_-Uk§.text = "<body>" + §_-xb§.§_-e1r§(_loc2_,"event:" + this.player["id"]) + " [" + §_-My§.§_-n1z§(this.player["exp"]) + "]" + _loc3_ + "</body>";
         if(this.self)
         {
            this.§_-Uk§.text = "<body><span class=\'bold\'>" + _loc2_ + "</span>" + " [" + §_-My§.§_-n1z§(this.player["exp"]) + "]" + _loc3_ + "</body>";
         }
         addChild(this.§_-Uk§);
         this.§_-l3§ = new IsDeathIcon();
         this.§_-l3§.visible = false;
         this.§_-l3§.x = 225;
         this.§_-l3§.y = 4;
         addChild(this.§_-l3§);
         this.§_-d1j§ = new ImageClock();
         this.§_-d1j§.visible = false;
         this.§_-d1j§.x = 225;
         this.§_-d1j§.y = 4;
         this.§_-d1j§.scaleX = this.§_-d1j§.scaleY = 0.75;
         addChild(this.§_-d1j§);
         this.§_-g1i§ = new isExitIcon();
         this.§_-g1i§.visible = false;
         this.§_-g1i§.x = 225;
         this.§_-g1i§.y = 4;
         addChild(this.§_-g1i§);
         this.§_-wh§ = new §_-22V§("",1,2,_loc1_);
         addChild(this.§_-wh§);
         if(this.player["clan_id"] == 0)
         {
            return;
         }
         var _loc4_:Clan = §_-e2W§.§_-W2X§(this.player["clan_id"]);
         if(_loc4_ != null && _loc4_.isLoaded())
         {
            this.clanEmblem = new §_-Z2N§(_loc4_.§_-M24§,20,5);
            addChild(this.clanEmblem);
            return;
         }
         this.clanEmblem = new §_-Z2N§("",20,5);
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
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         var _loc2_:§_-22V§ = param1.currentTarget as §_-22V§;
         if(!_loc2_.visible)
         {
            return;
         }
         §_-927§.§_-i2I§(this.player.id);
      }
   }
}

