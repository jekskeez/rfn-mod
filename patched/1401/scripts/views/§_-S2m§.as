package views
{
   import §_-42B§.§_-y2k§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import game.mainGame.GameMap;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   
   public class §_-S2m§ extends Sprite
   {
      
      private static var _instance:§_-S2m§ = null;
      
      private var timer:Timer = null;
      
      private var tween:§_-y2k§ = null;
      
      private var background:Sprite = new RoundBackground();
      
      private var progress:Sprite = new RoundProgress();
      
      private var §_-v1§:Sprite = new RoundLoadFrameProgress();
      
      private var §_-I2E§:§_-22V§ = null;
      
      private var §_-zl§:§_-22V§ = null;
      
      private var §_-v2B§:§_-22V§ = null;
      
      private var §_-73V§:§_-22V§ = null;
      
      private var §_-10§:int = 0;
      
      private var §_-O2b§:int = 0;
      
      private var locationId:int;
      
      private var mode:int;
      
      private var §_-01L§:int;
      
      public function §_-S2m§()
      {
         super();
         _instance = this;
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-Hk§,§_-S2I§.§_-W1O§]);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
      }
      
      public static function get instance() : §_-S2m§
      {
         return _instance;
      }
      
      public function §_-V1Q§(param1:Event = null) : void
      {
         this.x = 0;
         this.y = 0;
         this.§_-v1§.x = int(Game.starling.stage.stageWidth * 0.5);
         this.§_-v1§.y = int(Game.starling.stage.stageHeight * 0.5) + 130;
         this.background.x = int(Game.starling.stage.stageWidth * 0.5);
         this.background.y = int(Game.starling.stage.stageHeight * 0.5);
         this.background.scaleX = Game.starling.stage.stageWidth / §_-a9§.§_-9o§;
         this.background.scaleY = Game.starling.stage.stageHeight / §_-a9§.§_-31m§;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this.progress.visible = param1;
         super.visible = param1;
      }
      
      public function show(param1:int) : void
      {
         this.§_-V1Q§();
         if(param1 <= 0)
         {
            return;
         }
         this.visible = true;
         this.§_-I2E§.text = "";
         this.progress.width = 0;
         this.§_-O2b§ = 0;
         this.timer.reset();
         this.timer.repeatCount = param1 * 10;
         this.timer.start();
         GameSounds.play("next_round");
         this.§_-q8§();
      }
      
      public function hide() : void
      {
         this.visible = false;
         this.timer.stop();
         this.§_-I2E§.text = "";
         this.progress.width = 0;
         this.§_-O2b§ = 0;
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
      }
      
      public function dispose() : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.tween = null;
      }
      
      private function init() : void
      {
         this.addChild(this.background);
         this.§_-v1§.x = int(GameMap.§_-q1n§ * 0.5);
         this.§_-v1§.y = int(GameMap.§_-P1Q§ * 0.5) + 25;
         this.progress = new RoundProgress();
         this.progress.x = -179;
         this.progress.y = -19;
         this.background.x = int(GameMap.§_-q1n§ * 0.5);
         this.background.y = int(GameMap.§_-P1Q§ * 0.5);
         this.§_-10§ = this.progress.width;
         this.progress.width = 0;
         this.progress.height = 34;
         this.§_-O2b§ = 0;
         addChild(this.§_-v1§);
         this.§_-v1§.addChild(this.progress);
         this.§_-I2E§ = new §_-22V§("  ",0,0,new TextFormat(§_-22V§.§_-pJ§,34,16777215));
         this.§_-I2E§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-I2E§.x = -this.§_-I2E§.width * 0.5;
         this.§_-I2E§.y = -this.§_-I2E§.height * 0.5;
         this.§_-v1§.addChild(this.§_-I2E§);
         this.§_-zl§ = new §_-22V§(gls("Игра сейчас начнется"),0,0,new TextFormat(§_-22V§.§_-pJ§,32,16777215));
         this.§_-zl§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-zl§.x = -this.§_-zl§.width * 0.5;
         this.§_-zl§.y = -292;
         this.§_-zl§.filters = [new DropShadowFilter(0,0,0,0.9,4,4,2,2)];
         this.§_-v1§.addChild(this.§_-zl§);
         this.§_-v2B§ = new §_-22V§("",0,0,new TextFormat(§_-22V§.§_-pJ§,20,16770349));
         this.§_-v2B§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-v1§.addChild(this.§_-v2B§);
         this.§_-73V§ = new §_-22V§("",0,0,new TextFormat(null,16,16777215,true,null,null,null,null,"center"),610);
         this.§_-73V§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-v1§.addChild(this.§_-73V§);
         this.timer = new Timer(100);
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-q8§);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-Hk§:
               this.locationId = param1[0];
               this.§_-01L§ = param1[1];
               break;
            case §_-S2I§.§_-W1O§:
               if("3" in param1)
               {
                  this.mode = param1[3];
               }
               if(§_-q1p§.§_-l29§(this.locationId).teamMode)
               {
                  this.§_-v2B§.text = gls("Битва");
                  this.§_-73V§.text = gls("Убивай вражеских белок ядрами!\nНе дай себя убить!");
               }
               else
               {
                  this.§_-v2B§.text = §_-q1p§.§_-m15§[this.mode]["caption"];
                  this.§_-73V§.text = §_-q1p§.§_-m15§[this.mode]["text"];
               }
               this.§_-v2B§.x = -this.§_-v2B§.width * 0.5;
               this.§_-v2B§.y = -221;
               this.§_-73V§.x = -this.§_-73V§.width * 0.5;
               this.§_-73V§.y = -190;
         }
      }
      
      private function §_-q8§(param1:TimerEvent = null) : void
      {
         var _loc2_:Number = this.timer.currentCount / this.timer.repeatCount;
         this.§_-I2E§.text = String(int(_loc2_ * 100)) + "%";
         this.§_-I2E§.x = -this.§_-I2E§.width * 0.5 + 5;
         this.§_-I2E§.y = -26;
         this.§_-O2b§ = this.§_-10§ * _loc2_ * 0.883;
         this.§_-43J§();
      }
      
      private function §_-43J§() : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.tween = §_-y2k§.to(this.progress,1,{
            "width":this.§_-O2b§,
            "onComplete":this.§_-8e§
         });
      }
      
      private function §_-8e§() : void
      {
         this.tween.§_-h2r§();
      }
   }
}

