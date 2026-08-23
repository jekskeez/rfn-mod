package §_-p1f§
{
   import §_-l26§.§_-z2g§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-k4§ extends §_-6Y§
   {
      
      private var §_-HS§:int = 0;
      
      private var places:int = 0;
      
      public function §_-k4§()
      {
         super(§_-z2g§.SIZE);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.§_-HS§ = param1.length > 0 ? int(param1[0]) : 0;
         this.places = param1.length > 1 ? int(param1[1]) : 0;
         this.§_-53o§[0].text = this.§_-HS§.toString();
         this.§_-53o§[1].text = this.places.toString();
         this.§_-53o§[0].selectable = false;
      }
      
      override public function save() : §_-U1M§
      {
         this.places = int(this.§_-53o§[1].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.places);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Участников","Доп. места"];
      }
      
      override protected function get fieldWidth() : int
      {
         return 80;
      }
   }
}

