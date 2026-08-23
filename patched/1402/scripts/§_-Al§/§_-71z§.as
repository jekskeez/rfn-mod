package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-71z§ extends §_-K1K§
   {
      
      private var §_-es§:int = 0;
      
      private var §_-o17§:int = 0;
      
      public function §_-71z§()
      {
         super(§_-K1K§.§_-M1U§);
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function load(param1:*) : void
      {
         this.§_-es§ = param1[0];
         this.§_-o17§ = param1[1];
         this.§_-23Z§[0].text = this.§_-es§.toString();
         this.§_-23Z§[1].text = this.§_-o17§.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.§_-es§ = int(this.§_-23Z§[0].text);
         this.§_-o17§ = int(this.§_-23Z§[1].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.§_-es§);
         _loc1_.§_-C1W§(this.§_-o17§);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Бесплатные","Платные"];
      }
   }
}

