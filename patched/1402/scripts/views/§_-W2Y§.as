package views
{
   import §_-22D§.§_-C2E§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import game.mainGame.GameMap;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   
   public class §_-W2Y§ extends Sprite
   {
      
      private static var _instance:§_-W2Y§ = null;
      
      private var timer:Timer = null;
      
      private var tween:§_-C2E§ = null;
      
      private var background:Sprite = new RoundBackground();
      
      private var progress:Sprite = new RoundProgress();
      
      private var §_-S1N§:Sprite = new RoundLoadFrameProgress();
      
      private var §_-Nx§:§_-i5§ = null;
      
      private var §_-Y1T§:§_-i5§ = null;
      
      private var §_-7Q§:§_-i5§ = null;
      
      private var §_-d12§:§_-i5§ = null;
      
      private var §_-B3R§:int = 0;
      
      private var §_-B38§:int = 0;
      
      private var locationId:int;
      
      private var mode:int;
      
      private var §_-3O§:int;
      
      public function §_-W2Y§()
      {
         super();
         _instance = this;
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-o2Z§,§_-s2l§.§_-p1K§]);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
      }
      
      public static function get instance() : §_-W2Y§
      {
         return _instance;
      }
      
      public function §_-22v§(param1:Event = null) : void
      {
         this.x = 0;
         this.y = 0;
         this.§_-S1N§.x = int(Game.starling.stage.stageWidth * 0.5);
         this.§_-S1N§.y = int(Game.starling.stage.stageHeight * 0.5) + 130;
         this.background.x = int(Game.starling.stage.stageWidth * 0.5);
         this.background.y = int(Game.starling.stage.stageHeight * 0.5);
         this.background.scaleX = Game.starling.stage.stageWidth / §_-Zy§.§_-21V§;
         this.background.scaleY = Game.starling.stage.stageHeight / §_-Zy§.§_-02T§;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this.progress.visible = param1;
         super.visible = param1;
      }
      
      public function show(param1:int) : void
      {
         this.§_-22v§();
         if(param1 <= 0)
         {
            return;
         }
         this.visible = true;
         this.§_-Nx§.text = "";
         this.progress.width = 0;
         this.§_-B38§ = 0;
         this.timer.reset();
         this.timer.repeatCount = param1 * 10;
         this.timer.start();
         GameSounds.play("next_round");
         this.§_-41i§();
      }
      
      public function hide() : void
      {
         this.visible = false;
         this.timer.stop();
         this.§_-Nx§.text = "";
         this.progress.width = 0;
         this.§_-B38§ = 0;
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
      }
      
      public function dispose() : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = null;
      }
      
      private function init() : void
      {
         this.addChild(this.background);
         this.§_-S1N§.x = int(GameMap.§_-O19§ * 0.5);
         this.§_-S1N§.y = int(GameMap.§_-Gd§ * 0.5) + 25;
         this.progress = new RoundProgress();
         this.progress.x = -179;
         this.progress.y = -19;
         this.background.x = int(GameMap.§_-O19§ * 0.5);
         this.background.y = int(GameMap.§_-Gd§ * 0.5);
         this.§_-B3R§ = this.progress.width;
         this.progress.width = 0;
         this.progress.height = 34;
         this.§_-B38§ = 0;
         addChild(this.§_-S1N§);
         this.§_-S1N§.addChild(this.progress);
         this.§_-Nx§ = new §_-i5§("  ",0,0,new TextFormat(§_-i5§.§_-p1s§,34,16777215));
         this.§_-Nx§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-Nx§.x = -this.§_-Nx§.width * 0.5;
         this.§_-Nx§.y = -this.§_-Nx§.height * 0.5;
         this.§_-S1N§.addChild(this.§_-Nx§);
         this.§_-Y1T§ = new §_-i5§(gls("Игра сейчас начнется"),0,0,new TextFormat(§_-i5§.§_-p1s§,32,16777215));
         this.§_-Y1T§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-Y1T§.x = -this.§_-Y1T§.width * 0.5;
         this.§_-Y1T§.y = -292;
         this.§_-Y1T§.filters = [new DropShadowFilter(0,0,0,0.9,4,4,2,2)];
         this.§_-S1N§.addChild(this.§_-Y1T§);
         this.§_-7Q§ = new §_-i5§("",0,0,new TextFormat(§_-i5§.§_-p1s§,20,16770349));
         this.§_-7Q§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-S1N§.addChild(this.§_-7Q§);
         this.§_-d12§ = new §_-i5§("",0,0,new TextFormat(null,16,16777215,true,null,null,null,null,"center"),610);
         this.§_-d12§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-S1N§.addChild(this.§_-d12§);
         this.timer = new Timer(100);
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-41i§);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-o2Z§:
               this.locationId = param1[0];
               this.§_-3O§ = param1[1];
               break;
            case §_-s2l§.§_-p1K§:
               if("3" in param1)
               {
                  this.mode = param1[3];
               }
               if(§_-at§.§_-13l§(this.locationId).teamMode)
               {
                  this.§_-7Q§.text = gls("Битва");
                  this.§_-d12§.text = gls("Убивай вражеских белок ядрами!\nНе дай себя убить!");
               }
               else
               {
                  this.§_-7Q§.text = §_-at§.§_-02X§[this.mode]["caption"];
                  this.§_-d12§.text = §_-at§.§_-02X§[this.mode]["text"];
               }
               this.§_-7Q§.x = -this.§_-7Q§.width * 0.5;
               this.§_-7Q§.y = -221;
               this.§_-d12§.x = -this.§_-d12§.width * 0.5;
               this.§_-d12§.y = -190;
         }
      }
      
      private function §_-41i§(param1:TimerEvent = null) : void
      {
         var _loc2_:Number = this.timer.currentCount / this.timer.repeatCount;
         this.§_-Nx§.text = String(int(_loc2_ * 100)) + "%";
         this.§_-Nx§.x = -this.§_-Nx§.width * 0.5 + 5;
         this.§_-Nx§.y = -26;
         this.§_-B38§ = this.§_-B3R§ * _loc2_ * 0.883;
         this.§_-A2E§();
      }
      
      private function §_-A2E§() : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = §_-C2E§.to(this.progress,1,{
            "width":this.§_-B38§,
            "onComplete":this.§_-b23§
         });
      }
      
      private function §_-b23§() : void
      {
         this.tween.§_-kl§();
      }
   }
}

