package §_-o10§
{
   import §_-Q2§.§_-Az§;
   
   public class §_-y2v§ extends §_-Z23§
   {
      
      public static const §_-53q§:int = 50;
      
      public function §_-y2v§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-iP§;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-Az§ = new §_-Az§();
         _loc1_.force *= 1 + §_-bx§() / 100;
         if(this.§_-53U§)
         {
            _loc1_.velocity *= 1 + §_-53q§ / 100;
         }
         this.castObject = _loc1_;
      }
   }
}

