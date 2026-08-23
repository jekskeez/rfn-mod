package §_-wJ§
{
   import flash.display.Sprite;
   import tape.§_-L2v§;
   
   public class §_-q2U§ extends §_-L2v§
   {
      
      public function §_-q2U§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean = false, param10:Boolean = true)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      override protected function §_-j2y§() : void
      {
      }
      
      override protected function updateButtons() : void
      {
      }
      
      override protected function §_-nZ§() : void
      {
         var _loc5_:Sprite = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.data == null)
         {
            return;
         }
         §_-S1q§();
         var _loc1_:int = (§_-A1Z§ * §_-w1q§ - this.data.objects.length) * (this.§_-13r§ + this.offsetX) * 0.5;
         var _loc2_:int = Math.min(this.offset + this.§_-A1Z§ * this.§_-w1q§,this.data.objects.length);
         var _loc3_:int = this.offset;
         var _loc4_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = this.data.objects[_loc3_];
            if(this.§_-I2f§)
            {
               _loc5_.x = (this.§_-13r§ + this.offsetX) * int((_loc3_ - this.offset) % this.§_-A1Z§) + (int((_loc3_ - this.offset) / this.§_-A1Z§) == §_-w1q§ - 1 ? _loc1_ : 0);
               _loc5_.y = (this.§_-g6§ + this.offsetY) * int((_loc3_ - this.offset) / this.§_-A1Z§);
            }
            else
            {
               _loc6_ = _loc4_ % this.§_-w1q§;
               _loc7_ = _loc4_ / this.§_-w1q§;
               _loc5_.x = (this.§_-13r§ + this.offsetX) * _loc7_;
               _loc5_.y = (this.§_-g6§ + this.offsetY) * _loc6_;
            }
            this.sprite.addChild(_loc5_);
            _loc3_++;
            _loc4_++;
         }
      }
   }
}

