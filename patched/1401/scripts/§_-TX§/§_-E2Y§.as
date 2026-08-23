package §_-TX§
{
   import §_-A2x§.§_-01J§;
   import §_-A2x§.§_-Ar§;
   import §_-Y1A§.§_-au§;
   import protocol.§_-S2I§;
   
   public class §_-E2Y§ extends §_-Ar§
   {
      
      private static var §_-8O§:§_-au§ = null;
      
      public function §_-E2Y§()
      {
         super();
      }
      
      override public function §_-vw§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = (this.squirrels as §_-uw§).§_-pa§.concat();
         if(!Hero.self.§_-S1K§)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               if(Game.selfId in _loc1_[_loc2_])
               {
                  delete _loc1_[_loc2_][Game.selfId];
               }
               _loc2_++;
            }
         }
         this.§_-32Q§.§_-sZ§(_loc1_);
         if(this.§_-32Q§.visible)
         {
            this.§_-32Q§.hide();
         }
         else
         {
            this.§_-32Q§.show();
         }
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         var _loc2_:Boolean = param1[0] == §_-S2I§.§_-RO§;
         this.§_-32Q§.§_-sZ§((this.squirrels as §_-uw§).§_-pa§);
         this.§_-32Q§.§_-W2y§ = _loc2_;
         if(_loc2_)
         {
            this.§_-32Q§.show();
         }
         else
         {
            this.§_-32Q§.hide();
         }
      }
      
      override protected function init() : void
      {
         this.cast = new §_-01J§(this);
         this.map = new §_-f1c§(this);
         this.squirrels = new §_-uw§();
         §_-93L§ = this.§_-32Q§;
      }
      
      override protected function §_-e1D§() : void
      {
      }
      
      override protected function §_-G1a§() : void
      {
         if(!this.§_-32Q§.visible)
         {
            this.§_-32Q§.show();
         }
      }
      
      private function get §_-32Q§() : §_-au§
      {
         if(!§_-8O§)
         {
            §_-8O§ = new §_-au§();
         }
         return §_-8O§;
      }
   }
}

