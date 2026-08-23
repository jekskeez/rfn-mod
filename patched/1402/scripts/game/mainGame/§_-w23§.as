package game.mainGame
{
   import §_-S1n§.§_-kr§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-w23§ extends Sprite
   {
      
      public static const §_-31R§:int = -12;
      
      public static const §_-t2§:int = -105;
      
      private var button:KickButtonCustom = new KickButtonCustom();
      
      private var §_-U2S§:Function;
      
      private var hero:Hero = null;
      
      public function §_-w23§()
      {
         super();
         this.button.x = §_-31R§;
         this.button.y = §_-t2§;
         this.addChild(this.button);
         this.button.gotoAndStop(1);
         this.addEventListener(MouseEvent.ROLL_OUT,this.§_-vM§);
         this.addEventListener(MouseEvent.ROLL_OVER,this.§_-wq§);
         new §_-kr§(this,gls("Пожаловаться на белку"));
         this.mouseEnabled = true;
         this.buttonMode = true;
      }
      
      private function §_-wq§(param1:MouseEvent) : void
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
      
      private function §_-vM§(param1:MouseEvent = null) : void
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
         this.§_-vM§();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

