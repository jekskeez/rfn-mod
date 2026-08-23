package §_-Al§
{
   import §_-E1v§.§_-w1k§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-zz§ extends §_-K1K§
   {
      
      private var coins:int = 0;
      
      private var nuts:int = 0;
      
      public function §_-zz§()
      {
         super(§_-w1k§.§_-a1z§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.coins = param1[0];
         this.nuts = param1[1];
         this.§_-23Z§[0].text = this.coins.toString();
         this.§_-23Z§[1].text = this.nuts.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.coins = int(this.§_-23Z§[0].text);
         this.nuts = int(this.§_-23Z§[1].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.coins);
         _loc1_.§_-C1W§(this.nuts);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Монеты","Орехи"];
      }
   }
}

