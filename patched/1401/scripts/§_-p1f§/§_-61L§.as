package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-61L§ extends §_-6Y§
   {
      
      private var §_-kj§:int = 0;
      
      public function §_-61L§()
      {
         super(§_-6Y§.§_-TZ§);
      }
      
      override public function load(param1:*) : void
      {
         this.§_-kj§ = int(param1[0]);
         this.§_-53o§[0].text = this.§_-kj§.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.§_-kj§ = int(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.§_-kj§);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["КД тотема респавна (сек)"];
      }
   }
}

