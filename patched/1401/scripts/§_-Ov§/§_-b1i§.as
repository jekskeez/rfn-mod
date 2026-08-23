package §_-Ov§
{
   public class §_-b1i§
   {
      
      public var red:Number;
      
      public var green:Number;
      
      public var blue:Number;
      
      public var alpha:Number;
      
      public function §_-b1i§(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.red = param1;
         this.green = param2;
         this.blue = param3;
         this.alpha = param4;
      }
      
      public static function §_-r1l§(param1:uint) : §_-b1i§
      {
         var _loc2_:§_-b1i§ = new §_-b1i§();
         _loc2_.§_-r1l§(param1);
         return _loc2_;
      }
      
      public static function §_-73p§(param1:uint) : §_-b1i§
      {
         var _loc2_:§_-b1i§ = new §_-b1i§();
         _loc2_.§_-73p§(param1);
         return _loc2_;
      }
      
      public function §_-N1i§() : uint
      {
         var _loc1_:Number = this.red;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         else if(_loc1_ > 1)
         {
            _loc1_ = 1;
         }
         var _loc2_:Number = this.green;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         var _loc3_:Number = this.blue;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         else if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         return int(_loc1_ * 255) << 16 | int(_loc2_ * 255) << 8 | int(_loc3_ * 255);
      }
      
      public function §_-B1W§() : uint
      {
         var _loc1_:Number = this.alpha;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         else if(_loc1_ > 1)
         {
            _loc1_ = 1;
         }
         var _loc2_:Number = this.red;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         var _loc3_:Number = this.green;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         else if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         var _loc4_:Number = this.blue;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         else if(_loc4_ > 1)
         {
            _loc4_ = 1;
         }
         return int(_loc1_ * 255) << 24 | int(_loc2_ * 255) << 16 | int(_loc3_ * 255) << 8 | int(_loc4_ * 255);
      }
      
      public function §_-r1l§(param1:uint) : void
      {
         this.red = (param1 >> 16 & 0xFF) / 255;
         this.green = (param1 >> 8 & 0xFF) / 255;
         this.blue = (param1 & 0xFF) / 255;
      }
      
      public function §_-73p§(param1:uint) : void
      {
         this.red = (param1 >> 16 & 0xFF) / 255;
         this.green = (param1 >> 8 & 0xFF) / 255;
         this.blue = (param1 & 0xFF) / 255;
         this.alpha = (param1 >> 24 & 0xFF) / 255;
      }
      
      public function copyFrom(param1:§_-b1i§) : void
      {
         this.red = param1.red;
         this.green = param1.green;
         this.blue = param1.blue;
         this.alpha = param1.alpha;
      }
   }
}

