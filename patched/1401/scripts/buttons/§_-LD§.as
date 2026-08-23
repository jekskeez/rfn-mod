package buttons
{
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-Gp§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-LD§ extends Sprite
   {
      
      private var §_-XW§:§_-Hb§;
      
      public function §_-LD§(param1:Boolean = false)
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
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(_loc2_);
         this.§_-XW§ = new §_-Hb§(_loc2_,gls("Снимок экрана"));
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         this.§_-XW§.visible = false;
         §_-Gp§.show();
         this.§_-XW§.visible = true;
      }
   }
}

