package §_-92r§
{
   import §_-bN§.§_-33Q§;
   import events.GameEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   
   public class §_-h23§ extends §_-d1V§
   {
      
      private var §_-e6§:int = 0;
      
      public function §_-h23§()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.backgroundColor = 16711680;
         this.§_-83t§ = new TextFormat(§_-i5§.§_-p1s§,20,16777215,null,null,null,null,null,"center");
         super.init();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         §_-33Q§.hide(this);
         dispatchEvent(new GameEvent(GameEvent.HIDED));
         §_-p1V§.§_-B3x§(this.§_-x5§);
      }
      
      public function set §_-lQ§(param1:int) : void
      {
         this.§_-e6§ = param1;
         this.§_-x5§();
         §_-p1V§.§_-63T§(this.§_-x5§);
      }
      
      private function §_-x5§() : void
      {
         --this.§_-e6§;
         this.text = gls("Вы неактивны, и будете выгнаны из карты через {0} сек!",this.§_-e6§);
         placeOnResize();
         GameSounds.play("timer");
         if(this.§_-e6§ == 0)
         {
            this.hide();
         }
      }
   }
}

