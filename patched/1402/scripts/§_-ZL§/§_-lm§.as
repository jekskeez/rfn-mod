package §_-ZL§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-61C§.§_-sg§;
   import §_-B1G§.§_-32t§;
   import §_-bN§.Dialog;
   import §_-l2u§.§_-62b§;
   import §_-l2u§.§_-V2i§;
   import com.api.Player;
   import events.EditorEvent;
   import fl.data.DataProvider;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-33I§;
   import utils.§_-72U§;
   import utils.§_-r1G§;
   
   public class §_-lm§ extends Dialog
   {
      
      private static const §_-A3C§:int = 5;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #5E3929;","}","a {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-DZ§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,6175017);
      
      private static const §_-1G§:TextFormat = new TextFormat(§_-i5§.§_-c10§,10,6175017);
      
      private static var _instance:§_-lm§ = null;
      
      public var §_-X1L§:§_-32t§ = null;
      
      public var §_-WA§:§_-32t§ = null;
      
      public var §_-22M§:§_-32t§ = null;
      
      public var §_-o5§:§_-32t§ = null;
      
      public var §_-wA§:Boolean = false;
      
      public var silent:Boolean = false;
      
      private var §_-B2X§:§_-72U§;
      
      private var §_-F1r§:§_-72U§;
      
      private var §_-n25§:§_-72U§;
      
      private var §_-H2f§:§_-72U§;
      
      private var §_-D19§:§_-72U§;
      
      private var §_-a1u§:§_-72U§;
      
      private var §_-C26§:§_-i5§;
      
      private var §_-b7§:§_-i5§;
      
      private var §_-31f§:§_-i5§;
      
      private var §_-q2u§:§_-i5§;
      
      private var §_-F2e§:§_-i5§;
      
      private var §_-B3Z§:§_-i5§;
      
      private var §_-eX§:§_-i5§;
      
      private var §_-hN§:§_-i5§;
      
      private var §_-uq§:§_-i5§;
      
      private var §_-y1§:§_-i5§;
      
      private var locationId:int = 0;
      
      private var modeId:int = 0;
      
      private var §_-x2t§:int = 0;
      
      private var §_-I1a§:int = 0;
      
      private var §_-62y§:int = 0;
      
      private var §_-c2l§:§_-sg§;
      
      private var §_-cP§:int = 0;
      
      public function §_-lm§(param1:§_-sg§)
      {
         super(gls("Информация о карте"));
         this.§_-c2l§ = param1;
         _instance = this;
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-aD§);
         var _loc3_:§_-i5§ = new §_-i5§(gls("Локация: "),§_-A3C§,24,§_-DZ§);
         addChild(_loc3_);
         var _loc4_:§_-i5§ = new §_-i5§(gls("Режим: "),§_-A3C§,62,§_-DZ§);
         addChild(_loc4_);
         this.§_-y1§ = new §_-i5§(gls("Нет режима"),92,65,§_-DZ§);
         addChild(this.§_-y1§);
         var _loc5_:§_-i5§ = new §_-i5§(gls("Номер: "),§_-A3C§,82,§_-DZ§);
         addChild(_loc5_);
         this.§_-31f§ = new §_-i5§("",§_-A3C§ + 55,82,§_-DZ§);
         addChild(this.§_-31f§);
         var _loc6_:§_-i5§ = new §_-i5§(gls("Автор: "),§_-A3C§,102,§_-DZ§);
         addChild(_loc6_);
         this.§_-q2u§ = new §_-i5§("",§_-A3C§ + 55,102,_loc2_);
         this.§_-q2u§.width = 200;
         this.§_-q2u§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
         addChild(this.§_-q2u§);
         var _loc7_:§_-i5§ = new §_-i5§(gls("Редактор: "),§_-A3C§,242,§_-DZ§);
         addChild(_loc7_);
         this.§_-F2e§ = new §_-i5§("",§_-A3C§ + 75,242,_loc2_);
         this.§_-F2e§.width = 200;
         this.§_-F2e§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(this.§_-F2e§);
         }
         var _loc8_:§_-i5§ = new §_-i5§(gls("Время: "),§_-A3C§,122,§_-DZ§);
         addChild(_loc8_);
         this.§_-B2X§ = new §_-72U§("",94,124,33,16,§_-1G§,null,2);
         this.§_-B2X§.restrict = "0-9";
         this.§_-B2X§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-b12§,false,0,true);
         addChild(this.§_-B2X§);
         this.§_-F1r§ = new §_-72U§("",136,124,33,16,§_-1G§,null,2);
         this.§_-F1r§.restrict = "0-9";
         this.§_-F1r§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-b12§,false,0,true);
         addChild(this.§_-F1r§);
         this.§_-C26§ = new §_-i5§(gls("Размер: "),§_-A3C§,142,§_-DZ§);
         addChild(this.§_-C26§);
         this.§_-n25§ = new §_-72U§("",94,144,33,16,§_-1G§,null,5);
         this.§_-n25§.restrict = "0-9";
         this.§_-n25§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-32q§,false,0,true);
         addChild(this.§_-n25§);
         this.§_-H2f§ = new §_-72U§("",136,144,33,16,§_-1G§,null,5);
         this.§_-H2f§.restrict = "0-9";
         this.§_-H2f§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-32q§,false,0,true);
         addChild(this.§_-H2f§);
         this.§_-b7§ = new §_-i5§(gls("Гравитация: "),§_-A3C§,162,§_-DZ§);
         addChild(this.§_-b7§);
         this.§_-D19§ = new §_-72U§("",94,164,33,16,§_-1G§,null,7);
         this.§_-D19§.restrict = "-[0-9].";
         this.§_-D19§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-32q§,false,0,true);
         addChild(this.§_-D19§);
         this.§_-a1u§ = new §_-72U§("",136,164,33,16,§_-1G§,null,7);
         this.§_-a1u§.restrict = "-[0-9].";
         this.§_-a1u§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-32q§,false,0,true);
         addChild(this.§_-a1u§);
         var _loc9_:§_-i5§ = new §_-i5§(gls("Награда: "),§_-A3C§,182,§_-DZ§);
         addChild(_loc9_);
         var _loc10_:§_-i5§ = new §_-i5§(gls("Оценка карты: "),§_-A3C§,202,§_-DZ§);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(_loc10_);
         }
         var _loc11_:§_-i5§ = new §_-i5§(gls("Количество игр: "),§_-A3C§,222,§_-DZ§);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(_loc11_);
         }
         this.§_-B3Z§ = new §_-i5§("",_loc10_.x + _loc10_.width,202,new TextFormat(§_-i5§.§_-c10§,14,4567040));
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(this.§_-B3Z§);
         }
         this.§_-eX§ = new §_-i5§("",this.§_-B3Z§.x + this.§_-B3Z§.width + 10,202,new TextFormat(§_-i5§.§_-c10§,14,16711680));
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(this.§_-eX§);
         }
         this.§_-hN§ = new §_-i5§("",this.§_-eX§.x + this.§_-eX§.width + 10,202,new TextFormat(§_-i5§.§_-c10§,14,13260));
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(this.§_-hN§);
         }
         this.§_-uq§ = new §_-i5§("",_loc11_.x + _loc11_.width,222,§_-DZ§);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(this.§_-uq§);
         }
         var _loc12_:§_-i5§ = new §_-i5§("<body><a href=\'event:#\'>Сброс</a></body>",§_-A3C§ + 210,this.§_-uq§.y - 15,_loc2_);
         _loc12_.addEventListener(MouseEvent.CLICK,this.§_-I15§);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§))
         {
            addChild(_loc12_);
         }
         this.§_-X1L§ = new §_-32t§(145);
         this.§_-X1L§.x = §_-A3C§ + 85;
         this.§_-X1L§.y = 4;
         this.§_-X1L§.addEventListener(Event.CHANGE,this.§_-q2x§);
         this.§_-X1L§.addItem({
            "label":gls("Релиз"),
            "value":§_-at§.§_-L1l§
         });
         this.§_-X1L§.addItem({
            "label":gls("Готовы к релизу"),
            "value":§_-at§.§_-e2M§
         });
         this.§_-X1L§.§_-JZ§ = 0;
         this.§_-X1L§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
         addChild(this.§_-X1L§);
         this.§_-WA§ = new §_-32t§(145);
         this.§_-WA§.x = §_-A3C§ + 85;
         this.§_-WA§.y = 24;
         this.§_-WA§.addEventListener(Event.CHANGE,this.§_-rr§);
         addChild(this.§_-WA§);
         this.§_-o5§ = new §_-32t§(145);
         this.§_-o5§.x = §_-A3C§ + 85;
         this.§_-o5§.y = 44;
         this.§_-o5§.addEventListener(Event.CHANGE,this.§_-v2s§);
         addChild(this.§_-o5§);
         this.§_-22M§ = new §_-32t§(145);
         this.§_-22M§.x = §_-A3C§ + 85;
         this.§_-22M§.y = 64;
         this.§_-22M§.addEventListener(Event.CHANGE,this.§_-zA§);
         addChild(this.§_-22M§);
         place();
         this.width = 255 + this.§_-01q§ + this.§_-7N§ + 2 * §_-A3C§;
         this.height = 315;
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            _loc5_.visible = false;
            this.§_-31f§.visible = false;
            _loc6_.visible = false;
            this.§_-q2u§.visible = false;
            _loc7_.visible = false;
            this.§_-F2e§.visible = false;
            _loc8_.y = 88;
            this.§_-B2X§.y = 90;
            this.§_-F1r§.y = 90;
            this.§_-C26§.y = 108;
            this.§_-n25§.y = 110;
            this.§_-H2f§.y = 110;
            this.§_-b7§.y = 128;
            this.§_-D19§.y = 130;
            this.§_-a1u§.y = 130;
            _loc9_.visible = false;
            this.height -= 110;
         }
         else
         {
            this.§_-F2e§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
            _loc7_.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
            _loc9_.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§);
         }
      }
      
      public static function get instance() : §_-lm§
      {
         if(!_instance)
         {
            new §_-lm§(§_-sg§.instance);
         }
         return _instance;
      }
      
      public static function get minutes() : int
      {
         return _instance.minutes;
      }
      
      public static function get seconds() : int
      {
         return _instance.seconds;
      }
      
      public static function get location() : int
      {
         return _instance.locationId;
      }
      
      public static function get mode() : int
      {
         return _instance.mode;
      }
      
      public static function get §_-uj§() : int
      {
         return §_-V2i§.§_-r2d§(_instance.§_-X1L§,§_-at§.§_-L1l§);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.stage.focus = Game.stage;
      }
      
      override public function show() : void
      {
         this.§_-ZY§();
         super.show();
      }
      
      public function §_-ZY§() : void
      {
         var _loc1_:GameMap = this.§_-Kt§();
         if(!_loc1_)
         {
            return;
         }
         this.§_-n25§.text = String(_loc1_.size.x);
         this.§_-H2f§.text = String(_loc1_.size.y);
         this.§_-D19§.text = String(_loc1_.gravity.x);
         this.§_-a1u§.text = String(_loc1_.gravity.y);
      }
      
      public function §_-T1K§() : void
      {
         this.§_-q2u§.text = "";
         this.§_-F2e§.text = "";
         this.§_-31f§.text = "";
      }
      
      public function §_-rr§(param1:Event) : void
      {
         if(this.visible && this.§_-WA§.§_-E2v§["value"] == §_-at§.§_-31L§ && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§))
         {
            this.§_-WA§.§_-JZ§ = this.§_-cP§;
            return;
         }
         this.§_-cP§ = this.§_-WA§.§_-JZ§;
         this.locationId = this.§_-WA§.§_-E2v§["value"];
         this.§_-WA§.enabled = !(this.locationId == §_-at§.§_-31L§ && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§));
         this.§_-85§();
         this.§_-k1n§();
         var _loc2_:Array = this.§_-c2l§.§_-23H§.§_-n2K§();
         this.modeId = this.§_-22M§.visible ? int(this.§_-22M§.§_-E2v§["value"]) : 0;
         this.§_-x2t§ = §_-V2i§.§_-x2t§(this.§_-o5§);
         this.§_-c2l§.location = this.locationId;
         this.§_-c2l§.mode = this.modeId;
         if(!this.silent)
         {
            dispatchEvent(new EditorEvent(EditorEvent.LOCATION_CHANGED,this.locationId,this.modeId,this.§_-x2t§));
         }
         this.§_-c2l§.§_-C3Z§();
         this.§_-c2l§.§_-e1c§(true);
         this.§_-c2l§.§_-aR§(_loc2_);
         this.§_-x2v§();
      }
      
      public function §_-v2s§(param1:Event = null) : void
      {
         var _loc2_:Array = this.§_-c2l§.§_-23H§.§_-n2K§();
         this.§_-x2t§ = §_-V2i§.§_-x2t§(this.§_-o5§);
         this.§_-k1n§();
         this.modeId = this.§_-22M§.visible ? int(this.§_-22M§.§_-E2v§["value"]) : 0;
         this.§_-c2l§.location = this.locationId;
         this.§_-c2l§.mode = this.modeId;
         if(!this.silent)
         {
            dispatchEvent(new EditorEvent(EditorEvent.SUBLOCATION_CHANGED,this.locationId,this.modeId,this.§_-x2t§));
         }
         this.§_-c2l§.§_-e1c§();
         this.§_-c2l§.§_-aR§(_loc2_);
         this.§_-x2v§();
      }
      
      public function get §_-F2u§() : int
      {
         return this.locationId;
      }
      
      public function §_-S1§() : void
      {
         this.locationId = §_-V2i§.§_-r2d§(this.§_-WA§,this.locationId);
         this.modeId = this.§_-22M§.visible ? §_-V2i§.§_-r2d§(this.§_-22M§,0) : 0;
         this.§_-x2t§ = §_-V2i§.§_-x2t§(this.§_-o5§);
      }
      
      public function §_-zA§(param1:Event = null) : void
      {
         var _loc2_:Array = this.§_-c2l§.§_-23H§.§_-n2K§();
         this.modeId = this.§_-22M§.§_-E2v§["value"];
         this.§_-c2l§.location = this.locationId;
         this.§_-c2l§.mode = this.modeId;
         if(!this.silent)
         {
            dispatchEvent(new EditorEvent(EditorEvent.MODE_CHANGED,this.locationId,this.modeId,this.§_-x2t§));
         }
         this.§_-c2l§.§_-e1c§();
         this.§_-c2l§.§_-aR§(_loc2_);
         this.§_-x2v§();
      }
      
      public function §_-q2x§(param1:Event = null) : void
      {
         this.§_-K2v§();
         this.§_-WA§.§_-JZ§ = 0;
         this.§_-rr§(param1);
      }
      
      public function §_-K2v§() : void
      {
         var _loc2_:Location = null;
         var _loc1_:DataProvider = new DataProvider();
         for each(_loc2_ in §_-at§.list)
         {
            if(!(!this.§_-IZ§(_loc2_.id) || !this.§_-h1E§(_loc2_.id) || !this.§_-53a§(_loc2_.id) || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && _loc2_.id == §_-at§.§_-lg§ && this.§_-wA§))
            {
               _loc1_.addItem({
                  "label":_loc2_.name,
                  "value":_loc2_.id
               });
            }
         }
         this.§_-WA§.§_-GO§ = _loc1_;
         this.§_-85§();
         this.§_-k1n§();
      }
      
      public function get minutes() : int
      {
         return int(this.§_-B2X§.text);
      }
      
      public function get seconds() : int
      {
         return int(this.§_-F1r§.text);
      }
      
      public function §_-43C§(param1:int) : void
      {
         this.§_-B2X§.text = String(int(param1 / 60));
         var _loc2_:int = param1 % 60;
         this.§_-F1r§.text = (_loc2_ < 10 ? "0" : "") + String(_loc2_);
      }
      
      public function get §_-5V§() : int
      {
         return this.§_-I1a§;
      }
      
      public function set §_-E1v§(param1:int) : void
      {
         if(param1 == 0)
         {
            this.§_-F2e§.text = "";
            return;
         }
         this.§_-62y§ = param1;
         var _loc2_:Player = Game.getPlayer(param1);
         this.§_-F2e§.text = "<body>" + this.§_-j1g§(_loc2_) + "</body>";
      }
      
      public function set §_-5V§(param1:int) : void
      {
         this.§_-I1a§ = param1;
         var _loc2_:Player = Game.getPlayer(param1);
         this.§_-q2u§.text = "<body>" + this.§_-j1g§(_loc2_) + "</body>";
         this.§_-q2u§.userData = param1;
      }
      
      public function set map(param1:int) : void
      {
         this.§_-31f§.text = String(param1);
      }
      
      public function set mode(param1:int) : void
      {
         this.modeId = param1;
         if(this.§_-22M§.visible)
         {
            this.§_-22M§.§_-23V§(this.modeId);
         }
         this.§_-c2l§.location = this.locationId;
         this.§_-c2l§.mode = this.modeId;
      }
      
      public function get location() : int
      {
         return this.locationId;
      }
      
      public function get mode() : int
      {
         return this.modeId;
      }
      
      public function set sub(param1:int) : void
      {
         this.§_-x2t§ = param1;
         this.§_-o5§.§_-23V§(this.§_-x2t§);
      }
      
      public function get sub() : int
      {
         return this.§_-x2t§;
      }
      
      public function rating(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.§_-B3Z§.text = (param1 > 0 ? "+" : "") + String(param1);
         this.§_-eX§.text = (param2 > 0 ? "-" : "") + String(param2);
         this.§_-hN§.text = (param3 > 0 ? "-" : "") + String(param3) + "/" + param4;
         this.§_-uq§.text = param5.toString();
         this.§_-eX§.x = this.§_-B3Z§.x + this.§_-B3Z§.width + 10;
         this.§_-hN§.x = this.§_-eX§.x + this.§_-eX§.width + 10;
      }
      
      private function §_-I15§(param1:MouseEvent) : void
      {
         if(this.§_-31f§.text == "")
         {
            return;
         }
         this.rating(0,0,0,0,0);
         Connection.§_-e2T§(§_-u1O§.§_-e1Y§,int(this.§_-31f§.text));
      }
      
      private function §_-85§() : void
      {
         var _loc4_:Object = null;
         this.§_-o5§.visible = §_-at§.§_-13l§(this.locationId).subs != null;
         this.§_-x2t§ = 0;
         if(!this.§_-o5§.visible)
         {
            return;
         }
         var _loc1_:DataProvider = new DataProvider();
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < §_-at§.§_-13l§(this.locationId).subs.length)
         {
            _loc4_ = {
               "label":§_-at§.§_-13l§(this.locationId).subs[_loc3_]["name"],
               "value":_loc3_
            };
            _loc1_.addItem(_loc4_);
            if(_loc3_ == this.§_-x2t§)
            {
               _loc2_ = _loc4_;
            }
            _loc3_++;
         }
         this.§_-o5§.§_-GO§ = _loc1_;
         this.§_-o5§.§_-JZ§ = _loc2_ ? this.§_-o5§.getItemIndex(_loc2_) : 0;
      }
      
      private function §_-k1n§() : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc1_:Array = §_-at§.§_-13l§(this.locationId).subs != null ? §_-at§.§_-13l§(this.locationId).subs[this.§_-x2t§]["modes"] : §_-at§.§_-13l§(this.locationId).mapModes;
         this.§_-22M§.visible = _loc1_ != null;
         this.§_-y1§.visible = !this.§_-22M§.visible;
         if(!this.§_-22M§.visible)
         {
            this.modeId = 0;
            return;
         }
         var _loc2_:DataProvider = new DataProvider();
         var _loc3_:Object = null;
         for each(_loc5_ in _loc1_)
         {
            _loc4_ = {
               "label":§_-at§.§_-02X§[_loc5_].name,
               "value":_loc5_
            };
            if(_loc5_ == this.modeId)
            {
               _loc3_ = _loc4_;
            }
            _loc2_.addItem(_loc4_);
         }
         this.§_-22M§.§_-GO§ = _loc2_;
         this.§_-22M§.§_-JZ§ = _loc3_ ? this.§_-22M§.getItemIndex(_loc3_) : 0;
         _loc4_ = this.§_-22M§.§_-E2v§;
         if(_loc4_ != null)
         {
            this.modeId = int(_loc4_["value"]);
         }
      }
      
      private function §_-h1E§(param1:int) : Boolean
      {
         if(param1 == §_-at§.§_-820§)
         {
            return false;
         }
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§))
         {
            return true;
         }
         switch(param1)
         {
            case §_-at§.§_-lg§:
               return true;
            case §_-at§.§_-22E§:
               return this.§_-wA§;
            default:
               return false;
         }
      }
      
      private function §_-53a§(param1:int) : Boolean
      {
         if(param1 == §_-at§.§_-V1H§)
         {
            return false;
         }
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            return true;
         }
         switch(param1)
         {
            case §_-at§.§_-I6§:
            case §_-at§.§_-D18§:
            case §_-at§.§_-92b§:
            case §_-at§.§_-j1i§:
            case §_-at§.§_-e2a§:
            case §_-at§.§_-N2g§:
            case §_-at§.§_-U1s§:
            case §_-at§.§_-G1K§:
               return true;
            default:
               return false;
         }
      }
      
      private function §_-IZ§(param1:int) : Boolean
      {
         if(this.§_-X1L§.§_-E2v§["value"] == §_-at§.§_-L1l§)
         {
            return true;
         }
         return §_-at§.§_-13l§(param1).game;
      }
      
      private function §_-j1g§(param1:Player) : String
      {
         var _loc2_:String = param1.name;
         if(param1.id == Game.selfId)
         {
            return _loc2_;
         }
         return §_-r1G§.§_-fU§(param1.name,"event:" + param1.id);
      }
      
      private function §_-QQ§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(§_-i5§(param1.currentTarget).userData);
         if(Game.selfId == _loc2_)
         {
            return;
         }
         §_-cD§.§_-e25§(_loc2_);
      }
      
      private function §_-32q§(param1:FocusEvent) : void
      {
         var _loc2_:GameMap = this.§_-Kt§();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:int = Math.max(1,int(this.§_-n25§.text));
         var _loc4_:int = Math.max(1,int(this.§_-H2f§.text));
         this.§_-n25§.text = String(_loc3_);
         this.§_-H2f§.text = String(_loc4_);
         _loc2_.size = new Point(_loc3_,_loc4_);
         _loc2_.gravity = new b2Vec2(Number(this.§_-D19§.text),Number(this.§_-a1u§.text));
      }
      
      private function §_-Kt§() : GameMap
      {
         if(!(SquirrelGame.instance is §_-62b§))
         {
            return null;
         }
         return (SquirrelGame.instance as §_-62b§).map;
      }
      
      private function §_-b12§(param1:FocusEvent) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = int(this.§_-F1r§.text);
         var _loc3_:int = int(this.§_-B2X§.text);
         var _loc4_:int = _loc3_ * 60 + _loc2_;
         if((_loc4_ > Game.§_-W1G§ || _loc4_ < Game.§_-m26§) && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            _loc5_ = _loc4_ > Game.§_-W1G§ ? Game.§_-W1G§ : Game.§_-m26§;
            this.§_-43C§(_loc5_);
            this.§_-F1r§.setTextFormat(§_-1G§);
            this.§_-B2X§.setTextFormat(§_-1G§);
            return;
         }
         if(param1.currentTarget == this.§_-F1r§)
         {
            if(_loc2_ == 0)
            {
               this.§_-F1r§.text = "00";
               this.§_-F1r§.setTextFormat(§_-1G§);
               return;
            }
            if(_loc2_ > 60)
            {
               _loc2_ = 60;
            }
            this.§_-43C§(_loc3_ * 60 + _loc2_);
            this.§_-F1r§.setTextFormat(§_-1G§);
         }
         if(param1.currentTarget == this.§_-B2X§)
         {
            if(_loc3_ == 0)
            {
               this.§_-B2X§.setTextFormat(§_-1G§);
               return;
            }
            if(_loc3_ > int(Game.§_-W1G§ / 60) && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
            {
               this.§_-43C§(Game.§_-W1G§ / 60);
            }
            this.§_-B2X§.setTextFormat(§_-1G§);
         }
      }
      
      private function §_-x2v§() : void
      {
         if(!(SquirrelGame.instance is §_-62b§))
         {
            return;
         }
         (SquirrelGame.instance as §_-62b§).§_-LL§.§_-e2d§();
      }
   }
}

