package §_-B25§
{
   import §_-H7§.§_-z1v§;
   import §_-I10§.§_-A29§;
   import §_-I10§.§_-a1D§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.§_-jB§;
   import utils.§_-r2N§;
   import utils.§_-w2v§;
   
   public class §_-JY§ extends Sprite
   {
      
      public static const §_-kI§:int = 125;
      
      private static const WIDTH:int = 395;
      
      private static const §_-5G§:int = 5;
      
      private static const §_-jt§:int = 55;
      
      private static const §_-A1w§:int = 170;
      
      private static const §_-T1N§:int = 45;
      
      private static const §_-E§:Array = [new GlowFilter(0,1,2,2,1)];
      
      private static const §_-M2X§:Array = [new GlowFilter(0,1,4,4,1,2)];
      
      private var bg:Sprite;
      
      private var §_-33N§:Sprite;
      
      private var §_-62U§:§_-w2v§;
      
      private var §_-Kb§:§_-22V§;
      
      private var §_-y1D§:DisplayObject;
      
      private var §_-bA§:Sprite;
      
      private var §_-U2j§:Sprite;
      
      private var §_-Za§:§_-22V§;
      
      private var §_-u9§:§_-22V§;
      
      private var §_-SX§:§_-22V§;
      
      private var §_-ZD§:§_-j18§;
      
      private var passType:int = 0;
      
      private var rewardId:int = 0;
      
      private var §_-V1h§:Object;
      
      public function §_-JY§()
      {
         super();
         this.init();
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:Object, param5:int, param6:int) : void
      {
         var _loc11_:int = 0;
         if(this.passType != param1)
         {
            this.passType = param1;
            this.§_-S1h§();
            this.§_-K2J§();
            this.drawBackground();
         }
         var _loc7_:int = Math.max(1,param2);
         var _loc8_:Boolean = param5 >= param3;
         var _loc9_:int = 0;
         if(_loc8_)
         {
            _loc11_ = param6 % _loc7_;
            _loc9_ = _loc11_ == 0 && param6 > 0 ? _loc7_ : _loc11_;
         }
         this.§_-62U§.§_-B1n§(_loc9_,_loc7_,0);
         this.§_-Kb§.text = _loc9_ + "/" + _loc7_;
         this.§_-M1F§();
         this.rewardId = param4.rewardId;
         this.§_-V1h§ = param4;
         this.§_-u9§.text = gls("Зарабатывай очки {0} и получай {1}  -",§_-a1D§.§_-vT§(param1),param4.count);
         this.§_-u9§.y = 76;
         §_-jB§.§_-Y1f§(this.§_-u9§,"-",new §_-z1v§(param4.type,param4.id),0.55,0.55,-this.§_-u9§.x,-this.§_-u9§.y - 1,false);
         this.§_-SX§.text = gls("Доступно после достижения {0} уровня",param3);
         this.§_-SX§.y = 92;
         this.§_-SX§.visible = !_loc8_;
         this.§_-y1D§.visible = !_loc8_;
         var _loc10_:Boolean = _loc8_ && §_-A29§.§_-nT§(this.rewardId);
         this.§_-ZD§.visible = _loc10_;
      }
      
      private function init() : void
      {
         this.bg = new Sprite();
         addChild(this.bg);
         this.§_-33N§ = new Sprite();
         addChild(this.§_-33N§);
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,17,16777215,true,null,null,null,null,"center");
         this.§_-Za§ = new §_-22V§(gls("Бесконечный сундук"),0,6,_loc1_,WIDTH);
         addChild(this.§_-Za§);
         this.§_-62U§ = new §_-w2v§([{
            "image":new BarQuestBack(),
            "X":0,
            "Y":0
         },{
            "image":new BarQuestActive(),
            "X":0,
            "Y":0
         },{
            "image":new BarQuestActive(),
            "X":0,
            "Y":0
         }],§_-A1w§);
         addChild(this.§_-62U§);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,16777215,true);
         this.§_-Kb§ = new §_-22V§("",0,0,_loc2_);
         this.§_-Kb§.mouseEnabled = false;
         this.§_-Kb§.filters = §_-E§;
         addChild(this.§_-Kb§);
         this.§_-y1D§ = new ImageIconNuttyPassLock();
         this.§_-y1D§.filters = §_-M2X§;
         addChild(this.§_-y1D§);
         this.§_-U2j§ = new ImageIconNuttyPassChest();
         this.§_-U2j§.scaleX = this.§_-U2j§.scaleY = 35 / Math.max(this.§_-U2j§.width,this.§_-U2j§.height);
         addChild(this.§_-U2j§);
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,16777215,true,null,null,null,null,"center");
         this.§_-u9§ = new §_-22V§("",0,0,_loc3_,WIDTH);
         addChild(this.§_-u9§);
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,9,16777215,true,null,null,null,null,"center");
         this.§_-SX§ = new §_-22V§("",0,0,_loc4_,WIDTH);
         addChild(this.§_-SX§);
         this.§_-ZD§ = new §_-j18§(gls("Забрать"),95,13,this.§_-E2Z§);
         this.§_-ZD§.scaleX = this.§_-ZD§.scaleY = 0.8;
         this.§_-ZD§.x = (WIDTH - this.§_-ZD§.width) * 0.5;
         this.§_-ZD§.y = §_-kI§ - this.§_-ZD§.height - 8;
         this.§_-ZD§.visible = false;
         addChild(this.§_-ZD§);
      }
      
      private function drawBackground() : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginFill(§_-a1D§.§_-DG§(this.passType));
         this.bg.graphics.drawRoundRectComplex(0,0,WIDTH,§_-kI§,5,5,0,0);
         this.bg.graphics.endFill();
      }
      
      private function §_-K2J§() : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         this.§_-33N§.graphics.clear();
         var _loc1_:Number = this.§_-U2j§.x + this.§_-U2j§.width * 0.5;
         var _loc2_:Number = this.§_-U2j§.y + this.§_-U2j§.height * 0.5;
         var _loc3_:Number = Math.PI / 9;
         var _loc4_:Number = 0.06;
         var _loc5_:int = 0;
         while(_loc5_ < 18)
         {
            _loc6_ = _loc5_ * _loc3_ + _loc4_;
            _loc7_ = _loc6_ + _loc3_ - _loc4_ * 2;
            _loc8_ = this.§_-zs§(_loc1_,_loc2_,_loc6_);
            _loc9_ = this.§_-zs§(_loc1_,_loc2_,_loc7_);
            this.§_-33N§.graphics.beginFill(16777215,0.15);
            this.§_-33N§.graphics.moveTo(_loc1_,_loc2_);
            this.§_-33N§.graphics.lineTo(_loc8_.x,_loc8_.y);
            this.§_-33N§.graphics.lineTo(_loc9_.x,_loc9_.y);
            this.§_-33N§.graphics.endFill();
            _loc5_++;
         }
         this.§_-33N§.graphics.beginFill(16777215,0.15);
         this.§_-33N§.graphics.moveTo(0,0);
         this.§_-33N§.graphics.lineTo(148,0);
         this.§_-33N§.graphics.lineTo(0,35);
         this.§_-33N§.graphics.lineTo(0,0);
         this.§_-33N§.graphics.endFill();
         this.§_-33N§.graphics.beginFill(16777215,0.15);
         this.§_-33N§.graphics.moveTo(0,§_-kI§);
         this.§_-33N§.graphics.lineTo(97,§_-kI§);
         this.§_-33N§.graphics.lineTo(0,§_-kI§ - 50);
         this.§_-33N§.graphics.lineTo(0,§_-kI§);
         this.§_-33N§.graphics.endFill();
         this.§_-33N§.graphics.beginFill(16777215,0.15);
         this.§_-33N§.graphics.moveTo(WIDTH,§_-kI§);
         this.§_-33N§.graphics.lineTo(WIDTH - 16,§_-kI§);
         this.§_-33N§.graphics.lineTo(WIDTH,§_-kI§ - 11);
         this.§_-33N§.graphics.lineTo(WIDTH,§_-kI§);
         this.§_-33N§.graphics.endFill();
      }
      
      private function §_-S1h§() : void
      {
         if(Boolean(this.§_-bA§) && Boolean(this.§_-bA§.parent))
         {
            this.§_-bA§.parent.removeChild(this.§_-bA§);
         }
         var _loc1_:Class = §_-a1D§.§_-1A§(this.passType);
         this.§_-bA§ = new _loc1_();
         this.§_-bA§.x = §_-T1N§;
         this.§_-bA§.y = §_-jt§ - this.§_-bA§.height * 0.5;
         addChild(this.§_-bA§);
         this.§_-U2j§.x = WIDTH - this.§_-U2j§.width - §_-T1N§;
         this.§_-U2j§.y = §_-jt§ - this.§_-U2j§.height * 0.5;
      }
      
      private function §_-M1F§() : void
      {
         var _loc1_:Number = this.§_-bA§.x + this.§_-bA§.width - §_-5G§;
         var _loc2_:Number = this.§_-U2j§.x + this.§_-U2j§.width * 0.5;
         var _loc3_:Number = Math.max(1,_loc2_ - _loc1_);
         this.§_-62U§.scaleX = 1;
         this.§_-62U§.scaleX = _loc3_ / this.§_-62U§.width;
         this.§_-62U§.x = _loc1_;
         this.§_-62U§.y = §_-jt§ - this.§_-62U§.height * 0.5;
         this.§_-Kb§.x = _loc1_ + (_loc3_ - this.§_-Kb§.width) * 0.5;
         this.§_-Kb§.y = §_-jt§ - this.§_-Kb§.height * 0.5;
         this.§_-y1D§.x = _loc1_ + (_loc3_ - this.§_-y1D§.width) * 0.5;
         this.§_-y1D§.y = §_-jt§ - this.§_-y1D§.height * 0.5;
      }
      
      private function §_-zs§(param1:Number, param2:Number, param3:Number) : Object
      {
         var _loc4_:Number = Math.cos(param3);
         var _loc5_:Number = Math.sin(param3);
         var _loc6_:Number = Math.sqrt(WIDTH * WIDTH + §_-kI§ * §_-kI§);
         if(_loc4_ > 0)
         {
            _loc6_ = Math.min(_loc6_,(WIDTH - param1) / _loc4_);
         }
         else if(_loc4_ < 0)
         {
            _loc6_ = Math.min(_loc6_,param1 / -_loc4_);
         }
         if(_loc5_ > 0)
         {
            _loc6_ = Math.min(_loc6_,(§_-kI§ - param2) / _loc5_);
         }
         else if(_loc5_ < 0)
         {
            _loc6_ = Math.min(_loc6_,param2 / -_loc5_);
         }
         return {
            "x":param1 + _loc4_ * _loc6_,
            "y":param2 + _loc5_ * _loc6_
         };
      }
      
      private function §_-E2Z§(param1:Event = null) : void
      {
         §_-r2N§.§_-73z§(this.§_-ZD§,this.§_-V1h§);
         §_-A29§.§_-A3l§(this.rewardId);
      }
   }
}

