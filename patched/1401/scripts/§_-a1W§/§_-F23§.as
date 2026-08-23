package §_-a1W§
{
   import §_-I10§.EventsManager;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-ex§;
   
   public class §_-F23§ extends Sprite
   {
      
      private static const §_-I2c§:TextFormat = new TextFormat(null,14,8877877,true);
      
      private var §_-j2N§:§_-22V§;
      
      private var §_-Z2d§:String = "";
      
      private var §_-B16§:int = 0;
      
      public function §_-F23§()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         addChild(new TemporaryClothesTimerBack());
         this.§_-j2N§ = new §_-22V§("00:00:00",30,5,§_-I2c§);
         addChild(this.§_-j2N§);
      }
      
      public function §_-hk§(param1:String, param2:int) : void
      {
         this.§_-Z2d§ = param1;
         this.§_-B16§ = param2;
         §_-01Y§.§_-l2K§(this.§_-D1F§);
         §_-01Y§.§_-c9§(this.§_-D1F§);
         this.§_-D1F§();
      }
      
      public function stop() : void
      {
         §_-01Y§.§_-l2K§(this.§_-D1F§);
      }
      
      private function §_-D1F§() : void
      {
         var _loc1_:int = EventsManager.§_-11w§(this.§_-Z2d§,this.§_-B16§);
         if(_loc1_ <= 0)
         {
            this.§_-j2N§.text = gls("Окончен");
            §_-01Y§.§_-l2K§(this.§_-D1F§);
            return;
         }
         this.§_-j2N§.text = §_-ex§.§_-d2X§(_loc1_);
      }
   }
}

