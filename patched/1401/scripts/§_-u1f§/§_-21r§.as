package §_-u1f§
{
   import §_-A2x§.§_-01J§;
   import §_-A2x§.§_-Ar§;
   import §_-Y1A§.§_-I1f§;
   import protocol.§_-S2I§;
   
   public class §_-21r§ extends §_-Ar§
   {
      
      private static var §_-cF§:§_-I1f§ = null;
      
      public function §_-21r§()
      {
         super();
      }
      
      override public function §_-vw§() : void
      {
         this.§_-Ac§.§_-sZ§((this.squirrels as §_-63b§).§_-pa§);
         if(this.§_-Ac§.visible)
         {
            this.§_-Ac§.hide();
         }
         else
         {
            this.§_-Ac§.show();
         }
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         var _loc2_:Boolean = param1[0] == §_-S2I§.§_-RO§;
         this.§_-Ac§.§_-sZ§((this.squirrels as §_-63b§).§_-pa§);
         this.§_-Ac§.§_-W2y§ = _loc2_;
         if(_loc2_)
         {
            this.§_-Ac§.show();
         }
         else
         {
            this.§_-Ac§.hide();
         }
      }
      
      override protected function init() : void
      {
         this.cast = new §_-01J§(this);
         this.map = new §_-u15§(this);
         this.squirrels = new §_-63b§();
         §_-93L§ = this.§_-Ac§;
      }
      
      override protected function §_-G1a§() : void
      {
         this.§_-Ac§.§_-sZ§((this.squirrels as §_-63b§).§_-pa§);
         if(!this.§_-Ac§.visible)
         {
            this.§_-Ac§.show();
         }
      }
      
      override protected function §_-e1D§() : void
      {
      }
      
      private function get §_-Ac§() : §_-I1f§
      {
         if(!§_-cF§)
         {
            §_-cF§ = new §_-I1f§();
         }
         return §_-cF§;
      }
   }
}

