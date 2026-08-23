package game.mainGame
{
   import §_-RI§.§_-h2I§;
   
   public class §_-YI§ extends §_-h2I§
   {
      
      protected static const §_-T2w§:int = 5;
      
      protected var §_-q23§:§_-h2I§ = null;
      
      protected var §_-Ql§:Vector.<§_-h2I§> = null;
      
      private var §_-z2P§:int = 0;
      
      public function §_-YI§(param1:Boolean = false, param2:Boolean = false)
      {
         super();
         if(param2)
         {
            this.§_-h1a§();
         }
         else
         {
            this.§_-b2f§(param1,false);
         }
      }
      
      public function §_-b2f§(param1:Boolean = false, param2:Boolean = true) : void
      {
         this.§_-q23§ = new §_-h2I§(param1 ? new HitPointBlueHalf() : new HitPointRedHalf());
         this.§_-Ql§ = new Vector.<§_-h2I§>(§_-T2w§,true);
         var _loc3_:int = 0;
         while(_loc3_ < §_-T2w§)
         {
            this.§_-Ql§[_loc3_] = new §_-h2I§(param1 ? new HitPointBlue() : new HitPointRed());
            _loc3_++;
         }
         if(param2)
         {
            this.§_-c2u§();
         }
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:int = param2 / (§_-T2w§ * 2);
         var _loc4_:int = param1 / _loc3_;
         if(this.§_-z2P§ == _loc4_)
         {
            return;
         }
         this.§_-z2P§ = _loc4_;
         this.§_-c2u§();
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         this.§_-q23§ = null;
         this.§_-Ql§ = null;
      }
      
      private function §_-h1a§() : void
      {
         this.§_-q23§ = new §_-h2I§(new DropSmall());
         this.§_-Ql§ = new Vector.<§_-h2I§>(§_-T2w§,true);
         var _loc1_:int = 0;
         while(_loc1_ < §_-T2w§)
         {
            this.§_-Ql§[_loc1_] = new §_-h2I§(new DropBig());
            _loc1_++;
         }
      }
      
      private function §_-c2u§() : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:§_-h2I§ = null;
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         var _loc1_:int = int((this.§_-z2P§ + 1) * 0.5);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.§_-z2P§ - _loc2_ * 2 == 1;
            _loc4_ = _loc3_ ? this.§_-q23§ : this.§_-Ql§[_loc2_];
            _loc4_.x = 12 * _loc2_;
            _loc4_.y = _loc3_ ? 4 : 0;
            §_-83v§(_loc4_);
            _loc2_++;
         }
         this.x = -this.width * 0.5;
      }
   }
}

