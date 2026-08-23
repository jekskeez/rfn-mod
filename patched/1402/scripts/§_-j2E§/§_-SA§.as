package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-A1G§.§_-w10§;
   import §_-I1q§.§_-w27§;
   
   public class §_-SA§ extends §_-52h§
   {
      
      public function §_-SA§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function get castObject() : GameBody
      {
         var _loc1_:§_-w27§ = new §_-w27§();
         _loc1_.§_-iD§(§_-w10§.§_-eB§);
         return _loc1_;
      }
   }
}

