package §_-33r§
{
   import flash.display.MovieClip;
   
   public class §_-A35§ extends §_-AP§
   {
      
      protected var animation:MovieClip = null;
      
      public function §_-A35§(param1:Number)
      {
         super(param1);
         this.animation = new PerkDeathView();
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            if(this.hero.heroView.contains(this.animation))
            {
               this.hero.heroView.removeChild(this.animation);
            }
         }
         else
         {
            param1.heroView.addChild(this.animation);
            this.animation.y = param1.heroView.topOffset - 10;
         }
         super.hero = param1;
      }
   }
}

