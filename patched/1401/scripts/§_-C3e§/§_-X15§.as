package §_-C3e§
{
   import §_-42B§.TweenMax;
   import §_-k1c§.Dialog;
   import flash.text.TextFormat;
   
   public class §_-X15§ extends Dialog
   {
      
      protected static const §_-p2O§:Number = 10;
      
      private static const §_-m24§:int = 50;
      
      private static const §_-H24§:int = 120;
      
      public var §_-n2P§:§_-22V§;
      
      protected var backgroundColor:int = 0;
      
      protected var §_-V1w§:TextFormat = new TextFormat(null,20,16777215,null,null,null,null,null,"center");
      
      private var tween:TweenMax;
      
      private var §_-s1K§:Boolean = false;
      
      public function §_-X15§(param1:Boolean = false)
      {
         super("",false,false,null,false);
         this.init();
         this.§_-s1K§ = param1;
      }
      
      override public function show() : void
      {
         super.show();
         if(this.tween != null)
         {
            this.tween.§_-h2r§();
            this.tween = null;
         }
         this.placeOnResize();
         this.alpha = 1;
         this.tween = TweenMax.to(this,1,{
            "alpha":0,
            "delay":§_-p2O§,
            "onComplete":hide
         });
      }
      
      public function set text(param1:String) : void
      {
         this.§_-n2P§.text = param1;
         this.width = this.§_-n2P§.textWidth + 40;
         this.height = this.§_-n2P§.textHeight + 40;
         this.§_-a1C§();
         this.§_-n2P§.x = -int(this.§_-n2P§.textWidth * 0.5) - 4;
         this.§_-n2P§.y = -int(this.§_-n2P§.textHeight * 0.5) - 4;
      }
      
      override protected function placeOnResize() : void
      {
         this.x = Game.starling.stage.stageWidth * 0.5;
         this.y = this.§_-s1K§ ? Game.starling.stage.stageHeight - §_-H24§ : §_-m24§ + this.height * 0.5;
      }
      
      protected function init() : void
      {
         this.§_-n2P§ = new §_-22V§("",0,0,this.§_-V1w§);
         addChild(this.§_-n2P§);
         place();
      }
      
      private function §_-a1C§() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(this.backgroundColor,0.48);
         this.graphics.drawRoundRect(-((this.§_-n2P§.textWidth + 40) * 0.5),-int((this.§_-n2P§.textHeight + 40) * 0.5),this.§_-n2P§.textWidth + 40,this.§_-n2P§.textHeight + 40,15);
      }
   }
}

