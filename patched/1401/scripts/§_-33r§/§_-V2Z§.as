package §_-33r§
{
   import flash.display.MovieClip;
   
   public class §_-V2Z§ extends §_-AP§
   {
      
      protected var animation:MovieClip = null;
      
      public function §_-V2Z§(param1:Number)
      {
         super(param1);
         this.animation = new DruidPerkView();
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
         }
         super.hero = param1;
      }
   }
}

