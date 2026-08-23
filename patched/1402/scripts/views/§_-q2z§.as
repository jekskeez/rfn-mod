package views
{
   import §_-S1n§.§_-bs§;
   import §_-U19§.§_-F2Y§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-8p§;
   
   public class §_-q2z§ extends Sprite
   {
      
      private var §_-hX§:§_-8p§ = null;
      
      private var §_-o1a§:§_-i5§ = null;
      
      private var §_-h2n§:ClanExpLimitView = null;
      
      private var §_-D2w§:§_-i5§ = null;
      
      private var §_-oj§:§_-bs§ = null;
      
      public function §_-q2z§()
      {
         super();
         this.init();
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         if(this.§_-oj§ != null)
         {
            this.§_-oj§.remove();
         }
         this.§_-oj§ = new §_-bs§(this,param1,param2,param3,param4,param5);
         var _loc6_:int = param1 / param3 * 100;
         this.§_-o1a§.text = param2 != §_-F2Y§.MAX_LEVEL ? _loc6_ + "%" : "100%";
         this.§_-D2w§.text = String(param2);
         var _loc7_:Number = (param1 - param4 + param5) / param3;
         this.§_-h2n§.visible = _loc7_ <= 1;
         this.§_-hX§.§_-d1Z§(param2 != §_-F2Y§.MAX_LEVEL ? param1 : param3,param3);
         if(param4 == param5 || param2 == §_-F2Y§.MAX_LEVEL)
         {
            this.§_-h2n§.x = 21 + this.§_-hX§.§_-V1R§;
         }
         else
         {
            this.§_-h2n§.x = 21 + _loc7_ * (this.§_-hX§.width - 27);
         }
      }
      
      private function init() : void
      {
         var _loc1_:TextFormat = new TextFormat(null,15,5195027,true);
         _loc1_.align = TextFormatAlign.CENTER;
         this.§_-o1a§ = new §_-i5§("",40,4,_loc1_);
         this.§_-o1a§.width = 136;
         this.§_-o1a§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-o1a§);
         var _loc2_:TextFormat = new TextFormat(null,14,3943185,true);
         _loc2_.align = TextFormatAlign.CENTER;
         this.§_-D2w§ = new §_-i5§("",185,5,_loc2_);
         this.§_-D2w§.width = 24;
         this.§_-D2w§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-D2w§.filters = [new GlowFilter(16776960,1,3,3,3)];
         addChild(this.§_-D2w§);
         this.§_-h2n§ = new ClanExpLimitView();
         this.§_-h2n§.visible = false;
         this.§_-h2n§.y = 5;
         addChild(this.§_-h2n§);
         this.§_-hX§ = new §_-8p§([{
            "image":new BackgroundClanExpView(),
            "X":0,
            "Y":0
         },{
            "image":new ClanExpActiveBarImage(),
            "X":25,
            "Y":7
         },{
            "image":new ClanExpActiveBarImage(),
            "X":25,
            "Y":7
         }],82,true);
         addChildAt(this.§_-hX§,0);
      }
   }
}

