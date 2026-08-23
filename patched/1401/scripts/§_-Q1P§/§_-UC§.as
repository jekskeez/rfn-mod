package §_-Q1P§
{
   import §_-Kr§.§_-12w§;
   import §_-Kr§.§_-h1x§;
   import §_-Rj§.§_-A32§;
   import §_-Rj§.§_-Wl§;
   import §_-Rj§.§_-x1I§;
   import §_-T2y§.§_-71o§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import fl.data.DataProvider;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-c10§;
   import utils.§_-w2j§;
   
   public class §_-UC§ extends Dialog
   {
      
      private static const §_-V0§:int = 5;
      
      private static const §_-E1x§:int = 168;
      
      private static const §_-y1X§:int = 300;
      
      private static const §_-yH§:int = 80;
      
      private static const §_-h2p§:int = 20;
      
      private static const §_-H8§:int = 197;
      
      private static const §_-Y2Z§:int = 5;
      
      private static const §_-l2H§:int = 25;
      
      private static const §_-421§:int = 22;
      
      private static const §_-R2E§:int = 80;
      
      private static const §_-I20§:int = 103;
      
      private static const §_-qw§:int = 16;
      
      private static const §_-Y§:int = 119;
      
      private static const §_-92X§:int = 200;
      
      private static const §_-y2R§:int = 50;
      
      private static const §_-s2m§:int = 3;
      
      private static const §_-q25§:int = 6;
      
      private static const §_-L2U§:int = 7;
      
      private static const §_-Y12§:int = 4;
      
      private static const §_-vs§:int = 65;
      
      private static const §_-03O§:int = 72;
      
      private static const §_-M1c§:int = 127;
      
      private static const §_-g2d§:int = 202;
      
      private static const §_-Or§:int = 32;
      
      private static const §_-Z1Q§:int = 237;
      
      private static const §_-D2m§:int = 59;
      
      private static var _instance:§_-UC§;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","}",".number {","font-weight: bold;","text-decoration: none;","}",".number:hover {","text-decoration: underline;","}",".newMap {","color: #d72e00;","text-decoration: underline;","font-size: 12px;","}",".link {","color: #000000;","text-decoration: underline;","font-size: 12px;","}",".record {","font-size: 13px;","}",".record:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-O1e§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017);
      
      private static const §_-815§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017,true);
      
      private static const §_-M1L§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017,null,null,null,null,null,"right");
      
      private var §_-X1t§:§_-h1x§ = new §_-h1x§(§_-E1x§);
      
      private var §_-f1Y§:§_-h1x§ = new §_-h1x§(§_-E1x§);
      
      private var §_-o11§:§_-h1x§ = new §_-h1x§(§_-E1x§);
      
      private var §_-R2i§:§_-h1x§ = new §_-h1x§(§_-E1x§);
      
      private var §_-i2K§:§_-12w§;
      
      private var §_-Q1m§:Boolean = false;
      
      private var §_-33K§:Object = {};
      
      private var §_-ou§:Object = {};
      
      private var locationId:int = 0;
      
      private var modeId:int = 0;
      
      private var §_-43B§:int = 0;
      
      private var §_-e2h§:int = 0;
      
      private var loaded:Boolean = false;
      
      private var §_-O1p§:§_-22V§ = null;
      
      private var §_-B2I§:§_-22V§ = null;
      
      private var §_-z2I§:§_-22V§ = null;
      
      private var §_-B3j§:§_-22V§ = null;
      
      private var §_-C36§:§_-22V§ = null;
      
      private var §_-J1y§:§_-w2j§ = null;
      
      private var §_-T29§:SimpleButton = null;
      
      private var §_-D1x§:§_-22V§ = null;
      
      private var §_-An§:§_-22V§ = null;
      
      private var §_-H20§:§_-22V§ = null;
      
      private var §_-X19§:§_-22V§ = null;
      
      private var §_-lf§:§_-22V§ = null;
      
      private var §_-SG§:§_-22V§ = null;
      
      private var §_-R2C§:§_-22V§ = null;
      
      private var §_-a2L§:§_-22V§ = null;
      
      private var §_-D1o§:§_-22V§ = null;
      
      private var §_-r1W§:§_-Q13§ = new §_-Q13§(" ",gls("Карты с таким номером не существует."),false,null,265);
      
      private var §_-9S§:§_-w2j§;
      
      private var §_-02u§:§_-w2j§;
      
      private var §_-m2G§:int = 0;
      
      public function §_-UC§()
      {
         _instance = this;
         super(gls("Карты"));
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-X1t§.x = §_-V0§;
         this.§_-X1t§.y = 5;
         this.§_-X1t§.addEventListener(Event.CHANGE,this.§_-328§);
         this.§_-X1t§.addItem({
            "label":gls("Релиз"),
            "value":§_-q1p§.§_-8Z§
         });
         this.§_-X1t§.addItem({
            "label":gls("Готовы к релизу"),
            "value":§_-q1p§.§_-kZ§
         });
         this.§_-X1t§.§_-Uf§ = 0;
         addChild(this.§_-X1t§);
         this.§_-f1Y§.x = §_-V0§;
         this.§_-f1Y§.y = 30;
         this.§_-f1Y§.addEventListener(Event.CHANGE,this.§_-5M§);
         addChild(this.§_-f1Y§);
         this.§_-R2i§.x = §_-V0§;
         this.§_-R2i§.y = 55;
         this.§_-R2i§.addEventListener(Event.CHANGE,this.§_-E6§);
         addChild(this.§_-R2i§);
         this.§_-o11§.x = §_-V0§;
         this.§_-o11§.y = §_-R2E§;
         this.§_-o11§.addEventListener(Event.CHANGE,this.§_-aM§);
         addChild(this.§_-o11§);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,3810566);
         this.§_-J1y§ = new §_-w2j§(gls("Поиск по №"),§_-H8§,4,§_-yH§,20,_loc2_);
         this.§_-J1y§.restrict = "0-9";
         this.§_-J1y§.background = false;
         addChild(this.§_-J1y§);
         this.§_-T29§ = new ButtonSearch();
         this.§_-T29§.scaleX = this.§_-T29§.scaleY = 0.7;
         this.§_-T29§.x = §_-y1X§ - §_-h2p§;
         this.§_-T29§.y = 4;
         this.§_-T29§.addEventListener(MouseEvent.CLICK,this.§_-V11§);
         addChild(this.§_-T29§);
         this.§_-O1p§ = new §_-22V§("",§_-H8§,0,§_-M1L§,§_-y1X§ - §_-H8§);
         addChild(this.§_-O1p§);
         this.§_-B2I§ = new §_-22V§("№",§_-Y12§,0,§_-815§);
         addChild(this.§_-B2I§);
         this.§_-z2I§ = new §_-22V§(gls("Автор"),§_-03O§,0,§_-815§);
         addChild(this.§_-z2I§);
         this.§_-B3j§ = new §_-22V§("%",§_-g2d§,0,§_-M1L§,§_-Or§);
         addChild(this.§_-B3j§);
         this.§_-C36§ = new §_-22V§(gls("Игры"),§_-Z1Q§,0,§_-M1L§,§_-D2m§);
         addChild(this.§_-C36§);
         this.§_-i2K§ = new §_-12w§(§_-y1X§,§_-92X§);
         this.§_-i2K§.x = §_-V0§;
         this.§_-i2K§.y = §_-Y§;
         this.§_-i2K§.§_-Z1u§ = true;
         this.§_-i2K§.§_-82M§ = this.§_-M2R§;
         this.§_-i2K§.addEventListener(MouseEvent.CLICK,this.§_-Tz§);
         addChild(this.§_-i2K§);
         var _loc3_:int = §_-Y§ + §_-92X§ + 8;
         this.§_-X19§ = new §_-22V§(gls("<body><a href=\'event:\' class=\'link\'>Редактировать</a></body>"),§_-V0§,_loc3_,_loc1_);
         this.§_-X19§.addEventListener(MouseEvent.MOUSE_UP,this.§_-V2z§);
         addChild(this.§_-X19§);
         this.§_-D1x§ = new §_-22V§(gls("<body><a href=\'event:\' class=\'newMap\'>Удалить</a></body>"),§_-V0§ + 100,_loc3_,_loc1_);
         this.§_-D1x§.addEventListener(MouseEvent.MOUSE_UP,this.§_-hz§);
         addChild(this.§_-D1x§);
         this.§_-SG§ = new §_-22V§(gls("<body><a href=\'event:\' class=\'newMap\'>Лаги</a></body>"),§_-V0§ + §_-y1X§ - 30,_loc3_,_loc1_);
         this.§_-SG§.addEventListener(MouseEvent.MOUSE_UP,this.§_-q§);
         addChild(this.§_-SG§);
         this.§_-R2C§ = new §_-22V§(gls("<body><a href=\'event:\' class=\'newMap\'>Невидимые</a></body>"),§_-V0§ + 165,_loc3_,_loc1_);
         this.§_-R2C§.addEventListener(MouseEvent.MOUSE_UP,this.§_-yD§);
         addChild(this.§_-R2C§);
         this.§_-H20§ = new §_-22V§(gls("<body><a href=\'event:#\' class=\'newMap\'>Зарелизить все</a></body>"),§_-V0§ + 165,_loc3_,_loc1_);
         this.§_-H20§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Z2o§);
         addChild(this.§_-H20§);
         var _loc4_:int = _loc3_ + 20;
         this.§_-An§ = new §_-22V§(gls("<body><a href=\'event:#\' class=\'link\'>Создать карту</a></body>"),§_-V0§,_loc4_,_loc1_);
         this.§_-An§.addEventListener(MouseEvent.MOUSE_UP,this.§_-m1Q§);
         addChild(this.§_-An§);
         this.§_-lf§ = new §_-22V§(gls("<body><a href=\'event:#\' class=\'newMap\'>Начисления</a></body>"),§_-V0§ + §_-y1X§ - 70,_loc4_,_loc1_);
         this.§_-lf§.visible = false;
         this.§_-lf§.addEventListener(MouseEvent.MOUSE_UP,this.§_-o1g§);
         addChild(this.§_-lf§);
         var _loc5_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,3810566);
         this.§_-a2L§ = new §_-22V§(gls("<body>От</body>"),0,0,_loc1_);
         addChild(this.§_-a2L§);
         this.§_-9S§ = new §_-w2j§("",0,0,§_-y2R§,15,_loc5_);
         this.§_-9S§.background = false;
         this.§_-9S§.restrict = "0-9";
         this.§_-9S§.addEventListener(Event.CHANGE,this.§_-hJ§);
         addChild(this.§_-9S§);
         this.§_-D1o§ = new §_-22V§(gls("<body>до</body>"),0,0,_loc1_);
         addChild(this.§_-D1o§);
         this.§_-02u§ = new §_-w2j§("",0,0,§_-y2R§,15,_loc5_);
         this.§_-02u§.background = false;
         this.§_-02u§.restrict = "0-9";
         this.§_-02u§.addEventListener(Event.CHANGE,this.§_-hJ§);
         addChild(this.§_-02u§);
         place();
         this.height += 45;
         this.§_-m2G§ = int(this.height);
         this.§_-X18§();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-m0§]);
         Game.listen(this.§_-P9§);
      }
      
      public static function get §_-iM§() : int
      {
         return _instance.§_-i2K§.length;
      }
      
      public static function §_-j1d§(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         _instance.§_-j1d§(param1,param2,param3,param4,§_-y2d§.§_-21§,param5);
      }
      
      public static function §_-Q2V§(param1:int, param2:int) : void
      {
         var _loc3_:int = _instance.§_-i2K§.§_-Uf§;
         _instance.§_-I§(param1,param2);
         Connection.§_-Li§(§_-h2B§.§_-iL§,param2);
         if(!§_-Wl§.isEmpty)
         {
            §_-Wl§.§_-e2Q§(param2);
            if(!§_-Wl§.isEmpty)
            {
               §_-rx§();
            }
            else
            {
               (SquirrelGame.instance as §_-A32§).§_-j1q§();
            }
            return;
         }
         if(_loc3_ <= 0)
         {
            _instance.show();
            if(_loc3_ < 0 || _instance.§_-i2K§.length == 0)
            {
               return;
            }
         }
         _instance.§_-72D§(_loc3_ >= _instance.§_-i2K§.length ? int(_instance.§_-i2K§.length - 1) : _loc3_);
      }
      
      public static function §_-aT§() : void
      {
         var _loc1_:int = _instance.§_-i2K§.§_-Uf§;
         _instance.§_-72D§(_loc1_);
      }
      
      public static function §_-q1t§(param1:int = -1) : void
      {
         if(!§_-Wl§.isEmpty)
         {
            §_-rx§();
            return;
         }
         var _loc2_:int = 0;
         if(param1 > 0)
         {
            _loc2_ = _instance.§_-bV§(param1);
         }
         _instance.§_-72D§(_loc2_ + 1);
      }
      
      public static function §_-L1U§(param1:int = -1) : void
      {
         if(!§_-Wl§.isEmpty)
         {
            §_-rx§();
            return;
         }
         var _loc2_:int = 1;
         if(param1 > 0)
         {
            _loc2_ = _instance.§_-bV§(param1);
         }
         _instance.§_-72D§(_loc2_ - 1);
      }
      
      public static function §_-A2Q§() : void
      {
         var _loc1_:Object = _instance.§_-f1Y§.§_-l1§;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:Object = _instance.§_-A2R§();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _instance.§_-K1L§(_loc2_);
         _instance.§_-I§(_loc1_["value"]);
         Connection.§_-Li§(§_-h2B§.§_-iL§,_loc3_);
      }
      
      public static function §_-I§(param1:int, param2:int) : void
      {
         _instance.§_-I§(param1,param2);
      }
      
      public static function show() : void
      {
         _instance.show();
      }
      
      public static function §_-B3B§() : void
      {
         _instance.§_-B3B§();
      }
      
      public static function §_-P21§() : Boolean
      {
         return _instance.visible;
      }
      
      public static function §_-1J§(param1:int, param2:String) : Boolean
      {
         switch(param2)
         {
            case "Next":
               if(§_-Wl§.isEmpty)
               {
                  return _instance.§_-i2K§.length - 1 > _instance.§_-bV§(param1);
               }
               return §_-Wl§.§_-Sh§();
               break;
            case "Prev":
               if(§_-Wl§.isEmpty)
               {
                  return _instance.§_-bV§(param1) > 0;
               }
               return §_-Wl§.§_-i1R§();
               break;
            default:
               return false;
         }
      }
      
      private static function §_-rx§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-oy§(§_-Wl§.§_-GL§);
      }
      
      override public function show() : void
      {
         if(!this.loaded)
         {
            this.§_-lf§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§);
            this.§_-D1x§.visible = this.§_-y1d§;
            this.§_-An§.visible = !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && this.locationId == §_-q1p§.§_-l2I§;
            this.§_-H20§.visible = false;
            this.§_-SG§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
            this.§_-R2C§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
            this.§_-X1t§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
            this.§_-Mp§();
            Connection.§_-Li§(§_-h2B§.§_-m0§,this.locationId,0,this.modeId);
            this.§_-WT§(this.locationId);
            this.§_-MY§(this.locationId);
            this.loaded = true;
         }
         else
         {
            this.§_-X18§();
         }
         this.§_-Y1O§();
         this.visible = true;
         placeInCenter();
         addToSprite();
         this.§_-Q1m§ = false;
         this.§_-93s§(this.locationId);
         this.§_-Do§(this.§_-f1Y§.§_-l1§["value"],this.§_-e2h§);
         (SquirrelGame.instance as §_-A32§).reset();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.stage.focus = Game.stage;
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
         if(this.§_-Q1m§)
         {
            return;
         }
         §_-71o§.show("Location");
      }
      
      private function §_-Tz§(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         this.§_-X19§.visible = true;
         §_-Wl§.clear();
         if(this.§_-Fw§().length > 1)
         {
            for each(_loc2_ in this.§_-Fw§())
            {
               §_-Wl§.§_-j1d§(this.§_-K1L§(_loc2_));
            }
         }
         this.§_-9S§.text = §_-Wl§.isEmpty ? "" : String(§_-Wl§.first);
         this.§_-02u§.text = §_-Wl§.isEmpty ? "" : String(§_-Wl§.last);
         this.§_-D1x§.visible = this.§_-y1d§ && §_-Wl§.isEmpty;
         this.§_-T29§.visible = this.§_-J1y§.visible = §_-Wl§.isEmpty;
      }
      
      private function §_-Y1O§() : void
      {
         §_-Wl§.clear();
         this.§_-9S§.text = "";
         this.§_-02u§.text = "";
         this.§_-D1x§.visible = this.§_-y1d§;
         this.§_-J1y§.visible = this.§_-T29§.visible = this.§_-X19§.visible = true;
      }
      
      private function §_-X18§() : void
      {
         var _loc4_:§_-h1x§ = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc1_:int = §_-Y2Z§;
         var _loc2_:int = §_-Y2Z§;
         var _loc3_:Array = [this.§_-X1t§,this.§_-f1Y§,this.§_-R2i§,this.§_-o11§];
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.visible)
            {
               _loc4_.y = _loc1_;
               _loc2_ = _loc1_;
               _loc1_ += §_-l2H§;
            }
         }
         _loc5_ = §_-I20§ - §_-R2E§ - §_-421§;
         _loc6_ = _loc2_ + §_-421§ + _loc5_;
         _loc7_ = _loc6_ + §_-qw§;
         _loc8_ = _loc7_ + §_-92X§ + 8;
         _loc9_ = _loc8_ + 20;
         this.§_-O1p§.y = _loc2_ + 5;
         this.§_-B2I§.y = _loc6_;
         this.§_-z2I§.y = _loc6_;
         this.§_-B3j§.y = _loc6_;
         this.§_-C36§.y = _loc6_;
         this.§_-i2K§.y = _loc7_;
         this.§_-X19§.y = _loc8_;
         this.§_-D1x§.y = _loc8_;
         this.§_-SG§.y = _loc8_;
         this.§_-R2C§.y = _loc8_;
         this.§_-H20§.y = _loc8_;
         this.§_-An§.y = _loc9_;
         this.§_-lf§.y = _loc9_;
         this.§_-lf§.x = §_-V0§ + §_-y1X§ - this.§_-lf§.width;
         this.§_-wa§(_loc9_);
         if(this.§_-m2G§ > 0)
         {
            this.height = this.§_-m2G§ - (§_-I20§ - _loc6_);
         }
      }
      
      private function §_-wa§(param1:int) : void
      {
         var _loc2_:int = this.§_-An§.visible ? int(this.§_-An§.x + this.§_-An§.width) : §_-V0§;
         var _loc3_:int = this.§_-lf§.visible ? int(this.§_-lf§.x) : int(§_-V0§ + §_-y1X§);
         var _loc4_:int = this.§_-a2L§.width + §_-s2m§ + this.§_-D1o§.width + §_-s2m§ + §_-q25§;
         var _loc5_:int = int((_loc3_ - _loc2_ - _loc4_) * 0.5);
         if(_loc5_ < §_-y2R§)
         {
            _loc5_ = §_-y2R§;
         }
         this.§_-a2L§.x = _loc2_;
         this.§_-a2L§.y = param1;
         this.§_-9S§.x = _loc2_ + this.§_-a2L§.width + §_-s2m§;
         this.§_-9S§.y = param1;
         this.§_-9S§.width = _loc5_;
         this.§_-D1o§.x = this.§_-9S§.x + _loc5_ + §_-q25§;
         this.§_-D1o§.y = param1;
         this.§_-02u§.x = this.§_-D1o§.x + this.§_-D1o§.width + §_-s2m§;
         this.§_-02u§.y = param1;
         this.§_-02u§.width = _loc5_;
      }
      
      private function §_-Mp§() : void
      {
         var _loc2_:Location = null;
         var _loc1_:DataProvider = new DataProvider();
         for each(_loc2_ in §_-q1p§.list)
         {
            if(this.§_-12h§(_loc2_.id))
            {
               _loc1_.addItem({
                  "label":_loc2_.name,
                  "value":_loc2_.id
               });
            }
         }
         this.§_-f1Y§.§_-gx§ = _loc1_;
         this.§_-f1Y§.§_-Uf§ = 0;
      }
      
      private function §_-WT§(param1:int) : void
      {
         this.§_-R2i§.visible = §_-q1p§.§_-l29§(param1).subs != null;
         this.§_-43B§ = 0;
         if(!this.§_-R2i§.visible)
         {
            this.§_-X18§();
            return;
         }
         var _loc2_:DataProvider = new DataProvider();
         var _loc3_:int = 0;
         while(_loc3_ < §_-q1p§.§_-l29§(param1).subs.length)
         {
            _loc2_.addItem({
               "label":§_-q1p§.§_-l29§(param1).subs[_loc3_]["name"],
               "value":_loc3_
            });
            _loc3_++;
         }
         this.§_-R2i§.§_-gx§ = _loc2_;
         this.§_-X18§();
      }
      
      private function §_-MY§(param1:int) : void
      {
         var _loc5_:Object = null;
         var _loc2_:Array = §_-q1p§.§_-l29§(param1).subs != null ? §_-q1p§.§_-l29§(param1).subs[this.§_-43B§]["modes"] : §_-q1p§.§_-l29§(param1).mapModes;
         this.§_-o11§.visible = _loc2_ != null;
         this.modeId = 0;
         if(!this.§_-o11§.visible)
         {
            this.§_-X18§();
            return;
         }
         var _loc3_:DataProvider = new DataProvider();
         var _loc4_:int = 0;
         if(_loc2_)
         {
            for each(_loc4_ in _loc2_)
            {
               _loc3_.addItem({
                  "label":§_-q1p§.§_-m15§[_loc4_].name,
                  "value":_loc4_
               });
            }
         }
         else
         {
            for each(_loc5_ in §_-q1p§.§_-m15§)
            {
               if(_loc5_.name != null)
               {
                  _loc3_.addItem({
                     "label":_loc5_.name,
                     "value":_loc4_
                  });
               }
               _loc4_++;
            }
         }
         this.§_-o11§.§_-gx§ = _loc3_;
         this.modeId = this.§_-o11§.getItemAt(0)["value"];
         this.§_-X18§();
      }
      
      private function §_-12h§(param1:int) : Boolean
      {
         if(param1 == §_-q1p§.§_-B2D§ || param1 == §_-q1p§.§_-2Z§)
         {
            return false;
         }
         if(this.§_-X1t§.§_-l1§["value"] == §_-q1p§.§_-kZ§)
         {
            return §_-q1p§.§_-l29§(param1).game;
         }
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§) && (param1 == §_-q1p§.§_-X1n§ || param1 == §_-q1p§.§_-k2B§ || param1 == §_-q1p§.§_-73i§ || param1 == §_-q1p§.§_-k2m§ || param1 == §_-q1p§.§_-G1z§ || param1 == §_-q1p§.§_-427§))
         {
            return false;
         }
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§))
         {
            return true;
         }
         if(param1 != §_-q1p§.§_-l2I§)
         {
            return false;
         }
         this.locationId = §_-q1p§.§_-l2I§;
         return true;
      }
      
      private function §_-72D§(param1:int) : void
      {
         var _loc2_:Object = this.§_-f1Y§.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         if(!this.§_-i2K§.length)
         {
            return;
         }
         if(param1 < 0 || param1 >= this.§_-i2K§.length)
         {
            return;
         }
         var _loc3_:Object = this.§_-i2K§.items[param1];
         if(_loc3_ == null)
         {
            return;
         }
         this.§_-f1l§(param1);
         this.§_-oy§(this.§_-K1L§(_loc3_),int(_loc2_["value"]),true);
      }
      
      private function §_-bV§(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-i2K§.length)
         {
            _loc3_ = this.§_-K1L§(this.§_-i2K§.items[_loc2_]);
            if(_loc3_ == param1)
            {
               this.§_-f1l§(_loc2_);
               return _loc2_;
            }
            _loc2_++;
         }
         return 1;
      }
      
      private function §_-Do§(param1:int, param2:int, param3:Boolean = false) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         if(!param3 && this.locationId == param1 && this.§_-e2h§ == param2)
         {
            return;
         }
         this.locationId = param1;
         this.§_-e2h§ = param2;
         var _loc4_:int = this.§_-e2h§ == §_-q1p§.§_-kZ§ ? §_-q1p§.§_-B2D§ : this.locationId;
         if(!(_loc4_ in this.§_-ou§) || (this.§_-ou§[_loc4_]["mods"] as Array).indexOf(this.modeId) == -1 || this.§_-43B§ != 0)
         {
            this.§_-729§();
            if(§_-q1p§.§_-l29§(_loc4_).subs == null)
            {
               Connection.§_-Li§(§_-h2B§.§_-m0§,_loc4_,0,this.modeId);
            }
            else
            {
               _loc5_ = §_-q1p§.§_-l29§(_loc4_).subs[this.§_-43B§]["modes"];
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  Connection.§_-Li§(§_-h2B§.§_-m0§,_loc4_,this.§_-43B§,_loc5_[_loc6_]);
                  _loc6_++;
               }
            }
            return;
         }
         this.§_-J28§(this.locationId);
      }
      
      private function §_-B3B§() : void
      {
         this.§_-Q1m§ = true;
         this.hide();
      }
      
      private function §_-oy§(param1:int, param2:int = -1, param3:Boolean = false) : void
      {
         var _loc5_:Object = null;
         var _loc4_:int = param2;
         if(_loc4_ < 0)
         {
            _loc5_ = this.§_-f1Y§.§_-l1§;
            if(_loc5_ == null)
            {
               return;
            }
            _loc4_ = int(_loc5_["value"]);
         }
         §_-x1I§.open(_loc4_,param1,§_-x1I§.§_-S1n§(this.§_-X1t§,this.§_-e2h§),§_-x1I§.§_-43B§(this.§_-R2i§));
         if(param3)
         {
            this.§_-B3B§();
         }
      }
      
      private function §_-j1d§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:int = param5 == §_-q1p§.§_-kZ§ ? §_-q1p§.§_-B2D§ : param2;
         if(!(_loc7_ in this.§_-ou§))
         {
            return;
         }
         var _loc8_:Array = this.§_-ou§[_loc7_]["items"];
         _loc8_.push({
            "label":param1,
            "value":param1,
            "playerId":param4,
            "mode":param3,
            "rating":"0",
            "percent":"100",
            "forSort":param1,
            "sub":param6
         });
         if(param5 == §_-q1p§.§_-kZ§)
         {
            _loc8_[_loc8_.length - 1]["folderMark"] = param2;
         }
         if("total_count" in this.§_-ou§[_loc7_])
         {
            ++this.§_-ou§[_loc7_]["total_count"];
         }
         if(param5 != this.§_-e2h§)
         {
            return;
         }
         if(param2 != this.locationId)
         {
            return;
         }
         if(param3 != (§_-q1p§.§_-l29§(this.locationId).§_-F2e§ ? (this.§_-o11§.§_-l1§ != null ? this.§_-o11§.§_-l1§["value"] : this.§_-o11§.getItemAt(0)["value"]) : 0))
         {
            return;
         }
         var _loc9_:int = this.§_-i2K§.§_-Uf§;
         this.§_-J28§(param2);
         this.§_-f1l§(_loc9_);
      }
      
      private function §_-5M§(param1:Event) : void
      {
         this.§_-Y1O§();
         var _loc2_:Object = this.§_-f1Y§.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-WT§(_loc2_["value"]);
         this.§_-MY§(_loc2_["value"]);
         this.§_-Do§(_loc2_["value"],this.§_-e2h§);
         this.§_-D1x§.visible = this.§_-y1d§;
         this.§_-An§.visible = this.§_-e2h§ != §_-q1p§.§_-kZ§ && (!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && this.locationId == §_-q1p§.§_-l2I§);
      }
      
      private function §_-aM§(param1:Event) : void
      {
         this.§_-Y1O§();
         var _loc2_:Object = this.§_-o11§.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         this.modeId = _loc2_["value"];
         this.§_-Do§(this.locationId,this.§_-e2h§,true);
      }
      
      private function §_-E6§(param1:Event) : void
      {
         this.§_-Y1O§();
         var _loc2_:Object = this.§_-R2i§.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-43B§ = _loc2_["value"];
         this.§_-MY§(this.locationId);
         this.§_-Do§(this.locationId,this.§_-e2h§,true);
      }
      
      private function §_-328§(param1:Event) : void
      {
         this.§_-Y1O§();
         var _loc2_:Object = this.§_-X1t§.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-Mp§();
         this.§_-WT§(this.§_-f1Y§.§_-l1§["value"]);
         this.§_-MY§(this.§_-f1Y§.§_-l1§["value"]);
         this.§_-Do§(this.§_-f1Y§.§_-l1§["value"],_loc2_["value"]);
         this.§_-D1x§.visible = this.§_-y1d§;
         this.§_-An§.visible = this.§_-e2h§ != §_-q1p§.§_-kZ§ && (!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && this.locationId == §_-q1p§.§_-l2I§);
         this.§_-H20§.visible = this.§_-e2h§ == §_-q1p§.§_-kZ§ && §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
         this.§_-R2C§.visible = this.§_-e2h§ != §_-q1p§.§_-kZ§ && §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§);
      }
      
      private function §_-93s§(param1:int) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-f1Y§.length)
         {
            _loc3_ = this.§_-f1Y§.getItemAt(_loc2_);
            if(_loc3_["value"] == param1)
            {
               this.§_-f1Y§.§_-Uf§ = _loc2_;
               break;
            }
            _loc2_++;
         }
      }
      
      private function §_-J28§(param1:int) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:int = 0;
         if(§_-q1p§.§_-l29§(param1).§_-F2e§ || §_-q1p§.§_-l29§(param1).subs != null)
         {
            _loc2_ = this.§_-o11§.§_-l1§ != null ? int(this.§_-o11§.§_-l1§["value"]) : int(this.§_-o11§.getItemAt(0)["value"]);
         }
         _loc2_ = _loc2_ == §_-q1p§.§_-3F§ ? §_-q1p§.§_-h2d§ : _loc2_;
         this.§_-729§();
         this.§_-33K§ = {};
         var _loc3_:int = this.§_-e2h§ == §_-q1p§.§_-kZ§ ? §_-q1p§.§_-B2D§ : param1;
         if(!(_loc3_ in this.§_-ou§))
         {
            return;
         }
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         for each(_loc6_ in this.§_-ou§[_loc3_]["items"])
         {
            if(!(this.§_-e2h§ == §_-q1p§.§_-kZ§ && param1 != _loc6_["folderMark"]))
            {
               _loc7_ = int(_loc6_["playerId"]);
               _loc8_ = int(_loc6_["mode"]);
               if(!(_loc8_ != _loc2_ || _loc6_["sub"] != this.§_-43B§))
               {
                  _loc4_.push(_loc7_);
                  if(!(_loc7_ in this.§_-33K§))
                  {
                     this.§_-33K§[_loc7_] = [];
                  }
                  this.§_-33K§[_loc7_].push(_loc6_);
                  _loc5_.push(_loc6_);
               }
            }
         }
         _loc5_.sortOn("forSort",Array.NUMERIC);
         this.§_-I1r§(_loc5_);
         Game.request(_loc4_,§_-hF§.§_-31q§);
         this.§_-u2d§(_loc3_);
      }
      
      private function §_-u2d§(param1:int) : void
      {
         var _loc2_:int = "total_count" in this.§_-ou§[param1] ? int(this.§_-ou§[param1]["total_count"]) : this.§_-i2K§.length;
         this.§_-O1p§.text = _loc2_ != this.§_-i2K§.length ? gls("Карт: {0} / {1}",this.§_-i2K§.length,_loc2_) : gls("Карт: {0}",this.§_-i2K§.length);
      }
      
      private function §_-hz§(param1:Event = null) : void
      {
         if(this.§_-f1Y§.§_-l1§ == null)
         {
            return;
         }
         if(this.§_-A2R§() == null)
         {
            return;
         }
         (SquirrelGame.instance as §_-A32§).§_-Wo§();
      }
      
      private function §_-hJ§(param1:Event) : void
      {
         §_-Wl§.clear();
         var _loc2_:int = int(this.§_-9S§.text);
         var _loc3_:int = int(this.§_-02u§.text);
         if(_loc2_ >= _loc3_ || _loc2_ != this.§_-K1L§(this.§_-i2K§.items[this.§_-bV§(_loc2_)]) || _loc3_ != this.§_-K1L§(this.§_-i2K§.items[this.§_-bV§(_loc3_)]))
         {
            this.§_-D1x§.visible = this.§_-X19§.visible = false;
            return;
         }
         var _loc4_:int = this.§_-bV§(int(this.§_-9S§.text));
         while(_loc4_ < this.§_-i2K§.length)
         {
            §_-Wl§.§_-j1d§(this.§_-K1L§(this.§_-i2K§.items[_loc4_]));
            _loc4_++;
         }
         this.§_-X19§.visible = true;
         this.§_-D1x§.visible = this.§_-y1d§;
      }
      
      private function §_-V2z§(param1:Event) : void
      {
         var _loc2_:Object = this.§_-f1Y§.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         if(!§_-Wl§.isEmpty)
         {
            this.§_-oy§(§_-Wl§.first,int(_loc2_["value"]),true);
            return;
         }
         var _loc3_:Object = this.§_-A2R§();
         if(_loc3_ == null)
         {
            return;
         }
         this.§_-oy§(this.§_-K1L§(_loc3_),int(_loc2_["value"]),true);
      }
      
      private function §_-V11§(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         if(this.§_-J1y§.text == "" || this.§_-J1y§.text == gls("Поиск по №"))
         {
            return;
         }
         var _loc2_:Object = this.§_-f1Y§.§_-l1§;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = int(this.§_-J1y§.text);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§))
         {
            this.§_-oy§(_loc3_,int(_loc2_["value"]),true);
            return;
         }
         for each(_loc4_ in this.§_-ou§[_loc2_["value"]]["items"])
         {
            _loc5_ = this.§_-K1L§(_loc4_);
            if(_loc5_ == _loc3_)
            {
               this.§_-oy§(_loc3_,int(_loc2_["value"]),true);
               return;
            }
         }
         this.§_-r1W§.show();
      }
      
      private function §_-m1Q§(param1:Event) : void
      {
         this.§_-Y1O§();
         this.§_-B3B§();
         §_-x1I§.§_-s1E§(this.locationId,this.modeId,this.§_-43B§);
      }
      
      private function §_-Z2o§(param1:Event) : void
      {
         var _loc2_:Object = null;
         if(this.§_-e2h§ != §_-q1p§.§_-kZ§)
         {
            return;
         }
         this.§_-729§();
         for each(_loc2_ in this.§_-ou§[§_-q1p§.§_-B2D§]["items"])
         {
            Connection.§_-Li§(§_-h2B§.§_-g2o§,_loc2_["forSort"],_loc2_["folderMark"],_loc2_["sub"],_loc2_["mode"],_loc2_["folderMark"]);
            this.§_-j1d§(_loc2_["forSort"],_loc2_["folderMark"],_loc2_["mode"],_loc2_["playerId"],§_-q1p§.§_-8Z§,_loc2_["sub"]);
         }
         delete this.§_-ou§[§_-q1p§.§_-B2D§];
         this.§_-O1p§.text = gls("Карт: 0");
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Player = param1.player;
         if(!(_loc2_["id"] in this.§_-33K§))
         {
            return;
         }
         for each(_loc3_ in this.§_-33K§[_loc2_["id"]])
         {
            _loc3_["playerName"] = _loc2_.name.substr(0,15);
            this.§_-A1D§(_loc3_);
         }
         delete this.§_-33K§[_loc2_["id"]];
      }
      
      private function §_-K1L§(param1:Object) : int
      {
         return param1["value"];
      }
      
      private function §_-I§(param1:int, param2:int = -1) : void
      {
         var _loc3_:int = this.§_-e2h§ == §_-q1p§.§_-kZ§ ? §_-q1p§.§_-B2D§ : param1;
         if(!(_loc3_ in this.§_-ou§))
         {
            return;
         }
         var _loc4_:int = param2 != -1 ? param2 : this.§_-K1L§(this.§_-A2R§());
         var _loc5_:Array = this.§_-ou§[_loc3_]["items"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(_loc5_[_loc6_]["value"] == _loc4_)
            {
               _loc5_.splice(_loc6_,1);
               break;
            }
            _loc6_++;
         }
         this.§_-ou§[_loc3_]["items"] = _loc5_;
         if("total_count" in this.§_-ou§[_loc3_])
         {
            --this.§_-ou§[_loc3_]["total_count"];
         }
         var _loc7_:int = this.§_-i2K§.§_-Uf§;
         this.§_-J28§(param1);
         this.§_-f1l§(_loc7_);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:int = this.§_-e2h§ == §_-q1p§.§_-kZ§ ? §_-q1p§.§_-B2D§ : int(param1[0]);
         var _loc3_:Array = [];
         var _loc4_:int = int(param1[2]);
         var _loc5_:int = 0;
         while(_loc5_ < param1[3].length)
         {
            _loc6_ = int(param1[3][_loc5_]);
            _loc7_ = int(param1[3][_loc5_ + 1]);
            _loc8_ = int(param1[3][_loc5_ + 2]);
            _loc9_ = int(param1[3][_loc5_ + 3]);
            _loc10_ = int(param1[3][_loc5_ + 4]);
            _loc3_.push({
               "label":_loc6_,
               "value":_loc6_,
               "mode":_loc4_,
               "rating":_loc9_,
               "percent":_loc10_,
               "forSort":_loc6_,
               "playerId":_loc8_,
               "folderMark":_loc7_,
               "sub":param1[1]
            });
            _loc5_ += 5;
         }
         if(this.§_-ou§[_loc2_] != null)
         {
            this.§_-ou§[_loc2_]["items"] = (this.§_-ou§[_loc2_]["items"] as Array).concat(_loc3_);
            this.§_-ou§[_loc2_]["mods"].push(_loc4_);
         }
         else
         {
            this.§_-ou§[_loc2_] = {};
            this.§_-ou§[_loc2_]["items"] = _loc3_;
            this.§_-ou§[_loc2_]["mods"] = [_loc4_];
         }
         this.§_-ou§[_loc2_]["total_count"] = param1[4];
         this.§_-J28§(param1[0]);
      }
      
      private function §_-o1g§(param1:MouseEvent) : void
      {
         §_-C1p§.show();
      }
      
      private function §_-q§(param1:MouseEvent) : void
      {
         §_-53R§.show(this.locationId,this.§_-ou§[this.locationId]["items"].concat(),this.§_-43B§);
      }
      
      private function §_-yD§(param1:MouseEvent) : void
      {
         §_-03E§.show(this.locationId,this.§_-ou§[this.locationId]["items"].concat(),this.§_-43B§);
      }
      
      private function get §_-y1d§() : Boolean
      {
         return !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && (this.locationId == §_-q1p§.§_-l2I§ || this.locationId == §_-q1p§.§_-u2f§);
      }
      
      private function §_-729§() : void
      {
         this.§_-i2K§.removeAll();
      }
      
      private function §_-I1r§(param1:Array) : void
      {
         this.§_-i2K§.§_-K26§(param1,-1);
      }
      
      private function §_-A2R§() : Object
      {
         return this.§_-i2K§.§_-l1§;
      }
      
      private function §_-Fw§() : Array
      {
         return this.§_-i2K§.§_-x1U§();
      }
      
      private function §_-f1l§(param1:int) : void
      {
         if(param1 < -1 || param1 >= this.§_-i2K§.length)
         {
            return;
         }
         this.§_-i2K§.setSelection(param1 >= 0 ? [param1] : [],param1);
      }
      
      private function §_-M2R§(param1:Object, param2:int, param3:int) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:TextFormat = param1["marked"] ? new TextFormat(§_-22V§.§_-F2z§,12,16711680,true) : §_-815§;
         var _loc6_:String = param1["playerName"] ? param1["playerName"] : "";
         var _loc7_:§_-22V§ = new §_-22V§(String(param1["value"]),§_-Y12§,2,_loc5_,§_-vs§);
         this.§_-23B§(_loc7_);
         _loc7_.name = "number";
         _loc4_.addChild(_loc7_);
         var _loc8_:§_-22V§ = new §_-22V§(_loc6_,§_-03O§,2,§_-O1e§,§_-M1c§);
         this.§_-23B§(_loc8_);
         _loc8_.name = "name";
         _loc4_.addChild(_loc8_);
         var _loc9_:§_-22V§ = new §_-22V§(param1["percent"] + "%",§_-g2d§,2,§_-M1L§,§_-Or§);
         this.§_-23B§(_loc9_);
         _loc9_.name = "percent";
         _loc4_.addChild(_loc9_);
         var _loc10_:§_-22V§ = new §_-22V§(String(param1["rating"]),§_-Z1Q§,2,§_-M1L§,§_-D2m§);
         this.§_-23B§(_loc10_);
         _loc10_.name = "rating";
         _loc4_.addChild(_loc10_);
         return _loc4_;
      }
      
      private function §_-A1D§(param1:Object) : void
      {
         var _loc2_:int = this.§_-i2K§.items.indexOf(param1);
         var _loc3_:Sprite = this.§_-i2K§.§_-J2W§(_loc2_);
         if(_loc2_ < 0 || _loc3_ == null)
         {
            return;
         }
         var _loc4_:§_-22V§ = _loc3_.getChildByName("name") as §_-22V§;
         _loc4_.text = param1["playerName"] ? param1["playerName"] : "";
         this.§_-23B§(_loc4_);
         (_loc3_.getChildByName("percent") as §_-22V§).text = param1["percent"] + "%";
         (_loc3_.getChildByName("rating") as §_-22V§).text = String(param1["rating"]);
         this.§_-i2K§.§_-43o§();
      }
      
      private function §_-23B§(param1:§_-22V§) : void
      {
         param1.multiline = false;
         param1.wordWrap = false;
      }
   }
}

