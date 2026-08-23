package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-62L§ extends §_-K1K§
   {
      
      private var count:int = 0;
      
      public function §_-62L§()
      {
         super(§_-K1K§.§_-fz§);
      }
      
      override public function load(param1:*) : void
      {
         this.count = param1[0];
         this.§_-23Z§[0].text = this.count.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.count = int(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.count);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Мана"];
      }
   }
}

