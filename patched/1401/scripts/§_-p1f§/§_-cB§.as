package §_-p1f§
{
   import §_-l26§.§_-z2g§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-cB§ extends §_-6Y§
   {
      
      private var state:int = 0;
      
      public function §_-cB§()
      {
         super(§_-z2g§.STATE);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.state = param1[0];
         this.§_-53o§[0].text = this.state.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.state = int(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.writeByte(this.state);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Статус"];
      }
   }
}

