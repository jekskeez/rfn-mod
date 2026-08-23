package §_-O2Y§
{
   import §_-22D§.TweenMax;
   import §_-S1n§.§_-kr§;
   import §_-j2E§.§_-A11§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-jD§ extends Sprite
   {
      
      protected var tween:TweenMax = null;
      
      protected var image:DisplayObject = null;
      
      public function §_-jD§(param1:int = -1)
      {
         super();
         this.image = §_-A11§.§_-51T§(param1);
         addChild(this.image);
         var _loc2_:String = "<body><b>" + §_-A11§.getName(param1) + "</b>\n" + §_-A11§.§_-ya§(param1) + "</body>";
         new §_-kr§(this,_loc2_,false,true);
         addEventListener(MouseEvent.ROLL_OVER,this.§_-T2H§);
         addEventListener(MouseEvent.ROLL_OUT,this.§_-k2s§);
      }
      
      protected function §_-k2s§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this.image,0.2,{"glowFilter":{
            "color":16763955,
            "alpha":1,
            "blurX":0,
            "blurY":0,
            "strength":1
         }});
      }
      
      protected function §_-T2H§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this.image,0.2,{"glowFilter":{
            "color":16763955,
            "alpha":1,
            "blurX":10,
            "blurY":10,
            "strength":1
         }});
      }
   }
}

