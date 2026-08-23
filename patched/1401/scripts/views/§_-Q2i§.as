package views
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-l1f§;
   import §_-T2y§.§_-5B§;
   import §_-e1G§.§_-Hb§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   
   public class §_-Q2i§ extends Sprite
   {
      
      protected static const §_-CD§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,17,16777215,null,null,null,null,null,"center");
      
      private var §_-J1W§:SimpleButton = null;
      
      private var §_-c1§:MovieClip = null;
      
      private var §_-U2p§:SimpleButton = null;
      
      private var §_-V2q§:§_-22V§ = null;
      
      private var §_-XW§:§_-Hb§ = null;
      
      public function §_-Q2i§()
      {
         super();
         this.init();
         §_-l1f§.addEventListener(GameEvent.PRODUCE_BONUS_START,this.§_-Hp§);
         §_-l1f§.addEventListener(GameEvent.PRODUCE_BONUS_END,this.§_-I1m§);
         §_-l1f§.addEventListener(GameEvent.PRODUCE_START,this.§_-Hp§);
         §_-l1f§.addEventListener(GameEvent.PRODUCE_END,this.§_-Hp§);
         §_-l1f§.addEventListener(GameEvent.PRODUCE_UPDATE,this.update);
         §_-5B§.§_-h1R§(GameEvent.PROFILE_PLAYER_CHANGED,this.§_-Hp§);
         this.§_-Hp§();
         this.update(null);
      }
      
      private function update(param1:GameEvent) : void
      {
         this.§_-XW§.setStatus("<body>" + §_-l1f§.timeString(§_-l1f§.§_-I13§) + "</body>");
      }
      
      private function §_-Hp§(param1:GameEvent = null) : void
      {
         if(Boolean(param1) && Boolean(param1.data != null) && param1.data["type"] != §_-l1f§.§_-I13§)
         {
            return;
         }
         this.§_-J1W§.visible = §_-l1f§.§_-Pd§(§_-l1f§.§_-I13§) && §_-5B§.playerId == Game.selfId;
         this.§_-c1§.visible = §_-l1f§.§_-J26§(§_-l1f§.§_-I13§) && !§_-l1f§.§_-Pd§(§_-l1f§.§_-I13§) && §_-5B§.playerId == Game.selfId;
         this.§_-V2q§.visible = this.§_-U2p§.visible = this.§_-J1W§.visible;
         this.buttonMode = true;
      }
      
      private function §_-I1m§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-l1f§.§_-I13§)
         {
            return;
         }
         this.§_-Hp§(null);
         GameSounds.play("golden_cup_bonus");
         var _loc2_:int = 0;
         while(_loc2_ < §_-l1f§.§_-w2a§)
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
               Game.§_-d2t§.addChild(object);
            },
            "onComplete":function():void
            {
               Game.§_-d2t§.removeChild(object);
            }
         });
      }
      
      private function init() : void
      {
         this.§_-J1W§ = new GoldenCupFull();
         this.§_-J1W§.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(this.§_-J1W§);
         this.§_-U2p§ = new GoldenCupGet();
         this.§_-U2p§.x = 50;
         this.§_-U2p§.y = 10;
         this.§_-U2p§.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(this.§_-U2p§);
         this.§_-V2q§ = new §_-22V§(gls("Забрать"),0,0,§_-CD§);
         this.§_-V2q§.x = 10;
         this.§_-V2q§.y = -this.§_-V2q§.height / 4;
         this.§_-V2q§.mouseEnabled = false;
         addChild(this.§_-V2q§);
         this.§_-c1§ = new GoldenCupEmpty();
         this.§_-c1§.y = this.§_-J1W§.y = 20;
         addChild(this.§_-c1§);
         this.§_-XW§ = new §_-Hb§(this,"",false,true);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         if(§_-l1f§.§_-Pd§(§_-l1f§.§_-I13§))
         {
            §_-l1f§.§_-zk§(§_-l1f§.§_-I13§);
         }
      }
   }
}

