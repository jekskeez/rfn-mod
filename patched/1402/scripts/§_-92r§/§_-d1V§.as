package §_-92r§
{
   import §_-22D§.TweenMax;
   import §_-bN§.Dialog;
   import flash.text.TextFormat;
   
   public class §_-d1V§ extends Dialog
   {
      
      protected static const §_-17§:Number = 10;
      
      private static const §_-u1w§:int = 50;
      
      private static const §_-EG§:int = 120;
      
      public var §_-Z11§:§_-i5§;
      
      protected var backgroundColor:int = 0;
      
      protected var §_-83t§:TextFormat = new TextFormat(null,20,16777215,null,null,null,null,null,"center");
      
      private var tween:TweenMax;
      
      private var §_-u2o§:Boolean = false;
      
      public function §_-d1V§(param1:Boolean = false)
      {
         super("",false,false,null,false);
         this.init();
         this.§_-u2o§ = param1;
      }
      
      override public function show() : void
      {
         super.show();
         if(this.tween != null)
         {
            this.tween.§_-kl§();
            this.tween = null;
         }
         this.placeOnResize();
         this.alpha = 1;
         this.tween = TweenMax.to(this,1,{
            "alpha":0,
            "delay":§_-17§,
            "onComplete":hide
         });
      }
      
      public function set text(param1:String) : void
      {
         this.§_-Z11§.text = param1;
         this.width = this.§_-Z11§.textWidth + 40;
         this.height = this.§_-Z11§.textHeight + 40;
         this.§_-z23§();
         this.§_-Z11§.x = -int(this.§_-Z11§.textWidth * 0.5) - 4;
         this.§_-Z11§.y = -int(this.§_-Z11§.textHeight * 0.5) - 4;
      }
      
      override protected function placeOnResize() : void
      {
         this.x = Game.starling.stage.stageWidth * 0.5;
         this.y = this.§_-u2o§ ? Game.starling.stage.stageHeight - §_-EG§ : §_-u1w§ + this.height * 0.5;
      }
      
      protected function init() : void
      {
         this.§_-Z11§ = new §_-i5§("",0,0,this.§_-83t§);
         addChild(this.§_-Z11§);
         place();
      }
      
      private function §_-z23§() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(this.backgroundColor,0.48);
         this.graphics.drawRoundRect(-((this.§_-Z11§.textWidth + 40) * 0.5),-int((this.§_-Z11§.textHeight + 40) * 0.5),this.§_-Z11§.textWidth + 40,this.§_-Z11§.textHeight + 40,15);
      }
   }
}

