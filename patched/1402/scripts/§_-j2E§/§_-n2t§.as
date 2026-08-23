package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-C3Q§;
   
   public class §_-n2t§ extends §_-52h§
   {
      
      private static const §_-f1A§:Array = [30,30,30,30,30,30,28,26,24,22,20];
      
      public function §_-n2t§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "";
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-32l§ > §_-f1A§.length ? Number(§_-f1A§[§_-f1A§.length - 1]) : Number(§_-f1A§[this.§_-32l§]);
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-C3Q§();
      }
   }
}

