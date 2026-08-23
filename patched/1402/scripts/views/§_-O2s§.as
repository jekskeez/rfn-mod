package views
{
   import §_-22D§.TweenMax;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-T2A§;
   import §_-c2C§.§_-51A§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   
   public class §_-O2s§ extends Sprite
   {
      
      protected static const §_-C1Q§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,17,16777215,null,null,null,null,null,"center");
      
      private var §_-h1d§:SimpleButton = null;
      
      private var §_-J1K§:MovieClip = null;
      
      private var §_-7L§:SimpleButton = null;
      
      private var §_-Ss§:§_-i5§ = null;
      
      private var §_-oj§:§_-kr§ = null;
      
      public function §_-O2s§()
      {
         super();
         this.init();
         §_-T2A§.addEventListener(GameEvent.PRODUCE_BONUS_START,this.§_-w1T§);
         §_-T2A§.addEventListener(GameEvent.PRODUCE_BONUS_END,this.§_-m1j§);
         §_-T2A§.addEventListener(GameEvent.PRODUCE_START,this.§_-w1T§);
         §_-T2A§.addEventListener(GameEvent.PRODUCE_END,this.§_-w1T§);
         §_-T2A§.addEventListener(GameEvent.PRODUCE_UPDATE,this.update);
         §_-51A§.§_-A3z§(GameEvent.PROFILE_PLAYER_CHANGED,this.§_-w1T§);
         this.§_-w1T§();
         this.update(null);
      }
      
      private function update(param1:GameEvent) : void
      {
         this.§_-oj§.setStatus("<body>" + §_-T2A§.timeString(§_-T2A§.§_-c2h§) + "</body>");
      }
      
      private function §_-w1T§(param1:GameEvent = null) : void
      {
         if(Boolean(param1) && Boolean(param1.data != null) && param1.data["type"] != §_-T2A§.§_-c2h§)
         {
            return;
         }
         this.§_-h1d§.visible = §_-T2A§.§_-c2S§(§_-T2A§.§_-c2h§) && §_-51A§.playerId == Game.selfId;
         this.§_-J1K§.visible = §_-T2A§.§_-pW§(§_-T2A§.§_-c2h§) && !§_-T2A§.§_-c2S§(§_-T2A§.§_-c2h§) && §_-51A§.playerId == Game.selfId;
         this.§_-Ss§.visible = this.§_-7L§.visible = this.§_-h1d§.visible;
         this.buttonMode = true;
      }
      
      private function §_-m1j§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-T2A§.§_-c2h§)
         {
            return;
         }
         this.§_-w1T§(null);
         GameSounds.play("golden_cup_bonus");
         var _loc2_:int = 0;
         while(_loc2_ < §_-T2A§.§_-R1§)
         {
            this.showAward(ImageIconCoins,new Point(this.x + 40,this.y + 25),_loc2_ * 0.1);
            _loc2_++;
         }
      }
      
      private function showAward(param1:Class, param2:Point, param3:Number) : void
      {
         var object:DisplayObject = null;
         var imageClass:Class = param1;
         var point:Point = param2;
         var delay:Number = param3;
         object = new imageClass();
         object.x = point.x;
         object.y = point.y;
         TweenMax.to(object,1,{
            "bezier":[{
               "x":600,
               "y":300
            },{
               "x":285,
               "y":15
            }],
            "delay":delay,
            "onStart":function():void
            {
               Game.§_-q1L§.addChild(object);
            },
            "onComplete":function():void
            {
               Game.§_-q1L§.removeChild(object);
            }
         });
      }
      
      private function init() : void
      {
         this.§_-h1d§ = new GoldenCupFull();
         this.§_-h1d§.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(this.§_-h1d§);
         this.§_-7L§ = new GoldenCupGet();
         this.§_-7L§.x = 50;
         this.§_-7L§.y = 10;
         this.§_-7L§.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(this.§_-7L§);
         this.§_-Ss§ = new §_-i5§(gls("Забрать"),0,0,§_-C1Q§);
         this.§_-Ss§.x = 10;
         this.§_-Ss§.y = -this.§_-Ss§.height / 4;
         this.§_-Ss§.mouseEnabled = false;
         addChild(this.§_-Ss§);
         this.§_-J1K§ = new GoldenCupEmpty();
         this.§_-J1K§.y = this.§_-h1d§.y = 20;
         addChild(this.§_-J1K§);
         this.§_-oj§ = new §_-kr§(this,"",false,true);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         if(§_-T2A§.§_-c2S§(§_-T2A§.§_-c2h§))
         {
            §_-T2A§.§_-311§(§_-T2A§.§_-c2h§);
         }
      }
   }
}

