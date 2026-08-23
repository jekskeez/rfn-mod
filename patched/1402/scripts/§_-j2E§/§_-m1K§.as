package §_-j2E§
{
   import §_-p2L§.§_-t2P§;
   import flash.display.MovieClip;
   
   public class §_-m1K§ extends §_-t2P§
   {
      
      public function §_-m1K§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "police";
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function §_-o2B§() : MovieClip
      {
         var _loc1_:MovieClip = new SirenCreate();
         _loc1_.y -= 60;
         return _loc1_;
      }
   }
}

