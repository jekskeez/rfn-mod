package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-W1§ extends §_-6Y§
   {
      
      private var start:int = 0;
      
      private var §_-y1l§:int = 0;
      
      private var §_-o26§:int = 0;
      
      private var §_-lX§:int = 0;
      
      public function §_-W1§()
      {
         super(§_-6Y§.§_-l2Y§);
      }
      
      override public function load(param1:*) : void
      {
         this.start = param1[0];
         this.§_-y1l§ = param1[1];
         this.§_-o26§ = param1[2];
         this.§_-lX§ = param1[3];
         this.§_-53o§[0].text = this.start.toString();
         this.§_-53o§[1].text = this.§_-y1l§.toString();
         this.§_-53o§[2].text = this.§_-o26§.toString();
         this.§_-53o§[3].text = this.§_-lX§.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.start = int(this.§_-53o§[0].text);
         this.§_-y1l§ = int(this.§_-53o§[1].text);
         this.§_-o26§ = int(this.§_-53o§[2].text);
         this.§_-lX§ = int(this.§_-53o§[3].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.start);
         _loc1_.§_-s15§(this.§_-y1l§);
         _loc1_.§_-s15§(this.§_-o26§);
         _loc1_.writeByte(this.§_-lX§);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Начало","Текущий","Входы","День"];
      }
      
      override protected function get fieldWidth() : int
      {
         return 50;
      }
   }
}

