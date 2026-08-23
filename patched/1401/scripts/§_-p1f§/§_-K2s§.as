package §_-p1f§
{
   import §_-l26§.§_-z2g§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-K2s§ extends §_-6Y§
   {
      
      private var places:int = 0;
      
      public function §_-K2s§()
      {
         super(§_-z2g§.§_-X2U§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.places = param1[0];
         this.§_-53o§[0].text = this.places.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.places = int(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.places);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Места клана"];
      }
   }
}

