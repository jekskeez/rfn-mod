package §_-e2w§
{
   import §_-Rj§.§_-C2q§;
   import §_-Rj§.§_-K15§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Timer;
   import utils.§_-c10§;
   import utils.§_-x1Z§;
   
   public class §_-I2t§ extends Sprite
   {
      
      private static var _instance:§_-I2t§;
      
      public var §_-wh§:§_-22V§;
      
      public var §_-uu§:§_-22V§;
      
      public var §_-U1B§:§_-j18§ = null;
      
      public var §_-g8§:ButtonNextMap = null;
      
      public var §_-y1t§:ButtonPrevMap = null;
      
      public var §_-M2P§:ButtonDeleteMap = null;
      
      public var §_-gj§:ButtonEditorLoad = null;
      
      public var §_-n2C§:ButtonEditorSave = null;
      
      public var §_-2W§:ButtonEditorSave = null;
      
      public var §_-43q§:ButtonEditorSend = null;
      
      public var §_-O2R§:ButtonTestMap = null;
      
      public var §_-V1u§:ButtonEditorEdit = null;
      
      public var §_-X1w§:ButtonRedo = null;
      
      public var §_-za§:ButtonUndo = null;
      
      public var §_-qN§:ButtonHand = null;
      
      public var §_-R1t§:ButtonRulers = null;
      
      public var §_-oz§:ButtonEditorScaleDown = null;
      
      public var §_-n2J§:ButtonEditorScaleUp = null;
      
      public var §_-k2w§:ButtonCameraOn = null;
      
      public var §_-w1f§:ButtonRulers = null;
      
      public var §_-G1N§:ButtonMapTestSettings = null;
      
      public var §_-j2w§:ButtonMapInfo = null;
      
      public var §_-a17§:ButtonObjectsInspector = null;
      
      public var connectionClosed:Boolean = false;
      
      public var §_-G22§:Boolean = false;
      
      private var seconds:int;
      
      private var minutes:int;
      
      private var §_-60§:Sprite;
      
      private var §_-K1l§:§_-22V§;
      
      private var §_-5O§:Boolean = false;
      
      private var §_-C3Q§:Boolean = false;
      
      private var §_-o2Q§:Boolean = false;
      
      private var §_-t8§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,10,16777215);
      
      private var §_-31Y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,16763955,true);
      
      private var §_-31t§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,16777215,true);
      
      private var timer:Timer = new Timer(1000);
      
      private var state:DisplayObject = null;
      
      private var §_-yJ§:§_-Hb§;
      
      private var §_-Vz§:int = 0;
      
      private var §_-A2T§:Boolean = false;
      
      private var §_-93f§:§_-K15§ = null;
      
      private var §_-D2V§:Boolean = false;
      
      public function §_-I2t§()
      {
         _instance = this;
         super();
         this.visible = false;
         addChild(new ImageHeaderEditor());
         this.§_-U1B§ = new §_-j18§(gls("Выход"));
         this.§_-U1B§.scaleX = this.§_-U1B§.scaleY = 0.65;
         this.§_-U1B§.x = 839;
         this.§_-U1B§.y = 4;
         addChild(this.§_-U1B§);
         this.§_-k2w§ = new ButtonCameraOn();
         this.§_-k2w§.x = 723;
         this.§_-k2w§.y = 1;
         new §_-Hb§(this.§_-k2w§,gls("Список записей"));
         this.§_-g8§ = new ButtonNextMap();
         this.§_-g8§.x = 570;
         this.§_-g8§.y = 1;
         addChild(this.§_-g8§);
         new §_-Hb§(this.§_-g8§,gls("Следующая карта"));
         this.§_-g8§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§);
         this.§_-y1t§ = new ButtonPrevMap();
         this.§_-y1t§.x = 544;
         this.§_-y1t§.y = 1;
         addChild(this.§_-y1t§);
         new §_-Hb§(this.§_-y1t§,gls("Предыдущая карта"));
         this.§_-y1t§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§);
         this.§_-M2P§ = new ButtonDeleteMap();
         this.§_-M2P§.x = 504;
         this.§_-M2P§.y = 1;
         addChild(this.§_-M2P§);
         new §_-Hb§(this.§_-M2P§,gls("Удалить"));
         this.§_-gj§ = new ButtonEditorLoad();
         this.§_-gj§.x = 476;
         this.§_-gj§.y = 1;
         addChild(this.§_-gj§);
         new §_-Hb§(this.§_-gj§,gls("Загрузить сохраненную карту"));
         this.§_-2W§ = new ButtonEditorSave();
         this.§_-2W§.x = 476;
         this.§_-2W§.y = 1;
         addChild(this.§_-2W§);
         new §_-Hb§(this.§_-2W§,gls("Одобрить"));
         this.§_-n2C§ = new ButtonEditorSave();
         this.§_-n2C§.x = 449;
         this.§_-n2C§.y = 1;
         addChild(this.§_-n2C§);
         new §_-Hb§(this.§_-n2C§,gls("Сохранить как черновик"));
         this.§_-43q§ = new ButtonEditorSend();
         this.§_-43q§.x = 422;
         this.§_-43q§.y = 1;
         addChild(this.§_-43q§);
         new §_-Hb§(this.§_-43q§,§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§) ? gls("Сохранить") : gls("Отправить на проверку"));
         this.§_-O2R§ = new ButtonTestMap();
         this.§_-O2R§.x = 394;
         this.§_-O2R§.y = 1;
         addChild(this.§_-O2R§);
         new §_-Hb§(this.§_-O2R§,gls("Тестировать"));
         this.§_-V1u§ = new ButtonEditorEdit();
         this.§_-V1u§.x = 394;
         this.§_-V1u§.y = 1;
         this.§_-V1u§.visible = false;
         addChild(this.§_-V1u§);
         new §_-Hb§(this.§_-V1u§,gls("Редактировать"));
         this.§_-X1w§ = new ButtonRedo();
         this.§_-X1w§.x = 253;
         this.§_-X1w§.y = 1;
         addChild(this.§_-X1w§);
         new §_-Hb§(this.§_-X1w§,gls("Шаг вперед"));
         this.§_-za§ = new ButtonUndo();
         this.§_-za§.x = 227;
         this.§_-za§.y = 1;
         addChild(this.§_-za§);
         new §_-Hb§(this.§_-za§,gls("Шаг назад"));
         this.§_-R1t§ = new ButtonRulers();
         this.§_-R1t§.x = 178;
         this.§_-R1t§.y = 1;
         addChild(this.§_-R1t§);
         new §_-Hb§(this.§_-R1t§,gls("Линейки"));
         this.§_-n2J§ = new ButtonEditorScaleUp();
         this.§_-n2J§.x = 149;
         this.§_-n2J§.y = 1;
         addChild(this.§_-n2J§);
         new §_-Hb§(this.§_-n2J§,gls("Увеличить масштаб"));
         this.§_-oz§ = new ButtonEditorScaleDown();
         this.§_-oz§.x = 123;
         this.§_-oz§.y = 1;
         addChild(this.§_-oz§);
         new §_-Hb§(this.§_-oz§,gls("Уменьшить масштаб"));
         this.§_-qN§ = new ButtonHand();
         this.§_-qN§.x = 94;
         this.§_-qN§.y = 1;
         this.§_-qN§.addEventListener(MouseEvent.CLICK,this.§_-h2W§);
         addChild(this.§_-qN§);
         this.§_-yJ§ = new §_-Hb§(this.§_-qN§,gls("Включить\\выключить"));
         this.§_-a17§ = new ButtonObjectsInspector();
         this.§_-a17§.x = 63;
         this.§_-a17§.y = 1;
         addChild(this.§_-a17§);
         this.§_-a17§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§);
         new §_-Hb§(this.§_-a17§,gls("Инспектор объектов"));
         this.§_-G1N§ = new ButtonMapTestSettings();
         this.§_-G1N§.x = 34;
         this.§_-G1N§.y = 1;
         addChild(this.§_-G1N§);
         new §_-Hb§(this.§_-G1N§,gls("Настройки тестирования"));
         this.§_-j2w§ = new ButtonMapInfo();
         this.§_-j2w§.x = 5;
         this.§_-j2w§.y = 1;
         addChild(this.§_-j2w§);
         new §_-Hb§(this.§_-j2w§,gls("Инфо о карте"));
         this.§_-60§ = new ImageClock();
         this.§_-60§.x = 308;
         this.§_-60§.y = 6;
         addChild(this.§_-60§);
         this.§_-60§.visible = false;
         this.§_-K1l§ = new §_-22V§("",323,5,this.§_-31t§);
         addChild(this.§_-K1l§);
         this.§_-wh§ = new §_-22V§("№:",303,8,this.§_-t8§);
         this.§_-uu§ = new §_-22V§("",318,5,this.§_-31Y§);
         this.§_-uu§.addEventListener(MouseEvent.CLICK,Game.§_-S1F§);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            addChild(this.§_-wh§);
            addChild(this.§_-uu§);
         }
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-q8§,false,0,true);
      }
      
      public static function get instance() : §_-I2t§
      {
         return _instance;
      }
      
      public static function show() : void
      {
         §_-V1Q§();
         _instance.visible = true;
         _instance.§_-83p§();
      }
      
      public static function hide() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.visible = false;
         _instance.§_-83p§();
      }
      
      public static function §_-V1Q§() : void
      {
         if(!_instance || !Game.starling || !Game.starling.stage)
         {
            return;
         }
         _instance.x = (Game.starling.stage.stageWidth - _instance.width) * 0.5;
         _instance.y = 0;
      }
      
      public function block() : void
      {
         if(this.§_-D2V§)
         {
            return;
         }
         this.§_-D2V§ = true;
         this.filters = §_-x1Z§.§_-c2G§;
         this.mouseChildren = this.mouseEnabled = false;
      }
      
      public function §_-83p§() : void
      {
         if(!this.§_-D2V§)
         {
            return;
         }
         this.§_-D2V§ = false;
         this.filters = [];
         this.mouseChildren = this.mouseEnabled = true;
      }
      
      public function set §_-ap§(param1:§_-K15§) : void
      {
         this.§_-93f§ = param1;
      }
      
      public function get §_-Fa§() : Boolean
      {
         return this.§_-A2T§;
      }
      
      public function §_-731§(param1:MouseEvent = null) : void
      {
         this.§_-32j§();
         this.§_-V1u§.visible = true;
         this.§_-O2R§.visible = false;
         this.§_-5O§ = this.§_-za§.enabled;
         this.§_-C3Q§ = this.§_-X1w§.enabled;
         this.§_-Y2D§();
         this.§_-wh§.visible = false;
         this.§_-uu§.visible = false;
      }
      
      public function §_-42v§(param1:int, param2:int) : void
      {
         this.minutes = param1;
         this.seconds = param2;
         this.timer.start();
      }
      
      public function §_-r1u§() : void
      {
         this.timer.stop();
      }
      
      public function §_-Y2D§() : void
      {
         this.§_-o1O§([this.§_-g8§,this.§_-y1t§,this.§_-M2P§,this.§_-gj§,this.§_-n2C§,this.§_-43q§,this.§_-X1w§,this.§_-za§,this.§_-qN§,this.§_-oz§,this.§_-n2J§,this.§_-R1t§,this.§_-G1N§,this.§_-j2w§,this.§_-a17§,this.§_-2W§],false);
      }
      
      public function §_-w1C§(param1:Boolean = false) : void
      {
         this.§_-A2T§ = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§);
         this.§_-A2T§ = !param1 && this.§_-A2T§ && this.§_-Vz§ == §_-q1p§.§_-l2I§;
         this.§_-n2C§.visible = !this.§_-A2T§;
         this.§_-43q§.visible = !this.§_-A2T§;
         this.§_-gj§.visible = !this.§_-A2T§;
         this.§_-2W§.visible = this.§_-A2T§;
         if(this.§_-A2T§)
         {
            this.§_-O2R§.x = 449;
            this.§_-V1u§.x = 449;
         }
         else
         {
            this.§_-O2R§.x = 394;
            this.§_-V1u§.x = 394;
         }
      }
      
      public function §_-m1m§() : void
      {
         this.§_-o1O§([this.§_-g8§,this.§_-y1t§,this.§_-gj§,this.§_-n2C§,this.§_-43q§,this.§_-2W§,this.§_-qN§,this.§_-oz§,this.§_-n2J§,this.§_-R1t§,this.§_-G1N§,this.§_-j2w§,this.§_-a17§],true);
         var _loc1_:Boolean = !this.§_-G22§ || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§) || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-33l§) && (this.§_-Vz§ == §_-q1p§.§_-l2I§ || this.§_-Vz§ == §_-q1p§.§_-u2f§);
         this.setEnabled(this.§_-M2P§,_loc1_);
         if(this.§_-C3Q§)
         {
            this.setEnabled(this.§_-X1w§,true);
         }
         if(this.§_-5O§)
         {
            this.setEnabled(this.§_-za§,true);
         }
         if(this.connectionClosed)
         {
            this.§_-Ga§();
         }
      }
      
      public function §_-V2z§(param1:MouseEvent = null) : void
      {
         this.§_-32j§();
         this.§_-V1u§.visible = false;
         this.§_-O2R§.visible = true;
         this.§_-m1m§();
         this.§_-w1C§();
         this.§_-60§.visible = false;
         this.§_-K1l§.text = "";
         this.§_-wh§.visible = true;
         this.§_-uu§.visible = true;
         this.timer.stop();
         if(this.connectionClosed)
         {
            this.§_-Ga§();
         }
      }
      
      public function §_-m1Q§() : void
      {
         this.§_-M2P§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§);
         this.visible = true;
         this.§_-w1C§(true);
      }
      
      public function §_-h2W§(param1:MouseEvent = null) : void
      {
         if(!this.§_-93f§)
         {
            return;
         }
         if(!this.§_-93f§.§_-K1n§.§_-U1k§)
         {
            this.§_-93f§.§_-K1n§.§_-U1k§ = true;
            Mouse.cursor = MouseCursor.HAND;
            this.state = this.§_-qN§.upState;
            this.§_-qN§.upState = this.§_-qN§.downState;
         }
         else
         {
            this.§_-32j§();
         }
      }
      
      public function §_-32j§() : void
      {
         if(!this.§_-93f§ || !this.§_-93f§.§_-K1n§.§_-U1k§)
         {
            return;
         }
         this.§_-93f§.§_-K1n§.§_-U1k§ = false;
         Mouse.cursor = MouseCursor.AUTO;
         if(this.state)
         {
            this.§_-qN§.upState = this.state;
         }
      }
      
      public function §_-Ao§(param1:int) : void
      {
         this.§_-Vz§ = param1;
         this.§_-m1m§();
         this.§_-w1C§();
         this.visible = true;
      }
      
      public function §_-Ga§() : void
      {
         this.§_-o1O§([this.§_-43q§,this.§_-2W§,this.§_-g8§,this.§_-y1t§,this.§_-M2P§,this.§_-U1B§],false);
      }
      
      public function §_-d1h§(param1:Number) : void
      {
         this.setEnabled(this.§_-n2J§,param1 + §_-C2q§.§_-Ym§ <= §_-C2q§.§_-c1K§);
         this.setEnabled(this.§_-oz§,param1 - §_-C2q§.§_-Ym§ >= §_-C2q§.§_-H13§);
      }
      
      public function §_-XO§(param1:Boolean, param2:Boolean) : void
      {
         this.setEnabled(this.§_-za§,param1);
         this.setEnabled(this.§_-X1w§,param2);
      }
      
      private function §_-q8§(param1:TimerEvent) : void
      {
         var _loc2_:String = "";
         this.§_-60§.visible = true;
         if(this.seconds == 0)
         {
            --this.minutes;
            this.seconds = 60;
         }
         --this.seconds;
         if(this.seconds < 10)
         {
            _loc2_ = "0";
         }
         this.§_-K1l§.text = " " + this.minutes + ":" + _loc2_ + this.seconds;
         if(this.minutes == 0 && this.seconds == 0)
         {
            this.timer.stop();
         }
      }
      
      private function §_-o1O§(param1:Array, param2:Boolean) : void
      {
         var _loc3_:SimpleButton = null;
         for each(_loc3_ in param1)
         {
            this.setEnabled(_loc3_,param2);
         }
      }
      
      private function setEnabled(param1:SimpleButton, param2:Boolean) : void
      {
         param1.enabled = param2;
         param1.mouseEnabled = param2;
         param1.filters = param2 ? [] : §_-x1Z§.§_-c2G§;
      }
   }
}

