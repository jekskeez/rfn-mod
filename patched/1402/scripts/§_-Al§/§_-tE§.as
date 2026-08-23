package §_-Al§
{
   import §_-E1v§.§_-w1k§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-tE§ extends §_-K1K§
   {
      
      private var §_-oh§:int = 0;
      
      private var places:int = 0;
      
      public function §_-tE§()
      {
         super(§_-w1k§.SIZE);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.§_-oh§ = param1.length > 0 ? int(param1[0]) : 0;
         this.places = param1.length > 1 ? int(param1[1]) : 0;
         this.§_-23Z§[0].text = this.§_-oh§.toString();
         this.§_-23Z§[1].text = this.places.toString();
         this.§_-23Z§[0].selectable = false;
      }
      
      override public function save() : §_-z1i§
      {
         this.places = int(this.§_-23Z§[1].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.places);
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

