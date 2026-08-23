package menu
{
   import §_-I10§.§_-My§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-e1G§.§_-Hb§;
   import §_-xm§.§_-n1a§;
   import com.api.Player;
   import events.§_-n13§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import protocol.§_-S2I§;
   import utils.§_-Y1S§;
   import utils.§_-c10§;
   import utils.§_-vo§;
   import views.§_-Z2N§;
   
   public class §_-03b§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 10px;","}","a {","color: #663300;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","text-align: center;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var §_-63S§:TextField;
      
      private var §_-V2v§:§_-22V§;
      
      private var §_-X2P§:§_-22V§;
      
      private var §_-7q§:§_-22V§;
      
      private var clanEmblem:§_-Z2N§;
      
      private var background:Sprite;
      
      private var §_-e1a§:int = 53;
      
      private var clanId:int = -1;
      
      public function §_-03b§()
      {
         super();
         this.init();
         §_-e2W§.listen(this.§_-P1J§);
      }
      
      override public function get height() : Number
      {
         return this.§_-e1a§ + 0.5;
      }
      
      public function §_-031§(param1:Player) : void
      {
         if(!Game.toggle)
         {
            this.§_-X2P§.text = §_-My§.§_-bh§(param1["level"],false);
            §_-Y1S§.§_-uc§(this.§_-V2v§,param1,130);
            this.clanId = -1;
            this.clanEmblem.visible = false;
            this.§_-63S§.text = "";
            this.§_-63S§.visible = false;
            §_-vo§.§_-A2B§(this.§_-7q§,"ID: " + param1["uid"],140,true,true,param1["uid"]);
            this.§_-7q§.visible = true;
            var _loc2_:Clan = null;
            if(param1["clan_id"] != 0)
            {
               _loc2_ = §_-e2W§.§_-W2X§(param1["clan_id"]);
            }
            if(param1["clan_id"] == 0 || _loc2_ != null && _loc2_.isLoaded() && _loc2_.state != §_-S2I§.§_-Wr§)
            {
               this.§_-V2v§.y = 21;
               this.§_-7q§.y = 37;
               this.update();
               return;
            }
            this.§_-V2v§.y = 17;
            this.§_-7q§.y = 49;
            this.clanId = param1["clan_id"];
            this.clanEmblem.visible = true;
            if(_loc2_ != null && _loc2_.isLoaded() && _loc2_.state == §_-S2I§.§_-Wr§)
            {
               this.§_-P1J§(new §_-n13§(_loc2_,true));
               return;
            }
            §_-e2W§.request(this.clanId,§_-Oy§.ALL);
            return;
         }
         this.§_-X2P§.text = §_-My§.§_-bh§(param1["level"],false);
         §_-Y1S§.§_-uc§(this.§_-V2v§,param1,130);
         this.clanId = -1;
         this.clanEmblem.visible = false;
         this.§_-63S§.text = "";
         this.§_-63S§.visible = false;
         §_-vo§.§_-A2B§(this.§_-7q§,"ID: " + param1["uid"],140,true,true,param1["uid"]);
         this.§_-7q§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§);
         _loc2_ = null;
         if(param1["clan_id"] != 0)
         {
            _loc2_ = §_-e2W§.§_-W2X§(param1["clan_id"]);
         }
         if(param1["clan_id"] == 0 || _loc2_ != null && _loc2_.isLoaded() && _loc2_.state != §_-S2I§.§_-Wr§)
         {
            this.§_-V2v§.y = 21;
            this.§_-7q§.y = 37;
            this.update();
            return;
         }
         this.§_-V2v§.y = 17;
         this.§_-7q§.y = 49;
         this.clanId = param1["clan_id"];
         this.clanEmblem.visible = true;
         if(_loc2_ != null && _loc2_.isLoaded() && _loc2_.state == §_-S2I§.§_-Wr§)
         {
            this.§_-P1J§(new §_-n13§(_loc2_,true));
            return;
         }
         §_-e2W§.request(this.clanId,§_-Oy§.ALL);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.background = new Sprite();
         addChild(this.background);
         this.§_-Qi§();
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,6697728,true);
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,10,8746579,true);
         this.§_-X2P§ = new §_-22V§("",3,4,_loc3_);
         this.§_-X2P§.width = 140;
         this.§_-X2P§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-X2P§);
         this.§_-V2v§ = new §_-22V§("",0,21,_loc2_);
         this.§_-V2v§.width = 140;
         this.§_-V2v§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-V2v§);
         this.§_-63S§ = new TextField();
         this.§_-63S§.x = 16;
         this.§_-63S§.y = 36;
         this.§_-63S§.width = 120;
         this.§_-63S§.styleSheet = _loc1_;
         this.§_-63S§.multiline = true;
         this.§_-63S§.selectable = false;
         this.§_-63S§.embedFonts = true;
         this.§_-63S§.antiAliasType = AntiAliasType.ADVANCED;
         this.§_-63S§.gridFitType = GridFitType.PIXEL;
         this.§_-63S§.thickness = 100;
         this.§_-63S§.sharpness = 0;
         addChild(this.§_-63S§);
         this.§_-63S§.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         this.clanEmblem = new §_-Z2N§("",0,38);
         addChild(this.clanEmblem);
         this.§_-7q§ = new §_-22V§("",0,32,_loc1_);
         this.§_-7q§.width = 140;
         this.§_-7q§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-7q§.addEventListener(MouseEvent.CLICK,Game.§_-S1F§);
         addChild(this.§_-7q§);
         new §_-Hb§(this.§_-7q§,gls("Нажми, чтобы скопировать в буфер обмена."));
      }
      
      private function §_-P1J§(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         if(_loc2_.state != §_-S2I§.§_-Wr§ && _loc2_.state != §_-S2I§.§_-13l§)
         {
            this.§_-63S§.text = "";
            this.§_-63S§.visible = false;
            this.clanEmblem.visible = false;
            this.§_-V2v§.y = 21;
            this.update();
            return;
         }
         §_-vo§.§_-A2B§(this.§_-63S§,_loc2_.name,120,true,true,_loc2_.id);
         this.§_-63S§.visible = true;
         this.§_-63S§.name = _loc2_.id.toString();
         var _loc3_:Rectangle = this.§_-63S§.getCharBoundaries(0);
         this.clanEmblem.x = _loc3_.x + this.§_-63S§.x - 12;
         this.clanEmblem.load(_loc2_.§_-M24§);
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:Number = 42 + (this.§_-63S§.visible ? 11 : 0) + (this.§_-7q§.visible ? 11 : 0);
         if(_loc1_ == this.§_-e1a§)
         {
            return;
         }
         this.§_-e1a§ = _loc1_;
         this.§_-Qi§();
         §_-927§.update();
      }
      
      private function §_-Qi§() : void
      {
         this.background.graphics.clear();
         this.background.graphics.beginFill(16248017);
         this.background.graphics.drawRect(0,0,140,this.§_-e1a§);
         this.background.graphics.endFill();
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         §_-n1a§.show(param1.target.name);
      }
   }
}

