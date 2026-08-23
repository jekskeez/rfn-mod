package views
{
   import §_-42B§.TweenMax;
   import §_-r2A§.§_-j29§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-Si§ extends Sprite
   {
      
      private var view:MovieClip = null;
      
      private var §_-g1u§:Point = null;
      
      private var §_-01M§:Boolean = false;
      
      public function §_-Si§(param1:Point, param2:Point, param3:Boolean)
      {
         super();
         this.§_-g1u§ = param2;
         this.§_-01M§ = param3;
         this.view = param3 ? new SubscriptionShamanExpBonus() : new SubscriptionExpBonus();
         this.view.x = param1.x;
         this.view.y = param1.y;
         this.view.scaleX = this.view.scaleY = 0.9;
         this.view.addEventListener(Event.CHANGE,this.§_-u25§);
         this.view.gotoAndPlay(0);
         addChild(this.view);
      }
      
      private function §_-u25§(param1:Event) : void
      {
         var e:Event = param1;
         this.view.removeEventListener(Event.CHANGE,this.§_-u25§);
         TweenMax.to(this.view,0.7,{
            "scaleX":0.4,
            "scaleY":0.4,
            "x":this.§_-g1u§.x,
            "y":this.§_-g1u§.y,
            "ease":§_-j29§.easeInOut,
            "onComplete":function():void
            {
               TweenMax.to(view,0.3,{
                  "alpha":0,
                  "scaleX":0.6,
                  "scaleY":0.6,
                  "onComplete":§_-e16§
               });
            }
         });
      }
      
      private function §_-e16§() : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.view = null;
      }
   }
}

