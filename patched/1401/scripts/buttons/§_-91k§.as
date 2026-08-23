package buttons
{
   import flash.display.SimpleButton;
   
   public class §_-91k§ extends SimpleButton
   {
      
      public function §_-91k§()
      {
         super();
         var _loc1_:SimpleButton = §_-a9§.§_-O1z§ ? new ButtonCrossMobile() : new ButtonCross();
         this.upState = _loc1_.upState;
         this.overState = _loc1_.overState;
         this.downState = _loc1_.downState;
         this.hitTestState = _loc1_.hitTestState;
      }
      
      override public function get width() : Number
      {
         return 18.5;
      }
      
      override public function get height() : Number
      {
         return 19;
      }
   }
}

