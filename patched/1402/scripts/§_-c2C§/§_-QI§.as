package §_-c2C§
{
   import §_-J19§.§_-534§;
   import §_-S1n§.§_-kr§;
   import §_-S1w§.§_-81x§;
   import §_-S1w§.§_-F2P§;
   import §_-X1k§.§_-4v§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-F1Z§;
   import §_-bN§.Dialog;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-917§;
   import buttons.§_-K2G§;
   import buttons.§_-Z2B§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-r1G§;
   
   public class §_-QI§ extends Screen
   {
      
      private static var _instance:§_-QI§;
      
      public static const §_-D1j§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,76372,null,null,null,null,null,"center");
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}"].join("\n");
      
      private var §_-u21§:Boolean = false;
      
      private var §_-D2w§:§_-i5§;
      
      private var §_-LX§:§_-K2G§ = null;
      
      private var §_-P2o§:§_-F2P§;
      
      private var §_-BM§:Vector.<§_-81x§> = null;
      
      private var §_-71M§:int = -1;
      
      private var §_-t2p§:Sprite = null;
      
      private var §_-03N§:Sprite = null;
      
      public function §_-QI§()
      {
         super();
         _instance = this;
      }
      
      public static function get instance() : §_-QI§
      {
         return _instance;
      }
      
      public static function §_-B14§() : void
      {
         if(!_instance || !_instance.§_-u21§)
         {
            return;
         }
         _instance.§_-D2w§.text = String(§_-4v§.§_-H2W§);
         _instance.§_-P2o§.setData(§_-4v§.experience);
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-u21§)
         {
            this.init();
            this.§_-u21§ = true;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-BM§.length)
         {
            this.§_-BM§[_loc1_].§_-33r§();
            _loc1_++;
         }
         §_-Ac§.§_-91§(§_-Ac§.§_-R2n§);
      }
      
      private function init() : void
      {
         var field:§_-i5§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-Z2B§;
         var image:ShamanLevelBackground;
         var statusLevel:§_-kr§;
         var branch:§_-81x§;
         var i:int;
         var style:StyleSheet = new StyleSheet();
         style.parseCSS(§_-aD§);
         this.§_-t2p§ = new Sprite();
         addChild(this.§_-t2p§);
         this.§_-03N§ = new Sprite();
         addChild(this.§_-03N§);
         this.§_-03N§.addChild(new ScreenShamanBackground());
         field = new §_-i5§(gls("Навыки шамана"),0,5,new TextFormat(§_-i5§.§_-p1s§,21,16763904));
         field.x = int((§_-Zy§.§_-21V§ - field.textWidth) * 0.5);
         field.filters = Dialog.§_-q2I§;
         this.§_-03N§.addChild(field);
         buttonExit = new §_-917§();
         buttonExit.x = 870;
         buttonExit.y = 10;
         buttonExit.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-RH§.§_-K10§);
            §_-t2c§.show(§_-t2c§.§_-di§);
         });
         this.§_-03N§.addChild(buttonExit);
         screenshotButton = new §_-Z2B§(true);
         screenshotButton.x = 830;
         screenshotButton.y = 10;
         this.§_-03N§.addChild(screenshotButton);
         image = new ShamanLevelBackground();
         image.x = 15;
         image.y = 18;
         this.§_-03N§.addChild(image);
         this.§_-D2w§ = new §_-i5§(String(§_-4v§.§_-H2W§),46,32,§_-D1j§);
         this.§_-D2w§.width = 40;
         this.§_-D2w§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-03N§.addChild(this.§_-D2w§);
         statusLevel = new §_-kr§(this.§_-D2w§,"");
         statusLevel.setStyle(style);
         statusLevel.maxWidth = 290;
         statusLevel.setStatus(§_-r1G§.tag("body") + §_-r1G§.span(gls("Уровень шамана"),"bold") + gls("<br/>Шаман получает опыт за каждую белку, которой помог добраться до дупла<br/>Уровень шамана повышается, когда он наберёт достаточное количество очков опыта") + §_-r1G§.§_-43A§("body"));
         this.§_-P2o§ = new §_-F2P§();
         this.§_-P2o§.x = 125;
         this.§_-P2o§.y = 38;
         this.§_-03N§.addChild(this.§_-P2o§);
         this.§_-LX§ = new §_-K2G§(gls("Удвоить опыт шамана"));
         this.§_-LX§.x = int((§_-Zy§.§_-21V§ - this.§_-LX§.width) * 0.5);
         this.§_-LX§.y = 62;
         this.§_-LX§.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
         this.§_-03N§.addChild(this.§_-LX§);
         this.§_-BM§ = new Vector.<§_-81x§>();
         branch = null;
         i = 0;
         while(i < §_-4v§.§_-XV§.length)
         {
            branch = new §_-81x§(i,§_-4v§.§_-XV§[i]);
            branch.x = 300 * i + 10;
            branch.y = 99;
            branch.name = i.toString();
            this.§_-03N§.addChild(branch);
            branch.addEventListener(MouseEvent.CLICK,this.§_-TI§);
            branch.setData(§_-4v§.skills);
            this.§_-BM§.push(branch);
            i++;
         }
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-P2v§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-P2v§);
         §_-4v§.§_-82T§ = this.§_-p1w§;
         this.§_-p1w§();
         this.§_-P2v§();
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-t2p§.graphics.clear();
         this.§_-t2p§.graphics.beginFill(16183517);
         this.§_-t2p§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-t2p§.graphics.endFill();
         this.§_-03N§.x = (_loc2_ - §_-Zy§.§_-21V§) * 0.5;
         this.§_-03N§.y = (_loc3_ - §_-Zy§.§_-02T§) * 0.5;
      }
      
      private function §_-P2v§(param1:GameEvent = null) : void
      {
         this.§_-LX§.visible = !§_-F1Z§.§_-O1u§;
      }
      
      private function §_-G2T§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-U2d§.load(function():void
         {
            §_-534§.§_-R2X§(§_-534§.VIP);
         });
      }
      
      private function §_-TI§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget.name);
         if(§_-4v§.§_-71M§ == §_-4v§.§_-631§ || _loc2_ == §_-4v§.§_-71M§)
         {
            return;
         }
         if(!§_-4v§.§_-p21§(_loc2_))
         {
            §_-4v§.§_-Oe§(_loc2_);
            return;
         }
         §_-4v§.§_-51Z§(_loc2_);
      }
      
      private function §_-p1w§() : void
      {
         if(§_-4v§.§_-71M§ != §_-4v§.§_-631§)
         {
            this.§_-BM§[§_-4v§.§_-71M§].setData(§_-4v§.skills);
         }
         if(§_-4v§.§_-71M§ == this.§_-71M§)
         {
            if(§_-4v§.§_-71M§ != §_-4v§.§_-631§)
            {
               this.§_-BM§[this.§_-71M§].§_-4S§(false);
            }
            §_-4v§.§_-MH§();
            return;
         }
         this.§_-71M§ = §_-4v§.§_-71M§;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-BM§.length)
         {
            this.§_-BM§[_loc1_].§_-o7§(§_-4v§.§_-p21§(_loc1_));
            if(§_-4v§.§_-71M§ == §_-4v§.§_-631§)
            {
               this.§_-BM§[_loc1_].§_-z1X§();
            }
            else
            {
               this.§_-BM§[_loc1_].§_-4S§(_loc1_ != this.§_-71M§);
            }
            _loc1_++;
         }
         §_-4v§.§_-MH§();
      }
   }
}

