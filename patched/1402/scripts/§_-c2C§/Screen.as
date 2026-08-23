package §_-c2C§
{
   import §_-bN§.§_-Fk§;
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
         §_-p2U§.add("Screen.show " + this);
         this.visible = true;
         dispatchEvent(new ScreenEvent(ScreenEvent.SHOW,this));
         if(§_-t2c§.§_-M1K§)
         {
            new §_-Fk§(gls("Ты - ленивая Белка, и Шаман прогнал тебя"),gls("Будь активным во время игры и такого больше не повторится")).show();
            §_-t2c§.§_-M1K§ = false;
         }
         if(§_-t2c§.§_-pK§)
         {
            new §_-Fk§(gls("Игроки прогнали тебя"),gls("Пять игроков подали жалобу, что ты всех задерживаешь, и выгнали тебя из команды")).show();
            §_-t2c§.§_-pK§ = false;
         }
      }
      
      public function hide() : void
      {
         §_-p2U§.add("Screen.hide " + this);
         this.visible = false;
         dispatchEvent(new ScreenEvent(ScreenEvent.HIDE,this));
      }
   }
}

