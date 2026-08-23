package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-33D§ extends §_-6Y§
   {
      
      private var §_-x2N§:int = 0;
      
      private var §_-eP§:int = 0;
      
      public function §_-33D§()
      {
         super(§_-6Y§.§_-113§);
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function load(param1:*) : void
      {
         this.§_-x2N§ = param1[0];
         this.§_-eP§ = param1[1];
         this.§_-53o§[0].text = this.§_-x2N§.toString();
         this.§_-53o§[1].text = this.§_-eP§.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.§_-x2N§ = int(this.§_-53o§[0].text);
         this.§_-eP§ = int(this.§_-53o§[1].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.§_-x2N§);
         _loc1_.§_-s15§(this.§_-eP§);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Бесплатные","Платные"];
      }
   }
}

