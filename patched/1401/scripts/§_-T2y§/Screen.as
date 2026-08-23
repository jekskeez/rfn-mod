package §_-T2y§
{
   import §_-k1c§.§_-Q13§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   
   public class Screen extends Sprite
   {
      
      public function Screen()
      {
         super();
         this.visible = false;
      }
      
      public function show() : void
      {
         §_-TQ§.add("Screen.show " + this);
         this.visible = true;
         dispatchEvent(new ScreenEvent(ScreenEvent.SHOW,this));
         if(§_-71o§.§_-L13§)
         {
            new §_-Q13§(gls("Ты - ленивая Белка, и Шаман прогнал тебя"),gls("Будь активным во время игры и такого больше не повторится")).show();
            §_-71o§.§_-L13§ = false;
         }
         if(§_-71o§.§_-Iv§)
         {
            new §_-Q13§(gls("Игроки прогнали тебя"),gls("Пять игроков подали жалобу, что ты всех задерживаешь, и выгнали тебя из команды")).show();
            §_-71o§.§_-Iv§ = false;
         }
      }
      
      public function hide() : void
      {
         §_-TQ§.add("Screen.hide " + this);
         this.visible = false;
         dispatchEvent(new ScreenEvent(ScreenEvent.HIDE,this));
      }
   }
}

