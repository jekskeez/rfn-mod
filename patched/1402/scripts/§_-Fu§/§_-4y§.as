package §_-Fu§
{
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-z9§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.§_-8p§;
   import utils.§_-o1Q§;
   
   public class §_-4y§ extends Sprite
   {
      
      public static const WIDTH:int = 385;
      
      public static const §_-i2u§:int = 68;
      
      private static const §_-e2n§:int = 38;
      
      private static const §_-l2q§:GlowFilter = new GlowFilter(0,1,2,2,1);
      
      private static const §_-al§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,6570780,true);
      
      private static const §_-1d§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16777215,true);
      
      private var §_-03A§:§_-i5§;
      
      private var §_-11b§:§_-8p§;
      
      private var §_-6m§:§_-i5§;
      
      private var §_-31o§:Sprite;
      
      private var §_-J2N§:§_-i5§;
      
      private var §_-03O§:§_-i5§;
      
      private var §_-42g§:Shape;
      
      private var §_-02p§:§_-K2G§;
      
      private var passType:int;
      
      private var §_-B2E§:int = 0;
      
      private var §_-jV§:int = 0;
      
      private var §_-G2e§:DisplayObject;
      
      public function §_-4y§(param1:int)
      {
         super();
         this.passType = param1;
         this.§_-G23§();
      }
      
      public function §_-mq§(param1:DisplayObject) : void
      {
         this.§_-G2e§ = param1;
      }
      
      public function setData(param1:Object, param2:Boolean, param3:int) : void
      {
         this.passType = param3;
         this.§_-B2E§ = param1.id;
         this.alpha = param2 ? 0.55 : 1;
         this.§_-03A§.text = param1.title;
         this.§_-11b§.§_-d1Z§(param1.value,param1.max);
         this.§_-6m§.text = param1.value + "/" + param1.max;
         this.§_-6m§.x = (this.§_-11b§.width - this.§_-6m§.width) * 0.5;
         this.§_-6m§.y = (this.§_-11b§.height - this.§_-6m§.height) * 0.5;
         var _loc4_:Object = §_-z9§.§_-SC§(§_-z9§.§_-H2D§);
         var _loc5_:int = _loc4_ ? int(_loc4_.rate) : 0;
         var _loc6_:Boolean = _loc5_ > 1 && param1.reward > 0;
         this.§_-jV§ = param1.reward > 0 ? (_loc6_ ? int(param1.reward * _loc5_) : int(param1.reward)) : 0;
         this.§_-J2N§.text = String(_loc6_ ? param1.reward * _loc5_ : param1.reward);
         this.§_-31o§.x = WIDTH - this.§_-31o§.width - 14;
         this.§_-J2N§.x = this.§_-31o§.x - this.§_-J2N§.width - 2;
         var _loc7_:Boolean = Boolean(param1.completed) && !param2;
         this.§_-02p§.visible = _loc7_;
         this.§_-31o§.y = _loc7_ ? this.§_-02p§.y - this.§_-31o§.height - 4 : §_-e2n§;
         this.§_-J2N§.y = this.§_-31o§.y - 2 + (this.§_-31o§.height - this.§_-J2N§.height) * 0.5;
         this.§_-42g§.graphics.clear();
         this.§_-03O§.visible = this.§_-42g§.visible = _loc6_ && !_loc7_;
         if(!_loc6_)
         {
            return;
         }
         this.§_-03O§.text = param1.reward;
         this.§_-03O§.x = this.§_-J2N§.x + (this.§_-J2N§.width - this.§_-03O§.width) * 0.5;
         this.§_-03O§.y = this.§_-J2N§.y - this.§_-03O§.height + 2;
         this.§_-42g§.graphics.lineStyle(2,13378082);
         this.§_-42g§.graphics.moveTo(this.§_-03O§.x + 2,this.§_-03O§.y + this.§_-03O§.height - 4);
         this.§_-42g§.graphics.lineTo(this.§_-03O§.x + this.§_-03O§.width - 2,this.§_-03O§.y + 4);
      }
      
      private function §_-G23§() : void
      {
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.lineStyle(1,16049098);
         _loc1_.graphics.drawRoundRect(0,0,WIDTH,§_-i2u§,7,7);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
         this.§_-03A§ = new §_-i5§("",14,8,§_-al§,WIDTH - 28);
         this.§_-03A§.multiline = true;
         this.§_-03A§.wordWrap = true;
         addChild(this.§_-03A§);
         this.§_-11b§ = new §_-8p§([{
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
         }],200);
         this.§_-11b§.x = 14;
         this.§_-11b§.y = 36;
         addChild(this.§_-11b§);
         this.§_-6m§ = new §_-i5§("",0,0,§_-1d§);
         this.§_-6m§.filters = [§_-l2q§];
         this.§_-11b§.addChild(this.§_-6m§);
         var _loc2_:Class = §_-C2b§.§_-K2T§(this.passType);
         this.§_-31o§ = new _loc2_();
         this.§_-31o§.scaleX = this.§_-31o§.scaleY = 16 / this.§_-31o§.width;
         addChild(this.§_-31o§);
         var _loc3_:int = §_-C2b§.§_-Sz§(this.passType);
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,_loc3_,true,null,null,null,null,"center");
         this.§_-03O§ = new §_-i5§("",0,§_-e2n§,_loc4_);
         this.§_-03O§.alpha = 0.5;
         addChild(this.§_-03O§);
         this.§_-42g§ = new Shape();
         addChild(this.§_-42g§);
         var _loc5_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,18,_loc3_,true,null,null,null,null,"center");
         this.§_-J2N§ = new §_-i5§("",0,§_-e2n§,_loc5_);
         addChild(this.§_-J2N§);
         this.§_-02p§ = new §_-K2G§(gls("Забрать"),90,14,this.§_-S1E§);
         this.§_-02p§.x = WIDTH - this.§_-02p§.width - 14;
         this.§_-02p§.y = 28;
         this.§_-02p§.visible = false;
         addChild(this.§_-02p§);
      }
      
      private function §_-S1E§(param1:MouseEvent = null) : void
      {
         if(param1)
         {
            param1.stopPropagation();
         }
         if(this.§_-B2E§ > 0)
         {
            §_-o1Q§.§_-43m§(this.§_-02p§,this.§_-jV§,this.§_-G2e§);
            NuttyPassManager.§_-T2D§(this.§_-B2E§,this.passType);
         }
      }
   }
}

