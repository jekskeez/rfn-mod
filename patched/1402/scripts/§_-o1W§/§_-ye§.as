package §_-o1W§
{
   import §_-g17§.§_-os§;
   import §_-td§.§_-vO§;
   import §_-td§.§_-z2w§;
   import protocol.§_-s2l§;
   
   public class §_-ye§ extends §_-vO§
   {
      
      private static var §_-ih§:§_-os§ = null;
      
      public function §_-ye§()
      {
         super();
      }
      
      override public function §_-s2p§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = (this.squirrels as §_-i11§).§_-F2B§.concat();
         if(!Hero.self.§_-P12§)
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
         this.§_-p1W§.§_-C1k§(_loc1_);
         if(this.§_-p1W§.visible)
         {
            this.§_-p1W§.hide();
         }
         else
         {
            this.§_-p1W§.show();
         }
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         var _loc2_:Boolean = param1[0] == §_-s2l§.§_-02x§;
         this.§_-p1W§.§_-C1k§((this.squirrels as §_-i11§).§_-F2B§);
         this.§_-p1W§.§_-xE§ = _loc2_;
         if(_loc2_)
         {
            this.§_-p1W§.show();
         }
         else
         {
            this.§_-p1W§.hide();
         }
      }
      
      override protected function init() : void
      {
         this.cast = new §_-z2w§(this);
         this.map = new §_-e2W§(this);
         this.squirrels = new §_-i11§();
         §_-12U§ = this.§_-p1W§;
      }
      
      override protected function §_-23R§() : void
      {
      }
      
      override protected function §_-Q2Q§() : void
      {
         if(!this.§_-p1W§.visible)
         {
            this.§_-p1W§.show();
         }
      }
      
      private function get §_-p1W§() : §_-os§
      {
         if(!§_-ih§)
         {
            §_-ih§ = new §_-os§();
         }
         return §_-ih§;
      }
   }
}

