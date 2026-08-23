package views
{
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-Bm§;
   import §_-T2y§.§_-71o§;
   import §_-Y22§.§_-E1J§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import §_-t1F§.§_-72E§;
   import buttons.§_-i1E§;
   import buttons.§_-p1R§;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import protocol.§_-T2o§;
   import sounds.GameMusic;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-5b§ extends Sprite
   {
      
      private static const §_-t20§:int = 40;
      
      private static const §_-t2J§:int = 25;
      
      private static const §_-A0§:int = 4;
      
      private static var _instance:§_-5b§;
      
      public static var highlight:int = 2;
      
      private var background:SettingsBackground;
      
      private var §_-R1C§:SimpleButton;
      
      private var §_-O2e§:SimpleButton;
      
      private var §_-6E§:SimpleButton;
      
      private var §_-T2b§:§_-p1R§;
      
      private var §_-q1j§:§_-p1R§;
      
      private var §_-23M§:§_-p1R§;
      
      private var §_-g4§:§_-p1R§;
      
      private var §_-i1D§:§_-i1E§;
      
      private var §_-J1g§:§_-p1R§;
      
      private var §_-C1n§:§_-p1R§;
      
      private var §_-I2s§:Dialog;
      
      private var §_-j2p§:Boolean = false;
      
      private var §_-ue§:int = 0;
      
      private var §_-b4§:Object = {};
      
      private var buttonsArray:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function §_-5b§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.§_-b4§ = §_-82N§.load(§_-82N§.§_-43h§);
         §_-82N§.addCallback(§_-82N§.§_-43h§,this.onLoad);
         §_-Bm§.onLoad(this.§_-p2S§);
         this.init();
         this.extendsElements(false);
      }
      
      public static function §_-31p§() : void
      {
         _instance.§_-31p§();
      }
      
      public static function §_-RC§() : void
      {
         var clanInvitesOn:ButtonClansOn;
         var clanInvitesOff:ButtonClansOff;
         var i:int;
         if(!_instance)
         {
            return;
         }
         if(_instance.§_-j2p§)
         {
            return;
         }
         _instance.§_-j2p§ = true;
         clanInvitesOn = new ButtonClansOn();
         clanInvitesOn.addEventListener(MouseEvent.MOUSE_DOWN,_instance.§_-23n§);
         clanInvitesOn.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            Game.§_-L2T§ = false;
            §_-Bm§.set(§_-T2o§.§_-K1N§);
         });
         new §_-Hb§(clanInvitesOn,gls("Не получать приглашения в клан"));
         clanInvitesOff = new ButtonClansOff();
         clanInvitesOff.addEventListener(MouseEvent.MOUSE_DOWN,_instance.§_-23n§);
         clanInvitesOff.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            Game.§_-L2T§ = true;
            §_-Bm§.§_-fy§(§_-T2o§.§_-K1N§);
         });
         new §_-Hb§(clanInvitesOff,gls("Получать приглашения в клан"));
         _instance.§_-C1n§ = new §_-p1R§(clanInvitesOn,clanInvitesOff,!Game.§_-L2T§);
         _instance.§_-C1n§.x = 6;
         _instance.§_-C1n§.y = §_-t20§ + _instance.§_-ue§ * §_-t2J§;
         _instance.addChild(_instance.§_-C1n§);
         i = _instance.§_-ue§;
         while(i < _instance.buttonsArray.length)
         {
            _instance.buttonsArray[i].y += §_-t2J§;
            i++;
         }
         _instance.buttonsArray.splice(_instance.§_-ue§,0,_instance.§_-C1n§);
         _instance.background.height = _instance.buttonsArray.length * §_-t2J§;
         _instance.§_-C1n§.visible = _instance.background.visible;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         var _loc2_:int = this.§_-R1C§.width * (1 - param1) * 0.5;
         this.§_-R1C§.scaleX = this.§_-O2e§.scaleX = param1;
         this.§_-R1C§.x = _loc2_;
         this.§_-O2e§.x = _loc2_;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         this.§_-R1C§.scaleY = this.§_-O2e§.scaleY = param1;
      }
      
      private function init() : void
      {
         var buttonMusicOn:ButtonMusicOn;
         var buttonMusicOff:ButtonMusicOff;
         var buttonSoundOff:ButtonSoundOff;
         var buttonSoundOn:ButtonSoundOn;
         var buttonCameraOff:ButtonCameraOff;
         var buttonCameraOn:ButtonCameraOn;
         var buttonHighQuality:ButtonLQ;
         var buttonLowQuality:ButtonHQ;
         var buttonHighlightPaleOn:ButtonBacklightOn;
         var buttonHighlightStrongOn:ButtonBacklightOn;
         var buttonHighlightOff:ButtonBacklightOff;
         var buttonShamanOn:ButtonShamanOn;
         var buttonShamanOff:ButtonShamanOff;
         var enableHighQuality:Boolean = false;
         this.§_-I2s§ = new §_-Q13§(gls("Качество изображения"),gls("Для смены качества изображения\nвыйди на экран планет"));
         this.background = new SettingsBackground();
         this.background.y = §_-t20§;
         addChild(this.background);
         this.§_-R1C§ = new ButtonSettingsOpen();
         this.§_-R1C§.x = §_-A0§;
         this.§_-R1C§.addEventListener(MouseEvent.CLICK,this.§_-412§);
         this.§_-R1C§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         addChild(this.§_-R1C§);
         new §_-Hb§(this.§_-R1C§,gls("Настройки"));
         this.§_-O2e§ = new ButtonSettingsClose();
         this.§_-O2e§.x = §_-A0§;
         this.§_-O2e§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.§_-O2e§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            extendsElements(false);
         });
         addChild(this.§_-O2e§);
         buttonMusicOn = new ButtonMusicOn();
         buttonMusicOn.addEventListener(MouseEvent.CLICK,this.§_-53e§);
         buttonMusicOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonMusicOn,gls("Выключить музыку"));
         buttonMusicOff = new ButtonMusicOff();
         buttonMusicOff.addEventListener(MouseEvent.CLICK,this.§_-y2g§);
         buttonMusicOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonMusicOff,gls("Включить музыку"));
         this.§_-T2b§ = new §_-p1R§(buttonMusicOff,buttonMusicOn,GameMusic.on);
         addChild(this.§_-T2b§);
         this.buttonsArray.push(this.§_-T2b§);
         buttonSoundOff = new ButtonSoundOff();
         buttonSoundOff.addEventListener(MouseEvent.CLICK,this.§_-e2z§);
         buttonSoundOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonSoundOff,gls("Включить звук"));
         buttonSoundOn = new ButtonSoundOn();
         buttonSoundOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         buttonSoundOn.addEventListener(MouseEvent.CLICK,this.§_-P1p§);
         new §_-Hb§(buttonSoundOn,gls("Выключить звук"));
         this.§_-q1j§ = new §_-p1R§(buttonSoundOff,buttonSoundOn,GameSounds.on);
         addChild(this.§_-q1j§);
         this.buttonsArray.push(this.§_-q1j§);
         buttonCameraOff = new ButtonCameraOff();
         buttonCameraOff.addEventListener(MouseEvent.CLICK,this.§_-dN§);
         buttonCameraOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonCameraOff,gls("Включить слежение за белкой"));
         buttonCameraOn = new ButtonCameraOn();
         buttonCameraOn.addEventListener(MouseEvent.CLICK,this.§_-73b§);
         buttonCameraOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonCameraOn,gls("Выключить слежение за белкой"));
         this.§_-23M§ = new §_-p1R§(buttonCameraOff,buttonCameraOn,!§_-Bm§.§_-2S§(§_-T2o§.§_-w2N§));
         addChild(this.§_-23M§);
         this.buttonsArray.push(this.§_-23M§);
         buttonHighQuality = new ButtonLQ();
         buttonHighQuality.addEventListener(MouseEvent.CLICK,this.§_-wi§);
         buttonHighQuality.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonHighQuality,gls("Низкое качество"));
         buttonLowQuality = new ButtonHQ();
         buttonLowQuality.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         buttonLowQuality.addEventListener(MouseEvent.CLICK,this.§_-N1E§);
         new §_-Hb§(buttonLowQuality,gls("Высокое качество"));
         if("quality" in this.§_-b4§)
         {
            Game.stage.quality = this.§_-b4§["quality"];
            enableHighQuality = this.§_-b4§["quality"] != "LOW";
         }
         this.§_-g4§ = new §_-p1R§(buttonHighQuality,buttonLowQuality,enableHighQuality);
         addChild(this.§_-g4§);
         this.buttonsArray.push(this.§_-g4§);
         buttonHighlightPaleOn = new ButtonBacklightOn();
         buttonHighlightPaleOn.addEventListener(MouseEvent.CLICK,this.§_-Q1z§);
         buttonHighlightPaleOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonHighlightPaleOn,gls("Включить слабую подсветку своей белки"));
         buttonHighlightStrongOn = new ButtonBacklightOn();
         buttonHighlightStrongOn.addEventListener(MouseEvent.CLICK,this.§_-mC§);
         buttonHighlightStrongOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§(buttonHighlightStrongOn,gls("Включить сильную подсветку своей белки"));
         buttonHighlightOff = new ButtonBacklightOff();
         buttonHighlightOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         buttonHighlightOff.addEventListener(MouseEvent.CLICK,this.§_-B13§);
         new §_-Hb§(buttonHighlightOff,gls("Выключить подсветку своей белки"));
         if("highlight" in this.§_-b4§)
         {
            highlight = int(this.§_-b4§["highlight"]);
         }
         else
         {
            highlight = 0;
         }
         this.§_-i1D§ = new §_-i1E§([buttonHighlightOff,buttonHighlightPaleOn,buttonHighlightStrongOn],highlight);
         addChild(this.§_-i1D§);
         this.buttonsArray.push(this.§_-i1D§);
         buttonShamanOn = new ButtonShamanOn();
         buttonShamanOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         buttonShamanOn.addEventListener(MouseEvent.CLICK,this.§_-R2j§);
         new §_-Hb§(buttonShamanOn,gls("Не хочу быть шаманом"));
         buttonShamanOff = new ButtonShamanOff();
         buttonShamanOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         buttonShamanOff.addEventListener(MouseEvent.CLICK,this.§_-73f§);
         new §_-Hb§(buttonShamanOff,gls("Хочу быть шаманом"));
         this.§_-J1g§ = new §_-p1R§(buttonShamanOn,buttonShamanOff,Game.§_-v4§);
         addChild(this.§_-J1g§);
         this.buttonsArray.push(this.§_-J1g§);
         this.§_-ue§ = this.buttonsArray.length;
         this.§_-6E§ = new ButtonPromocode();
         this.§_-6E§.addEventListener(MouseEvent.CLICK,this.§_-G23§);
         this.§_-6E§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         addChild(this.§_-6E§);
         new §_-Hb§(this.§_-6E§,gls("Ввести промокод"));
         this.buttonsArray.push(this.§_-6E§);
         this.update();
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
      }
      
      private function update() : void
      {
         var _loc1_:int = 2 + 5;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            this.buttonsArray[_loc2_].x = §_-A0§;
            this.buttonsArray[_loc2_].y = §_-t20§ + _loc1_;
            _loc1_ += this.buttonsArray[_loc2_].visible ? Math.max(this.buttonsArray[_loc2_].height,§_-t2J§) : 0;
            _loc2_++;
         }
         this.background.height = _loc1_ - 5;
      }
      
      private function §_-G23§(param1:MouseEvent) : void
      {
         §_-72E§.show();
      }
      
      private function §_-73f§(param1:MouseEvent) : void
      {
         Game.§_-v4§ = false;
         §_-Bm§.§_-fy§(§_-T2o§.§_-T1J§);
      }
      
      private function §_-R2j§(param1:MouseEvent) : void
      {
         Game.§_-v4§ = true;
         §_-Bm§.set(§_-T2o§.§_-T1J§);
      }
      
      private function §_-mC§(param1:MouseEvent) : void
      {
         highlight = 2;
         this.§_-b4§["highlight"] = highlight;
         §_-82N§.save(§_-82N§.§_-43h§,this.§_-b4§);
      }
      
      private function §_-Q1z§(param1:MouseEvent) : void
      {
         highlight = 1;
         this.§_-b4§["highlight"] = highlight;
         §_-82N§.save(§_-82N§.§_-43h§,this.§_-b4§);
      }
      
      private function §_-B13§(param1:MouseEvent) : void
      {
         highlight = 0;
         this.§_-b4§["highlight"] = highlight;
         §_-82N§.save(§_-82N§.§_-43h§,this.§_-b4§);
      }
      
      private function §_-N1E§(param1:MouseEvent) : void
      {
         if(§_-71o§.active is §_-E1J§)
         {
            param1.stopImmediatePropagation();
            this.§_-I2s§.show();
         }
         else
         {
            Game.stage.quality = StageQuality.LOW;
            this.§_-b4§["quality"] = Game.stage.quality;
            §_-82N§.save(§_-82N§.§_-43h§,this.§_-b4§);
         }
      }
      
      private function §_-wi§(param1:MouseEvent) : void
      {
         if(§_-71o§.active is §_-E1J§)
         {
            param1.stopImmediatePropagation();
            this.§_-I2s§.show();
         }
         else
         {
            Game.stage.quality = StageQuality.HIGH;
            this.§_-b4§["quality"] = Game.stage.quality;
            §_-82N§.save(§_-82N§.§_-43h§,this.§_-b4§);
         }
      }
      
      private function §_-dN§(param1:MouseEvent) : void
      {
         §_-Bm§.§_-fy§(§_-T2o§.§_-w2N§);
      }
      
      private function §_-73b§(param1:MouseEvent) : void
      {
         §_-Bm§.set(§_-T2o§.§_-w2N§);
      }
      
      private function §_-e2z§(param1:MouseEvent) : void
      {
         GameSounds.on = true;
         §_-Bm§.§_-fy§(§_-T2o§.§_-62Z§);
      }
      
      private function §_-P1p§(param1:MouseEvent) : void
      {
         GameSounds.on = false;
         GameSounds.play(§_-43Z§.CLICK);
         §_-Bm§.set(§_-T2o§.§_-62Z§);
      }
      
      private function §_-y2g§(param1:MouseEvent) : void
      {
         GameMusic.on = true;
         §_-Bm§.§_-fy§(§_-T2o§.§_-32D§);
      }
      
      private function §_-53e§(param1:MouseEvent) : void
      {
         GameMusic.on = false;
         §_-Bm§.set(§_-T2o§.§_-32D§);
      }
      
      private function onLoad() : void
      {
         this.§_-b4§ = §_-82N§.load(§_-82N§.§_-43h§);
         this.§_-31p§();
      }
      
      private function §_-p2S§() : void
      {
         this.§_-31p§();
      }
      
      private function §_-23n§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§,true);
      }
      
      private function §_-412§(param1:MouseEvent) : void
      {
         this.extendsElements(true);
      }
      
      private function extendsElements(param1:Boolean) : void
      {
         var _loc2_:DisplayObject = null;
         this.§_-R1C§.visible = !param1;
         this.§_-O2e§.visible = param1;
         this.background.visible = param1;
         for each(_loc2_ in this.buttonsArray)
         {
            _loc2_.visible = param1;
         }
         this.update();
         Game.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.click);
         if(param1)
         {
            Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.click);
         }
      }
      
      private function click(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = null;
         if(param1.target)
         {
            for each(_loc2_ in this.buttonsArray)
            {
               if(param1.target == _loc2_ || param1.target.parent == _loc2_)
               {
                  return;
               }
            }
         }
         this.extendsElements(false);
      }
      
      private function §_-31p§() : void
      {
         if(GameMusic.on)
         {
            this.§_-T2b§.on();
         }
         else
         {
            this.§_-T2b§.off();
         }
         if(GameSounds.on)
         {
            this.§_-q1j§.on();
         }
         else
         {
            this.§_-q1j§.off();
         }
         if("quality" in this.§_-b4§)
         {
            if(this.§_-b4§["quality"] != "LOW")
            {
               this.§_-g4§.on();
            }
            else
            {
               this.§_-g4§.off();
            }
            Game.stage.quality = this.§_-b4§["quality"] == 0 ? StageQuality.HIGH : StageQuality.LOW;
         }
         if(Game.§_-v4§)
         {
            this.§_-J1g§.on();
         }
         else
         {
            this.§_-J1g§.off();
         }
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         this.extendsElements(false);
      }
   }
}

