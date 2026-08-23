package §_-ZL§
{
   import §_-B1G§.§_-32t§;
   import §_-B1G§.§_-U1c§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-t2c§;
   import §_-l2u§.§_-62b§;
   import §_-l2u§.§_-V2i§;
   import §_-l2u§.§_-lp§;
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
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-33I§;
   import utils.§_-72U§;
   
   public class §_-Ti§ extends Dialog
   {
      
      private static const §_-A3C§:int = 5;
      
      private static const §_-m2Q§:int = 168;
      
      private static const §_-S9§:int = 300;
      
      private static const §_-y14§:int = 80;
      
      private static const §_-i2g§:int = 20;
      
      private static const §_-JF§:int = 197;
      
      private static const §_-N1z§:int = 5;
      
      private static const §_-O2i§:int = 25;
      
      private static const §_-21u§:int = 22;
      
      private static const §_-a22§:int = 80;
      
      private static const §_-JQ§:int = 103;
      
      private static const §_-lw§:int = 16;
      
      private static const §_-d28§:int = 119;
      
      private static const §_-e2q§:int = 200;
      
      private static const §_-32b§:int = 50;
      
      private static const §_-83X§:int = 3;
      
      private static const §_-X2H§:int = 6;
      
      private static const §_-71K§:int = 7;
      
      private static const §_-Q1d§:int = 4;
      
      private static const §_-J2B§:int = 65;
      
      private static const §_-O2p§:int = 72;
      
      private static const §_-W2k§:int = 127;
      
      private static const §_-L24§:int = 202;
      
      private static const §_-M2D§:int = 32;
      
      private static const §_-v1c§:int = 237;
      
      private static const §_-R2g§:int = 59;
      
      private static var _instance:§_-Ti§;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","}",".number {","font-weight: bold;","text-decoration: none;","}",".number:hover {","text-decoration: underline;","}",".newMap {","color: #d72e00;","text-decoration: underline;","font-size: 12px;","}",".link {","color: #000000;","text-decoration: underline;","font-size: 12px;","}",".record {","font-size: 13px;","}",".record:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-I2h§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017);
      
      private static const §_-g1N§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017,true);
      
      private static const §_-w1c§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017,null,null,null,null,null,"right");
      
      private var §_-X1L§:§_-32t§ = new §_-32t§(§_-m2Q§);
      
      private var §_-G17§:§_-32t§ = new §_-32t§(§_-m2Q§);
      
      private var §_-22M§:§_-32t§ = new §_-32t§(§_-m2Q§);
      
      private var §_-o5§:§_-32t§ = new §_-32t§(§_-m2Q§);
      
      private var §_-T1j§:§_-U1c§;
      
      private var §_-32Q§:Boolean = false;
      
      private var §_-q6§:Object = {};
      
      private var §_-J1Y§:Object = {};
      
      private var locationId:int = 0;
      
      private var modeId:int = 0;
      
      private var §_-x2t§:int = 0;
      
      private var §_-Z2a§:int = 0;
      
      private var loaded:Boolean = false;
      
      private var §_-w0§:§_-i5§ = null;
      
      private var §_-qr§:§_-i5§ = null;
      
      private var §_-x9§:§_-i5§ = null;
      
      private var §_-jU§:§_-i5§ = null;
      
      private var §_-KT§:§_-i5§ = null;
      
      private var §_-s§:§_-72U§ = null;
      
      private var §_-b2p§:SimpleButton = null;
      
      private var §_-D1r§:§_-i5§ = null;
      
      private var §_-H2j§:§_-i5§ = null;
      
      private var §_-KA§:§_-i5§ = null;
      
      private var §_-f2t§:§_-i5§ = null;
      
      private var §_-L1W§:§_-i5§ = null;
      
      private var §_-d2X§:§_-i5§ = null;
      
      private var §_-j1B§:§_-i5§ = null;
      
      private var §_-C1u§:§_-i5§ = null;
      
      private var §_-SN§:§_-i5§ = null;
      
      private var §_-72D§:§_-Fk§ = new §_-Fk§(" ",gls("Карты с таким номером не существует."),false,null,265);
      
      private var §_-w2§:§_-72U§;
      
      private var §_-2U§:§_-72U§;
      
      private var §_-029§:int = 0;
      
      public function §_-Ti§()
      {
         _instance = this;
         super(gls("Карты"));
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-X1L§.x = §_-A3C§;
         this.§_-X1L§.y = 5;
         this.§_-X1L§.addEventListener(Event.CHANGE,this.§_-C3h§);
         this.§_-X1L§.addItem({
            "label":gls("Релиз"),
            "value":§_-at§.§_-L1l§
         });
         this.§_-X1L§.addItem({
            "label":gls("Готовы к релизу"),
            "value":§_-at§.§_-e2M§
         });
         this.§_-X1L§.§_-JZ§ = 0;
         addChild(this.§_-X1L§);
         this.§_-G17§.x = §_-A3C§;
         this.§_-G17§.y = 30;
         this.§_-G17§.addEventListener(Event.CHANGE,this.§_-Em§);
         addChild(this.§_-G17§);
         this.§_-o5§.x = §_-A3C§;
         this.§_-o5§.y = 55;
         this.§_-o5§.addEventListener(Event.CHANGE,this.§_-or§);
         addChild(this.§_-o5§);
         this.§_-22M§.x = §_-A3C§;
         this.§_-22M§.y = §_-a22§;
         this.§_-22M§.addEventListener(Event.CHANGE,this.§_-h1y§);
         addChild(this.§_-22M§);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,3810566);
         this.§_-s§ = new §_-72U§(gls("Поиск по №"),§_-JF§,4,§_-y14§,20,_loc2_);
         this.§_-s§.restrict = "0-9";
         this.§_-s§.background = false;
         addChild(this.§_-s§);
         this.§_-b2p§ = new ButtonSearch();
         this.§_-b2p§.scaleX = this.§_-b2p§.scaleY = 0.7;
         this.§_-b2p§.x = §_-S9§ - §_-i2g§;
         this.§_-b2p§.y = 4;
         this.§_-b2p§.addEventListener(MouseEvent.CLICK,this.§_-l1P§);
         addChild(this.§_-b2p§);
         this.§_-w0§ = new §_-i5§("",§_-JF§,0,§_-w1c§,§_-S9§ - §_-JF§);
         addChild(this.§_-w0§);
         this.§_-qr§ = new §_-i5§("№",§_-Q1d§,0,§_-g1N§);
         addChild(this.§_-qr§);
         this.§_-x9§ = new §_-i5§(gls("Автор"),§_-O2p§,0,§_-g1N§);
         addChild(this.§_-x9§);
         this.§_-jU§ = new §_-i5§("%",§_-L24§,0,§_-w1c§,§_-M2D§);
         addChild(this.§_-jU§);
         this.§_-KT§ = new §_-i5§(gls("Игры"),§_-v1c§,0,§_-w1c§,§_-R2g§);
         addChild(this.§_-KT§);
         this.§_-T1j§ = new §_-U1c§(§_-S9§,§_-e2q§);
         this.§_-T1j§.x = §_-A3C§;
         this.§_-T1j§.y = §_-d28§;
         this.§_-T1j§.§_-c23§ = true;
         this.§_-T1j§.§_-530§ = this.§_-12o§;
         this.§_-T1j§.addEventListener(MouseEvent.CLICK,this.§_-s2D§);
         addChild(this.§_-T1j§);
         var _loc3_:int = §_-d28§ + §_-e2q§ + 8;
         this.§_-f2t§ = new §_-i5§(gls("<body><a href=\'event:\' class=\'link\'>Редактировать</a></body>"),§_-A3C§,_loc3_,_loc1_);
         this.§_-f2t§.addEventListener(MouseEvent.MOUSE_UP,this.§_-61A§);
         addChild(this.§_-f2t§);
         this.§_-D1r§ = new §_-i5§(gls("<body><a href=\'event:\' class=\'newMap\'>Удалить</a></body>"),§_-A3C§ + 100,_loc3_,_loc1_);
         this.§_-D1r§.addEventListener(MouseEvent.MOUSE_UP,this.§_-73C§);
         addChild(this.§_-D1r§);
         this.§_-d2X§ = new §_-i5§(gls("<body><a href=\'event:\' class=\'newMap\'>Лаги</a></body>"),§_-A3C§ + §_-S9§ - 30,_loc3_,_loc1_);
         this.§_-d2X§.addEventListener(MouseEvent.MOUSE_UP,this.§_-u2W§);
         addChild(this.§_-d2X§);
         this.§_-j1B§ = new §_-i5§(gls("<body><a href=\'event:\' class=\'newMap\'>Невидимые</a></body>"),§_-A3C§ + 165,_loc3_,_loc1_);
         this.§_-j1B§.addEventListener(MouseEvent.MOUSE_UP,this.§_-a1T§);
         addChild(this.§_-j1B§);
         this.§_-KA§ = new §_-i5§(gls("<body><a href=\'event:#\' class=\'newMap\'>Зарелизить все</a></body>"),§_-A3C§ + 165,_loc3_,_loc1_);
         this.§_-KA§.addEventListener(MouseEvent.MOUSE_UP,this.§_-s1L§);
         addChild(this.§_-KA§);
         var _loc4_:int = _loc3_ + 20;
         this.§_-H2j§ = new §_-i5§(gls("<body><a href=\'event:#\' class=\'link\'>Создать карту</a></body>"),§_-A3C§,_loc4_,_loc1_);
         this.§_-H2j§.addEventListener(MouseEvent.MOUSE_UP,this.§_-O1A§);
         addChild(this.§_-H2j§);
         this.§_-L1W§ = new §_-i5§(gls("<body><a href=\'event:#\' class=\'newMap\'>Начисления</a></body>"),§_-A3C§ + §_-S9§ - 70,_loc4_,_loc1_);
         this.§_-L1W§.visible = false;
         this.§_-L1W§.addEventListener(MouseEvent.MOUSE_UP,this.§_-6H§);
         addChild(this.§_-L1W§);
         var _loc5_:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,3810566);
         this.§_-C1u§ = new §_-i5§(gls("<body>От</body>"),0,0,_loc1_);
         addChild(this.§_-C1u§);
         this.§_-w2§ = new §_-72U§("",0,0,§_-32b§,15,_loc5_);
         this.§_-w2§.background = false;
         this.§_-w2§.restrict = "0-9";
         this.§_-w2§.addEventListener(Event.CHANGE,this.§_-t16§);
         addChild(this.§_-w2§);
         this.§_-SN§ = new §_-i5§(gls("<body>до</body>"),0,0,_loc1_);
         addChild(this.§_-SN§);
         this.§_-2U§ = new §_-72U§("",0,0,§_-32b§,15,_loc5_);
         this.§_-2U§.background = false;
         this.§_-2U§.restrict = "0-9";
         this.§_-2U§.addEventListener(Event.CHANGE,this.§_-t16§);
         addChild(this.§_-2U§);
         place();
         this.height += 45;
         this.§_-029§ = int(this.height);
         this.§_-lz§();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-q2f§]);
         Game.listen(this.§_-Y16§);
      }
      
      public static function get §_-Es§() : int
      {
         return _instance.§_-T1j§.length;
      }
      
      public static function §_-O1z§(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         _instance.§_-O1z§(param1,param2,param3,param4,§_-lm§.§_-uj§,param5);
      }
      
      public static function §_-b2w§(param1:int, param2:int) : void
      {
         var _loc3_:int = _instance.§_-T1j§.§_-JZ§;
         _instance.§_-W1Y§(param1,param2);
         Connection.§_-e2T§(§_-u1O§.§_-E2E§,param2);
         if(!§_-lp§.isEmpty)
         {
            §_-lp§.§_-T1R§(param2);
            if(!§_-lp§.isEmpty)
            {
               §_-x2k§();
            }
            else
            {
               (SquirrelGame.instance as §_-62b§).§_-x2I§();
            }
            return;
         }
         if(_loc3_ <= 0)
         {
            _instance.show();
            if(_loc3_ < 0 || _instance.§_-T1j§.length == 0)
            {
               return;
            }
         }
         _instance.§_-x8§(_loc3_ >= _instance.§_-T1j§.length ? int(_instance.§_-T1j§.length - 1) : _loc3_);
      }
      
      public static function §_-p1n§() : void
      {
         var _loc1_:int = _instance.§_-T1j§.§_-JZ§;
         _instance.§_-x8§(_loc1_);
      }
      
      public static function §_-810§(param1:int = -1) : void
      {
         if(!§_-lp§.isEmpty)
         {
            §_-x2k§();
            return;
         }
         var _loc2_:int = 0;
         if(param1 > 0)
         {
            _loc2_ = _instance.§_-n1T§(param1);
         }
         _instance.§_-x8§(_loc2_ + 1);
      }
      
      public static function §_-WV§(param1:int = -1) : void
      {
         if(!§_-lp§.isEmpty)
         {
            §_-x2k§();
            return;
         }
         var _loc2_:int = 1;
         if(param1 > 0)
         {
            _loc2_ = _instance.§_-n1T§(param1);
         }
         _instance.§_-x8§(_loc2_ - 1);
      }
      
      public static function §_-Yg§() : void
      {
         var _loc1_:Object = _instance.§_-G17§.§_-E2v§;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:Object = _instance.§_-8f§();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _instance.§_-1r§(_loc2_);
         _instance.§_-W1Y§(_loc1_["value"]);
         Connection.§_-e2T§(§_-u1O§.§_-E2E§,_loc3_);
      }
      
      public static function §_-W1Y§(param1:int, param2:int) : void
      {
         _instance.§_-W1Y§(param1,param2);
      }
      
      public static function show() : void
      {
         _instance.show();
      }
      
      public static function §_-X2b§() : void
      {
         _instance.§_-X2b§();
      }
      
      public static function §_-41k§() : Boolean
      {
         return _instance.visible;
      }
      
      public static function §_-K2L§(param1:int, param2:String) : Boolean
      {
         switch(param2)
         {
            case "Next":
               if(§_-lp§.isEmpty)
               {
                  return _instance.§_-T1j§.length - 1 > _instance.§_-n1T§(param1);
               }
               return §_-lp§.§_-9l§();
               break;
            case "Prev":
               if(§_-lp§.isEmpty)
               {
                  return _instance.§_-n1T§(param1) > 0;
               }
               return §_-lp§.§_-m1k§();
               break;
            default:
               return false;
         }
      }
      
      private static function §_-x2k§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-H1a§(§_-lp§.§_-I2R§);
      }
      
      override public function show() : void
      {
         if(!this.loaded)
         {
            this.§_-L1W§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§);
            this.§_-D1r§.visible = this.§_-A1t§;
            this.§_-H2j§.visible = !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && this.locationId == §_-at§.§_-lg§;
            this.§_-KA§.visible = false;
            this.§_-d2X§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
            this.§_-j1B§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
            this.§_-X1L§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
            this.§_-K2v§();
            Connection.§_-e2T§(§_-u1O§.§_-q2f§,this.locationId,0,this.modeId);
            this.§_-85§(this.locationId);
            this.§_-k1n§(this.locationId);
            this.loaded = true;
         }
         else
         {
            this.§_-lz§();
         }
         this.§_-22U§();
         this.visible = true;
         placeInCenter();
         addToSprite();
         this.§_-32Q§ = false;
         this.§_-D1§(this.locationId);
         this.§_-ne§(this.§_-G17§.§_-E2v§["value"],this.§_-Z2a§);
         (SquirrelGame.instance as §_-62b§).reset();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.stage.focus = Game.stage;
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
         if(this.§_-32Q§)
         {
            return;
         }
         §_-t2c§.show("Location");
      }
      
      private function §_-s2D§(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         this.§_-f2t§.visible = true;
         §_-lp§.clear();
         if(this.§_-r1d§().length > 1)
         {
            for each(_loc2_ in this.§_-r1d§())
            {
               §_-lp§.§_-O1z§(this.§_-1r§(_loc2_));
            }
         }
         this.§_-w2§.text = §_-lp§.isEmpty ? "" : String(§_-lp§.first);
         this.§_-2U§.text = §_-lp§.isEmpty ? "" : String(§_-lp§.last);
         this.§_-D1r§.visible = this.§_-A1t§ && §_-lp§.isEmpty;
         this.§_-b2p§.visible = this.§_-s§.visible = §_-lp§.isEmpty;
      }
      
      private function §_-22U§() : void
      {
         §_-lp§.clear();
         this.§_-w2§.text = "";
         this.§_-2U§.text = "";
         this.§_-D1r§.visible = this.§_-A1t§;
         this.§_-s§.visible = this.§_-b2p§.visible = this.§_-f2t§.visible = true;
      }
      
      private function §_-lz§() : void
      {
         var _loc4_:§_-32t§ = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc1_:int = §_-N1z§;
         var _loc2_:int = §_-N1z§;
         var _loc3_:Array = [this.§_-X1L§,this.§_-G17§,this.§_-o5§,this.§_-22M§];
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.visible)
            {
               _loc4_.y = _loc1_;
               _loc2_ = _loc1_;
               _loc1_ += §_-O2i§;
            }
         }
         _loc5_ = §_-JQ§ - §_-a22§ - §_-21u§;
         _loc6_ = _loc2_ + §_-21u§ + _loc5_;
         _loc7_ = _loc6_ + §_-lw§;
         _loc8_ = _loc7_ + §_-e2q§ + 8;
         _loc9_ = _loc8_ + 20;
         this.§_-w0§.y = _loc2_ + 5;
         this.§_-qr§.y = _loc6_;
         this.§_-x9§.y = _loc6_;
         this.§_-jU§.y = _loc6_;
         this.§_-KT§.y = _loc6_;
         this.§_-T1j§.y = _loc7_;
         this.§_-f2t§.y = _loc8_;
         this.§_-D1r§.y = _loc8_;
         this.§_-d2X§.y = _loc8_;
         this.§_-j1B§.y = _loc8_;
         this.§_-KA§.y = _loc8_;
         this.§_-H2j§.y = _loc9_;
         this.§_-L1W§.y = _loc9_;
         this.§_-L1W§.x = §_-A3C§ + §_-S9§ - this.§_-L1W§.width;
         this.§_-Qa§(_loc9_);
         if(this.§_-029§ > 0)
         {
            this.height = this.§_-029§ - (§_-JQ§ - _loc6_);
         }
      }
      
      private function §_-Qa§(param1:int) : void
      {
         var _loc2_:int = this.§_-H2j§.visible ? int(this.§_-H2j§.x + this.§_-H2j§.width) : §_-A3C§;
         var _loc3_:int = this.§_-L1W§.visible ? int(this.§_-L1W§.x) : int(§_-A3C§ + §_-S9§);
         var _loc4_:int = this.§_-C1u§.width + §_-83X§ + this.§_-SN§.width + §_-83X§ + §_-X2H§;
         var _loc5_:int = int((_loc3_ - _loc2_ - _loc4_) * 0.5);
         if(_loc5_ < §_-32b§)
         {
            _loc5_ = §_-32b§;
         }
         this.§_-C1u§.x = _loc2_;
         this.§_-C1u§.y = param1;
         this.§_-w2§.x = _loc2_ + this.§_-C1u§.width + §_-83X§;
         this.§_-w2§.y = param1;
         this.§_-w2§.width = _loc5_;
         this.§_-SN§.x = this.§_-w2§.x + _loc5_ + §_-X2H§;
         this.§_-SN§.y = param1;
         this.§_-2U§.x = this.§_-SN§.x + this.§_-SN§.width + §_-83X§;
         this.§_-2U§.y = param1;
         this.§_-2U§.width = _loc5_;
      }
      
      private function §_-K2v§() : void
      {
         var _loc2_:Location = null;
         var _loc1_:DataProvider = new DataProvider();
         for each(_loc2_ in §_-at§.list)
         {
            if(this.§_-h1E§(_loc2_.id))
            {
               _loc1_.addItem({
                  "label":_loc2_.name,
                  "value":_loc2_.id
               });
            }
         }
         this.§_-G17§.§_-GO§ = _loc1_;
         this.§_-G17§.§_-JZ§ = 0;
      }
      
      private function §_-85§(param1:int) : void
      {
         this.§_-o5§.visible = §_-at§.§_-13l§(param1).subs != null;
         this.§_-x2t§ = 0;
         if(!this.§_-o5§.visible)
         {
            this.§_-lz§();
            return;
         }
         var _loc2_:DataProvider = new DataProvider();
         var _loc3_:int = 0;
         while(_loc3_ < §_-at§.§_-13l§(param1).subs.length)
         {
            _loc2_.addItem({
               "label":§_-at§.§_-13l§(param1).subs[_loc3_]["name"],
               "value":_loc3_
            });
            _loc3_++;
         }
         this.§_-o5§.§_-GO§ = _loc2_;
         this.§_-lz§();
      }
      
      private function §_-k1n§(param1:int) : void
      {
         var _loc5_:Object = null;
         var _loc2_:Array = §_-at§.§_-13l§(param1).subs != null ? §_-at§.§_-13l§(param1).subs[this.§_-x2t§]["modes"] : §_-at§.§_-13l§(param1).mapModes;
         this.§_-22M§.visible = _loc2_ != null;
         this.modeId = 0;
         if(!this.§_-22M§.visible)
         {
            this.§_-lz§();
            return;
         }
         var _loc3_:DataProvider = new DataProvider();
         var _loc4_:int = 0;
         if(_loc2_)
         {
            for each(_loc4_ in _loc2_)
            {
               _loc3_.addItem({
                  "label":§_-at§.§_-02X§[_loc4_].name,
                  "value":_loc4_
               });
            }
         }
         else
         {
            for each(_loc5_ in §_-at§.§_-02X§)
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
         this.§_-22M§.§_-GO§ = _loc3_;
         this.modeId = this.§_-22M§.getItemAt(0)["value"];
         this.§_-lz§();
      }
      
      private function §_-h1E§(param1:int) : Boolean
      {
         if(param1 == §_-at§.§_-820§ || param1 == §_-at§.§_-V1H§)
         {
            return false;
         }
         if(this.§_-X1L§.§_-E2v§["value"] == §_-at§.§_-e2M§)
         {
            return §_-at§.§_-13l§(param1).game;
         }
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§) && (param1 == §_-at§.§_-B2t§ || param1 == §_-at§.§_-G1K§ || param1 == §_-at§.§_-Lt§ || param1 == §_-at§.§_-31L§ || param1 == §_-at§.§_-Uf§ || param1 == §_-at§.§_-nq§))
         {
            return false;
         }
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§))
         {
            return true;
         }
         if(param1 != §_-at§.§_-lg§)
         {
            return false;
         }
         this.locationId = §_-at§.§_-lg§;
         return true;
      }
      
      private function §_-x8§(param1:int) : void
      {
         var _loc2_:Object = this.§_-G17§.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         if(!this.§_-T1j§.length)
         {
            return;
         }
         if(param1 < 0 || param1 >= this.§_-T1j§.length)
         {
            return;
         }
         var _loc3_:Object = this.§_-T1j§.items[param1];
         if(_loc3_ == null)
         {
            return;
         }
         this.§_-V13§(param1);
         this.§_-H1a§(this.§_-1r§(_loc3_),int(_loc2_["value"]),true);
      }
      
      private function §_-n1T§(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-T1j§.length)
         {
            _loc3_ = this.§_-1r§(this.§_-T1j§.items[_loc2_]);
            if(_loc3_ == param1)
            {
               this.§_-V13§(_loc2_);
               return _loc2_;
            }
            _loc2_++;
         }
         return 1;
      }
      
      private function §_-ne§(param1:int, param2:int, param3:Boolean = false) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         if(!param3 && this.locationId == param1 && this.§_-Z2a§ == param2)
         {
            return;
         }
         this.locationId = param1;
         this.§_-Z2a§ = param2;
         var _loc4_:int = this.§_-Z2a§ == §_-at§.§_-e2M§ ? §_-at§.§_-820§ : this.locationId;
         if(!(_loc4_ in this.§_-J1Y§) || (this.§_-J1Y§[_loc4_]["mods"] as Array).indexOf(this.modeId) == -1 || this.§_-x2t§ != 0)
         {
            this.§_-615§();
            if(§_-at§.§_-13l§(_loc4_).subs == null)
            {
               Connection.§_-e2T§(§_-u1O§.§_-q2f§,_loc4_,0,this.modeId);
            }
            else
            {
               _loc5_ = §_-at§.§_-13l§(_loc4_).subs[this.§_-x2t§]["modes"];
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-q2f§,_loc4_,this.§_-x2t§,_loc5_[_loc6_]);
                  _loc6_++;
               }
            }
            return;
         }
         this.§_-C3b§(this.locationId);
      }
      
      private function §_-X2b§() : void
      {
         this.§_-32Q§ = true;
         this.hide();
      }
      
      private function §_-H1a§(param1:int, param2:int = -1, param3:Boolean = false) : void
      {
         var _loc5_:Object = null;
         var _loc4_:int = param2;
         if(_loc4_ < 0)
         {
            _loc5_ = this.§_-G17§.§_-E2v§;
            if(_loc5_ == null)
            {
               return;
            }
            _loc4_ = int(_loc5_["value"]);
         }
         §_-V2i§.open(_loc4_,param1,§_-V2i§.§_-r2d§(this.§_-X1L§,this.§_-Z2a§),§_-V2i§.§_-x2t§(this.§_-o5§));
         if(param3)
         {
            this.§_-X2b§();
         }
      }
      
      private function §_-O1z§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:int = param5 == §_-at§.§_-e2M§ ? §_-at§.§_-820§ : param2;
         if(!(_loc7_ in this.§_-J1Y§))
         {
            return;
         }
         var _loc8_:Array = this.§_-J1Y§[_loc7_]["items"];
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
         if(param5 == §_-at§.§_-e2M§)
         {
            _loc8_[_loc8_.length - 1]["folderMark"] = param2;
         }
         if("total_count" in this.§_-J1Y§[_loc7_])
         {
            ++this.§_-J1Y§[_loc7_]["total_count"];
         }
         if(param5 != this.§_-Z2a§)
         {
            return;
         }
         if(param2 != this.locationId)
         {
            return;
         }
         if(param3 != (§_-at§.§_-13l§(this.locationId).§_-X1E§ ? (this.§_-22M§.§_-E2v§ != null ? this.§_-22M§.§_-E2v§["value"] : this.§_-22M§.getItemAt(0)["value"]) : 0))
         {
            return;
         }
         var _loc9_:int = this.§_-T1j§.§_-JZ§;
         this.§_-C3b§(param2);
         this.§_-V13§(_loc9_);
      }
      
      private function §_-Em§(param1:Event) : void
      {
         this.§_-22U§();
         var _loc2_:Object = this.§_-G17§.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-85§(_loc2_["value"]);
         this.§_-k1n§(_loc2_["value"]);
         this.§_-ne§(_loc2_["value"],this.§_-Z2a§);
         this.§_-D1r§.visible = this.§_-A1t§;
         this.§_-H2j§.visible = this.§_-Z2a§ != §_-at§.§_-e2M§ && (!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && this.locationId == §_-at§.§_-lg§);
      }
      
      private function §_-h1y§(param1:Event) : void
      {
         this.§_-22U§();
         var _loc2_:Object = this.§_-22M§.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         this.modeId = _loc2_["value"];
         this.§_-ne§(this.locationId,this.§_-Z2a§,true);
      }
      
      private function §_-or§(param1:Event) : void
      {
         this.§_-22U§();
         var _loc2_:Object = this.§_-o5§.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-x2t§ = _loc2_["value"];
         this.§_-k1n§(this.locationId);
         this.§_-ne§(this.locationId,this.§_-Z2a§,true);
      }
      
      private function §_-C3h§(param1:Event) : void
      {
         this.§_-22U§();
         var _loc2_:Object = this.§_-X1L§.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-K2v§();
         this.§_-85§(this.§_-G17§.§_-E2v§["value"]);
         this.§_-k1n§(this.§_-G17§.§_-E2v§["value"]);
         this.§_-ne§(this.§_-G17§.§_-E2v§["value"],_loc2_["value"]);
         this.§_-D1r§.visible = this.§_-A1t§;
         this.§_-H2j§.visible = this.§_-Z2a§ != §_-at§.§_-e2M§ && (!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && this.locationId == §_-at§.§_-lg§);
         this.§_-KA§.visible = this.§_-Z2a§ == §_-at§.§_-e2M§ && §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
         this.§_-j1B§.visible = this.§_-Z2a§ != §_-at§.§_-e2M§ && §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§);
      }
      
      private function §_-D1§(param1:int) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-G17§.length)
         {
            _loc3_ = this.§_-G17§.getItemAt(_loc2_);
            if(_loc3_["value"] == param1)
            {
               this.§_-G17§.§_-JZ§ = _loc2_;
               break;
            }
            _loc2_++;
         }
      }
      
      private function §_-C3b§(param1:int) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:int = 0;
         if(§_-at§.§_-13l§(param1).§_-X1E§ || §_-at§.§_-13l§(param1).subs != null)
         {
            _loc2_ = this.§_-22M§.§_-E2v§ != null ? int(this.§_-22M§.§_-E2v§["value"]) : int(this.§_-22M§.getItemAt(0)["value"]);
         }
         _loc2_ = _loc2_ == §_-at§.§_-dH§ ? §_-at§.§_-n1O§ : _loc2_;
         this.§_-615§();
         this.§_-q6§ = {};
         var _loc3_:int = this.§_-Z2a§ == §_-at§.§_-e2M§ ? §_-at§.§_-820§ : param1;
         if(!(_loc3_ in this.§_-J1Y§))
         {
            return;
         }
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         for each(_loc6_ in this.§_-J1Y§[_loc3_]["items"])
         {
            if(!(this.§_-Z2a§ == §_-at§.§_-e2M§ && param1 != _loc6_["folderMark"]))
            {
               _loc7_ = int(_loc6_["playerId"]);
               _loc8_ = int(_loc6_["mode"]);
               if(!(_loc8_ != _loc2_ || _loc6_["sub"] != this.§_-x2t§))
               {
                  _loc4_.push(_loc7_);
                  if(!(_loc7_ in this.§_-q6§))
                  {
                     this.§_-q6§[_loc7_] = [];
                  }
                  this.§_-q6§[_loc7_].push(_loc6_);
                  _loc5_.push(_loc6_);
               }
            }
         }
         _loc5_.sortOn("forSort",Array.NUMERIC);
         this.§_-PB§(_loc5_);
         Game.request(_loc4_,§_-Y2E§.§_-n2H§);
         this.§_-52z§(_loc3_);
      }
      
      private function §_-52z§(param1:int) : void
      {
         var _loc2_:int = "total_count" in this.§_-J1Y§[param1] ? int(this.§_-J1Y§[param1]["total_count"]) : this.§_-T1j§.length;
         this.§_-w0§.text = _loc2_ != this.§_-T1j§.length ? gls("Карт: {0} / {1}",this.§_-T1j§.length,_loc2_) : gls("Карт: {0}",this.§_-T1j§.length);
      }
      
      private function §_-73C§(param1:Event = null) : void
      {
         if(this.§_-G17§.§_-E2v§ == null)
         {
            return;
         }
         if(this.§_-8f§() == null)
         {
            return;
         }
         (SquirrelGame.instance as §_-62b§).§_-C1m§();
      }
      
      private function §_-t16§(param1:Event) : void
      {
         §_-lp§.clear();
         var _loc2_:int = int(this.§_-w2§.text);
         var _loc3_:int = int(this.§_-2U§.text);
         if(_loc2_ >= _loc3_ || _loc2_ != this.§_-1r§(this.§_-T1j§.items[this.§_-n1T§(_loc2_)]) || _loc3_ != this.§_-1r§(this.§_-T1j§.items[this.§_-n1T§(_loc3_)]))
         {
            this.§_-D1r§.visible = this.§_-f2t§.visible = false;
            return;
         }
         var _loc4_:int = this.§_-n1T§(int(this.§_-w2§.text));
         while(_loc4_ < this.§_-T1j§.length)
         {
            §_-lp§.§_-O1z§(this.§_-1r§(this.§_-T1j§.items[_loc4_]));
            _loc4_++;
         }
         this.§_-f2t§.visible = true;
         this.§_-D1r§.visible = this.§_-A1t§;
      }
      
      private function §_-61A§(param1:Event) : void
      {
         var _loc2_:Object = this.§_-G17§.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         if(!§_-lp§.isEmpty)
         {
            this.§_-H1a§(§_-lp§.first,int(_loc2_["value"]),true);
            return;
         }
         var _loc3_:Object = this.§_-8f§();
         if(_loc3_ == null)
         {
            return;
         }
         this.§_-H1a§(this.§_-1r§(_loc3_),int(_loc2_["value"]),true);
      }
      
      private function §_-l1P§(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         if(this.§_-s§.text == "" || this.§_-s§.text == gls("Поиск по №"))
         {
            return;
         }
         var _loc2_:Object = this.§_-G17§.§_-E2v§;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = int(this.§_-s§.text);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§))
         {
            this.§_-H1a§(_loc3_,int(_loc2_["value"]),true);
            return;
         }
         for each(_loc4_ in this.§_-J1Y§[_loc2_["value"]]["items"])
         {
            _loc5_ = this.§_-1r§(_loc4_);
            if(_loc5_ == _loc3_)
            {
               this.§_-H1a§(_loc3_,int(_loc2_["value"]),true);
               return;
            }
         }
         this.§_-72D§.show();
      }
      
      private function §_-O1A§(param1:Event) : void
      {
         this.§_-22U§();
         this.§_-X2b§();
         §_-V2i§.§_-22W§(this.locationId,this.modeId,this.§_-x2t§);
      }
      
      private function §_-s1L§(param1:Event) : void
      {
         var _loc2_:Object = null;
         if(this.§_-Z2a§ != §_-at§.§_-e2M§)
         {
            return;
         }
         this.§_-615§();
         for each(_loc2_ in this.§_-J1Y§[§_-at§.§_-820§]["items"])
         {
            Connection.§_-e2T§(§_-u1O§.§_-k0§,_loc2_["forSort"],_loc2_["folderMark"],_loc2_["sub"],_loc2_["mode"],_loc2_["folderMark"]);
            this.§_-O1z§(_loc2_["forSort"],_loc2_["folderMark"],_loc2_["mode"],_loc2_["playerId"],§_-at§.§_-L1l§,_loc2_["sub"]);
         }
         delete this.§_-J1Y§[§_-at§.§_-820§];
         this.§_-w0§.text = gls("Карт: 0");
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Player = param1.player;
         if(!(_loc2_["id"] in this.§_-q6§))
         {
            return;
         }
         for each(_loc3_ in this.§_-q6§[_loc2_["id"]])
         {
            _loc3_["playerName"] = _loc2_.name.substr(0,15);
            this.§_-rz§(_loc3_);
         }
         delete this.§_-q6§[_loc2_["id"]];
      }
      
      private function §_-1r§(param1:Object) : int
      {
         return param1["value"];
      }
      
      private function §_-W1Y§(param1:int, param2:int = -1) : void
      {
         var _loc3_:int = this.§_-Z2a§ == §_-at§.§_-e2M§ ? §_-at§.§_-820§ : param1;
         if(!(_loc3_ in this.§_-J1Y§))
         {
            return;
         }
         var _loc4_:int = param2 != -1 ? param2 : this.§_-1r§(this.§_-8f§());
         var _loc5_:Array = this.§_-J1Y§[_loc3_]["items"];
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
         this.§_-J1Y§[_loc3_]["items"] = _loc5_;
         if("total_count" in this.§_-J1Y§[_loc3_])
         {
            --this.§_-J1Y§[_loc3_]["total_count"];
         }
         var _loc7_:int = this.§_-T1j§.§_-JZ§;
         this.§_-C3b§(param1);
         this.§_-V13§(_loc7_);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:int = this.§_-Z2a§ == §_-at§.§_-e2M§ ? §_-at§.§_-820§ : int(param1[0]);
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
         if(this.§_-J1Y§[_loc2_] != null)
         {
            this.§_-J1Y§[_loc2_]["items"] = (this.§_-J1Y§[_loc2_]["items"] as Array).concat(_loc3_);
            this.§_-J1Y§[_loc2_]["mods"].push(_loc4_);
         }
         else
         {
            this.§_-J1Y§[_loc2_] = {};
            this.§_-J1Y§[_loc2_]["items"] = _loc3_;
            this.§_-J1Y§[_loc2_]["mods"] = [_loc4_];
         }
         this.§_-J1Y§[_loc2_]["total_count"] = param1[4];
         this.§_-C3b§(param1[0]);
      }
      
      private function §_-6H§(param1:MouseEvent) : void
      {
         §_-TF§.show();
      }
      
      private function §_-u2W§(param1:MouseEvent) : void
      {
         §_-g1E§.show(this.locationId,this.§_-J1Y§[this.locationId]["items"].concat(),this.§_-x2t§);
      }
      
      private function §_-a1T§(param1:MouseEvent) : void
      {
         §_-c20§.show(this.locationId,this.§_-J1Y§[this.locationId]["items"].concat(),this.§_-x2t§);
      }
      
      private function get §_-A1t§() : Boolean
      {
         return !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && (this.locationId == §_-at§.§_-lg§ || this.locationId == §_-at§.§_-22E§);
      }
      
      private function §_-615§() : void
      {
         this.§_-T1j§.removeAll();
      }
      
      private function §_-PB§(param1:Array) : void
      {
         this.§_-T1j§.§_-533§(param1,-1);
      }
      
      private function §_-8f§() : Object
      {
         return this.§_-T1j§.§_-E2v§;
      }
      
      private function §_-r1d§() : Array
      {
         return this.§_-T1j§.§_-72S§();
      }
      
      private function §_-V13§(param1:int) : void
      {
         if(param1 < -1 || param1 >= this.§_-T1j§.length)
         {
            return;
         }
         this.§_-T1j§.setSelection(param1 >= 0 ? [param1] : [],param1);
      }
      
      private function §_-12o§(param1:Object, param2:int, param3:int) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:TextFormat = param1["marked"] ? new TextFormat(§_-i5§.§_-c10§,12,16711680,true) : §_-g1N§;
         var _loc6_:String = param1["playerName"] ? param1["playerName"] : "";
         var _loc7_:§_-i5§ = new §_-i5§(String(param1["value"]),§_-Q1d§,2,_loc5_,§_-J2B§);
         this.§_-N2o§(_loc7_);
         _loc7_.name = "number";
         _loc4_.addChild(_loc7_);
         var _loc8_:§_-i5§ = new §_-i5§(_loc6_,§_-O2p§,2,§_-I2h§,§_-W2k§);
         this.§_-N2o§(_loc8_);
         _loc8_.name = "name";
         _loc4_.addChild(_loc8_);
         var _loc9_:§_-i5§ = new §_-i5§(param1["percent"] + "%",§_-L24§,2,§_-w1c§,§_-M2D§);
         this.§_-N2o§(_loc9_);
         _loc9_.name = "percent";
         _loc4_.addChild(_loc9_);
         var _loc10_:§_-i5§ = new §_-i5§(String(param1["rating"]),§_-v1c§,2,§_-w1c§,§_-R2g§);
         this.§_-N2o§(_loc10_);
         _loc10_.name = "rating";
         _loc4_.addChild(_loc10_);
         return _loc4_;
      }
      
      private function §_-rz§(param1:Object) : void
      {
         var _loc2_:int = this.§_-T1j§.items.indexOf(param1);
         var _loc3_:Sprite = this.§_-T1j§.§_-u2a§(_loc2_);
         if(_loc2_ < 0 || _loc3_ == null)
         {
            return;
         }
         var _loc4_:§_-i5§ = _loc3_.getChildByName("name") as §_-i5§;
         _loc4_.text = param1["playerName"] ? param1["playerName"] : "";
         this.§_-N2o§(_loc4_);
         (_loc3_.getChildByName("percent") as §_-i5§).text = param1["percent"] + "%";
         (_loc3_.getChildByName("rating") as §_-i5§).text = String(param1["rating"]);
         this.§_-T1j§.§_-r6§();
      }
      
      private function §_-N2o§(param1:§_-i5§) : void
      {
         param1.multiline = false;
         param1.wordWrap = false;
      }
   }
}

