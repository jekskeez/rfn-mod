package §_-p1f§
{
   import §_-l26§.§_-z2g§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-a1Q§ extends §_-6Y§
   {
      
      private var message:String = "";
      
      public function §_-a1Q§()
      {
         super(§_-z2g§.§_-K12§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.message = param1[0];
         this.§_-53o§[0].text = this.message;
      }
      
      override public function save() : §_-U1M§
      {
         this.message = this.§_-53o§[0].text;
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-4E§(this.message);
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-53o§[0].height = 54;
         this.§_-53o§[0].multiline = true;
         this.§_-53o§[0].wordWrap = true;
         this.§_-72j§ = true;
         this.§_-72j§ = false;
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

