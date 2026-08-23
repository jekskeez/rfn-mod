package §_-xm§
{
   import §_-42B§.TweenMax;
   import §_-T2y§.§_-71o§;
   import §_-Y22§.§_-E1J§;
   import §_-k1c§.§_-b2z§;
   import flash.text.StyleSheet;
   import flash.utils.setTimeout;
   
   public class §_-n29§ extends §_-b2z§
   {
      
      private static const §_-g1S§:int = 5000;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #432104;","text-align: center;","}",".caption {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","color: #FF0000;","font-size: 17px;","font-weight: bold;","}"].join("\n");
      
      private static var _instance:§_-n29§ = null;
      
      private var §_-92§:§_-22V§ = null;
      
      private var tween:TweenMax = null;
      
      public function §_-n29§(param1:String)
      {
         if(_instance != null)
         {
            _instance.close();
         }
         _instance = this;
         super("",true,false);
         this.init(param1);
      }
      
      override public function close() : void
      {
         if(this.tween != null)
         {
            this.tween.§_-h2r§();
            this.tween = null;
         }
         super.close();
      }
      
      override public function showDialog() : void
      {
         this.visible = true;
         addToSprite();
         this.effectOpen();
      }
      
      override public function placeInCenter(param1:Number = 900, param2:Number = 620) : void
      {
         if(Boolean(param1) || Boolean(param2))
         {
         }
         this.x = this.§_-R1Y§ + Game.starling.stage.stageWidth - this.width - 13;
         if(§_-71o§.active is §_-E1J§)
         {
            this.y = this.topOffset + Game.starling.stage.stageHeight - this.height - 58;
         }
         else
         {
            this.y = this.topOffset + Game.starling.stage.stageHeight - this.height - 78;
         }
      }
      
      override protected function effectOpen() : void
      {
         this.tween = TweenMax.to(this,1,{"alpha":1});
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         this.§_-O2e§.y -= 2;
      }
      
      private function init(param1:String) : void
      {
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-I2U§);
         this.§_-92§ = new §_-22V§("",0,-2,_loc2_);
         this.§_-92§.htmlText = "<body><textformat leading = \'7\'><span class = \'caption\'>" + gls("Новость клана!") + "</span><br/></textformat>";
         this.§_-92§.htmlText += param1;
         this.§_-92§.htmlText += "</body>";
         this.§_-92§.width = 200;
         this.§_-92§.wordWrap = true;
         this.§_-92§.multiline = true;
         addChild(this.§_-92§);
         place();
         this.alpha = 0;
         this.height += 25;
         this.§_-O2e§.x += 5;
         this.§_-O2e§.y += 5;
         setTimeout(this.§_-Mm§,§_-g1S§);
      }
      
      private function §_-Mm§() : void
      {
         if(this == null || !this.visible)
         {
            return;
         }
         this.tween = TweenMax.to(this,1,{
            "alpha":0,
            "onComplete":this.close
         });
      }
   }
}

