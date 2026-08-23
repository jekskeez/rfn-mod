package §_-I1W§
{
   import §_-62K§.§_-m18§;
   import §_-B25§.§_-RW§;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-K1X§;
   import §_-I10§.§_-a1D§;
   import §_-T2y§.§_-J2n§;
   import §_-a1W§.§_-F23§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.§_-w2v§;
   import views.§_-E8§;
   
   public class §_-Uy§ extends Sprite
   {
      
      private static const §_-m29§:int = 400;
      
      private static const §_-F2T§:int = 5;
      
      private static const §_-e14§:int = 27;
      
      private static const §_-mO§:int = 35;
      
      private static const §_-d1S§:int = 37;
      
      private static const §_-u18§:Array = [new GlowFilter(16777215,1,4,4,2)];
      
      private static const §_-E§:Array = [new GlowFilter(0,1,2,2,1)];
      
      private var §_-Za§:§_-22V§;
      
      private var §_-bA§:Sprite;
      
      private var §_-C2p§:Sprite;
      
      private var §_-Qr§:§_-22V§;
      
      private var §_-12K§:§_-22V§;
      
      private var §_-62U§:§_-w2v§;
      
      private var §_-up§:§_-F23§;
      
      private var §_-j2c§:int = 0;
      
      private var §_-mU§:§_-T2z§;
      
      private var §_-P1a§:§_-T2z§;
      
      private var §_-5c§:Number = 0;
      
      private var §_-b2O§:Sprite;
      
      private var §_-EE§:§_-G2L§;
      
      private var §_-t2f§:§_-F1F§;
      
      private var §_-q2L§:§_-F1F§;
      
      private var §_-U19§:§_-E8§;
      
      private var §_-81i§:§_-E8§;
      
      private var §_-O2M§:§_-RW§;
      
      private var §_-pm§:§_-m18§;
      
      private var passType:int = 3;
      
      public function §_-Uy§(param1:int)
      {
         super();
         this.passType = param1;
         this.§_-lc§();
         this.§_-m2m§();
         NuttyPassManager.addEventListener(NuttyPassManager.CHANGE,this.§_-d15§);
      }
      
      private function §_-lc§() : void
      {
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,§_-a1D§.§_-DG§(this.passType),true);
         this.§_-Za§ = new §_-22V§(gls("Ореховый Пропуск"),0,-2,_loc1_);
         this.§_-Za§.filters = §_-u18§;
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
         }],§_-m29§);
         addChild(this.§_-62U§);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,16777215,true);
         this.§_-12K§ = new §_-22V§("0/0",0,0,_loc2_);
         this.§_-12K§.filters = §_-E§;
         addChild(this.§_-12K§);
         var _loc3_:Class = §_-a1D§.§_-1A§(this.passType);
         this.§_-bA§ = new _loc3_() as Sprite;
         addChild(this.§_-bA§);
         this.§_-C2p§ = new Sprite();
         this.§_-i1H§(this.§_-C2p§);
         addChild(this.§_-C2p§);
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,16777215);
         this.§_-Qr§ = new §_-22V§("1",0,0,_loc4_);
         this.§_-C2p§.addChild(this.§_-Qr§);
         this.§_-up§ = new §_-F23§();
         this.§_-j2c§ = NuttyPassManager.§_-R2B§(this.passType);
         this.§_-up§.§_-hk§(§_-K1X§.§_-T1I§,this.§_-j2c§);
         addChild(this.§_-up§);
         var _loc5_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,12,16777215);
         this.§_-mU§ = new §_-T2z§(gls("Активный"),[_loc5_,_loc5_,_loc5_],ButtonNuttyPassBought,3,-2);
         this.§_-mU§.mouseEnabled = false;
         addChild(this.§_-mU§);
         var _loc6_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,12,6305554);
         this.§_-P1a§ = new §_-T2z§(gls("Открыть"),[_loc6_,_loc6_,_loc6_],ButtonBuyNuttyPass,3,-4);
         this.§_-P1a§.addEventListener(MouseEvent.CLICK,this.§_-02Z§);
         addChild(this.§_-P1a§);
         this.§_-Q7§();
      }
      
      private function §_-m2m§() : void
      {
         this.§_-b2O§ = new Sprite();
         this.§_-b2O§.graphics.beginFill(16774885,1);
         this.§_-b2O§.graphics.lineStyle(3,15522236);
         this.§_-b2O§.graphics.drawRect(4.5,0,400,315);
         this.§_-b2O§.graphics.endFill();
         addChild(this.§_-b2O§);
         this.§_-O2M§ = new §_-RW§();
         this.§_-O2M§.x = 7;
         this.§_-O2M§.passType = this.passType;
         addChild(this.§_-O2M§);
         this.§_-pm§ = new §_-m18§();
         this.§_-pm§.x = 7;
         this.§_-pm§.visible = false;
         this.§_-pm§.§_-t21§(this.§_-bA§);
         this.§_-pm§.passType = this.passType;
         addChild(this.§_-pm§);
         this.§_-EE§ = new §_-G2L§();
         this.§_-EE§.x = 0;
         this.§_-EE§.y = this.§_-5c§;
         addChild(this.§_-EE§);
         this.§_-t2f§ = new §_-F1F§(new §_-T2z§(gls("Награды"),§_-J2n§.§_-HM§,ButtonNuttyPassTabDouble,10,0));
         this.§_-EE§.insert(this.§_-t2f§,this.§_-O2M§);
         this.§_-U19§ = new §_-E8§(this.§_-t2f§,this.§_-t2f§.width - 18,5);
         this.§_-q2L§ = new §_-F1F§(new §_-T2z§(gls("Задания"),§_-J2n§.§_-HM§,ButtonNuttyPassTabDouble,10,0));
         this.§_-q2L§.x = this.§_-EE§.§_-Y2N§[0].width + 3;
         this.§_-EE§.insert(this.§_-q2L§,this.§_-pm§);
         this.§_-81i§ = new §_-E8§(this.§_-q2L§,this.§_-q2L§.width - 18,5);
         this.§_-mt§();
         this.§_-O2M§.y = this.§_-EE§.y + this.§_-EE§.height + 1;
         this.§_-pm§.y = this.§_-O2M§.y;
         this.§_-b2O§.y = this.§_-EE§.y + this.§_-EE§.height - 1;
         this.§_-EE§.§_-32c§(this.§_-t2f§);
      }
      
      private function §_-i1H§(param1:Sprite) : void
      {
         var _loc2_:Number = §_-e14§ * 0.5;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(§_-a1D§.§_-DG§(this.passType));
         _loc3_.graphics.drawCircle(_loc2_,_loc2_,_loc2_);
         _loc3_.graphics.endFill();
         param1.addChild(_loc3_);
      }
      
      private function §_-f1a§() : void
      {
         this.§_-Za§.x = (§_-m29§ - this.§_-Za§.width) * 0.5;
         var _loc1_:int = this.§_-Za§.y + this.§_-Za§.height + 8;
         this.§_-bA§.x = §_-F2T§;
         this.§_-bA§.y = _loc1_;
         this.§_-C2p§.x = §_-m29§ - 22;
         this.§_-C2p§.y = _loc1_;
         var _loc2_:Number = this.§_-bA§.x + this.§_-bA§.width - §_-F2T§;
         var _loc3_:Number = this.§_-C2p§.x + §_-e14§ * 0.5;
         var _loc4_:Number = Math.max(1,_loc3_ - _loc2_);
         this.§_-62U§.x = _loc2_;
         this.§_-62U§.scaleX = 1;
         var _loc5_:Number = this.§_-62U§.width;
         this.§_-62U§.scaleX = _loc4_ / _loc5_;
         this.§_-62U§.y = _loc1_ + (this.§_-bA§.height - this.§_-62U§.height) * 0.5;
         this.§_-Qr§.x = (§_-e14§ - this.§_-Qr§.width) * 0.5;
         this.§_-Qr§.y = (§_-e14§ - this.§_-Qr§.height - 2) * 0.5;
         var _loc6_:Number = _loc2_ + _loc4_ * 0.5;
         var _loc7_:Number = this.§_-12K§.textWidth + 5;
         this.§_-12K§.x = _loc6_ - _loc7_ * 0.5;
         this.§_-12K§.y = this.§_-62U§.y + (this.§_-62U§.height - this.§_-12K§.height) * 0.5;
         var _loc8_:int = this.§_-62U§.y + this.§_-62U§.height;
         var _loc9_:int = 10;
         var _loc10_:int = _loc8_ + _loc9_;
         var _loc11_:int = Math.max(this.§_-up§.height,this.§_-P1a§.height);
         this.§_-up§.x = §_-mO§;
         this.§_-up§.y = _loc10_ + (_loc11_ - this.§_-up§.height) * 0.5;
         this.§_-mU§.x = §_-m29§ - this.§_-P1a§.width - §_-d1S§;
         this.§_-mU§.y = _loc10_ + 5 + (_loc11_ - this.§_-P1a§.height) * 0.5;
         this.§_-P1a§.x = this.§_-mU§.x;
         this.§_-P1a§.y = this.§_-mU§.y;
         this.§_-5c§ = _loc10_ + _loc11_ + _loc9_;
      }
      
      private function §_-N2§(param1:int) : int
      {
         var _loc2_:Object = null;
         for each(_loc2_ in NuttyPassManager.§_-F1r§(this.passType))
         {
            if(_loc2_.level + 1 == param1)
            {
               return int(_loc2_.points) || 0;
            }
         }
         return 0;
      }
      
      private function §_-Q7§() : void
      {
         this.§_-Za§.text = §_-a1D§.§_-hY§(this.passType);
         var _loc1_:int = Math.max(1,NuttyPassManager.§_-A1x§(this.passType));
         this.§_-Qr§.text = String(_loc1_);
         var _loc2_:int = Math.max(1,this.§_-N2§(_loc1_ + 1));
         var _loc3_:int = Math.max(0,Math.min(NuttyPassManager.§_-NY§(this.passType),_loc2_));
         this.§_-12K§.text = _loc3_ == _loc2_ ? gls("Максимальный уровень") : _loc3_ + "/" + _loc2_;
         this.§_-62U§.§_-B1n§(_loc3_,_loc2_);
         this.§_-mU§.visible = NuttyPassManager.§_-pU§(this.passType);
         this.§_-P1a§.visible = !this.§_-mU§.visible && NuttyPassManager.§_-U28§(this.passType);
         this.§_-f1a§();
      }
      
      private function §_-d15§(param1:Event) : void
      {
         var _loc2_:int = NuttyPassManager.§_-R2B§(this.passType);
         if(_loc2_ != this.§_-j2c§)
         {
            this.§_-j2c§ = _loc2_;
            this.§_-up§.§_-hk§(§_-K1X§.§_-T1I§,_loc2_);
         }
         this.§_-Q7§();
         this.§_-mt§();
         this.§_-O2M§.§_-f19§();
         this.§_-pm§.§_-f19§();
      }
      
      private function §_-mt§() : void
      {
         if(this.§_-U19§)
         {
            this.§_-U19§.active = NuttyPassManager.§_-11M§(this.passType);
         }
         if(this.§_-81i§)
         {
            this.§_-81i§.active = NuttyPassManager.§_-o1r§(this.passType);
         }
      }
      
      private function §_-02Z§(param1:MouseEvent) : void
      {
         NuttyPassManager.§_-Yd§(this.passType);
      }
   }
}

