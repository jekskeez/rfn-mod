package views
{
   import §_-22D§.TweenMax;
   import §_-Kc§.§_-A30§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-D14§ extends Sprite
   {
      
      private var view:MovieClip = null;
      
      private var §_-6U§:Point = null;
      
      private var §_-12e§:Boolean = false;
      
      public function §_-D14§(param1:Point, param2:Point, param3:Boolean)
      {
         super();
         this.§_-6U§ = param2;
         this.§_-12e§ = param3;
         this.view = param3 ? new SubscriptionShamanExpBonus() : new SubscriptionExpBonus();
         this.view.x = param1.x;
         this.view.y = param1.y;
         this.view.scaleX = this.view.scaleY = 0.9;
         this.view.addEventListener(Event.CHANGE,this.§_-y2u§);
         this.view.gotoAndPlay(0);
         addChild(this.view);
      }
      
      private function §_-y2u§(param1:Event) : void
      {
         var e:Event = param1;
         this.view.removeEventListener(Event.CHANGE,this.§_-y2u§);
         TweenMax.to(this.view,0.7,{
            "scaleX":0.4,
            "scaleY":0.4,
            "x":this.§_-6U§.x,
            "y":this.§_-6U§.y,
            "ease":§_-A30§.easeInOut,
            "onComplete":function():void
            {
               TweenMax.to(view,0.3,{
                  "alpha":0,
                  "scaleX":0.6,
                  "scaleY":0.6,
                  "onComplete":§_-P19§
               });
            }
         });
      }
      
      private function §_-P19§() : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.view = null;
      }
   }
}

