package §_-B1O§
{
   import §_-RI§.§_-h2I§;
   
   public class §_-Y2y§ extends §_-N2o§
   {
      
      private var §_-m2D§:Number = 0;
      
      public function §_-Y2y§()
      {
         super();
         §_-71E§ = new this.leftClass().width - 2;
         this.§_-m2D§ = new this.middleClass().height;
         this.draw();
      }
      
      override protected function draw() : void
      {
         var _loc3_:§_-h2I§ = null;
         while(§_-J1p§.numChildren > 0)
         {
            §_-J1p§.§_-ek§(0).removeFromParent(true);
            §_-J1p§.§_-n2T§(0);
         }
         while(this.§_-12§.numChildren > 0)
         {
            this.§_-12§.§_-n2T§(0,true);
         }
         var _loc1_:int = Math.round((this._width - this.§_-71E§) / this.§_-x2A§) - 2;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = new §_-h2I§(new this.middleClass());
            _loc3_.x = _loc2_ * _loc3_.width;
            §_-J1p§.§_-83v§(_loc3_);
            _loc2_++;
         }
         §_-J1p§.x = this.§_-71E§;
         if(Boolean(§_-J1p§.width) && Boolean(§_-J1p§.height))
         {
            this.§_-12§.§_-83v§(§_-J1p§);
         }
         §_-1k§.x = §_-J1p§.x + §_-J1p§.width;
         §_-R2H§();
         §_-J1p§.y = this.§_-m2D§ + 1;
         §_-y19§.y = -this.§_-m2D§;
      }
      
      override protected function get leftClass() : Class
      {
         return BridgeLeft;
      }
      
      override protected function get middleClass() : Class
      {
         return BridgeMiddle;
      }
      
      override protected function get rightClass() : Class
      {
         return BridgeRight;
      }
   }
}

