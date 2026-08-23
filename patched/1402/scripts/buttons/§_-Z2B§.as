package buttons
{
   import §_-S1n§.§_-kr§;
   import §_-bN§.§_-Og§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-Z2B§ extends Sprite
   {
      
      private var §_-oj§:§_-kr§;
      
      public function §_-Z2B§(param1:Boolean = false)
      {
         var _loc3_:PhotoStand = null;
         super();
         if(!param1)
         {
            _loc3_ = new PhotoStand();
            _loc3_.x = -6;
            _loc3_.y = 19;
            addChild(_loc3_);
         }
         var _loc2_:SimpleButton = param1 ? new ButtonPhotoHeader() : new PhotoButton();
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(_loc2_);
         this.§_-oj§ = new §_-kr§(_loc2_,gls("Снимок экрана"));
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         this.§_-oj§.visible = false;
         §_-Og§.show();
         this.§_-oj§.visible = true;
      }
   }
}

