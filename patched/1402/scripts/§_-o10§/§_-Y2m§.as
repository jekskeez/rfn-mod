package §_-o10§
{
   import §_-I1q§.§_-Fr§;
   
   public class §_-Y2m§ extends §_-Z23§
   {
      
      public static const §_-l2a§:Number = 40;
      
      public function §_-Y2m§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-52I§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 1.2;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-Fr§ = new §_-Fr§();
         _loc1_.maxVelocity += _loc1_.maxVelocity * §_-bx§() / 100;
         if(this.§_-53U§)
         {
            _loc1_.§_-62I§ *= 1 + §_-l2a§ / 100;
         }
         this.castObject = _loc1_;
      }
   }
}

