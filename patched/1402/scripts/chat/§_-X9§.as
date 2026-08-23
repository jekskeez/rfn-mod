package chat
{
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-XW§;
   import §_-c2C§.§_-u24§;
   import com.api.Player;
   import events.§_-a1V§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.StyleSheet;
   import menu.§_-cD§;
   import protocol.§_-s2l§;
   import utils.§_-33I§;
   import utils.§_-r1G§;
   import views.§_-SZ§;
   
   public class §_-X9§ extends Sprite
   {
      
      public static const §_-n3§:int = 20;
      
      public static const §_-O23§:int = 450;
      
      private static const §_-Z2q§:int = 0;
      
      public static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #FFFFFF;","}",".name {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".service_message {","color: #F7CF81;","font-weight: bold;","}",".vip_message {","color: #FEFE00;","}",".name_shaman {","color: #A6DAF7;","font-weight: bold;","}",".name_leader {","color: #FF0000;","font-weight: bold;","}",".name_moderator {","color: #7CF772;","font-weight: bold;","}",".color0 {","color: #FFFFFF;","font-weight: bold;","}",".color1 {","color: #FF5A3A;","font-weight: bold;","}",".color2 {","color: #FFA800;","font-weight: bold;","}",".color3 {","color: #FFF12A;","font-weight: bold;","}",".color4 {","color: #FFC8FF;","font-weight: bold;","}",".color5 {","color: #66F2FF;","font-weight: bold;","}",".color6 {","color: #66A6FF;","font-weight: bold;","}",".color7 {","color: #EF66FF;","font-weight: bold;","}"].join("\n");
      
      private static const §_-zx§:Array = [new DropShadowFilter(0,0,0,0.5,1.5,1.5,7)];
      
      private static const §_-A24§:uint = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-L1b§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-T5§;
      
      protected var player:Player;
      
      protected var playerId:int;
      
      protected var text:String;
      
      protected var §_-b19§:Boolean;
      
      protected var §_-12X§:Boolean;
      
      protected var loader:§_-SZ§;
      
      private var color:int = 0;
      
      private var style:StyleSheet = null;
      
      private var message:§_-i5§ = null;
      
      private var sprite:Sprite = null;
      
      public function §_-X9§(param1:Player, param2:String, param3:Boolean = false, param4:Boolean = true, param5:int = 0)
      {
         super();
         this.player = param1;
         this.playerId = param5 || int(param1["id"]);
         this.text = param2;
         this.§_-b19§ = param3;
         this.color = this.§_-b19§ ? 16774583 : §_-Z2q§;
         this.§_-12X§ = param4;
         this.init();
         if(!this.playerId)
         {
            return;
         }
         this.player.addEventListener(§_-X9§.§_-A24§,this.§_-Y16§);
         Game.request(this.playerId,§_-X9§.§_-A24§);
         this.x -= 10;
      }
      
      public function dispose() : void
      {
         if(this.message)
         {
            this.message.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
         }
      }
      
      public function get isNull() : Boolean
      {
         return this.text == "";
      }
      
      public function get messageHeight() : int
      {
         if(!this.message)
         {
            return §_-n3§;
         }
         return Math.max(§_-n3§,int(this.message.textHeight) + 9);
      }
      
      protected function §_-QQ§(param1:MouseEvent) : void
      {
         var _loc2_:§_-i5§ = §_-i5§(param1.target);
         var _loc3_:int = int(_loc2_.userData);
         if(Game.selfId == _loc3_)
         {
            return;
         }
         §_-cD§.§_-e25§(_loc3_);
      }
      
      protected function §_-z2U§(param1:String) : String
      {
         var _loc2_:String = this.§_-j1g§();
         var _loc3_:String = "";
         if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-42W§))
         {
            _loc3_ += "[A]";
         }
         else if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-AJ§))
         {
            _loc3_ += "[M]";
         }
         _loc2_ += " [" + §_-XW§.§_-Wh§(this.player["exp"]) + "]" + _loc3_ + ": ";
         return "<body>" + this.§_-f1w§(_loc2_) + this.§_-i1l§(param1) + "</body>";
      }
      
      protected function draw(param1:Boolean = true) : void
      {
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
         if(param1)
         {
            if(this.message)
            {
               this.message.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
            }
            while(this.sprite.numChildren > 0)
            {
               this.sprite.removeChildAt(0);
            }
            this.message = new §_-i5§("",0,0,this.style,§_-O23§);
            this.message.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§,false,0,true);
            this.message.filters = §_-zx§;
            this.message.htmlText = this.§_-z2U§(this.text);
            this.message.userData = this.playerId;
            this.message.width = Math.min(§_-O23§,Math.ceil(this.message.textWidth) + 5);
            this.sprite.addChild(this.message);
         }
         var _loc2_:Number = Math.min(§_-O23§,this.message.textWidth);
         var _loc3_:Number = this.message.textHeight;
         this.sprite.graphics.clear();
         this.sprite.graphics.beginFill(this.color,0.35);
         this.sprite.graphics.drawRoundRectComplex((Boolean(this.loader) && this.§_-12X§ ? this.loader.x : 0) - 5,this.message.y - 2,(Boolean(this.loader) && this.§_-12X§ ? 10 : 0) + _loc2_ + 14,_loc3_ + 8,5,5,5,5);
         this.sprite.graphics.endFill();
         addChild(this.sprite);
         if(Boolean(this.loader) && this.§_-12X§)
         {
            this.message.x = this.loader.x + 10;
            addChild(this.loader);
         }
         §_-O1y§.instance.§_-z8§();
      }
      
      protected function §_-Y16§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-Y16§);
         this.draw();
         if(this.player["clan_id"] == 0)
         {
            return;
         }
         §_-B2U§.listen(this.onClanLoaded);
         §_-B2U§.request(this.player["clan_id"],§_-eT§.ALL);
      }
      
      protected function §_-j1g§() : String
      {
         var _loc1_:String = this.player.name;
         if(this.player.id != Game.selfId)
         {
            _loc1_ = §_-r1G§.§_-fU§(this.player.name,"event:" + this.player.id);
         }
         return _loc1_;
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.sprite = new Sprite();
      }
      
      private function §_-f1w§(param1:String = "") : String
      {
         if(!param1)
         {
            param1 = this.§_-j1g§();
         }
         if(§_-u24§.§_-31B§(this.player.id))
         {
            return §_-r1G§.span(param1,"name_shaman");
         }
         if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-42W§))
         {
            return §_-r1G§.span(param1,"name_leader");
         }
         if(§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-AJ§))
         {
            return §_-r1G§.span(param1,"name_moderator");
         }
         if(this.player["vip_exist"] > 0)
         {
            return §_-r1G§.span(param1,"color" + this.player["vip_color"]);
         }
         return §_-r1G§.span(param1,"name");
      }
      
      private function §_-i1l§(param1:String) : String
      {
         if(this.player["vip_exist"] > 0)
         {
            param1 = §_-r1G§.span(param1,"vip_message");
         }
         return param1;
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         if(param1.§_-b19§.id != this.player["clan_id"])
         {
            return;
         }
         §_-B2U§.forget(this.onClanLoaded);
         if(param1.§_-b19§.state != §_-s2l§.§_-YU§)
         {
            return;
         }
         this.loader = new §_-SZ§(param1.§_-b19§.§_-o1p§,0,3);
         this.draw();
      }
   }
}

