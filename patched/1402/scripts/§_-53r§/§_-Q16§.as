package §_-53r§
{
   import §_-g17§.§_-g1U§;
   import §_-td§.§_-vO§;
   import §_-td§.§_-z2w§;
   import protocol.§_-s2l§;
   
   public class §_-Q16§ extends §_-vO§
   {
      
      private static var §_-c2a§:§_-g1U§ = null;
      
      public function §_-Q16§()
      {
         super();
      }
      
      override public function §_-s2p§() : void
      {
         this.§_-d1I§.§_-C1k§((this.squirrels as §_-u2b§).§_-F2B§);
         if(this.§_-d1I§.visible)
         {
            this.§_-d1I§.hide();
         }
         else
         {
            this.§_-d1I§.show();
         }
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         var _loc2_:Boolean = param1[0] == §_-s2l§.§_-02x§;
         this.§_-d1I§.§_-C1k§((this.squirrels as §_-u2b§).§_-F2B§);
         this.§_-d1I§.§_-xE§ = _loc2_;
         if(_loc2_)
         {
            this.§_-d1I§.show();
         }
         else
         {
            this.§_-d1I§.hide();
         }
      }
      
      override protected function init() : void
      {
         this.cast = new §_-z2w§(this);
         this.map = new §_-c2J§(this);
         this.squirrels = new §_-u2b§();
         §_-12U§ = this.§_-d1I§;
      }
      
      override protected function §_-Q2Q§() : void
      {
         this.§_-d1I§.§_-C1k§((this.squirrels as §_-u2b§).§_-F2B§);
         if(!this.§_-d1I§.visible)
         {
            this.§_-d1I§.show();
         }
      }
      
      override protected function §_-23R§() : void
      {
      }
      
      private function get §_-d1I§() : §_-g1U§
      {
         if(!§_-c2a§)
         {
            §_-c2a§ = new §_-g1U§();
         }
         return §_-c2a§;
      }
   }
}

