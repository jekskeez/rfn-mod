package §_-31v§
{
   import §_-8D§.§_-L2I§;
   import §_-D0§.§_-b1e§;
   import §_-Fu§.§_-8b§;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-z9§;
   import §_-c2C§.§_-j2f§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-uH§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.§_-8p§;
   import views.§_-O2q§;
   
   public class §_-G1L§ extends Sprite
   {
      
      private static const §_-92a§:int = 400;
      
      private static const §_-Ee§:int = 5;
      
      private static const §_-I1W§:int = 27;
      
      private static const §_-63q§:int = 35;
      
      private static const §_-01j§:int = 37;
      
      private static const §_-FU§:Array = [new GlowFilter(16777215,1,4,4,2)];
      
      private static const §_-43s§:Array = [new GlowFilter(0,1,2,2,1)];
      
      private var §_-03A§:§_-i5§;
      
      private var §_-sq§:Sprite;
      
      private var §_-D8§:Sprite;
      
      private var §_-D2w§:§_-i5§;
      
      private var §_-72i§:§_-i5§;
      
      private var §_-03B§:§_-8p§;
      
      private var §_-73R§:§_-L2I§;
      
      private var §_-d1u§:int = 0;
      
      private var §_-H2M§:§_-Q1W§;
      
      private var §_-e1f§:§_-Q1W§;
      
      private var §_-C3L§:Number = 0;
      
      private var §_-xs§:Sprite;
      
      private var §_-S8§:§_-Hg§;
      
      private var §_-j2n§:§_-uH§;
      
      private var §_-N25§:§_-uH§;
      
      private var §_-U2§:§_-O2q§;
      
      private var §_-S§:§_-O2q§;
      
      private var §_-KF§:§_-b1e§;
      
      private var §_-M2d§:§_-8b§;
      
      private var passType:int = 3;
      
      public function §_-G1L§(param1:int)
      {
         super();
         this.passType = param1;
         this.§_-V2j§();
         this.§_-H1N§();
         NuttyPassManager.addEventListener(NuttyPassManager.CHANGE,this.§_-B1v§);
      }
      
      private function §_-V2j§() : void
      {
         var _loc1_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,§_-C2b§.§_-Sz§(this.passType),true);
         this.§_-03A§ = new §_-i5§(gls("Ореховый Пропуск"),0,-2,_loc1_);
         this.§_-03A§.filters = §_-FU§;
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
         }],§_-92a§);
         addChild(this.§_-03B§);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,16777215,true);
         this.§_-72i§ = new §_-i5§("0/0",0,0,_loc2_);
         this.§_-72i§.filters = §_-43s§;
         addChild(this.§_-72i§);
         var _loc3_:Class = §_-C2b§.§_-K2T§(this.passType);
         this.§_-sq§ = new _loc3_() as Sprite;
         addChild(this.§_-sq§);
         this.§_-D8§ = new Sprite();
         this.§_-AT§(this.§_-D8§);
         addChild(this.§_-D8§);
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,16777215);
         this.§_-D2w§ = new §_-i5§("1",0,0,_loc4_);
         this.§_-D8§.addChild(this.§_-D2w§);
         this.§_-73R§ = new §_-L2I§();
         this.§_-d1u§ = NuttyPassManager.§_-d1l§(this.passType);
         this.§_-73R§.§_-y25§(§_-z9§.§_-bp§,this.§_-d1u§);
         addChild(this.§_-73R§);
         var _loc5_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,12,16777215);
         this.§_-H2M§ = new §_-Q1W§(gls("Активный"),[_loc5_,_loc5_,_loc5_],ButtonNuttyPassBought,3,-2);
         this.§_-H2M§.mouseEnabled = false;
         addChild(this.§_-H2M§);
         var _loc6_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,12,6305554);
         this.§_-e1f§ = new §_-Q1W§(gls("Открыть"),[_loc6_,_loc6_,_loc6_],ButtonBuyNuttyPass,3,-4);
         this.§_-e1f§.addEventListener(MouseEvent.CLICK,this.§_-ai§);
         addChild(this.§_-e1f§);
         this.§_-B6§();
      }
      
      private function §_-H1N§() : void
      {
         this.§_-xs§ = new Sprite();
         this.§_-xs§.graphics.beginFill(16774885,1);
         this.§_-xs§.graphics.lineStyle(3,15522236);
         this.§_-xs§.graphics.drawRect(4.5,0,400,315);
         this.§_-xs§.graphics.endFill();
         addChild(this.§_-xs§);
         this.§_-KF§ = new §_-b1e§();
         this.§_-KF§.x = 7;
         this.§_-KF§.passType = this.passType;
         addChild(this.§_-KF§);
         this.§_-M2d§ = new §_-8b§();
         this.§_-M2d§.x = 7;
         this.§_-M2d§.visible = false;
         this.§_-M2d§.§_-mq§(this.§_-sq§);
         this.§_-M2d§.passType = this.passType;
         addChild(this.§_-M2d§);
         this.§_-S8§ = new §_-Hg§();
         this.§_-S8§.x = 0;
         this.§_-S8§.y = this.§_-C3L§;
         addChild(this.§_-S8§);
         this.§_-j2n§ = new §_-uH§(new §_-Q1W§(gls("Награды"),§_-j2f§.§_-D12§,ButtonNuttyPassTabDouble,10,0));
         this.§_-S8§.insert(this.§_-j2n§,this.§_-KF§);
         this.§_-U2§ = new §_-O2q§(this.§_-j2n§,this.§_-j2n§.width - 18,5);
         this.§_-N25§ = new §_-uH§(new §_-Q1W§(gls("Задания"),§_-j2f§.§_-D12§,ButtonNuttyPassTabDouble,10,0));
         this.§_-N25§.x = this.§_-S8§.§_-a3§[0].width + 3;
         this.§_-S8§.insert(this.§_-N25§,this.§_-M2d§);
         this.§_-S§ = new §_-O2q§(this.§_-N25§,this.§_-N25§.width - 18,5);
         this.§_-g23§();
         this.§_-KF§.y = this.§_-S8§.y + this.§_-S8§.height + 1;
         this.§_-M2d§.y = this.§_-KF§.y;
         this.§_-xs§.y = this.§_-S8§.y + this.§_-S8§.height - 1;
         this.§_-S8§.§_-l1Y§(this.§_-j2n§);
      }
      
      private function §_-AT§(param1:Sprite) : void
      {
         var _loc2_:Number = §_-I1W§ * 0.5;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(§_-C2b§.§_-Sz§(this.passType));
         _loc3_.graphics.drawCircle(_loc2_,_loc2_,_loc2_);
         _loc3_.graphics.endFill();
         param1.addChild(_loc3_);
      }
      
      private function §_-l5§() : void
      {
         this.§_-03A§.x = (§_-92a§ - this.§_-03A§.width) * 0.5;
         var _loc1_:int = this.§_-03A§.y + this.§_-03A§.height + 8;
         this.§_-sq§.x = §_-Ee§;
         this.§_-sq§.y = _loc1_;
         this.§_-D8§.x = §_-92a§ - 22;
         this.§_-D8§.y = _loc1_;
         var _loc2_:Number = this.§_-sq§.x + this.§_-sq§.width - §_-Ee§;
         var _loc3_:Number = this.§_-D8§.x + §_-I1W§ * 0.5;
         var _loc4_:Number = Math.max(1,_loc3_ - _loc2_);
         this.§_-03B§.x = _loc2_;
         this.§_-03B§.scaleX = 1;
         var _loc5_:Number = this.§_-03B§.width;
         this.§_-03B§.scaleX = _loc4_ / _loc5_;
         this.§_-03B§.y = _loc1_ + (this.§_-sq§.height - this.§_-03B§.height) * 0.5;
         this.§_-D2w§.x = (§_-I1W§ - this.§_-D2w§.width) * 0.5;
         this.§_-D2w§.y = (§_-I1W§ - this.§_-D2w§.height - 2) * 0.5;
         var _loc6_:Number = _loc2_ + _loc4_ * 0.5;
         var _loc7_:Number = this.§_-72i§.textWidth + 5;
         this.§_-72i§.x = _loc6_ - _loc7_ * 0.5;
         this.§_-72i§.y = this.§_-03B§.y + (this.§_-03B§.height - this.§_-72i§.height) * 0.5;
         var _loc8_:int = this.§_-03B§.y + this.§_-03B§.height;
         var _loc9_:int = 10;
         var _loc10_:int = _loc8_ + _loc9_;
         var _loc11_:int = Math.max(this.§_-73R§.height,this.§_-e1f§.height);
         this.§_-73R§.x = §_-63q§;
         this.§_-73R§.y = _loc10_ + (_loc11_ - this.§_-73R§.height) * 0.5;
         this.§_-H2M§.x = §_-92a§ - this.§_-e1f§.width - §_-01j§;
         this.§_-H2M§.y = _loc10_ + 5 + (_loc11_ - this.§_-e1f§.height) * 0.5;
         this.§_-e1f§.x = this.§_-H2M§.x;
         this.§_-e1f§.y = this.§_-H2M§.y;
         this.§_-C3L§ = _loc10_ + _loc11_ + _loc9_;
      }
      
      private function §_-t1N§(param1:int) : int
      {
         var _loc2_:Object = null;
         for each(_loc2_ in NuttyPassManager.§_-V2L§(this.passType))
         {
            if(_loc2_.level + 1 == param1)
            {
               return int(_loc2_.points) || 0;
            }
         }
         return 0;
      }
      
      private function §_-B6§() : void
      {
         this.§_-03A§.text = §_-C2b§.§_-S14§(this.passType);
         var _loc1_:int = Math.max(1,NuttyPassManager.§_-82P§(this.passType));
         this.§_-D2w§.text = String(_loc1_);
         var _loc2_:int = Math.max(1,this.§_-t1N§(_loc1_ + 1));
         var _loc3_:int = Math.max(0,Math.min(NuttyPassManager.§_-NZ§(this.passType),_loc2_));
         this.§_-72i§.text = _loc3_ == _loc2_ ? gls("Максимальный уровень") : _loc3_ + "/" + _loc2_;
         this.§_-03B§.§_-d1Z§(_loc3_,_loc2_);
         this.§_-H2M§.visible = NuttyPassManager.§_-M2X§(this.passType);
         this.§_-e1f§.visible = !this.§_-H2M§.visible && NuttyPassManager.§_-13X§(this.passType);
         this.§_-l5§();
      }
      
      private function §_-B1v§(param1:Event) : void
      {
         var _loc2_:int = NuttyPassManager.§_-d1l§(this.passType);
         if(_loc2_ != this.§_-d1u§)
         {
            this.§_-d1u§ = _loc2_;
            this.§_-73R§.§_-y25§(§_-z9§.§_-bp§,_loc2_);
         }
         this.§_-B6§();
         this.§_-g23§();
         this.§_-KF§.§_-iJ§();
         this.§_-M2d§.§_-iJ§();
      }
      
      private function §_-g23§() : void
      {
         if(this.§_-U2§)
         {
            this.§_-U2§.active = NuttyPassManager.§_-94§(this.passType);
         }
         if(this.§_-S§)
         {
            this.§_-S§.active = NuttyPassManager.§_-s15§(this.passType);
         }
      }
      
      private function §_-ai§(param1:MouseEvent) : void
      {
         NuttyPassManager.§_-L2Y§(this.passType);
      }
   }
}

