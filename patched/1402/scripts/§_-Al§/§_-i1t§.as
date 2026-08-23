package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-i1t§ extends §_-K1K§
   {
      
      private var start:int = 0;
      
      private var §_-n1s§:int = 0;
      
      private var §_-N1c§:int = 0;
      
      private var §_-42V§:int = 0;
      
      public function §_-i1t§()
      {
         super(§_-K1K§.§_-wb§);
      }
      
      override public function load(param1:*) : void
      {
         this.start = param1[0];
         this.§_-n1s§ = param1[1];
         this.§_-N1c§ = param1[2];
         this.§_-42V§ = param1[3];
         this.§_-23Z§[0].text = this.start.toString();
         this.§_-23Z§[1].text = this.§_-n1s§.toString();
         this.§_-23Z§[2].text = this.§_-N1c§.toString();
         this.§_-23Z§[3].text = this.§_-42V§.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.start = int(this.§_-23Z§[0].text);
         this.§_-n1s§ = int(this.§_-23Z§[1].text);
         this.§_-N1c§ = int(this.§_-23Z§[2].text);
         this.§_-42V§ = int(this.§_-23Z§[3].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.start);
         _loc1_.§_-C1W§(this.§_-n1s§);
         _loc1_.§_-C1W§(this.§_-N1c§);
         _loc1_.writeByte(this.§_-42V§);
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

