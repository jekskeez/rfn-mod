package §_-l2q§
{
   import §_-42B§.TweenMax;
   import §_-P2b§.§_-6L§;
   import §_-e1G§.§_-Hb§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-u1c§ extends Sprite
   {
      
      protected var tween:TweenMax = null;
      
      protected var image:DisplayObject = null;
      
      public function §_-u1c§(param1:int = -1)
      {
         super();
         this.image = §_-6L§.§_-Gi§(param1);
         addChild(this.image);
         var _loc2_:String = "<body><b>" + §_-6L§.getName(param1) + "</b>\n" + §_-6L§.§_-l7§(param1) + "</body>";
         new §_-Hb§(this,_loc2_,false,true);
         addEventListener(MouseEvent.ROLL_OVER,this.§_-Q20§);
         addEventListener(MouseEvent.ROLL_OUT,this.§_-9c§);
      }
      
      protected function §_-9c§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.tween = TweenMax.to(this.image,0.2,{"glowFilter":{
            "color":16763955,
            "alpha":1,
            "blurX":0,
            "blurY":0,
            "strength":1
         }});
      }
      
      protected function §_-Q20§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
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

