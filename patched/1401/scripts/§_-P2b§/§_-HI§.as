package §_-P2b§
{
   import §_-A3e§.§_-rl§;
   import flash.display.MovieClip;
   
   public class §_-HI§ extends §_-rl§
   {
      
      public function §_-HI§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "police";
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function §_-Y2U§() : MovieClip
      {
         var _loc1_:MovieClip = new SirenCreate();
         _loc1_.y -= 60;
         return _loc1_;
      }
   }
}

