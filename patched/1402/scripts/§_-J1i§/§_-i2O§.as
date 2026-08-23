package §_-J1i§
{
   import §_-22D§.TweenMax;
   import §_-I18§.§_-c2Q§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.NotificationManager;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-XW§;
   import §_-bN§.§_-q1i§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-QI§;
   import §_-c2C§.§_-e1v§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-x2y§;
   import §_-c2C§.§_-y10§;
   import §_-s2e§.§_-U2d§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-y1l§;
   import views.§_-O2q§;
   
   public class §_-i2O§ extends Sprite
   {
      
      private var tween:TweenMax;
      
      private var §_-j2i§:SimpleButton;
      
      private var §_-o1F§:§_-kr§;
      
      private var §_-k1x§:Boolean = false;
      
      private var timer:Timer = new Timer(1000,1);
      
      public function §_-i2O§()
      {
         super();
         this.init();
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.hide);
         this.addEventListener(MouseEvent.ROLL_OVER,this.§_-T2H§);
         this.addEventListener(MouseEvent.ROLL_OUT,this.§_-k2s§);
      }
      
      public function update(param1:Boolean) : void
      {
         this.§_-k1x§ = param1;
         if(this.§_-k1x§)
         {
            this.show();
         }
         else
         {
            this.§_-V2S§();
         }
         var _loc2_:Boolean = Game.self["clan_id"] != 0;
         this.§_-j2i§.mouseEnabled = §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§;
         this.§_-j2i§.filters = §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§ ? [] : §_-y1l§.§_-Tk§;
         this.§_-o1F§.setStatus(_loc2_ ? gls("Клан") : (§_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§ ? gls("Кланы") : gls("Доступно с {0} уровня",§_-XW§.§_-I1V§)));
      }
      
      public function show() : void
      {
         this.visible = true;
         this.tween = TweenMax.to(this,0.2,{
            "y":60,
            "alpha":1
         });
         this.timer.stop();
      }
      
      public function §_-V2S§() : void
      {
         this.visible = false;
         this.alpha = 0;
         this.y = 0;
      }
      
      public function §_-c1H§() : void
      {
         if(this.§_-k1x§)
         {
            return;
         }
         this.timer.reset();
         this.timer.start();
      }
      
      public function hide(param1:TimerEvent = null) : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this,0.2,{
            "y":0,
            "alpha":0,
            "onComplete":this.§_-V2S§
         });
      }
      
      private function init() : void
      {
         var _loc1_:Array = [new ButtonProfileWardrobe(),new ButtonProfileMail(),new ButtonProfileShaman(),new ButtonProfileCollection(),new ButtonProfileAward(),new ButtonProfileClan()];
         var _loc2_:Array = [gls("Гардероб"),gls("Почта"),gls("Навыки шамана"),gls("Коллекции"),gls("Достижения"),gls("Клан")];
         var _loc3_:Array = [this.§_-T1D§,this.§_-FY§,this.§_-b1f§,this.§_-A2u§,this.showAward,this.§_-334§];
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.length)
         {
            this.addButton(_loc1_[_loc4_],_loc2_[_loc4_],_loc3_[_loc4_],_loc4_);
            _loc4_++;
         }
      }
      
      private function addButton(param1:SimpleButton, param2:String, param3:Function, param4:int) : void
      {
         var _loc6_:Sprite = null;
         param1.x = 52 * param4 + (26 - int(param1.width * 0.5));
         param1.y = 43 - int(param1.height * 0.5);
         param1.addEventListener(MouseEvent.CLICK,param3);
         addChild(param1);
         var _loc5_:§_-kr§ = new §_-kr§(param1,param2);
         if(param1 is ButtonProfileClan)
         {
            _loc6_ = new Sprite();
            _loc6_.addChild(param1);
            _loc6_.buttonMode = true;
            addChild(_loc6_);
            this.§_-j2i§ = param1;
            this.§_-o1F§ = new §_-kr§(_loc6_,param2);
            _loc5_.remove();
         }
         if(param1 is ButtonProfileMail)
         {
            NotificationManager.instance.§_-a1K§(NotificationManager.§_-T1Z§,new §_-O2q§(param1,30,20));
         }
         if(param1 is ButtonProfileCollection)
         {
            NotificationManager.instance.§_-a1K§(NotificationManager.§_-Xd§,new §_-O2q§(param1,20,20));
         }
      }
      
      private function §_-FY§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-RH§.§_-K10§,true);
         §_-U2d§.load(function():void
         {
            §_-q1i§.show();
         });
      }
      
      private function §_-T1D§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§,true);
         GameSounds.play(§_-RH§.§_-K2k§,true);
         §_-51A§.§_-h2w§(Game.selfId);
         §_-t2c§.show(§_-x2y§.instance);
      }
      
      private function §_-A2u§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-51A§.§_-h2w§(Game.selfId);
         §_-U2d§.load(function():void
         {
            GameSounds.play(§_-RH§.§_-K10§,true);
            GameSounds.play(§_-RH§.§_-K2k§,true);
            §_-t2c§.show(§_-e1v§.instance);
         });
      }
      
      private function §_-b1f§(param1:MouseEvent = null) : void
      {
         GameSounds.play(§_-RH§.§_-K10§,true);
         GameSounds.play(§_-RH§.§_-K2k§,true);
         §_-t2c§.show(§_-QI§.instance);
      }
      
      private function showAward(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-U2d§.load(function():void
         {
            GameSounds.play(§_-RH§.§_-K10§,true);
            GameSounds.play(§_-RH§.§_-K2k§,true);
            §_-t2c§.show(§_-y10§.instance);
         });
      }
      
      private function §_-334§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§,true);
         if(§_-LZ§.§_-mA§ < §_-XW§.§_-I1V§)
         {
            return;
         }
         if(Game.self["clan_id"] == 0)
         {
            §_-c2Q§.show();
            return;
         }
         GameSounds.play(§_-RH§.§_-K2k§,true);
         §_-51A§.§_-h2w§(Game.selfId);
         §_-t2c§.show(§_-P1w§.instance);
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         this.timer.stop();
      }
      
      private function §_-k2s§(param1:MouseEvent) : void
      {
         this.§_-c1H§();
      }
   }
}

