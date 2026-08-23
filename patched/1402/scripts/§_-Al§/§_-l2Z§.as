package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-l2Z§ extends §_-K1K§
   {
      
      private var §_-4X§:int = 0;
      
      public function §_-l2Z§()
      {
         super(§_-K1K§.§_-t1d§);
      }
      
      override public function load(param1:*) : void
      {
         this.§_-4X§ = int(param1[0]);
         this.§_-23Z§[0].text = this.§_-4X§.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.§_-4X§ = int(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.§_-4X§);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["КД тотема респавна (сек)"];
      }
   }
}

