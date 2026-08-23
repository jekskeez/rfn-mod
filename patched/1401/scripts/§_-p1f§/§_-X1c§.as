package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-X1c§ extends §_-6Y§
   {
      
      private var count:int = 0;
      
      public function §_-X1c§()
      {
         super(§_-6Y§.§_-61Q§);
      }
      
      override public function load(param1:*) : void
      {
         this.count = param1[0];
         this.§_-53o§[0].text = this.count.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.count = int(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.count);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Энергия"];
      }
   }
}

