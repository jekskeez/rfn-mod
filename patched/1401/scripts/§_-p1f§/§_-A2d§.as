package §_-p1f§
{
   import §_-l26§.§_-z2g§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-A2d§ extends §_-6Y§
   {
      
      public function §_-A2d§()
      {
         super(§_-z2g§.§_-819§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.§_-53o§[0].text = param1[0];
         this.§_-53o§[1].text = param1[1];
         this.§_-53o§[2].text = param1[2];
      }
      
      override public function save() : §_-U1M§
      {
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.writeByte(int(this.§_-53o§[0].text));
         _loc1_.§_-s15§(int(this.§_-53o§[1].text));
         _loc1_.§_-s15§(int(this.§_-53o§[2].text));
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Ранг","Опыт","Опыт за день"];
      }
      
      override protected function get fieldWidth() : int
      {
         return 100;
      }
   }
}

