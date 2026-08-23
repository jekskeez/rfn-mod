package §_-K2c§
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Point;
   import starling.core.Starling;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   import starling.textures.Texture;
   
   internal class §_-H22§ extends Sprite
   {
      
      private var §_-N2B§:Point;
      
      private var §_-W1E§:Texture;
      
      public function §_-H22§()
      {
         var _loc2_:§_-jH§ = null;
         super();
         this.§_-N2B§ = new Point();
         this.§_-W1E§ = this.createTexture();
         var _loc1_:int = 0;
         while(_loc1_ < 2)
         {
            _loc2_ = new §_-jH§(this.§_-W1E§);
            _loc2_.pivotX = this.§_-W1E§.width / 2;
            _loc2_.pivotY = this.§_-W1E§.height / 2;
            _loc2_.touchable = false;
            addChild(_loc2_);
            _loc1_++;
         }
      }
      
      override public function dispose() : void
      {
         this.§_-W1E§.dispose();
         super.dispose();
      }
      
      public function §_-522§(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param3)
         {
            this.§_-N2B§.x += param1 - this.§_-D2H§.x;
            this.§_-N2B§.y += param2 - this.§_-D2H§.y;
         }
         this.§_-D2H§.x = param1;
         this.§_-D2H§.y = param2;
         this.§_-b1E§.x = 2 * this.§_-N2B§.x - param1;
         this.§_-b1E§.y = 2 * this.§_-N2B§.y - param2;
      }
      
      public function §_-k2A§(param1:Number, param2:Number) : void
      {
         this.§_-N2B§.x = param1;
         this.§_-N2B§.y = param2;
         this.§_-522§(this.§_-PH§,this.§_-z1g§);
      }
      
      private function createTexture() : Texture
      {
         var _loc1_:Number = Starling.§_-61w§;
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
         return Texture.§_-b2K§(_loc7_,false,false,_loc1_);
      }
      
      private function get §_-D2H§() : §_-jH§
      {
         return getChildAt(0) as §_-jH§;
      }
      
      private function get §_-b1E§() : §_-jH§
      {
         return getChildAt(1) as §_-jH§;
      }
      
      public function get §_-PH§() : Number
      {
         return this.§_-D2H§.x;
      }
      
      public function get §_-z1g§() : Number
      {
         return this.§_-D2H§.y;
      }
      
      public function get §_-m2y§() : Number
      {
         return this.§_-b1E§.x;
      }
      
      public function get §_-R1T§() : Number
      {
         return this.§_-b1E§.y;
      }
   }
}

