package game
{
   import §_-22D§.TweenMax;
   import flash.display.Sprite;
   import starling.core.Starling;
   
   public class §_-43H§ extends Sprite
   {
      
      private var view:NewYearFreezeView;
      
      private var active:Boolean = false;
      
      private var tween:TweenMax = null;
      
      public function §_-43H§()
      {
         super();
         this.view = new NewYearFreezeView();
         this.view.height = Starling.§_-n1s§.stage.stageHeight;
         this.view.width = Starling.§_-n1s§.stage.stageWidth;
         addChild(this.view);
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      public function dispose() : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.§_-TZ§();
      }
      
      public function start() : void
      {
         if(this.active)
         {
            return;
         }
         this.active = true;
         if(!Game.§_-q1L§.contains(this))
         {
            Game.§_-q1L§.addChild(this);
         }
         this.alpha = 0;
         if(this.tween)
         {
            this.tween.§_-kl§();
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
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this,1,{
            "alpha":0,
            "onComplete":this.§_-TZ§
         });
      }
      
      private function §_-TZ§() : void
      {
         if(Game.§_-q1L§.contains(this))
         {
            Game.§_-q1L§.removeChild(this);
         }
      }
   }
}

