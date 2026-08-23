package §_-f1T§
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Point;
   import starling.core.Starling;
   import starling.display.Sprite;
   import starling.display.§_-I2q§;
   import starling.textures.Texture;
   
   internal class §_-V1r§ extends Sprite
   {
      
      private var §_-F2x§:Point;
      
      private var §_-A1m§:Texture;
      
      public function §_-V1r§()
      {
         var _loc2_:§_-I2q§ = null;
         super();
         this.§_-F2x§ = new Point();
         this.§_-A1m§ = this.createTexture();
         var _loc1_:int = 0;
         while(_loc1_ < 2)
         {
            _loc2_ = new §_-I2q§(this.§_-A1m§);
            _loc2_.pivotX = this.§_-A1m§.width / 2;
            _loc2_.pivotY = this.§_-A1m§.height / 2;
            _loc2_.touchable = false;
            addChild(_loc2_);
            _loc1_++;
         }
      }
      
      override public function dispose() : void
      {
         this.§_-A1m§.dispose();
         super.dispose();
      }
      
      public function §_-yc§(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param3)
         {
            this.§_-F2x§.x += param1 - this.§_-024§.x;
            this.§_-F2x§.y += param2 - this.§_-024§.y;
         }
         this.§_-024§.x = param1;
         this.§_-024§.y = param2;
         this.§_-E2u§.x = 2 * this.§_-F2x§.x - param1;
         this.§_-E2u§.y = 2 * this.§_-F2x§.y - param2;
      }
      
      public function §_-j2p§(param1:Number, param2:Number) : void
      {
         this.§_-F2x§.x = param1;
         this.§_-F2x§.y = param2;
         this.§_-yc§(this.§_-LP§,this.§_-62k§);
      }
      
      private function createTexture() : Texture
      {
         var _loc1_:Number = Starling.§_-Cj§;
         var _loc2_:Number = 12 * _loc1_;
         var _loc3_:int = 32 * _loc1_;
         var _loc4_:int = 32 * _loc1_;
         var _loc5_:Number = 1.5 * _loc1_;
         var _loc6_:Shape = new Shape();
         _loc6_.graphics.lineStyle(_loc5_,0,0.3);
         _loc6_.graphics.drawCircle(_loc3_ / 2,_loc4_ / 2,_loc2_ + _loc5_);
         _loc6_.graphics.beginFill(16777215,0.4);
         _loc6_.graphics.lineStyle(_loc5_,16777215);
         _loc6_.graphics.drawCircle(_loc3_ / 2,_loc4_ / 2,_loc2_);
         _loc6_.graphics.endFill();
         var _loc7_:BitmapData = new BitmapData(_loc3_,_loc4_,true,0);
         _loc7_.draw(_loc6_);
         return Texture.§_-h2H§(_loc7_,false,false,_loc1_);
      }
      
      private function get §_-024§() : §_-I2q§
      {
         return getChildAt(0) as §_-I2q§;
      }
      
      private function get §_-E2u§() : §_-I2q§
      {
         return getChildAt(1) as §_-I2q§;
      }
      
      public function get §_-LP§() : Number
      {
         return this.§_-024§.x;
      }
      
      public function get §_-62k§() : Number
      {
         return this.§_-024§.y;
      }
      
      public function get §_-a2j§() : Number
      {
         return this.§_-E2u§.x;
      }
      
      public function get §_-132§() : Number
      {
         return this.§_-E2u§.y;
      }
   }
}

