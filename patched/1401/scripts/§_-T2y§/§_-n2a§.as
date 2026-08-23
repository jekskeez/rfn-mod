package §_-T2y§
{
   import §_-68§.§_-EI§;
   import §_-CF§.§_-43v§;
   import §_-CF§.§_-P1V§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-ct§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import buttons.§_-91k§;
   import buttons.§_-LD§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-xb§;
   
   public class §_-n2a§ extends Screen
   {
      
      private static var _instance:§_-n2a§;
      
      public static const §_-d1x§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,76372,null,null,null,null,null,"center");
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}"].join("\n");
      
      private var §_-P20§:Boolean = false;
      
      private var §_-Qr§:§_-22V§;
      
      private var §_-C2z§:§_-j18§ = null;
      
      private var §_-GY§:§_-43v§;
      
      private var §_-11v§:Vector.<§_-P1V§> = null;
      
      private var §_-m1k§:int = -1;
      
      private var §_-KL§:Sprite = null;
      
      private var §_-rm§:Sprite = null;
      
      public function §_-n2a§()
      {
         super();
         _instance = this;
      }
      
      public static function get instance() : §_-n2a§
      {
         return _instance;
      }
      
      public static function §_-012§() : void
      {
         if(!_instance || !_instance.§_-P20§)
         {
            return;
         }
         _instance.§_-Qr§.text = String(§_-ct§.§_-AL§);
         _instance.§_-GY§.setData(§_-ct§.experience);
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-P20§)
         {
            this.init();
            this.§_-P20§ = true;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-11v§.length)
         {
            this.§_-11v§[_loc1_].§_-zN§();
            _loc1_++;
         }
         §_-Q2v§.§_-S2y§(§_-Q2v§.§_-a2k§);
      }
      
      private function init() : void
      {
         var field:§_-22V§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-LD§;
         var image:ShamanLevelBackground;
         var statusLevel:§_-Hb§;
         var branch:§_-P1V§;
         var i:int;
         var style:StyleSheet = new StyleSheet();
         style.parseCSS(§_-I2U§);
         this.§_-KL§ = new Sprite();
         addChild(this.§_-KL§);
         this.§_-rm§ = new Sprite();
         addChild(this.§_-rm§);
         this.§_-rm§.addChild(new ScreenShamanBackground());
         field = new §_-22V§(gls("Навыки шамана"),0,5,new TextFormat(§_-22V§.§_-pJ§,21,16763904));
         field.x = int((§_-a9§.§_-9o§ - field.textWidth) * 0.5);
         field.filters = Dialog.§_-m2A§;
         this.§_-rm§.addChild(field);
         buttonExit = new §_-91k§();
         buttonExit.x = 870;
         buttonExit.y = 10;
         buttonExit.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-43Z§.§_-o1e§);
            §_-71o§.show(§_-71o§.§_-n2M§);
         });
         this.§_-rm§.addChild(buttonExit);
         screenshotButton = new §_-LD§(true);
         screenshotButton.x = 830;
         screenshotButton.y = 10;
         this.§_-rm§.addChild(screenshotButton);
         image = new ShamanLevelBackground();
         image.x = 15;
         image.y = 18;
         this.§_-rm§.addChild(image);
         this.§_-Qr§ = new §_-22V§(String(§_-ct§.§_-AL§),46,32,§_-d1x§);
         this.§_-Qr§.width = 40;
         this.§_-Qr§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-rm§.addChild(this.§_-Qr§);
         statusLevel = new §_-Hb§(this.§_-Qr§,"");
         statusLevel.setStyle(style);
         statusLevel.maxWidth = 290;
         statusLevel.setStatus(§_-xb§.tag("body") + §_-xb§.span(gls("Уровень шамана"),"bold") + gls("<br/>Шаман получает опыт за каждую белку, которой помог добраться до дупла<br/>Уровень шамана повышается, когда он наберёт достаточное количество очков опыта") + §_-xb§.§_-p1§("body"));
         this.§_-GY§ = new §_-43v§();
         this.§_-GY§.x = 125;
         this.§_-GY§.y = 38;
         this.§_-rm§.addChild(this.§_-GY§);
         this.§_-C2z§ = new §_-j18§(gls("Удвоить опыт шамана"));
         this.§_-C2z§.x = int((§_-a9§.§_-9o§ - this.§_-C2z§.width) * 0.5);
         this.§_-C2z§.y = 62;
         this.§_-C2z§.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
         this.§_-rm§.addChild(this.§_-C2z§);
         this.§_-11v§ = new Vector.<§_-P1V§>();
         branch = null;
         i = 0;
         while(i < §_-ct§.§_-i1§.length)
         {
            branch = new §_-P1V§(i,§_-ct§.§_-i1§[i]);
            branch.x = 300 * i + 10;
            branch.y = 99;
            branch.name = i.toString();
            this.§_-rm§.addChild(branch);
            branch.addEventListener(MouseEvent.CLICK,this.§_-Kl§);
            branch.setData(§_-ct§.skills);
            this.§_-11v§.push(branch);
            i++;
         }
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-v2D§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-v2D§);
         §_-ct§.§_-gg§ = this.§_-m1r§;
         this.§_-m1r§();
         this.§_-v2D§();
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-KL§.graphics.clear();
         this.§_-KL§.graphics.beginFill(16183517);
         this.§_-KL§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-KL§.graphics.endFill();
         this.§_-rm§.x = (_loc2_ - §_-a9§.§_-9o§) * 0.5;
         this.§_-rm§.y = (_loc3_ - §_-a9§.§_-31m§) * 0.5;
      }
      
      private function §_-v2D§(param1:GameEvent = null) : void
      {
         this.§_-C2z§.visible = !§_-Br§.§_-f2k§;
      }
      
      private function §_-r1S§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-EI§.load(function():void
         {
            §_-m1L§.§_-Y1T§(§_-m1L§.VIP);
         });
      }
      
      private function §_-Kl§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget.name);
         if(§_-ct§.§_-m1k§ == §_-ct§.§_-F2j§ || _loc2_ == §_-ct§.§_-m1k§)
         {
            return;
         }
         if(!§_-ct§.§_-Z1E§(_loc2_))
         {
            §_-ct§.§_-qy§(_loc2_);
            return;
         }
         §_-ct§.§_-f10§(_loc2_);
      }
      
      private function §_-m1r§() : void
      {
         if(§_-ct§.§_-m1k§ != §_-ct§.§_-F2j§)
         {
            this.§_-11v§[§_-ct§.§_-m1k§].setData(§_-ct§.skills);
         }
         if(§_-ct§.§_-m1k§ == this.§_-m1k§)
         {
            if(§_-ct§.§_-m1k§ != §_-ct§.§_-F2j§)
            {
               this.§_-11v§[this.§_-m1k§].§_-43I§(false);
            }
            §_-ct§.§_-l2G§();
            return;
         }
         this.§_-m1k§ = §_-ct§.§_-m1k§;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-11v§.length)
         {
            this.§_-11v§[_loc1_].§_-F2K§(§_-ct§.§_-Z1E§(_loc1_));
            if(§_-ct§.§_-m1k§ == §_-ct§.§_-F2j§)
            {
               this.§_-11v§[_loc1_].§_-en§();
            }
            else
            {
               this.§_-11v§[_loc1_].§_-43I§(_loc1_ != this.§_-m1k§);
            }
            _loc1_++;
         }
         §_-ct§.§_-l2G§();
      }
   }
}

