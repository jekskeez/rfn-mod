package menu
{
   import §_-I18§.§_-Tw§;
   import §_-S1n§.§_-kr§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import events.§_-a1V§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import protocol.§_-s2l§;
   import utils.§_-33I§;
   import utils.§_-L2J§;
   import utils.§_-S1m§;
   import views.§_-SZ§;
   
   public class §_-y2z§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 10px;","}","a {","color: #663300;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","text-align: center;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var §_-CI§:TextField;
      
      private var §_-EC§:§_-i5§;
      
      private var §_-23q§:§_-i5§;
      
      private var §_-j23§:§_-i5§;
      
      private var clanEmblem:§_-SZ§;
      
      private var background:Sprite;
      
      private var §_-76§:int = 53;
      
      private var clanId:int = -1;
      
      public function §_-y2z§()
      {
         super();
         this.init();
         §_-B2U§.listen(this.§_-lr§);
      }
      
      override public function get height() : Number
      {
         return this.§_-76§ + 0.5;
      }
      
      public function §_-yC§(param1:Player) : void
      {
         if(!Game.toggle)
         {
            this.§_-23q§.text = §_-XW§.§_-3f§(param1["level"],false);
            §_-S1m§.§_-hB§(this.§_-EC§,param1,130);
            this.clanId = -1;
            this.clanEmblem.visible = false;
            this.§_-CI§.text = "";
            this.§_-CI§.visible = false;
            §_-L2J§.§_-CS§(this.§_-j23§,"ID: " + param1["uid"],140,true,true,param1["uid"]);
            this.§_-j23§.visible = true;
            var _loc2_:Clan = null;
            if(param1["clan_id"] != 0)
            {
               _loc2_ = §_-B2U§.§_-Q2g§(param1["clan_id"]);
            }
            if(param1["clan_id"] == 0 || _loc2_ != null && _loc2_.isLoaded() && _loc2_.state != §_-s2l§.§_-YU§)
            {
               this.§_-EC§.y = 21;
               this.§_-j23§.y = 37;
               this.update();
               return;
            }
            this.§_-EC§.y = 17;
            this.§_-j23§.y = 49;
            this.clanId = param1["clan_id"];
            this.clanEmblem.visible = true;
            if(_loc2_ != null && _loc2_.isLoaded() && _loc2_.state == §_-s2l§.§_-YU§)
            {
               this.§_-lr§(new §_-a1V§(_loc2_,true));
               return;
            }
            §_-B2U§.request(this.clanId,§_-eT§.ALL);
            return;
         }
         this.§_-23q§.text = §_-XW§.§_-3f§(param1["level"],false);
         §_-S1m§.§_-hB§(this.§_-EC§,param1,130);
         this.clanId = -1;
         this.clanEmblem.visible = false;
         this.§_-CI§.text = "";
         this.§_-CI§.visible = false;
         §_-L2J§.§_-CS§(this.§_-j23§,"ID: " + param1["uid"],140,true,true,param1["uid"]);
         this.§_-j23§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§);
         _loc2_ = null;
         if(param1["clan_id"] != 0)
         {
            _loc2_ = §_-B2U§.§_-Q2g§(param1["clan_id"]);
         }
         if(param1["clan_id"] == 0 || _loc2_ != null && _loc2_.isLoaded() && _loc2_.state != §_-s2l§.§_-YU§)
         {
            this.§_-EC§.y = 21;
            this.§_-j23§.y = 37;
            this.update();
            return;
         }
         this.§_-EC§.y = 17;
         this.§_-j23§.y = 49;
         this.clanId = param1["clan_id"];
         this.clanEmblem.visible = true;
         if(_loc2_ != null && _loc2_.isLoaded() && _loc2_.state == §_-s2l§.§_-YU§)
         {
            this.§_-lr§(new §_-a1V§(_loc2_,true));
            return;
         }
         §_-B2U§.request(this.clanId,§_-eT§.ALL);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.background = new Sprite();
         addChild(this.background);
         this.§_-2k§();
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,6697728,true);
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,10,8746579,true);
         this.§_-23q§ = new §_-i5§("",3,4,_loc3_);
         this.§_-23q§.width = 140;
         this.§_-23q§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-23q§);
         this.§_-EC§ = new §_-i5§("",0,21,_loc2_);
         this.§_-EC§.width = 140;
         this.§_-EC§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-EC§);
         this.§_-CI§ = new TextField();
         this.§_-CI§.x = 16;
         this.§_-CI§.y = 36;
         this.§_-CI§.width = 120;
         this.§_-CI§.styleSheet = _loc1_;
         this.§_-CI§.multiline = true;
         this.§_-CI§.selectable = false;
         this.§_-CI§.embedFonts = true;
         this.§_-CI§.antiAliasType = AntiAliasType.ADVANCED;
         this.§_-CI§.gridFitType = GridFitType.PIXEL;
         this.§_-CI§.thickness = 100;
         this.§_-CI§.sharpness = 0;
         addChild(this.§_-CI§);
         this.§_-CI§.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         this.clanEmblem = new §_-SZ§("",0,38);
         addChild(this.clanEmblem);
         this.§_-j23§ = new §_-i5§("",0,32,_loc1_);
         this.§_-j23§.width = 140;
         this.§_-j23§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-j23§.addEventListener(MouseEvent.CLICK,Game.§_-036§);
         addChild(this.§_-j23§);
         new §_-kr§(this.§_-j23§,gls("Нажми, чтобы скопировать в буфер обмена."));
      }
      
      private function §_-lr§(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         if(_loc2_.state != §_-s2l§.§_-YU§ && _loc2_.state != §_-s2l§.§_-M3§)
         {
            this.§_-CI§.text = "";
            this.§_-CI§.visible = false;
            this.clanEmblem.visible = false;
            this.§_-EC§.y = 21;
            this.update();
            return;
         }
         §_-L2J§.§_-CS§(this.§_-CI§,_loc2_.name,120,true,true,_loc2_.id);
         this.§_-CI§.visible = true;
         this.§_-CI§.name = _loc2_.id.toString();
         var _loc3_:Rectangle = this.§_-CI§.getCharBoundaries(0);
         this.clanEmblem.x = _loc3_.x + this.§_-CI§.x - 12;
         this.clanEmblem.load(_loc2_.§_-o1p§);
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:Number = 42 + (this.§_-CI§.visible ? 11 : 0) + (this.§_-j23§.visible ? 11 : 0);
         if(_loc1_ == this.§_-76§)
         {
            return;
         }
         this.§_-76§ = _loc1_;
         this.§_-2k§();
         §_-cD§.update();
      }
      
      private function §_-2k§() : void
      {
         this.background.graphics.clear();
         this.background.graphics.beginFill(16248017);
         this.background.graphics.drawRect(0,0,140,this.§_-76§);
         this.background.graphics.endFill();
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         §_-Tw§.show(param1.target.name);
      }
   }
}

