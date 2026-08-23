package §_-j2H§
{
   import §_-TK§.§_-aS§;
   
   public class §_-k1§ extends §_-T2i§
   {
      
      private var §_-L1w§:Number = 0;
      
      public function §_-k1§()
      {
         super();
         §_-J1Q§ = new this.leftClass().width - 2;
         this.§_-L1w§ = new this.middleClass().height;
         this.draw();
      }
      
      override protected function draw() : void
      {
         var _loc3_:§_-aS§ = null;
         while(§_-56§.numChildren > 0)
         {
            §_-56§.§_-kD§(0).removeFromParent(true);
            §_-56§.§_-av§(0);
         }
         while(this.§_-N2D§.numChildren > 0)
         {
            this.§_-N2D§.§_-av§(0,true);
         }
         var _loc1_:int = Math.round((this._width - this.§_-J1Q§) / this.§_-a2S§) - 2;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = new §_-aS§(new this.middleClass());
            _loc3_.x = _loc2_ * _loc3_.width;
            §_-56§.§_-J2J§(_loc3_);
            _loc2_++;
         }
         §_-56§.x = this.§_-J1Q§;
         if(Boolean(§_-56§.width) && Boolean(§_-56§.height))
         {
            this.§_-N2D§.§_-J2J§(§_-56§);
         }
         §_-j2g§.x = §_-56§.x + §_-56§.width;
         §_-uz§();
         §_-56§.y = this.§_-L1w§ + 1;
         §_-f2Y§.y = -this.§_-L1w§;
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

