package §_-Q1P§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Kr§.§_-h1x§;
   import §_-Rj§.§_-A32§;
   import §_-Rj§.§_-x1I§;
   import §_-S1D§.§_-C1G§;
   import §_-k1c§.Dialog;
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
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-c10§;
   import utils.§_-w2j§;
   import utils.§_-xb§;
   
   public class §_-y2d§ extends Dialog
   {
      
      private static const §_-V0§:int = 5;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #5E3929;","}","a {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-L1e§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,6175017);
      
      private static const §_-p1z§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,10,6175017);
      
      private static var _instance:§_-y2d§ = null;
      
      public var §_-X1t§:§_-h1x§ = null;
      
      public var §_-R2K§:§_-h1x§ = null;
      
      public var §_-o11§:§_-h1x§ = null;
      
      public var §_-R2i§:§_-h1x§ = null;
      
      public var §_-G22§:Boolean = false;
      
      public var silent:Boolean = false;
      
      private var §_-hm§:§_-w2j§;
      
      private var §_-K1Y§:§_-w2j§;
      
      private var §_-22e§:§_-w2j§;
      
      private var §_-y1Y§:§_-w2j§;
      
      private var §_-B37§:§_-w2j§;
      
      private var §_-Y21§:§_-w2j§;
      
      private var §_-Y1o§:§_-22V§;
      
      private var §_-g2b§:§_-22V§;
      
      private var §_-uu§:§_-22V§;
      
      private var §_-93O§:§_-22V§;
      
      private var §_-i24§:§_-22V§;
      
      private var §_-n2D§:§_-22V§;
      
      private var §_-K1I§:§_-22V§;
      
      private var §_-x2t§:§_-22V§;
      
      private var §_-D2E§:§_-22V§;
      
      private var §_-72X§:§_-22V§;
      
      private var locationId:int = 0;
      
      private var modeId:int = 0;
      
      private var §_-43B§:int = 0;
      
      private var §_-i1v§:int = 0;
      
      private var §_-02J§:int = 0;
      
      private var §_-bD§:§_-C1G§;
      
      private var §_-JW§:int = 0;
      
      public function §_-y2d§(param1:§_-C1G§)
      {
         super(gls("Информация о карте"));
         this.§_-bD§ = param1;
         _instance = this;
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-I2U§);
         var _loc3_:§_-22V§ = new §_-22V§(gls("Локация: "),§_-V0§,24,§_-L1e§);
         addChild(_loc3_);
         var _loc4_:§_-22V§ = new §_-22V§(gls("Режим: "),§_-V0§,62,§_-L1e§);
         addChild(_loc4_);
         this.§_-72X§ = new §_-22V§(gls("Нет режима"),92,65,§_-L1e§);
         addChild(this.§_-72X§);
         var _loc5_:§_-22V§ = new §_-22V§(gls("Номер: "),§_-V0§,82,§_-L1e§);
         addChild(_loc5_);
         this.§_-uu§ = new §_-22V§("",§_-V0§ + 55,82,§_-L1e§);
         addChild(this.§_-uu§);
         var _loc6_:§_-22V§ = new §_-22V§(gls("Автор: "),§_-V0§,102,§_-L1e§);
         addChild(_loc6_);
         this.§_-93O§ = new §_-22V§("",§_-V0§ + 55,102,_loc2_);
         this.§_-93O§.width = 200;
         this.§_-93O§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
         addChild(this.§_-93O§);
         var _loc7_:§_-22V§ = new §_-22V§(gls("Редактор: "),§_-V0§,242,§_-L1e§);
         addChild(_loc7_);
         this.§_-i24§ = new §_-22V§("",§_-V0§ + 75,242,_loc2_);
         this.§_-i24§.width = 200;
         this.§_-i24§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(this.§_-i24§);
         }
         var _loc8_:§_-22V§ = new §_-22V§(gls("Время: "),§_-V0§,122,§_-L1e§);
         addChild(_loc8_);
         this.§_-hm§ = new §_-w2j§("",94,124,33,16,§_-p1z§,null,2);
         this.§_-hm§.restrict = "0-9";
         this.§_-hm§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-22j§,false,0,true);
         addChild(this.§_-hm§);
         this.§_-K1Y§ = new §_-w2j§("",136,124,33,16,§_-p1z§,null,2);
         this.§_-K1Y§.restrict = "0-9";
         this.§_-K1Y§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-22j§,false,0,true);
         addChild(this.§_-K1Y§);
         this.§_-Y1o§ = new §_-22V§(gls("Размер: "),§_-V0§,142,§_-L1e§);
         addChild(this.§_-Y1o§);
         this.§_-22e§ = new §_-w2j§("",94,144,33,16,§_-p1z§,null,5);
         this.§_-22e§.restrict = "0-9";
         this.§_-22e§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Kx§,false,0,true);
         addChild(this.§_-22e§);
         this.§_-y1Y§ = new §_-w2j§("",136,144,33,16,§_-p1z§,null,5);
         this.§_-y1Y§.restrict = "0-9";
         this.§_-y1Y§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Kx§,false,0,true);
         addChild(this.§_-y1Y§);
         this.§_-g2b§ = new §_-22V§(gls("Гравитация: "),§_-V0§,162,§_-L1e§);
         addChild(this.§_-g2b§);
         this.§_-B37§ = new §_-w2j§("",94,164,33,16,§_-p1z§,null,7);
         this.§_-B37§.restrict = "-[0-9].";
         this.§_-B37§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Kx§,false,0,true);
         addChild(this.§_-B37§);
         this.§_-Y21§ = new §_-w2j§("",136,164,33,16,§_-p1z§,null,7);
         this.§_-Y21§.restrict = "-[0-9].";
         this.§_-Y21§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Kx§,false,0,true);
         addChild(this.§_-Y21§);
         var _loc9_:§_-22V§ = new §_-22V§(gls("Награда: "),§_-V0§,182,§_-L1e§);
         addChild(_loc9_);
         var _loc10_:§_-22V§ = new §_-22V§(gls("Оценка карты: "),§_-V0§,202,§_-L1e§);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(_loc10_);
         }
         var _loc11_:§_-22V§ = new §_-22V§(gls("Количество игр: "),§_-V0§,222,§_-L1e§);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(_loc11_);
         }
         this.§_-n2D§ = new §_-22V§("",_loc10_.x + _loc10_.width,202,new TextFormat(§_-22V§.§_-F2z§,14,4567040));
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(this.§_-n2D§);
         }
         this.§_-K1I§ = new §_-22V§("",this.§_-n2D§.x + this.§_-n2D§.width + 10,202,new TextFormat(§_-22V§.§_-F2z§,14,16711680));
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(this.§_-K1I§);
         }
         this.§_-x2t§ = new §_-22V§("",this.§_-K1I§.x + this.§_-K1I§.width + 10,202,new TextFormat(§_-22V§.§_-F2z§,14,13260));
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(this.§_-x2t§);
         }
         this.§_-D2E§ = new §_-22V§("",_loc11_.x + _loc11_.width,222,§_-L1e§);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(this.§_-D2E§);
         }
         var _loc12_:§_-22V§ = new §_-22V§("<body><a href=\'event:#\'>Сброс</a></body>",§_-V0§ + 210,this.§_-D2E§.y - 15,_loc2_);
         _loc12_.addEventListener(MouseEvent.CLICK,this.§_-x1V§);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§))
         {
            addChild(_loc12_);
         }
         this.§_-X1t§ = new §_-h1x§(145);
         this.§_-X1t§.x = §_-V0§ + 85;
         this.§_-X1t§.y = 4;
         this.§_-X1t§.addEventListener(Event.CHANGE,this.§_-m2w§);
         this.§_-X1t§.addItem({
            "label":gls("Релиз"),
            "value":§_-q1p§.§_-8Z§
         });
         this.§_-X1t§.addItem({
            "label":gls("Готовы к релизу"),
            "value":§_-q1p§.§_-kZ§
         });
         this.§_-X1t§.§_-Uf§ = 0;
         this.§_-X1t§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
         addChild(this.§_-X1t§);
         this.§_-R2K§ = new §_-h1x§(145);
         this.§_-R2K§.x = §_-V0§ + 85;
         this.§_-R2K§.y = 24;
         this.§_-R2K§.addEventListener(Event.CHANGE,this.§_-o2h§);
         addChild(this.§_-R2K§);
         this.§_-R2i§ = new §_-h1x§(145);
         this.§_-R2i§.x = §_-V0§ + 85;
         this.§_-R2i§.y = 44;
         this.§_-R2i§.addEventListener(Event.CHANGE,this.§_-t1x§);
         addChild(this.§_-R2i§);
         this.§_-o11§ = new §_-h1x§(145);
         this.§_-o11§.x = §_-V0§ + 85;
         this.§_-o11§.y = 64;
         this.§_-o11§.addEventListener(Event.CHANGE,this.§_-H2§);
         addChild(this.§_-o11§);
         place();
         this.width = 255 + this.§_-R1Y§ + this.§_-4n§ + 2 * §_-V0§;
         this.height = 315;
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            _loc5_.visible = false;
            this.§_-uu§.visible = false;
            _loc6_.visible = false;
            this.§_-93O§.visible = false;
            _loc7_.visible = false;
            this.§_-i24§.visible = false;
            _loc8_.y = 88;
            this.§_-hm§.y = 90;
            this.§_-K1Y§.y = 90;
            this.§_-Y1o§.y = 108;
            this.§_-22e§.y = 110;
            this.§_-y1Y§.y = 110;
            this.§_-g2b§.y = 128;
            this.§_-B37§.y = 130;
            this.§_-Y21§.y = 130;
            _loc9_.visible = false;
            this.height -= 110;
         }
         else
         {
            this.§_-i24§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
            _loc7_.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
            _loc9_.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§);
         }
      }
      
      public static function get instance() : §_-y2d§
      {
         if(!_instance)
         {
            new §_-y2d§(§_-C1G§.instance);
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
      
      public static function get §_-21§() : int
      {
         return §_-x1I§.§_-S1n§(_instance.§_-X1t§,§_-q1p§.§_-8Z§);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.stage.focus = Game.stage;
      }
      
      override public function show() : void
      {
         this.§_-P1j§();
         super.show();
      }
      
      public function §_-P1j§() : void
      {
         var _loc1_:GameMap = this.§_-n2d§();
         if(!_loc1_)
         {
            return;
         }
         this.§_-22e§.text = String(_loc1_.size.x);
         this.§_-y1Y§.text = String(_loc1_.size.y);
         this.§_-B37§.text = String(_loc1_.gravity.x);
         this.§_-Y21§.text = String(_loc1_.gravity.y);
      }
      
      public function §_-Q1T§() : void
      {
         this.§_-93O§.text = "";
         this.§_-i24§.text = "";
         this.§_-uu§.text = "";
      }
      
      public function §_-o2h§(param1:Event) : void
      {
         if(this.visible && this.§_-R2K§.§_-l1§["value"] == §_-q1p§.§_-k2m§ && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§))
         {
            this.§_-R2K§.§_-Uf§ = this.§_-JW§;
            return;
         }
         this.§_-JW§ = this.§_-R2K§.§_-Uf§;
         this.locationId = this.§_-R2K§.§_-l1§["value"];
         this.§_-R2K§.enabled = !(this.locationId == §_-q1p§.§_-k2m§ && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§));
         this.§_-WT§();
         this.§_-MY§();
         var _loc2_:Array = this.§_-bD§.§_-V1R§.§_-f12§();
         this.modeId = this.§_-o11§.visible ? int(this.§_-o11§.§_-l1§["value"]) : 0;
         this.§_-43B§ = §_-x1I§.§_-43B§(this.§_-R2i§);
         this.§_-bD§.location = this.locationId;
         this.§_-bD§.mode = this.modeId;
         if(!this.silent)
         {
            dispatchEvent(new EditorEvent(EditorEvent.LOCATION_CHANGED,this.locationId,this.modeId,this.§_-43B§));
         }
         this.§_-bD§.§_-P2p§();
         this.§_-bD§.§_-O2L§(true);
         this.§_-bD§.§_-mJ§(_loc2_);
         this.§_-21n§();
      }
      
      public function §_-t1x§(param1:Event = null) : void
      {
         var _loc2_:Array = this.§_-bD§.§_-V1R§.§_-f12§();
         this.§_-43B§ = §_-x1I§.§_-43B§(this.§_-R2i§);
         this.§_-MY§();
         this.modeId = this.§_-o11§.visible ? int(this.§_-o11§.§_-l1§["value"]) : 0;
         this.§_-bD§.location = this.locationId;
         this.§_-bD§.mode = this.modeId;
         if(!this.silent)
         {
            dispatchEvent(new EditorEvent(EditorEvent.SUBLOCATION_CHANGED,this.locationId,this.modeId,this.§_-43B§));
         }
         this.§_-bD§.§_-O2L§();
         this.§_-bD§.§_-mJ§(_loc2_);
         this.§_-21n§();
      }
      
      public function get §_-Vz§() : int
      {
         return this.locationId;
      }
      
      public function §_-91Q§() : void
      {
         this.locationId = §_-x1I§.§_-S1n§(this.§_-R2K§,this.locationId);
         this.modeId = this.§_-o11§.visible ? §_-x1I§.§_-S1n§(this.§_-o11§,0) : 0;
         this.§_-43B§ = §_-x1I§.§_-43B§(this.§_-R2i§);
      }
      
      public function §_-H2§(param1:Event = null) : void
      {
         var _loc2_:Array = this.§_-bD§.§_-V1R§.§_-f12§();
         this.modeId = this.§_-o11§.§_-l1§["value"];
         this.§_-bD§.location = this.locationId;
         this.§_-bD§.mode = this.modeId;
         if(!this.silent)
         {
            dispatchEvent(new EditorEvent(EditorEvent.MODE_CHANGED,this.locationId,this.modeId,this.§_-43B§));
         }
         this.§_-bD§.§_-O2L§();
         this.§_-bD§.§_-mJ§(_loc2_);
         this.§_-21n§();
      }
      
      public function §_-m2w§(param1:Event = null) : void
      {
         this.§_-Mp§();
         this.§_-R2K§.§_-Uf§ = 0;
         this.§_-o2h§(param1);
      }
      
      public function §_-Mp§() : void
      {
         var _loc2_:Location = null;
         var _loc1_:DataProvider = new DataProvider();
         for each(_loc2_ in §_-q1p§.list)
         {
            if(!(!this.§_-R10§(_loc2_.id) || !this.§_-12h§(_loc2_.id) || !this.§_-Xn§(_loc2_.id) || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && _loc2_.id == §_-q1p§.§_-l2I§ && this.§_-G22§))
            {
               _loc1_.addItem({
                  "label":_loc2_.name,
                  "value":_loc2_.id
               });
            }
         }
         this.§_-R2K§.§_-gx§ = _loc1_;
         this.§_-WT§();
         this.§_-MY§();
      }
      
      public function get minutes() : int
      {
         return int(this.§_-hm§.text);
      }
      
      public function get seconds() : int
      {
         return int(this.§_-K1Y§.text);
      }
      
      public function §_-X1C§(param1:int) : void
      {
         this.§_-hm§.text = String(int(param1 / 60));
         var _loc2_:int = param1 % 60;
         this.§_-K1Y§.text = (_loc2_ < 10 ? "0" : "") + String(_loc2_);
      }
      
      public function get §_-A14§() : int
      {
         return this.§_-i1v§;
      }
      
      public function set §_-l26§(param1:int) : void
      {
         if(param1 == 0)
         {
            this.§_-i24§.text = "";
            return;
         }
         this.§_-02J§ = param1;
         var _loc2_:Player = Game.getPlayer(param1);
         this.§_-i24§.text = "<body>" + this.§_-F3§(_loc2_) + "</body>";
      }
      
      public function set §_-A14§(param1:int) : void
      {
         this.§_-i1v§ = param1;
         var _loc2_:Player = Game.getPlayer(param1);
         this.§_-93O§.text = "<body>" + this.§_-F3§(_loc2_) + "</body>";
         this.§_-93O§.userData = param1;
      }
      
      public function set map(param1:int) : void
      {
         this.§_-uu§.text = String(param1);
      }
      
      public function set mode(param1:int) : void
      {
         this.modeId = param1;
         if(this.§_-o11§.visible)
         {
            this.§_-o11§.§_-p1A§(this.modeId);
         }
         this.§_-bD§.location = this.locationId;
         this.§_-bD§.mode = this.modeId;
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
         this.§_-43B§ = param1;
         this.§_-R2i§.§_-p1A§(this.§_-43B§);
      }
      
      public function get sub() : int
      {
         return this.§_-43B§;
      }
      
      public function rating(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.§_-n2D§.text = (param1 > 0 ? "+" : "") + String(param1);
         this.§_-K1I§.text = (param2 > 0 ? "-" : "") + String(param2);
         this.§_-x2t§.text = (param3 > 0 ? "-" : "") + String(param3) + "/" + param4;
         this.§_-D2E§.text = param5.toString();
         this.§_-K1I§.x = this.§_-n2D§.x + this.§_-n2D§.width + 10;
         this.§_-x2t§.x = this.§_-K1I§.x + this.§_-K1I§.width + 10;
      }
      
      private function §_-x1V§(param1:MouseEvent) : void
      {
         if(this.§_-uu§.text == "")
         {
            return;
         }
         this.rating(0,0,0,0,0);
         Connection.§_-Li§(§_-h2B§.§_-l2R§,int(this.§_-uu§.text));
      }
      
      private function §_-WT§() : void
      {
         var _loc4_:Object = null;
         this.§_-R2i§.visible = §_-q1p§.§_-l29§(this.locationId).subs != null;
         this.§_-43B§ = 0;
         if(!this.§_-R2i§.visible)
         {
            return;
         }
         var _loc1_:DataProvider = new DataProvider();
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < §_-q1p§.§_-l29§(this.locationId).subs.length)
         {
            _loc4_ = {
               "label":§_-q1p§.§_-l29§(this.locationId).subs[_loc3_]["name"],
               "value":_loc3_
            };
            _loc1_.addItem(_loc4_);
            if(_loc3_ == this.§_-43B§)
            {
               _loc2_ = _loc4_;
            }
            _loc3_++;
         }
         this.§_-R2i§.§_-gx§ = _loc1_;
         this.§_-R2i§.§_-Uf§ = _loc2_ ? this.§_-R2i§.getItemIndex(_loc2_) : 0;
      }
      
      private function §_-MY§() : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc1_:Array = §_-q1p§.§_-l29§(this.locationId).subs != null ? §_-q1p§.§_-l29§(this.locationId).subs[this.§_-43B§]["modes"] : §_-q1p§.§_-l29§(this.locationId).mapModes;
         this.§_-o11§.visible = _loc1_ != null;
         this.§_-72X§.visible = !this.§_-o11§.visible;
         if(!this.§_-o11§.visible)
         {
            this.modeId = 0;
            return;
         }
         var _loc2_:DataProvider = new DataProvider();
         var _loc3_:Object = null;
         for each(_loc5_ in _loc1_)
         {
            _loc4_ = {
               "label":§_-q1p§.§_-m15§[_loc5_].name,
               "value":_loc5_
            };
            if(_loc5_ == this.modeId)
            {
               _loc3_ = _loc4_;
            }
            _loc2_.addItem(_loc4_);
         }
         this.§_-o11§.§_-gx§ = _loc2_;
         this.§_-o11§.§_-Uf§ = _loc3_ ? this.§_-o11§.getItemIndex(_loc3_) : 0;
         _loc4_ = this.§_-o11§.§_-l1§;
         if(_loc4_ != null)
         {
            this.modeId = int(_loc4_["value"]);
         }
      }
      
      private function §_-12h§(param1:int) : Boolean
      {
         if(param1 == §_-q1p§.§_-B2D§)
         {
            return false;
         }
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§))
         {
            return true;
         }
         switch(param1)
         {
            case §_-q1p§.§_-l2I§:
               return true;
            case §_-q1p§.§_-u2f§:
               return this.§_-G22§;
            default:
               return false;
         }
      }
      
      private function §_-Xn§(param1:int) : Boolean
      {
         if(param1 == §_-q1p§.§_-2Z§)
         {
            return false;
         }
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            return true;
         }
         switch(param1)
         {
            case §_-q1p§.§_-C25§:
            case §_-q1p§.§_-sL§:
            case §_-q1p§.§_-P4§:
            case §_-q1p§.§_-u2u§:
            case §_-q1p§.§_-A3z§:
            case §_-q1p§.§_-M1m§:
            case §_-q1p§.§_-Q1s§:
            case §_-q1p§.§_-k2B§:
               return true;
            default:
               return false;
         }
      }
      
      private function §_-R10§(param1:int) : Boolean
      {
         if(this.§_-X1t§.§_-l1§["value"] == §_-q1p§.§_-8Z§)
         {
            return true;
         }
         return §_-q1p§.§_-l29§(param1).game;
      }
      
      private function §_-F3§(param1:Player) : String
      {
         var _loc2_:String = param1.name;
         if(param1.id == Game.selfId)
         {
            return _loc2_;
         }
         return §_-xb§.§_-e1r§(param1.name,"event:" + param1.id);
      }
      
      private function §_-o1P§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(§_-22V§(param1.currentTarget).userData);
         if(Game.selfId == _loc2_)
         {
            return;
         }
         §_-927§.§_-i2I§(_loc2_);
      }
      
      private function §_-Kx§(param1:FocusEvent) : void
      {
         var _loc2_:GameMap = this.§_-n2d§();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:int = Math.max(1,int(this.§_-22e§.text));
         var _loc4_:int = Math.max(1,int(this.§_-y1Y§.text));
         this.§_-22e§.text = String(_loc3_);
         this.§_-y1Y§.text = String(_loc4_);
         _loc2_.size = new Point(_loc3_,_loc4_);
         _loc2_.gravity = new b2Vec2(Number(this.§_-B37§.text),Number(this.§_-Y21§.text));
      }
      
      private function §_-n2d§() : GameMap
      {
         if(!(SquirrelGame.instance is §_-A32§))
         {
            return null;
         }
         return (SquirrelGame.instance as §_-A32§).map;
      }
      
      private function §_-22j§(param1:FocusEvent) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = int(this.§_-K1Y§.text);
         var _loc3_:int = int(this.§_-hm§.text);
         var _loc4_:int = _loc3_ * 60 + _loc2_;
         if((_loc4_ > Game.§_-233§ || _loc4_ < Game.§_-KX§) && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            _loc5_ = _loc4_ > Game.§_-233§ ? Game.§_-233§ : Game.§_-KX§;
            this.§_-X1C§(_loc5_);
            this.§_-K1Y§.setTextFormat(§_-p1z§);
            this.§_-hm§.setTextFormat(§_-p1z§);
            return;
         }
         if(param1.currentTarget == this.§_-K1Y§)
         {
            if(_loc2_ == 0)
            {
               this.§_-K1Y§.text = "00";
               this.§_-K1Y§.setTextFormat(§_-p1z§);
               return;
            }
            if(_loc2_ > 60)
            {
               _loc2_ = 60;
            }
            this.§_-X1C§(_loc3_ * 60 + _loc2_);
            this.§_-K1Y§.setTextFormat(§_-p1z§);
         }
         if(param1.currentTarget == this.§_-hm§)
         {
            if(_loc3_ == 0)
            {
               this.§_-hm§.setTextFormat(§_-p1z§);
               return;
            }
            if(_loc3_ > int(Game.§_-233§ / 60) && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
            {
               this.§_-X1C§(Game.§_-233§ / 60);
            }
            this.§_-hm§.setTextFormat(§_-p1z§);
         }
      }
      
      private function §_-21n§() : void
      {
         if(!(SquirrelGame.instance is §_-A32§))
         {
            return;
         }
         (SquirrelGame.instance as §_-A32§).§_-Sv§.§_-D2p§();
      }
   }
}

