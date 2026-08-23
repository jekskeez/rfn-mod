package §_-Al§
{
   import §_-E1v§.§_-w1k§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-92M§ extends §_-K1K§
   {
      
      public function §_-92M§()
      {
         super(§_-w1k§.§_-03H§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.§_-23Z§[0].text = param1[0];
         this.§_-23Z§[1].text = param1[1];
         this.§_-23Z§[2].text = param1[2];
      }
      
      override public function save() : §_-z1i§
      {
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.writeByte(int(this.§_-23Z§[0].text));
         _loc1_.§_-C1W§(int(this.§_-23Z§[1].text));
         _loc1_.§_-C1W§(int(this.§_-23Z§[2].text));
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

