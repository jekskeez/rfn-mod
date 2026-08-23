package §_-Al§
{
   import §_-E1v§.§_-w1k§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-o2G§ extends §_-K1K§
   {
      
      private var state:int = 0;
      
      public function §_-o2G§()
      {
         super(§_-w1k§.STATE);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.state = param1[0];
         this.§_-23Z§[0].text = this.state.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.state = int(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
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

