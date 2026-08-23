package chat
{
   import §_-I10§.§_-My§;
   import §_-T2y§.§_-92z§;
   import §_-dc§.§_-e2W§;
   import com.api.Player;
   import events.§_-n13§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.StyleSheet;
   import menu.§_-927§;
   import protocol.§_-S2I§;
   import utils.§_-c10§;
   import utils.§_-xb§;
   import views.§_-Z2N§;
   
   public class §_-s2y§ extends Sprite
   {
      
      public static const §_-K2E§:int = 20;
      
      public static const §_-N7§:int = 450;
      
      private static const §_-R11§:int = 0;
      
      public static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #FFFFFF;","}",".name {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".service_message {","color: #F7CF81;","font-weight: bold;","}",".vip_message {","color: #FEFE00;","}",".name_shaman {","color: #A6DAF7;","font-weight: bold;","}",".name_leader {","color: #FF0000;","font-weight: bold;","}",".name_moderator {","color: #7CF772;","font-weight: bold;","}",".color0 {","color: #FFFFFF;","font-weight: bold;","}",".color1 {","color: #FF5A3A;","font-weight: bold;","}",".color2 {","color: #FFA800;","font-weight: bold;","}",".color3 {","color: #FFF12A;","font-weight: bold;","}",".color4 {","color: #FFC8FF;","font-weight: bold;","}",".color5 {","color: #66F2FF;","font-weight: bold;","}",".color6 {","color: #66A6FF;","font-weight: bold;","}",".color7 {","color: #EF66FF;","font-weight: bold;","}"].join("\n");
      
      private static const §_-d2o§:Array = [new DropShadowFilter(0,0,0,0.5,1.5,1.5,7)];
      
      private static const §_-03g§:uint = §_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-329§ | §_-hF§.§_-P13§ | §_-hF§.§_-sK§;
      
      protected var player:Player;
      
      protected var playerId:int;
      
      protected var text:String;
      
      protected var §_-81t§:Boolean;
      
      protected var §_-42E§:Boolean;
      
      protected var loader:§_-Z2N§;
      
      private var color:int = 0;
      
      private var style:StyleSheet = null;
      
      private var message:§_-22V§ = null;
      
      private var sprite:Sprite = null;
      
      public function §_-s2y§(param1:Player, param2:String, param3:Boolean = false, param4:Boolean = true, param5:int = 0)
      {
         super();
         this.player = param1;
         this.playerId = param5 || int(param1["id"]);
         this.text = param2;
         this.§_-81t§ = param3;
         this.color = this.§_-81t§ ? 16774583 : §_-R11§;
         this.§_-42E§ = param4;
         this.init();
         if(!this.playerId)
         {
            return;
         }
         this.player.addEventListener(§_-s2y§.§_-03g§,this.§_-P9§);
         Game.request(this.playerId,§_-s2y§.§_-03g§);
         this.x -= 10;
      }
      
      public function dispose() : void
      {
         if(this.message)
         {
            this.message.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
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
            return §_-K2E§;
         }
         return Math.max(§_-K2E§,int(this.message.textHeight) + 9);
      }
      
      protected function §_-o1P§(param1:MouseEvent) : void
      {
         var _loc2_:§_-22V§ = §_-22V§(param1.target);
         var _loc3_:int = int(_loc2_.userData);
         if(Game.selfId == _loc3_)
         {
            return;
         }
         §_-927§.§_-i2I§(_loc3_);
      }
      
      protected function §_-w1s§(param1:String) : String
      {
         var _loc2_:String = this.§_-F3§();
         var _loc3_:String = "";
         if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-MR§))
         {
            _loc3_ += "[A]";
         }
         else if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-639§))
         {
            _loc3_ += "[M]";
         }
         _loc2_ += " [" + §_-My§.§_-n1z§(this.player["exp"]) + "]" + _loc3_ + ": ";
         return "<body>" + this.§_-22Q§(_loc2_) + this.§_-d1F§(param1) + "</body>";
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
               this.message.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
            }
            while(this.sprite.numChildren > 0)
            {
               this.sprite.removeChildAt(0);
            }
            this.message = new §_-22V§("",0,0,this.style,§_-N7§);
            this.message.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§,false,0,true);
            this.message.filters = §_-d2o§;
            this.message.htmlText = this.§_-w1s§(this.text);
            this.message.userData = this.playerId;
            this.message.width = Math.min(§_-N7§,Math.ceil(this.message.textWidth) + 5);
            this.sprite.addChild(this.message);
         }
         var _loc2_:Number = Math.min(§_-N7§,this.message.textWidth);
         var _loc3_:Number = this.message.textHeight;
         this.sprite.graphics.clear();
         this.sprite.graphics.beginFill(this.color,0.35);
         this.sprite.graphics.drawRoundRectComplex((Boolean(this.loader) && this.§_-42E§ ? this.loader.x : 0) - 5,this.message.y - 2,(Boolean(this.loader) && this.§_-42E§ ? 10 : 0) + _loc2_ + 14,_loc3_ + 8,5,5,5,5);
         this.sprite.graphics.endFill();
         addChild(this.sprite);
         if(Boolean(this.loader) && this.§_-42E§)
         {
            this.message.x = this.loader.x + 10;
            addChild(this.loader);
         }
         §_-r0§.instance.§_-t2S§();
      }
      
      protected function §_-P9§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-P9§);
         this.draw();
         if(this.player["clan_id"] == 0)
         {
            return;
         }
         §_-e2W§.listen(this.onClanLoaded);
         §_-e2W§.request(this.player["clan_id"],§_-Oy§.ALL);
      }
      
      protected function §_-F3§() : String
      {
         var _loc1_:String = this.player.name;
         if(this.player.id != Game.selfId)
         {
            _loc1_ = §_-xb§.§_-e1r§(this.player.name,"event:" + this.player.id);
         }
         return _loc1_;
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.sprite = new Sprite();
      }
      
      private function §_-22Q§(param1:String = "") : String
      {
         if(!param1)
         {
            param1 = this.§_-F3§();
         }
         if(§_-92z§.§_-81f§(this.player.id))
         {
            return §_-xb§.span(param1,"name_shaman");
         }
         if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-MR§))
         {
            return §_-xb§.span(param1,"name_leader");
         }
         if(§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-639§))
         {
            return §_-xb§.span(param1,"name_moderator");
         }
         if(this.player["vip_exist"] > 0)
         {
            return §_-xb§.span(param1,"color" + this.player["vip_color"]);
         }
         return §_-xb§.span(param1,"name");
      }
      
      private function §_-d1F§(param1:String) : String
      {
         if(this.player["vip_exist"] > 0)
         {
            param1 = §_-xb§.span(param1,"vip_message");
         }
         return param1;
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         if(param1.§_-81t§.id != this.player["clan_id"])
         {
            return;
         }
         §_-e2W§.forget(this.onClanLoaded);
         if(param1.§_-81t§.state != §_-S2I§.§_-Wr§)
         {
            return;
         }
         this.loader = new §_-Z2N§(param1.§_-81t§.§_-M24§,0,3);
         this.draw();
      }
   }
}

