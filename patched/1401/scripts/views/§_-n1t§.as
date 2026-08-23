package views
{
   import §_-dc§.§_-F§;
   import §_-e1G§.§_-k2R§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-w2v§;
   
   public class §_-n1t§ extends Sprite
   {
      
      private var §_-Y1t§:§_-w2v§ = null;
      
      private var §_-V1k§:§_-22V§ = null;
      
      private var §_-21Y§:ClanExpLimitView = null;
      
      private var §_-Qr§:§_-22V§ = null;
      
      private var §_-XW§:§_-k2R§ = null;
      
      public function §_-n1t§()
      {
         super();
         this.init();
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         if(this.§_-XW§ != null)
         {
            this.§_-XW§.remove();
         }
         this.§_-XW§ = new §_-k2R§(this,param1,param2,param3,param4,param5);
         var _loc6_:int = param1 / param3 * 100;
         this.§_-V1k§.text = param2 != §_-F§.MAX_LEVEL ? _loc6_ + "%" : "100%";
         this.§_-Qr§.text = String(param2);
         var _loc7_:Number = (param1 - param4 + param5) / param3;
         this.§_-21Y§.visible = _loc7_ <= 1;
         this.§_-Y1t§.§_-B1n§(param2 != §_-F§.MAX_LEVEL ? param1 : param3,param3);
         if(param4 == param5 || param2 == §_-F§.MAX_LEVEL)
         {
            this.§_-21Y§.x = 21 + this.§_-Y1t§.§_-U2o§;
         }
         else
         {
            this.§_-21Y§.x = 21 + _loc7_ * (this.§_-Y1t§.width - 27);
         }
      }
      
      private function init() : void
      {
         var _loc1_:TextFormat = new TextFormat(null,15,5195027,true);
         _loc1_.align = TextFormatAlign.CENTER;
         this.§_-V1k§ = new §_-22V§("",40,4,_loc1_);
         this.§_-V1k§.width = 136;
         this.§_-V1k§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-V1k§);
         var _loc2_:TextFormat = new TextFormat(null,14,3943185,true);
         _loc2_.align = TextFormatAlign.CENTER;
         this.§_-Qr§ = new §_-22V§("",185,5,_loc2_);
         this.§_-Qr§.width = 24;
         this.§_-Qr§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-Qr§.filters = [new GlowFilter(16776960,1,3,3,3)];
         addChild(this.§_-Qr§);
         this.§_-21Y§ = new ClanExpLimitView();
         this.§_-21Y§.visible = false;
         this.§_-21Y§.y = 5;
         addChild(this.§_-21Y§);
         this.§_-Y1t§ = new §_-w2v§([{
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
         addChildAt(this.§_-Y1t§,0);
      }
   }
}

