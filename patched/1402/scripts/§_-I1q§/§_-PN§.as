package §_-I1q§
{
   import §_-82h§.§_-KS§;
   import §_-TK§.§_-f1u§;
   import sounds.GameSounds;
   
   public class §_-PN§ extends §_-42a§
   {
      
      public var §_-JU§:§_-PN§ = null;
      
      public function §_-PN§()
      {
         super();
      }
      
      override protected function §_-U25§() : §_-f1u§
      {
         return new §_-f1u§(new SpiderWebInAir());
      }
      
      override protected function §_-m2S§() : §_-KS§
      {
         return new §_-KS§(SpiderWebMiddle);
      }
      
      override public function get minLength() : Number
      {
         return 10;
      }
      
      override protected function §_-d2x§() : void
      {
         super.§_-d2x§();
         GameSounds.play("web");
         if(this.§_-JU§)
         {
            this.§_-JU§.breakJoint();
         }
      }
   }
}

