package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-ZS§.§_-93d§;
   import §_-u2r§.§_-T2M§;
   
   public class §_-32F§ extends §_-XT§
   {
      
      public function §_-32F§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function get castObject() : GameBody
      {
         var _loc1_:§_-T2M§ = new §_-T2M§();
         _loc1_.§_-m2a§(§_-93d§.§_-Jk§);
         return _loc1_;
      }
   }
}

