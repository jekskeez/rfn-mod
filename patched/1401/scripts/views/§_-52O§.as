package views
{
   import §_-I10§.§_-h1f§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import utils.§_-ex§;
   
   public class §_-52O§ extends Sprite
   {
      
      private static const §_-5i§:TextFormat = new TextFormat(null,14,8877877,true);
      
      private var §_-4A§:int = 0;
      
      private var time:int = 0;
      
      private var §_-j2N§:§_-22V§ = null;
      
      public function §_-52O§(param1:int)
      {
         super();
         addChild(new TemporaryClothesTimerBack());
         this.mouseEnabled = false;
         this.§_-j2N§ = new §_-22V§("00:00:00",0,5,§_-5i§);
         addChild(this.§_-j2N§);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         this.id = param1;
      }
      
      public function update(param1:GameEvent = null) : void
      {
         this.time = §_-h1f§.§_-y2U§(this.id);
         if(this.time == 0)
         {
            §_-01Y§.§_-l2K§(this.§_-A1b§);
         }
         else
         {
            §_-01Y§.§_-c9§(this.§_-A1b§);
         }
         this.§_-A1b§();
      }
      
      private function §_-A1b§() : void
      {
         var _loc1_:int = 0;
         _loc1_ = this.time - int(getTimer() / 1000) - Game.§_-nE§;
         this.visible = _loc1_ > 0 && this.time != 0;
         if(_loc1_ < 0)
         {
            §_-01Y§.§_-l2K§(this.§_-A1b§);
            return;
         }
         this.§_-j2N§.text = §_-ex§.§_-d2X§(_loc1_);
         this.§_-j2N§.x = 70 - int(this.§_-j2N§.textWidth * 0.5);
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-4A§ = param1;
         this.update();
      }
   }
}

