package §_-p1f§
{
   import §_-l26§.§_-z2g§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-f1F§ extends §_-6Y§
   {
      
      private var coins:int = 0;
      
      private var nuts:int = 0;
      
      public function §_-f1F§()
      {
         super(§_-z2g§.§_-I25§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.coins = param1[0];
         this.nuts = param1[1];
         this.§_-53o§[0].text = this.coins.toString();
         this.§_-53o§[1].text = this.nuts.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.coins = int(this.§_-53o§[0].text);
         this.nuts = int(this.§_-53o§[1].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.coins);
         _loc1_.§_-s15§(this.nuts);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Монеты","Орехи"];
      }
   }
}

