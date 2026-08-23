package §_-8D§
{
   import §_-X1k§.EventsManager;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-B1d§;
   
   public class §_-L2I§ extends Sprite
   {
      
      private static const §_-ds§:TextFormat = new TextFormat(null,14,8877877,true);
      
      private var §_-W2d§:§_-i5§;
      
      private var §_-Qi§:String = "";
      
      private var §_-d21§:int = 0;
      
      public function §_-L2I§()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         addChild(new TemporaryClothesTimerBack());
         this.§_-W2d§ = new §_-i5§("00:00:00",30,5,§_-ds§);
         addChild(this.§_-W2d§);
      }
      
      public function §_-y25§(param1:String, param2:int) : void
      {
         this.§_-Qi§ = param1;
         this.§_-d21§ = param2;
         §_-p1V§.§_-B3x§(this.§_-r28§);
         §_-p1V§.§_-63T§(this.§_-r28§);
         this.§_-r28§();
      }
      
      public function stop() : void
      {
         §_-p1V§.§_-B3x§(this.§_-r28§);
      }
      
      private function §_-r28§() : void
      {
         var _loc1_:int = EventsManager.§_-M1b§(this.§_-Qi§,this.§_-d21§);
         if(_loc1_ <= 0)
         {
            this.§_-W2d§.text = gls("Окончен");
            §_-p1V§.§_-B3x§(this.§_-r28§);
            return;
         }
         this.§_-W2d§.text = §_-B1d§.§_-g2n§(_loc1_);
      }
   }
}

