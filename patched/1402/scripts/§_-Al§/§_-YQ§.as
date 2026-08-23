package §_-Al§
{
   import §_-E1v§.§_-w1k§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-YQ§ extends §_-K1K§
   {
      
      private var places:int = 0;
      
      public function §_-YQ§()
      {
         super(§_-w1k§.§_-I1N§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.places = param1[0];
         this.§_-23Z§[0].text = this.places.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.places = int(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.places);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Места клана"];
      }
   }
}

