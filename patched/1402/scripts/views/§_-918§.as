package views
{
   import §_-X1k§.§_-L1o§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import utils.§_-B1d§;
   
   public class §_-918§ extends Sprite
   {
      
      private static const §_-fC§:TextFormat = new TextFormat(null,14,8877877,true);
      
      private var §_-n2x§:int = 0;
      
      private var time:int = 0;
      
      private var §_-W2d§:§_-i5§ = null;
      
      public function §_-918§(param1:int)
      {
         super();
         addChild(new TemporaryClothesTimerBack());
         this.mouseEnabled = false;
         this.§_-W2d§ = new §_-i5§("00:00:00",0,5,§_-fC§);
         addChild(this.§_-W2d§);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         this.id = param1;
      }
      
      public function update(param1:GameEvent = null) : void
      {
         this.time = §_-L1o§.§_-Tg§(this.id);
         if(this.time == 0)
         {
            §_-p1V§.§_-B3x§(this.§_-62z§);
         }
         else
         {
            §_-p1V§.§_-63T§(this.§_-62z§);
         }
         this.§_-62z§();
      }
      
      private function §_-62z§() : void
      {
         var _loc1_:int = 0;
         _loc1_ = this.time - int(getTimer() / 1000) - Game.§_-i24§;
         this.visible = _loc1_ > 0 && this.time != 0;
         if(_loc1_ < 0)
         {
            §_-p1V§.§_-B3x§(this.§_-62z§);
            return;
         }
         this.§_-W2d§.text = §_-B1d§.§_-g2n§(_loc1_);
         this.§_-W2d§.x = 70 - int(this.§_-W2d§.textWidth * 0.5);
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-n2x§ = param1;
         this.update();
      }
   }
}

