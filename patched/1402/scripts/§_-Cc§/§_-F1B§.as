package §_-Cc§
{
   import flash.display.MovieClip;
   
   public class §_-F1B§ extends §_-pp§
   {
      
      protected var animation:MovieClip = null;
      
      public function §_-F1B§(param1:Number)
      {
         super(param1);
         this.animation = new PerkKickMovie();
         this.animation.y = -60;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.isStopped = false;
            if(this.hero.heroView.contains(this.animation))
            {
               this.hero.heroView.removeChild(this.animation);
            }
         }
         else
         {
            param1.heroView.addChild(this.animation);
            param1.isStopped = true;
         }
         super.hero = param1;
      }
   }
}

