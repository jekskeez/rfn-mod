package §_-e2w§
{
   import §_-42B§.TweenMax;
   import §_-68§.§_-EI§;
   import §_-I10§.NotificationManager;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-d2x§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-5T§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-F2y§;
   import §_-T2y§.§_-J29§;
   import §_-T2y§.§_-ac§;
   import §_-T2y§.§_-n2a§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-512§;
   import §_-xm§.§_-by§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-x1Z§;
   import views.§_-E8§;
   
   public class §_-31V§ extends Sprite
   {
      
      private var tween:TweenMax;
      
      private var §_-a2W§:SimpleButton;
      
      private var §_-UJ§:§_-Hb§;
      
      private var §_-A1u§:Boolean = false;
      
      private var timer:Timer = new Timer(1000,1);
      
      public function §_-31V§()
      {
         super();
         this.init();
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.hide);
         this.addEventListener(MouseEvent.ROLL_OVER,this.§_-Q20§);
         this.addEventListener(MouseEvent.ROLL_OUT,this.§_-9c§);
      }
      
      public function update(param1:Boolean) : void
      {
         this.§_-A1u§ = param1;
         if(this.§_-A1u§)
         {
            this.show();
         }
         else
         {
            this.§_-d2N§();
         }
         var _loc2_:Boolean = Game.self["clan_id"] != 0;
         this.§_-a2W§.mouseEnabled = §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§;
         this.§_-a2W§.filters = §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§ ? [] : §_-x1Z§.§_-c2G§;
         this.§_-UJ§.setStatus(_loc2_ ? gls("Клан") : (§_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§ ? gls("Кланы") : gls("Доступно с {0} уровня",§_-My§.§_-U1R§)));
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
      
      public function §_-d2N§() : void
      {
         this.visible = false;
         this.alpha = 0;
         this.y = 0;
      }
      
      public function §_-t1G§() : void
      {
         if(this.§_-A1u§)
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
            this.tween.§_-h2r§();
         }
         this.tween = TweenMax.to(this,0.2,{
            "y":0,
            "alpha":0,
            "onComplete":this.§_-d2N§
         });
      }
      
      private function init() : void
      {
         var _loc1_:Array = [new ButtonProfileWardrobe(),new ButtonProfileMail(),new ButtonProfileShaman(),new ButtonProfileCollection(),new ButtonProfileAward(),new ButtonProfileClan()];
         var _loc2_:Array = [gls("Гардероб"),gls("Почта"),gls("Навыки шамана"),gls("Коллекции"),gls("Достижения"),gls("Клан")];
         var _loc3_:Array = [this.§_-h1M§,this.§_-dA§,this.§_-nv§,this.§_-D1G§,this.showAward,this.§_-Z2c§];
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
         var _loc5_:§_-Hb§ = new §_-Hb§(param1,param2);
         if(param1 is ButtonProfileClan)
         {
            _loc6_ = new Sprite();
            _loc6_.addChild(param1);
            _loc6_.buttonMode = true;
            addChild(_loc6_);
            this.§_-a2W§ = param1;
            this.§_-UJ§ = new §_-Hb§(_loc6_,param2);
            _loc5_.remove();
         }
         if(param1 is ButtonProfileMail)
         {
            NotificationManager.instance.§_-P2Y§(NotificationManager.§_-V1P§,new §_-E8§(param1,30,20));
         }
         if(param1 is ButtonProfileCollection)
         {
            NotificationManager.instance.§_-P2Y§(NotificationManager.§_-M0§,new §_-E8§(param1,20,20));
         }
      }
      
      private function §_-dA§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         §_-EI§.load(function():void
         {
            §_-512§.show();
         });
      }
      
      private function §_-h1M§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         GameSounds.play(§_-43Z§.§_-w2I§,true);
         §_-5B§.§_-R1G§(Game.selfId);
         §_-71o§.show(§_-ac§.instance);
      }
      
      private function §_-D1G§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-5B§.§_-R1G§(Game.selfId);
         §_-EI§.load(function():void
         {
            GameSounds.play(§_-43Z§.§_-o1e§,true);
            GameSounds.play(§_-43Z§.§_-w2I§,true);
            §_-71o§.show(§_-5T§.instance);
         });
      }
      
      private function §_-nv§(param1:MouseEvent = null) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         GameSounds.play(§_-43Z§.§_-w2I§,true);
         §_-71o§.show(§_-n2a§.instance);
      }
      
      private function showAward(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-EI§.load(function():void
         {
            GameSounds.play(§_-43Z§.§_-o1e§,true);
            GameSounds.play(§_-43Z§.§_-w2I§,true);
            §_-71o§.show(§_-J29§.instance);
         });
      }
      
      private function §_-Z2c§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         if(§_-d2x§.§_-z2o§ < §_-My§.§_-U1R§)
         {
            return;
         }
         if(Game.self["clan_id"] == 0)
         {
            §_-by§.show();
            return;
         }
         GameSounds.play(§_-43Z§.§_-w2I§,true);
         §_-5B§.§_-R1G§(Game.selfId);
         §_-71o§.show(§_-F2y§.instance);
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         this.timer.stop();
      }
      
      private function §_-9c§(param1:MouseEvent) : void
      {
         this.§_-t1G§();
      }
   }
}

