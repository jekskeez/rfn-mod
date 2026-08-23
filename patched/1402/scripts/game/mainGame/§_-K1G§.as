package game.mainGame
{
   import §_-TK§.§_-aS§;
   
   public class §_-K1G§ extends §_-aS§
   {
      
      protected static const §_-nU§:int = 5;
      
      protected var §_-d1Y§:§_-aS§ = null;
      
      protected var §_-R2F§:Vector.<§_-aS§> = null;
      
      private var §_-X2X§:int = 0;
      
      public function §_-K1G§(param1:Boolean = false, param2:Boolean = false)
      {
         super();
         if(param2)
         {
            this.§_-F0§();
         }
         else
         {
            this.§_-o1q§(param1,false);
         }
      }
      
      public function §_-o1q§(param1:Boolean = false, param2:Boolean = true) : void
      {
         this.§_-d1Y§ = new §_-aS§(param1 ? new HitPointBlueHalf() : new HitPointRedHalf());
         this.§_-R2F§ = new Vector.<§_-aS§>(§_-nU§,true);
         var _loc3_:int = 0;
         while(_loc3_ < §_-nU§)
         {
            this.§_-R2F§[_loc3_] = new §_-aS§(param1 ? new HitPointBlue() : new HitPointRed());
            _loc3_++;
         }
         if(param2)
         {
            this.§_-Ic§();
         }
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:int = param2 / (§_-nU§ * 2);
         var _loc4_:int = param1 / _loc3_;
         if(this.§_-X2X§ == _loc4_)
         {
            return;
         }
         this.§_-X2X§ = _loc4_;
         this.§_-Ic§();
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         this.§_-d1Y§ = null;
         this.§_-R2F§ = null;
      }
      
      private function §_-F0§() : void
      {
         this.§_-d1Y§ = new §_-aS§(new DropSmall());
         this.§_-R2F§ = new Vector.<§_-aS§>(§_-nU§,true);
         var _loc1_:int = 0;
         while(_loc1_ < §_-nU§)
         {
            this.§_-R2F§[_loc1_] = new §_-aS§(new DropBig());
            _loc1_++;
         }
      }
      
      private function §_-Ic§() : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:§_-aS§ = null;
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         var _loc1_:int = int((this.§_-X2X§ + 1) * 0.5);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.§_-X2X§ - _loc2_ * 2 == 1;
            _loc4_ = _loc3_ ? this.§_-d1Y§ : this.§_-R2F§[_loc2_];
            _loc4_.x = 12 * _loc2_;
            _loc4_.y = _loc3_ ? 4 : 0;
            §_-J2J§(_loc4_);
            _loc2_++;
         }
         this.x = -this.width * 0.5;
      }
   }
}

