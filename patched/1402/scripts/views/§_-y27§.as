package views
{
   import §_-6f§.§_-71B§;
   import §_-I2Y§.§_-91K§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-r12§;
   import §_-X1k§.§_-u2n§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-t2c§;
   import buttons.§_-C13§;
   import buttons.§_-c6§;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import protocol.§_-n2E§;
   import sounds.GameMusic;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-y27§ extends Sprite
   {
      
      private static const §_-m1I§:int = 40;
      
      private static const §_-p1C§:int = 25;
      
      private static const §_-X1C§:int = 4;
      
      private static var _instance:§_-y27§;
      
      public static var highlight:int = 2;
      
      private var background:SettingsBackground;
      
      private var §_-O1b§:SimpleButton;
      
      private var §_-x2T§:SimpleButton;
      
      private var §_-EA§:SimpleButton;
      
      private var §_-F2V§:§_-c6§;
      
      private var §_-EZ§:§_-c6§;
      
      private var §_-8o§:§_-c6§;
      
      private var §_-X1m§:§_-c6§;
      
      private var §_-72k§:§_-C13§;
      
      private var §_-zt§:§_-c6§;
      
      private var §_-B1m§:§_-c6§;
      
      private var §_-zo§:Dialog;
      
      private var §_-X2E§:Boolean = false;
      
      private var §_-Z1z§:int = 0;
      
      private var §_-cv§:Object = {};
      
      private var buttonsArray:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function §_-y27§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.§_-cv§ = §_-u2n§.load(§_-u2n§.§_-eS§);
         §_-u2n§.addCallback(§_-u2n§.§_-eS§,this.onLoad);
         §_-r12§.onLoad(this.§_-Y2G§);
         this.init();
         this.extendsElements(false);
      }
      
      public static function §_-R2s§() : void
      {
         _instance.§_-R2s§();
      }
      
      public static function §_-i1S§() : void
      {
         var clanInvitesOn:ButtonClansOn;
         var clanInvitesOff:ButtonClansOff;
         var i:int;
         if(!_instance)
         {
            return;
         }
         if(_instance.§_-X2E§)
         {
            return;
         }
         _instance.§_-X2E§ = true;
         clanInvitesOn = new ButtonClansOn();
         clanInvitesOn.addEventListener(MouseEvent.MOUSE_DOWN,_instance.§_-31U§);
         clanInvitesOn.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            Game.§_-z16§ = false;
            §_-r12§.set(§_-n2E§.§_-S1K§);
         });
         new §_-kr§(clanInvitesOn,gls("Не получать приглашения в клан"));
         clanInvitesOff = new ButtonClansOff();
         clanInvitesOff.addEventListener(MouseEvent.MOUSE_DOWN,_instance.§_-31U§);
         clanInvitesOff.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            Game.§_-z16§ = true;
            §_-r12§.§_-42k§(§_-n2E§.§_-S1K§);
         });
         new §_-kr§(clanInvitesOff,gls("Получать приглашения в клан"));
         _instance.§_-B1m§ = new §_-c6§(clanInvitesOn,clanInvitesOff,!Game.§_-z16§);
         _instance.§_-B1m§.x = 6;
         _instance.§_-B1m§.y = §_-m1I§ + _instance.§_-Z1z§ * §_-p1C§;
         _instance.addChild(_instance.§_-B1m§);
         i = _instance.§_-Z1z§;
         while(i < _instance.buttonsArray.length)
         {
            _instance.buttonsArray[i].y += §_-p1C§;
            i++;
         }
         _instance.buttonsArray.splice(_instance.§_-Z1z§,0,_instance.§_-B1m§);
         _instance.background.height = _instance.buttonsArray.length * §_-p1C§;
         _instance.§_-B1m§.visible = _instance.background.visible;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         var _loc2_:int = this.§_-O1b§.width * (1 - param1) * 0.5;
         this.§_-O1b§.scaleX = this.§_-x2T§.scaleX = param1;
         this.§_-O1b§.x = _loc2_;
         this.§_-x2T§.x = _loc2_;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         this.§_-O1b§.scaleY = this.§_-x2T§.scaleY = param1;
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
         this.§_-zo§ = new §_-Fk§(gls("Качество изображения"),gls("Для смены качества изображения\nвыйди на экран планет"));
         this.background = new SettingsBackground();
         this.background.y = §_-m1I§;
         addChild(this.background);
         this.§_-O1b§ = new ButtonSettingsOpen();
         this.§_-O1b§.x = §_-X1C§;
         this.§_-O1b§.addEventListener(MouseEvent.CLICK,this.§_-P28§);
         this.§_-O1b§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         addChild(this.§_-O1b§);
         new §_-kr§(this.§_-O1b§,gls("Настройки"));
         this.§_-x2T§ = new ButtonSettingsClose();
         this.§_-x2T§.x = §_-X1C§;
         this.§_-x2T§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.§_-x2T§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            extendsElements(false);
         });
         addChild(this.§_-x2T§);
         buttonMusicOn = new ButtonMusicOn();
         buttonMusicOn.addEventListener(MouseEvent.CLICK,this.§_-72f§);
         buttonMusicOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonMusicOn,gls("Выключить музыку"));
         buttonMusicOff = new ButtonMusicOff();
         buttonMusicOff.addEventListener(MouseEvent.CLICK,this.§_-61y§);
         buttonMusicOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonMusicOff,gls("Включить музыку"));
         this.§_-F2V§ = new §_-c6§(buttonMusicOff,buttonMusicOn,GameMusic.on);
         addChild(this.§_-F2V§);
         this.buttonsArray.push(this.§_-F2V§);
         buttonSoundOff = new ButtonSoundOff();
         buttonSoundOff.addEventListener(MouseEvent.CLICK,this.§_-93S§);
         buttonSoundOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonSoundOff,gls("Включить звук"));
         buttonSoundOn = new ButtonSoundOn();
         buttonSoundOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         buttonSoundOn.addEventListener(MouseEvent.CLICK,this.§_-C2W§);
         new §_-kr§(buttonSoundOn,gls("Выключить звук"));
         this.§_-EZ§ = new §_-c6§(buttonSoundOff,buttonSoundOn,GameSounds.on);
         addChild(this.§_-EZ§);
         this.buttonsArray.push(this.§_-EZ§);
         buttonCameraOff = new ButtonCameraOff();
         buttonCameraOff.addEventListener(MouseEvent.CLICK,this.§_-p1T§);
         buttonCameraOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonCameraOff,gls("Включить слежение за белкой"));
         buttonCameraOn = new ButtonCameraOn();
         buttonCameraOn.addEventListener(MouseEvent.CLICK,this.§_-yy§);
         buttonCameraOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonCameraOn,gls("Выключить слежение за белкой"));
         this.§_-8o§ = new §_-c6§(buttonCameraOff,buttonCameraOn,!§_-r12§.§_-FS§(§_-n2E§.§_-X2z§));
         addChild(this.§_-8o§);
         this.buttonsArray.push(this.§_-8o§);
         buttonHighQuality = new ButtonLQ();
         buttonHighQuality.addEventListener(MouseEvent.CLICK,this.§_-03T§);
         buttonHighQuality.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonHighQuality,gls("Низкое качество"));
         buttonLowQuality = new ButtonHQ();
         buttonLowQuality.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         buttonLowQuality.addEventListener(MouseEvent.CLICK,this.§_-GR§);
         new §_-kr§(buttonLowQuality,gls("Высокое качество"));
         if("quality" in this.§_-cv§)
         {
            Game.stage.quality = this.§_-cv§["quality"];
            enableHighQuality = this.§_-cv§["quality"] != "LOW";
         }
         this.§_-X1m§ = new §_-c6§(buttonHighQuality,buttonLowQuality,enableHighQuality);
         addChild(this.§_-X1m§);
         this.buttonsArray.push(this.§_-X1m§);
         buttonHighlightPaleOn = new ButtonBacklightOn();
         buttonHighlightPaleOn.addEventListener(MouseEvent.CLICK,this.§_-ae§);
         buttonHighlightPaleOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonHighlightPaleOn,gls("Включить слабую подсветку своей белки"));
         buttonHighlightStrongOn = new ButtonBacklightOn();
         buttonHighlightStrongOn.addEventListener(MouseEvent.CLICK,this.§_-s2B§);
         buttonHighlightStrongOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§(buttonHighlightStrongOn,gls("Включить сильную подсветку своей белки"));
         buttonHighlightOff = new ButtonBacklightOff();
         buttonHighlightOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         buttonHighlightOff.addEventListener(MouseEvent.CLICK,this.§_-71v§);
         new §_-kr§(buttonHighlightOff,gls("Выключить подсветку своей белки"));
         if("highlight" in this.§_-cv§)
         {
            highlight = int(this.§_-cv§["highlight"]);
         }
         else
         {
            highlight = 0;
         }
         this.§_-72k§ = new §_-C13§([buttonHighlightOff,buttonHighlightPaleOn,buttonHighlightStrongOn],highlight);
         addChild(this.§_-72k§);
         this.buttonsArray.push(this.§_-72k§);
         buttonShamanOn = new ButtonShamanOn();
         buttonShamanOn.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         buttonShamanOn.addEventListener(MouseEvent.CLICK,this.§_-A3T§);
         new §_-kr§(buttonShamanOn,gls("Не хочу быть шаманом"));
         buttonShamanOff = new ButtonShamanOff();
         buttonShamanOff.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         buttonShamanOff.addEventListener(MouseEvent.CLICK,this.§_-ak§);
         new §_-kr§(buttonShamanOff,gls("Хочу быть шаманом"));
         this.§_-zt§ = new §_-c6§(buttonShamanOn,buttonShamanOff,Game.§_-ul§);
         addChild(this.§_-zt§);
         this.buttonsArray.push(this.§_-zt§);
         this.§_-Z1z§ = this.buttonsArray.length;
         this.§_-EA§ = new ButtonPromocode();
         this.§_-EA§.addEventListener(MouseEvent.CLICK,this.§_-w1l§);
         this.§_-EA§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         addChild(this.§_-EA§);
         new §_-kr§(this.§_-EA§,gls("Ввести промокод"));
         this.buttonsArray.push(this.§_-EA§);
         this.update();
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
      }
      
      private function update() : void
      {
         var _loc1_:int = 2 + 5;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            this.buttonsArray[_loc2_].x = §_-X1C§;
            this.buttonsArray[_loc2_].y = §_-m1I§ + _loc1_;
            _loc1_ += this.buttonsArray[_loc2_].visible ? Math.max(this.buttonsArray[_loc2_].height,§_-p1C§) : 0;
            _loc2_++;
         }
         this.background.height = _loc1_ - 5;
      }
      
      private function §_-w1l§(param1:MouseEvent) : void
      {
         §_-71B§.show();
      }
      
      private function §_-ak§(param1:MouseEvent) : void
      {
         Game.§_-ul§ = false;
         §_-r12§.§_-42k§(§_-n2E§.§_-T2s§);
      }
      
      private function §_-A3T§(param1:MouseEvent) : void
      {
         Game.§_-ul§ = true;
         §_-r12§.set(§_-n2E§.§_-T2s§);
      }
      
      private function §_-s2B§(param1:MouseEvent) : void
      {
         highlight = 2;
         this.§_-cv§["highlight"] = highlight;
         §_-u2n§.save(§_-u2n§.§_-eS§,this.§_-cv§);
      }
      
      private function §_-ae§(param1:MouseEvent) : void
      {
         highlight = 1;
         this.§_-cv§["highlight"] = highlight;
         §_-u2n§.save(§_-u2n§.§_-eS§,this.§_-cv§);
      }
      
      private function §_-71v§(param1:MouseEvent) : void
      {
         highlight = 0;
         this.§_-cv§["highlight"] = highlight;
         §_-u2n§.save(§_-u2n§.§_-eS§,this.§_-cv§);
      }
      
      private function §_-GR§(param1:MouseEvent) : void
      {
         if(§_-t2c§.active is §_-91K§)
         {
            param1.stopImmediatePropagation();
            this.§_-zo§.show();
         }
         else
         {
            Game.stage.quality = StageQuality.LOW;
            this.§_-cv§["quality"] = Game.stage.quality;
            §_-u2n§.save(§_-u2n§.§_-eS§,this.§_-cv§);
         }
      }
      
      private function §_-03T§(param1:MouseEvent) : void
      {
         if(§_-t2c§.active is §_-91K§)
         {
            param1.stopImmediatePropagation();
            this.§_-zo§.show();
         }
         else
         {
            Game.stage.quality = StageQuality.HIGH;
            this.§_-cv§["quality"] = Game.stage.quality;
            §_-u2n§.save(§_-u2n§.§_-eS§,this.§_-cv§);
         }
      }
      
      private function §_-p1T§(param1:MouseEvent) : void
      {
         §_-r12§.§_-42k§(§_-n2E§.§_-X2z§);
      }
      
      private function §_-yy§(param1:MouseEvent) : void
      {
         §_-r12§.set(§_-n2E§.§_-X2z§);
      }
      
      private function §_-93S§(param1:MouseEvent) : void
      {
         GameSounds.on = true;
         §_-r12§.§_-42k§(§_-n2E§.§_-XU§);
      }
      
      private function §_-C2W§(param1:MouseEvent) : void
      {
         GameSounds.on = false;
         GameSounds.play(§_-RH§.CLICK);
         §_-r12§.set(§_-n2E§.§_-XU§);
      }
      
      private function §_-61y§(param1:MouseEvent) : void
      {
         GameMusic.on = true;
         §_-r12§.§_-42k§(§_-n2E§.§_-U1G§);
      }
      
      private function §_-72f§(param1:MouseEvent) : void
      {
         GameMusic.on = false;
         §_-r12§.set(§_-n2E§.§_-U1G§);
      }
      
      private function onLoad() : void
      {
         this.§_-cv§ = §_-u2n§.load(§_-u2n§.§_-eS§);
         this.§_-R2s§();
      }
      
      private function §_-Y2G§() : void
      {
         this.§_-R2s§();
      }
      
      private function §_-31U§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§,true);
      }
      
      private function §_-P28§(param1:MouseEvent) : void
      {
         this.extendsElements(true);
      }
      
      private function extendsElements(param1:Boolean) : void
      {
         var _loc2_:DisplayObject = null;
         this.§_-O1b§.visible = !param1;
         this.§_-x2T§.visible = param1;
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
      
      private function §_-R2s§() : void
      {
         if(GameMusic.on)
         {
            this.§_-F2V§.on();
         }
         else
         {
            this.§_-F2V§.off();
         }
         if(GameSounds.on)
         {
            this.§_-EZ§.on();
         }
         else
         {
            this.§_-EZ§.off();
         }
         if("quality" in this.§_-cv§)
         {
            if(this.§_-cv§["quality"] != "LOW")
            {
               this.§_-X1m§.on();
            }
            else
            {
               this.§_-X1m§.off();
            }
            Game.stage.quality = this.§_-cv§["quality"] == 0 ? StageQuality.HIGH : StageQuality.LOW;
         }
         if(Game.§_-ul§)
         {
            this.§_-zt§.on();
         }
         else
         {
            this.§_-zt§.off();
         }
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         this.extendsElements(false);
      }
   }
}

