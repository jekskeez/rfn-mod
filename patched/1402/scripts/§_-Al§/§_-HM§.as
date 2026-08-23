package §_-Al§
{
   import §_-E1v§.§_-w1k§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-HM§ extends §_-K1K§
   {
      
      private var message:String = "";
      
      public function §_-HM§()
      {
         super(§_-w1k§.§_-FM§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.message = param1[0];
         this.§_-23Z§[0].text = this.message;
      }
      
      override public function save() : §_-z1i§
      {
         this.message = this.§_-23Z§[0].text;
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-d2z§(this.message);
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-23Z§[0].height = 54;
         this.§_-23Z§[0].multiline = true;
         this.§_-23Z§[0].wordWrap = true;
         this.§_-51U§ = true;
         this.§_-51U§ = false;
      }
      
      override protected function get fieldList() : Array
      {
         return [""];
      }
      
      override protected function get fieldWidth() : int
      {
         return 250;
      }
   }
}

