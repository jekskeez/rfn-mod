package §_-62K§
{
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-K1X§;
   import §_-I10§.§_-a1D§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.§_-r2N§;
   import utils.§_-w2v§;
   
   public class §_-D22§ extends Sprite
   {
      
      public static const WIDTH:int = 385;
      
      public static const §_-kI§:int = 68;
      
      private static const §_-E1q§:int = 38;
      
      private static const §_-51d§:GlowFilter = new GlowFilter(0,1,2,2,1);
      
      private static const §_-G1P§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,6570780,true);
      
      private static const §_-02z§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16777215,true);
      
      private var §_-Za§:§_-22V§;
      
      private var §_-k1g§:§_-w2v§;
      
      private var §_-Kb§:§_-22V§;
      
      private var §_-Z2t§:Sprite;
      
      private var §_-32B§:§_-22V§;
      
      private var §_-32C§:§_-22V§;
      
      private var §_-r1Z§:Shape;
      
      private var §_-q2r§:§_-j18§;
      
      private var passType:int;
      
      private var §_-d2B§:int = 0;
      
      private var §_-62f§:int = 0;
      
      private var §_-J2l§:DisplayObject;
      
      public function §_-D22§(param1:int)
      {
         super();
         this.passType = param1;
         this.§_-xE§();
      }
      
      public function §_-t21§(param1:DisplayObject) : void
      {
         this.§_-J2l§ = param1;
      }
      
      public function setData(param1:Object, param2:Boolean, param3:int) : void
      {
         this.passType = param3;
         this.§_-d2B§ = param1.id;
         this.alpha = param2 ? 0.55 : 1;
         this.§_-Za§.text = param1.title;
         this.§_-k1g§.§_-B1n§(param1.value,param1.max);
         this.§_-Kb§.text = param1.value + "/" + param1.max;
         this.§_-Kb§.x = (this.§_-k1g§.width - this.§_-Kb§.width) * 0.5;
         this.§_-Kb§.y = (this.§_-k1g§.height - this.§_-Kb§.height) * 0.5;
         var _loc4_:Object = §_-K1X§.§_-e1K§(§_-K1X§.§_-822§);
         var _loc5_:int = _loc4_ ? int(_loc4_.rate) : 0;
         var _loc6_:Boolean = _loc5_ > 1 && param1.reward > 0;
         this.§_-62f§ = param1.reward > 0 ? (_loc6_ ? int(param1.reward * _loc5_) : int(param1.reward)) : 0;
         this.§_-32B§.text = String(_loc6_ ? param1.reward * _loc5_ : param1.reward);
         this.§_-Z2t§.x = WIDTH - this.§_-Z2t§.width - 14;
         this.§_-32B§.x = this.§_-Z2t§.x - this.§_-32B§.width - 2;
         var _loc7_:Boolean = Boolean(param1.completed) && !param2;
         this.§_-q2r§.visible = _loc7_;
         this.§_-Z2t§.y = _loc7_ ? this.§_-q2r§.y - this.§_-Z2t§.height - 4 : §_-E1q§;
         this.§_-32B§.y = this.§_-Z2t§.y - 2 + (this.§_-Z2t§.height - this.§_-32B§.height) * 0.5;
         this.§_-r1Z§.graphics.clear();
         this.§_-32C§.visible = this.§_-r1Z§.visible = _loc6_ && !_loc7_;
         if(!_loc6_)
         {
            return;
         }
         this.§_-32C§.text = param1.reward;
         this.§_-32C§.x = this.§_-32B§.x + (this.§_-32B§.width - this.§_-32C§.width) * 0.5;
         this.§_-32C§.y = this.§_-32B§.y - this.§_-32C§.height + 2;
         this.§_-r1Z§.graphics.lineStyle(2,13378082);
         this.§_-r1Z§.graphics.moveTo(this.§_-32C§.x + 2,this.§_-32C§.y + this.§_-32C§.height - 4);
         this.§_-r1Z§.graphics.lineTo(this.§_-32C§.x + this.§_-32C§.width - 2,this.§_-32C§.y + 4);
      }
      
      private function §_-xE§() : void
      {
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.lineStyle(1,16049098);
         _loc1_.graphics.drawRoundRect(0,0,WIDTH,§_-kI§,7,7);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
         this.§_-Za§ = new §_-22V§("",14,8,§_-G1P§,WIDTH - 28);
         this.§_-Za§.multiline = true;
         this.§_-Za§.wordWrap = true;
         addChild(this.§_-Za§);
         this.§_-k1g§ = new §_-w2v§([{
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
         this.§_-k1g§.x = 14;
         this.§_-k1g§.y = 36;
         addChild(this.§_-k1g§);
         this.§_-Kb§ = new §_-22V§("",0,0,§_-02z§);
         this.§_-Kb§.filters = [§_-51d§];
         this.§_-k1g§.addChild(this.§_-Kb§);
         var _loc2_:Class = §_-a1D§.§_-1A§(this.passType);
         this.§_-Z2t§ = new _loc2_();
         this.§_-Z2t§.scaleX = this.§_-Z2t§.scaleY = 16 / this.§_-Z2t§.width;
         addChild(this.§_-Z2t§);
         var _loc3_:int = §_-a1D§.§_-DG§(this.passType);
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,_loc3_,true,null,null,null,null,"center");
         this.§_-32C§ = new §_-22V§("",0,§_-E1q§,_loc4_);
         this.§_-32C§.alpha = 0.5;
         addChild(this.§_-32C§);
         this.§_-r1Z§ = new Shape();
         addChild(this.§_-r1Z§);
         var _loc5_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,18,_loc3_,true,null,null,null,null,"center");
         this.§_-32B§ = new §_-22V§("",0,§_-E1q§,_loc5_);
         addChild(this.§_-32B§);
         this.§_-q2r§ = new §_-j18§(gls("Забрать"),90,14,this.§_-X1e§);
         this.§_-q2r§.x = WIDTH - this.§_-q2r§.width - 14;
         this.§_-q2r§.y = 28;
         this.§_-q2r§.visible = false;
         addChild(this.§_-q2r§);
      }
      
      private function §_-X1e§(param1:MouseEvent = null) : void
      {
         if(param1)
         {
            param1.stopPropagation();
         }
         if(this.§_-d2B§ > 0)
         {
            §_-r2N§.§_-03M§(this.§_-q2r§,this.§_-62f§,this.§_-J2l§);
            NuttyPassManager.§_-A1E§(this.§_-d2B§,this.passType);
         }
      }
   }
}

