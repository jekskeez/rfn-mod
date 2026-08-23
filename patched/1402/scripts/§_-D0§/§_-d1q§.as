package §_-D0§
{
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-f4§;
   import §_-u1R§.§_-g1m§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.§_-8p§;
   import utils.§_-K1Y§;
   import utils.§_-o1Q§;
   
   public class §_-d1q§ extends Sprite
   {
      
      public static const §_-i2u§:int = 125;
      
      private static const WIDTH:int = 395;
      
      private static const §_-u2d§:int = 5;
      
      private static const §_-417§:int = 55;
      
      private static const §_-619§:int = 170;
      
      private static const §_-k21§:int = 45;
      
      private static const §_-43s§:Array = [new GlowFilter(0,1,2,2,1)];
      
      private static const §_-eo§:Array = [new GlowFilter(0,1,4,4,1,2)];
      
      private var bg:Sprite;
      
      private var §_-V1o§:Sprite;
      
      private var §_-03B§:§_-8p§;
      
      private var §_-6m§:§_-i5§;
      
      private var §_-40§:DisplayObject;
      
      private var §_-sq§:Sprite;
      
      private var §_-s1M§:Sprite;
      
      private var §_-03A§:§_-i5§;
      
      private var §_-f1X§:§_-i5§;
      
      private var §_-S1o§:§_-i5§;
      
      private var §_-42j§:§_-K2G§;
      
      private var passType:int = 0;
      
      private var rewardId:int = 0;
      
      private var §_-Z1m§:Object;
      
      public function §_-d1q§()
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
            this.§_-P2A§();
            this.§_-R2Q§();
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
         this.§_-03B§.§_-d1Z§(_loc9_,_loc7_,0);
         this.§_-6m§.text = _loc9_ + "/" + _loc7_;
         this.§_-s1o§();
         this.rewardId = param4.rewardId;
         this.§_-Z1m§ = param4;
         this.§_-f1X§.text = gls("Зарабатывай очки {0} и получай {1}  -",§_-C2b§.§_-Gq§(param1),param4.count);
         this.§_-f1X§.y = 76;
         §_-K1Y§.§_-y2p§(this.§_-f1X§,"-",new §_-g1m§(param4.type,param4.id),0.55,0.55,-this.§_-f1X§.x,-this.§_-f1X§.y - 1,false);
         this.§_-S1o§.text = gls("Доступно после достижения {0} уровня",param3);
         this.§_-S1o§.y = 92;
         this.§_-S1o§.visible = !_loc8_;
         this.§_-40§.visible = !_loc8_;
         var _loc10_:Boolean = _loc8_ && §_-f4§.§_-a1M§(this.rewardId);
         this.§_-42j§.visible = _loc10_;
      }
      
      private function init() : void
      {
         this.bg = new Sprite();
         addChild(this.bg);
         this.§_-V1o§ = new Sprite();
         addChild(this.§_-V1o§);
         var _loc1_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,17,16777215,true,null,null,null,null,"center");
         this.§_-03A§ = new §_-i5§(gls("Бесконечный сундук"),0,6,_loc1_,WIDTH);
         addChild(this.§_-03A§);
         this.§_-03B§ = new §_-8p§([{
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
         }],§_-619§);
         addChild(this.§_-03B§);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,16777215,true);
         this.§_-6m§ = new §_-i5§("",0,0,_loc2_);
         this.§_-6m§.mouseEnabled = false;
         this.§_-6m§.filters = §_-43s§;
         addChild(this.§_-6m§);
         this.§_-40§ = new ImageIconNuttyPassLock();
         this.§_-40§.filters = §_-eo§;
         addChild(this.§_-40§);
         this.§_-s1M§ = new ImageIconNuttyPassChest();
         this.§_-s1M§.scaleX = this.§_-s1M§.scaleY = 35 / Math.max(this.§_-s1M§.width,this.§_-s1M§.height);
         addChild(this.§_-s1M§);
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,16777215,true,null,null,null,null,"center");
         this.§_-f1X§ = new §_-i5§("",0,0,_loc3_,WIDTH);
         addChild(this.§_-f1X§);
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-c10§,9,16777215,true,null,null,null,null,"center");
         this.§_-S1o§ = new §_-i5§("",0,0,_loc4_,WIDTH);
         addChild(this.§_-S1o§);
         this.§_-42j§ = new §_-K2G§(gls("Забрать"),95,13,this.§_-j2l§);
         this.§_-42j§.scaleX = this.§_-42j§.scaleY = 0.8;
         this.§_-42j§.x = (WIDTH - this.§_-42j§.width) * 0.5;
         this.§_-42j§.y = §_-i2u§ - this.§_-42j§.height - 8;
         this.§_-42j§.visible = false;
         addChild(this.§_-42j§);
      }
      
      private function drawBackground() : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginFill(§_-C2b§.§_-Sz§(this.passType));
         this.bg.graphics.drawRoundRectComplex(0,0,WIDTH,§_-i2u§,5,5,0,0);
         this.bg.graphics.endFill();
      }
      
      private function §_-R2Q§() : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         this.§_-V1o§.graphics.clear();
         var _loc1_:Number = this.§_-s1M§.x + this.§_-s1M§.width * 0.5;
         var _loc2_:Number = this.§_-s1M§.y + this.§_-s1M§.height * 0.5;
         var _loc3_:Number = Math.PI / 9;
         var _loc4_:Number = 0.06;
         var _loc5_:int = 0;
         while(_loc5_ < 18)
         {
            _loc6_ = _loc5_ * _loc3_ + _loc4_;
            _loc7_ = _loc6_ + _loc3_ - _loc4_ * 2;
            _loc8_ = this.§_-33T§(_loc1_,_loc2_,_loc6_);
            _loc9_ = this.§_-33T§(_loc1_,_loc2_,_loc7_);
            this.§_-V1o§.graphics.beginFill(16777215,0.15);
            this.§_-V1o§.graphics.moveTo(_loc1_,_loc2_);
            this.§_-V1o§.graphics.lineTo(_loc8_.x,_loc8_.y);
            this.§_-V1o§.graphics.lineTo(_loc9_.x,_loc9_.y);
            this.§_-V1o§.graphics.endFill();
            _loc5_++;
         }
         this.§_-V1o§.graphics.beginFill(16777215,0.15);
         this.§_-V1o§.graphics.moveTo(0,0);
         this.§_-V1o§.graphics.lineTo(148,0);
         this.§_-V1o§.graphics.lineTo(0,35);
         this.§_-V1o§.graphics.lineTo(0,0);
         this.§_-V1o§.graphics.endFill();
         this.§_-V1o§.graphics.beginFill(16777215,0.15);
         this.§_-V1o§.graphics.moveTo(0,§_-i2u§);
         this.§_-V1o§.graphics.lineTo(97,§_-i2u§);
         this.§_-V1o§.graphics.lineTo(0,§_-i2u§ - 50);
         this.§_-V1o§.graphics.lineTo(0,§_-i2u§);
         this.§_-V1o§.graphics.endFill();
         this.§_-V1o§.graphics.beginFill(16777215,0.15);
         this.§_-V1o§.graphics.moveTo(WIDTH,§_-i2u§);
         this.§_-V1o§.graphics.lineTo(WIDTH - 16,§_-i2u§);
         this.§_-V1o§.graphics.lineTo(WIDTH,§_-i2u§ - 11);
         this.§_-V1o§.graphics.lineTo(WIDTH,§_-i2u§);
         this.§_-V1o§.graphics.endFill();
      }
      
      private function §_-P2A§() : void
      {
         if(Boolean(this.§_-sq§) && Boolean(this.§_-sq§.parent))
         {
            this.§_-sq§.parent.removeChild(this.§_-sq§);
         }
         var _loc1_:Class = §_-C2b§.§_-K2T§(this.passType);
         this.§_-sq§ = new _loc1_();
         this.§_-sq§.x = §_-k21§;
         this.§_-sq§.y = §_-417§ - this.§_-sq§.height * 0.5;
         addChild(this.§_-sq§);
         this.§_-s1M§.x = WIDTH - this.§_-s1M§.width - §_-k21§;
         this.§_-s1M§.y = §_-417§ - this.§_-s1M§.height * 0.5;
      }
      
      private function §_-s1o§() : void
      {
         var _loc1_:Number = this.§_-sq§.x + this.§_-sq§.width - §_-u2d§;
         var _loc2_:Number = this.§_-s1M§.x + this.§_-s1M§.width * 0.5;
         var _loc3_:Number = Math.max(1,_loc2_ - _loc1_);
         this.§_-03B§.scaleX = 1;
         this.§_-03B§.scaleX = _loc3_ / this.§_-03B§.width;
         this.§_-03B§.x = _loc1_;
         this.§_-03B§.y = §_-417§ - this.§_-03B§.height * 0.5;
         this.§_-6m§.x = _loc1_ + (_loc3_ - this.§_-6m§.width) * 0.5;
         this.§_-6m§.y = §_-417§ - this.§_-6m§.height * 0.5;
         this.§_-40§.x = _loc1_ + (_loc3_ - this.§_-40§.width) * 0.5;
         this.§_-40§.y = §_-417§ - this.§_-40§.height * 0.5;
      }
      
      private function §_-33T§(param1:Number, param2:Number, param3:Number) : Object
      {
         var _loc4_:Number = Math.cos(param3);
         var _loc5_:Number = Math.sin(param3);
         var _loc6_:Number = Math.sqrt(WIDTH * WIDTH + §_-i2u§ * §_-i2u§);
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
            _loc6_ = Math.min(_loc6_,(§_-i2u§ - param2) / _loc5_);
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
      
      private function §_-j2l§(param1:Event = null) : void
      {
         §_-o1Q§.§_-i1g§(this.§_-42j§,this.§_-Z1m§);
         §_-f4§.§_-6M§(this.rewardId);
      }
   }
}

