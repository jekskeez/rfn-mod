package §_-o10§
{
   import §_-8Q§.§_-e1P§;
   
   public class §_-b1c§ extends §_-Z23§
   {
      
      public static const §_-hp§:int = 20;
      
      public static const §_-F1s§:int = 20;
      
      public static const §_-W1D§:int = 20;
      
      public function §_-b1c§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-Z1C§;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-e1P§ = null;
         _loc1_ = new §_-e1P§();
         if(this.§_-f1V§ == 3)
         {
            _loc1_.power *= 1 + §_-F1s§ / 100;
         }
         if(this.§_-41Z§ >= 2)
         {
            _loc1_.radius *= 1 + §_-W1D§ / 100;
         }
         _loc1_.§_-ZD§ = !this.§_-53U§;
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return §_-hp§ - §_-bx§();
      }
   }
}

