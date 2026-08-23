package game.mainGame
{
   import §_-e1G§.§_-Hb§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-L2k§ extends Sprite
   {
      
      public static const §_-L19§:int = -12;
      
      public static const §_-G17§:int = -105;
      
      private var button:KickButtonCustom = new KickButtonCustom();
      
      private var §_-2g§:Function;
      
      private var hero:Hero = null;
      
      public function §_-L2k§()
      {
         super();
         this.button.x = §_-L19§;
         this.button.y = §_-G17§;
         this.addChild(this.button);
         this.button.gotoAndStop(1);
         this.addEventListener(MouseEvent.ROLL_OUT,this.§_-kQ§);
         this.addEventListener(MouseEvent.ROLL_OVER,this.§_-t2H§);
         new §_-Hb§(this,gls("Пожаловаться на белку"));
         this.mouseEnabled = true;
         this.buttonMode = true;
      }
      
      private function §_-t2H§(param1:MouseEvent) : void
      {
         if(this.parent is Hero)
         {
            this.hero = this.parent as Hero;
            this.x = this.hero.x;
            this.y = this.hero.y + this.height * 0.7;
            this.rotation = this.hero.rotation;
            this.hero.game.map.addChild(this);
         }
         this.button.gotoAndStop(2);
      }
      
      private function §_-kQ§(param1:MouseEvent = null) : void
      {
         if(this.hero)
         {
            this.x = 0;
            this.y = this.height * 0.7;
            this.rotation = 0;
            this.hero.addChild(this);
         }
         this.hero = null;
         this.button.gotoAndStop(1);
      }
      
      public function reset() : void
      {
         this.§_-kQ§();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

