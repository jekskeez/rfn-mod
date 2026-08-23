package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-u2r§.§_-y12§;
   
   public class §_-732§ extends §_-XT§
   {
      
      private static const §_-S1d§:Array = [30,30,30,30,30,30,28,26,24,22,20];
      
      public function §_-732§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "";
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-j2Y§ > §_-S1d§.length ? Number(§_-S1d§[§_-S1d§.length - 1]) : Number(§_-S1d§[this.§_-j2Y§]);
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-y12§();
      }
   }
}

