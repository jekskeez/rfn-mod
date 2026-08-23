package §_-o10§
{
   import §_-Q2§.§_-EV§;
   import §_-Q2§.§_-b1v§;
   
   public class §_-p2G§ extends §_-Z23§
   {
      
      public function §_-p2G§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-8F§;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:* = this.§_-53U§ ? new §_-EV§() : new §_-b1v§();
         _loc1_.lifeTime = §_-bx§() * 1000;
         this.castObject = _loc1_;
      }
   }
}

