package §_-33r§
{
   import flash.display.MovieClip;
   
   public class §_-R1B§ extends §_-AP§
   {
      
      protected var view:MovieClip = null;
      
      public function §_-R1B§(param1:Number)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.isStopped = false;
            this.view.parent.removeChild(this.view);
            this.hero.unlockBody(this);
         }
         else
         {
            this.view = param1.isSquirrel ? new CthulhuTenatacleView() : new CthulhuTenatacleBigView();
            this.view.x = (param1.isDragon || param1.isSquirrel ? 0 : 15) * (param1.heroView.direction ? -1 : 1);
            this.view.y = param1.isSquirrel ? -Hero.§_-YH§ : (param1.isDragon ? -6 : -32);
            this.view.scaleX = param1.heroView.direction ? 1 : -1;
            param1.heroView.addChild(this.view);
            param1.lockBody(this);
            param1.isStopped = true;
         }
         super.hero = param1;
      }
   }
}

