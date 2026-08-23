package §_-C3e§
{
   import §_-k1c§.§_-83D§;
   import events.GameEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   
   public class §_-W27§ extends §_-X15§
   {
      
      private var §_-VR§:int = 0;
      
      public function §_-W27§()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.backgroundColor = 16711680;
         this.§_-V1w§ = new TextFormat(§_-22V§.§_-pJ§,20,16777215,null,null,null,null,null,"center");
         super.init();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         §_-83D§.hide(this);
         dispatchEvent(new GameEvent(GameEvent.HIDED));
         §_-01Y§.§_-l2K§(this.§_-j2O§);
      }
      
      public function set §_-un§(param1:int) : void
      {
         this.§_-VR§ = param1;
         this.§_-j2O§();
         §_-01Y§.§_-c9§(this.§_-j2O§);
      }
      
      private function §_-j2O§() : void
      {
         --this.§_-VR§;
         this.text = gls("Вы неактивны, и будете выгнаны из карты через {0} сек!",this.§_-VR§);
         placeOnResize();
         GameSounds.play("timer");
         if(this.§_-VR§ == 0)
         {
            this.hide();
         }
      }
   }
}

