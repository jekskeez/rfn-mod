package §_-I18§
{
   import §_-22D§.TweenMax;
   import §_-I2Y§.§_-91K§;
   import §_-bN§.§_-T1e§;
   import §_-c2C§.§_-t2c§;
   import flash.text.StyleSheet;
   import flash.utils.setTimeout;
   
   public class §_-jv§ extends §_-T1e§
   {
      
      private static const §_-Xo§:int = 5000;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #432104;","text-align: center;","}",".caption {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","color: #FF0000;","font-size: 17px;","font-weight: bold;","}"].join("\n");
      
      private static var _instance:§_-jv§ = null;
      
      private var §_-iQ§:§_-i5§ = null;
      
      private var tween:TweenMax = null;
      
      public function §_-jv§(param1:String)
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
            this.tween.§_-kl§();
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
         this.x = this.§_-01q§ + Game.starling.stage.stageWidth - this.width - 13;
         if(§_-t2c§.active is §_-91K§)
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
         this.§_-x2T§.y -= 2;
      }
      
      private function init(param1:String) : void
      {
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-aD§);
         this.§_-iQ§ = new §_-i5§("",0,-2,_loc2_);
         this.§_-iQ§.htmlText = "<body><textformat leading = \'7\'><span class = \'caption\'>" + gls("Новость клана!") + "</span><br/></textformat>";
         this.§_-iQ§.htmlText += param1;
         this.§_-iQ§.htmlText += "</body>";
         this.§_-iQ§.width = 200;
         this.§_-iQ§.wordWrap = true;
         this.§_-iQ§.multiline = true;
         addChild(this.§_-iQ§);
         place();
         this.alpha = 0;
         this.height += 25;
         this.§_-x2T§.x += 5;
         this.§_-x2T§.y += 5;
         setTimeout(this.§_-Yp§,§_-Xo§);
      }
      
      private function §_-Yp§() : void
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

