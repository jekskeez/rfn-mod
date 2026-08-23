package §_-u2r§
{
   import §_-RI§.§_-d2d§;
   import §_-f17§.§_-Gn§;
   import sounds.GameSounds;
   
   public class §_-8W§ extends §_-41Q§
   {
      
      public var §_-4d§:§_-8W§ = null;
      
      public function §_-8W§()
      {
         super();
      }
      
      override protected function §_-61E§() : §_-d2d§
      {
         return new §_-d2d§(new SpiderWebInAir());
      }
      
      override protected function §_-Xw§() : §_-Gn§
      {
         return new §_-Gn§(SpiderWebMiddle);
      }
      
      override public function get minLength() : Number
      {
         return 10;
      }
      
      override protected function §_-w6§() : void
      {
         super.§_-w6§();
         GameSounds.play("web");
         if(this.§_-4d§)
         {
            this.§_-4d§.breakJoint();
         }
      }
   }
}

