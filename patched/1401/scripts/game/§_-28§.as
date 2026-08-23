package game
{
   import §_-42B§.TweenMax;
   import flash.display.Sprite;
   import starling.core.Starling;
   
   public class §_-28§ extends Sprite
   {
      
      private var view:NewYearFreezeView;
      
      private var active:Boolean = false;
      
      private var tween:TweenMax = null;
      
      public function §_-28§()
      {
         super();
         this.view = new NewYearFreezeView();
         this.view.height = Starling.§_-y1l§.stage.stageHeight;
         this.view.width = Starling.§_-y1l§.stage.stageWidth;
         addChild(this.view);
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      public function dispose() : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.§_-bY§();
      }
      
      public function start() : void
      {
         if(this.active)
         {
            return;
         }
         this.active = true;
         if(!Game.§_-d2t§.contains(this))
         {
            Game.§_-d2t§.addChild(this);
         }
         this.alpha = 0;
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.tween = TweenMax.to(this,1,{"alpha":0.7});
      }
      
      public function stop() : void
      {
         if(!this.active)
         {
            return;
         }
         this.active = false;
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.tween = TweenMax.to(this,1,{
            "alpha":0,
            "onComplete":this.§_-bY§
         });
      }
      
      private function §_-bY§() : void
      {
         if(Game.§_-d2t§.contains(this))
         {
            Game.§_-d2t§.removeChild(this);
         }
      }
   }
}

