package starling.utils
{
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   
   public class §_-U2i§
   {
      
      public static const §_-l1J§:int = 8;
      
      public static const §_-V2M§:int = 0;
      
      public static const §_-c1S§:int = 2;
      
      public static const §_-F2I§:int = 6;
      
      private static var §_-O§:Point = new Point();
      
      private static var sHelperPoint3D:Vector3D = new Vector3D();
      
      private var §_-J2K§:Vector.<Number>;
      
      private var §_-9X§:Boolean;
      
      private var §_-O22§:int;
      
      public function §_-U2i§(param1:int, param2:Boolean = false)
      {
         super();
         this.§_-J2K§ = new Vector.<Number>(0);
         this.§_-9X§ = param2;
         this.§_-d18§ = param1;
      }
      
      public function clone(param1:int = 0, param2:int = -1) : §_-U2i§
      {
         if(param2 < 0 || param1 + param2 > this.§_-O22§)
         {
            param2 = this.§_-O22§ - param1;
         }
         var _loc3_:§_-U2i§ = new §_-U2i§(0,this.§_-9X§);
         _loc3_.§_-O22§ = param2;
         _loc3_.§_-J2K§ = this.§_-J2K§.slice(param1 * §_-l1J§,param2 * §_-l1J§);
         _loc3_.§_-J2K§.fixed = true;
         return _loc3_;
      }
      
      public function §_-5D§(param1:§_-U2i§, param2:int = 0, param3:int = 0, param4:int = -1) : void
      {
         this.§_-93B§(param1,param2,null,param3,param4);
      }
      
      public function §_-93B§(param1:§_-U2i§, param2:int = 0, param3:Matrix = null, param4:int = 0, param5:int = -1) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param5 < 0 || param4 + param5 > this.§_-O22§)
         {
            param5 = this.§_-O22§ - param4;
         }
         var _loc8_:Vector.<Number> = param1.§_-J2K§;
         var _loc9_:* = int(param2 * §_-l1J§);
         var _loc10_:* = int(param4 * §_-l1J§);
         var _loc11_:int = (param4 + param5) * §_-l1J§;
         if(param3)
         {
            while(_loc10_ < _loc11_)
            {
               _loc6_ = this.§_-J2K§[int(_loc10_++)];
               _loc7_ = this.§_-J2K§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = param3.a * _loc6_ + param3.c * _loc7_ + param3.tx;
               _loc8_[int(_loc9_++)] = param3.d * _loc7_ + param3.b * _loc6_ + param3.ty;
               _loc8_[int(_loc9_++)] = this.§_-J2K§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-J2K§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-J2K§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-J2K§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-J2K§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-J2K§[int(_loc10_++)];
            }
         }
         else
         {
            while(_loc10_ < _loc11_)
            {
               _loc8_[int(_loc9_++)] = this.§_-J2K§[int(_loc10_++)];
            }
         }
      }
      
      public function append(param1:§_-U2i§) : void
      {
         this.§_-J2K§.fixed = false;
         var _loc2_:* = int(this.§_-J2K§.length);
         var _loc3_:Vector.<Number> = param1.§_-J2K§;
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            this.§_-J2K§[int(_loc2_++)] = _loc3_[_loc5_];
            _loc5_++;
         }
         this.§_-O22§ += param1.§_-d18§;
         this.§_-J2K§.fixed = true;
      }
      
      public function setPosition(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 * §_-l1J§ + §_-V2M§;
         this.§_-J2K§[_loc4_] = param2;
         this.§_-J2K§[int(_loc4_ + 1)] = param3;
      }
      
      public function getPosition(param1:int, param2:Point) : void
      {
         var _loc3_:int = param1 * §_-l1J§ + §_-V2M§;
         param2.x = this.§_-J2K§[_loc3_];
         param2.y = this.§_-J2K§[int(_loc3_ + 1)];
      }
      
      public function §_-W1J§(param1:int, param2:uint, param3:Number) : void
      {
         if(param3 < 0.001)
         {
            param3 = 0.001;
         }
         else if(param3 > 1)
         {
            param3 = 1;
         }
         var _loc4_:int = param1 * §_-l1J§ + §_-c1S§;
         var _loc5_:Number = this.§_-9X§ ? param3 : 1;
         this.§_-J2K§[_loc4_] = (param2 >> 16 & 0xFF) / 255 * _loc5_;
         this.§_-J2K§[int(_loc4_ + 1)] = (param2 >> 8 & 0xFF) / 255 * _loc5_;
         this.§_-J2K§[int(_loc4_ + 2)] = (param2 & 0xFF) / 255 * _loc5_;
         this.§_-J2K§[int(_loc4_ + 3)] = param3;
      }
      
      public function setColor(param1:int, param2:uint) : void
      {
         var _loc3_:int = param1 * §_-l1J§ + §_-c1S§;
         var _loc4_:Number = this.§_-9X§ ? this.§_-J2K§[int(_loc3_ + 3)] : 1;
         this.§_-J2K§[_loc3_] = (param2 >> 16 & 0xFF) / 255 * _loc4_;
         this.§_-J2K§[int(_loc3_ + 1)] = (param2 >> 8 & 0xFF) / 255 * _loc4_;
         this.§_-J2K§[int(_loc3_ + 2)] = (param2 & 0xFF) / 255 * _loc4_;
      }
      
      public function §_-AR§(param1:int) : uint
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc2_:int = param1 * §_-l1J§ + §_-c1S§;
         var _loc3_:Number = this.§_-9X§ ? this.§_-J2K§[int(_loc2_ + 3)] : 1;
         if(_loc3_ == 0)
         {
            return 0;
         }
         _loc4_ = this.§_-J2K§[_loc2_] / _loc3_;
         _loc5_ = this.§_-J2K§[int(_loc2_ + 1)] / _loc3_;
         _loc6_ = this.§_-J2K§[int(_loc2_ + 2)] / _loc3_;
         return int(_loc4_ * 255) << 16 | int(_loc5_ * 255) << 8 | int(_loc6_ * 255);
      }
      
      public function §_-D2h§(param1:int, param2:Number) : void
      {
         if(this.§_-9X§)
         {
            this.§_-W1J§(param1,this.§_-AR§(param1),param2);
         }
         else
         {
            this.§_-J2K§[int(param1 * §_-l1J§ + §_-c1S§ + 3)] = param2;
         }
      }
      
      public function §_-E2h§(param1:int) : Number
      {
         var _loc2_:int = param1 * §_-l1J§ + §_-c1S§ + 3;
         return this.§_-J2K§[_loc2_];
      }
      
      public function §_-N1O§(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 * §_-l1J§ + §_-F2I§;
         this.§_-J2K§[_loc4_] = param2;
         this.§_-J2K§[int(_loc4_ + 1)] = param3;
      }
      
      public function §_-Yn§(param1:int, param2:Point) : void
      {
         var _loc3_:int = param1 * §_-l1J§ + §_-F2I§;
         param2.x = this.§_-J2K§[_loc3_];
         param2.y = this.§_-J2K§[int(_loc3_ + 1)];
      }
      
      public function §_-f2U§(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 * §_-l1J§ + §_-V2M§;
         this.§_-J2K§[_loc4_] += param2;
         this.§_-J2K§[int(_loc4_ + 1)] = this.§_-J2K§[int(_loc4_ + 1)] + param3;
      }
      
      public function §_-92I§(param1:int, param2:Matrix, param3:int = 1) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = param1 * §_-l1J§ + §_-V2M§;
         var _loc7_:int = 0;
         while(_loc7_ < param3)
         {
            _loc4_ = this.§_-J2K§[_loc6_];
            _loc5_ = this.§_-J2K§[int(_loc6_ + 1)];
            this.§_-J2K§[_loc6_] = param2.a * _loc4_ + param2.c * _loc5_ + param2.tx;
            this.§_-J2K§[int(_loc6_ + 1)] = param2.d * _loc5_ + param2.b * _loc4_ + param2.ty;
            _loc6_ += §_-l1J§;
            _loc7_++;
         }
      }
      
      public function §_-P15§(param1:uint) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-O22§)
         {
            this.setColor(_loc2_,param1);
            _loc2_++;
         }
      }
      
      public function §_-r11§(param1:Number) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-O22§)
         {
            this.§_-D2h§(_loc2_,param1);
            _loc2_++;
         }
      }
      
      public function §_-M1c§(param1:int, param2:Number, param3:int = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2 == 1)
         {
            return;
         }
         if(param3 < 0 || param1 + param3 > this.§_-O22§)
         {
            param3 = this.§_-O22§ - param1;
         }
         if(this.§_-9X§)
         {
            _loc4_ = 0;
            while(_loc4_ < param3)
            {
               this.§_-D2h§(param1 + _loc4_,this.§_-E2h§(param1 + _loc4_) * param2);
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = param1 * §_-l1J§ + §_-c1S§ + 3;
            _loc4_ = 0;
            while(_loc4_ < param3)
            {
               this.§_-J2K§[int(_loc5_ + _loc4_ * §_-l1J§)] = this.§_-J2K§[int(_loc5_ + _loc4_ * §_-l1J§)] * param2;
               _loc4_++;
            }
         }
      }
      
      public function getBounds(param1:Matrix = null, param2:int = 0, param3:int = -1, param4:Rectangle = null) : Rectangle
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         if(param4 == null)
         {
            param4 = new Rectangle();
         }
         if(param3 < 0 || param2 + param3 > this.§_-O22§)
         {
            param3 = this.§_-O22§ - param2;
         }
         if(param3 == 0)
         {
            if(param1 == null)
            {
               param4.setEmpty();
            }
            else
            {
               §_-r1p§.§_-317§(param1,0,0,§_-O§);
               param4.setTo(§_-O§.x,§_-O§.y,0,0);
            }
         }
         else
         {
            _loc5_ = Number.MAX_VALUE;
            _loc6_ = -Number.MAX_VALUE;
            _loc7_ = Number.MAX_VALUE;
            _loc8_ = -Number.MAX_VALUE;
            _loc9_ = param2 * §_-l1J§ + §_-V2M§;
            if(param1 == null)
            {
               _loc12_ = 0;
               while(_loc12_ < param3)
               {
                  _loc10_ = this.§_-J2K§[_loc9_];
                  _loc11_ = this.§_-J2K§[int(_loc9_ + 1)];
                  _loc9_ += §_-l1J§;
                  if(_loc5_ > _loc10_)
                  {
                     _loc5_ = _loc10_;
                  }
                  if(_loc6_ < _loc10_)
                  {
                     _loc6_ = _loc10_;
                  }
                  if(_loc7_ > _loc11_)
                  {
                     _loc7_ = _loc11_;
                  }
                  if(_loc8_ < _loc11_)
                  {
                     _loc8_ = _loc11_;
                  }
                  _loc12_++;
               }
            }
            else
            {
               _loc12_ = 0;
               while(_loc12_ < param3)
               {
                  _loc10_ = this.§_-J2K§[_loc9_];
                  _loc11_ = this.§_-J2K§[int(_loc9_ + 1)];
                  _loc9_ += §_-l1J§;
                  §_-r1p§.§_-317§(param1,_loc10_,_loc11_,§_-O§);
                  if(_loc5_ > §_-O§.x)
                  {
                     _loc5_ = §_-O§.x;
                  }
                  if(_loc6_ < §_-O§.x)
                  {
                     _loc6_ = §_-O§.x;
                  }
                  if(_loc7_ > §_-O§.y)
                  {
                     _loc7_ = §_-O§.y;
                  }
                  if(_loc8_ < §_-O§.y)
                  {
                     _loc8_ = §_-O§.y;
                  }
                  _loc12_++;
               }
            }
            param4.setTo(_loc5_,_loc7_,_loc6_ - _loc5_,_loc8_ - _loc7_);
         }
         return param4;
      }
      
      public function §_-An§(param1:Matrix3D, param2:Vector3D, param3:int = 0, param4:int = -1, param5:Rectangle = null) : Rectangle
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         if(param2 == null)
         {
            throw new ArgumentError("camPos must not be null");
         }
         if(param5 == null)
         {
            param5 = new Rectangle();
         }
         if(param4 < 0 || param3 + param4 > this.§_-O22§)
         {
            param4 = this.§_-O22§ - param3;
         }
         if(param4 == 0)
         {
            if(param1)
            {
               §_-r1p§.transformCoords3D(param1,0,0,0,sHelperPoint3D);
            }
            else
            {
               sHelperPoint3D.setTo(0,0,0);
            }
            §_-t1m§.§_-Y1O§(param2,sHelperPoint3D,§_-O§);
            param5.setTo(§_-O§.x,§_-O§.y,0,0);
         }
         else
         {
            _loc6_ = Number.MAX_VALUE;
            _loc7_ = -Number.MAX_VALUE;
            _loc8_ = Number.MAX_VALUE;
            _loc9_ = -Number.MAX_VALUE;
            _loc10_ = param3 * §_-l1J§ + §_-V2M§;
            _loc13_ = 0;
            while(_loc13_ < param4)
            {
               _loc11_ = this.§_-J2K§[_loc10_];
               _loc12_ = this.§_-J2K§[int(_loc10_ + 1)];
               _loc10_ += §_-l1J§;
               if(param1)
               {
                  §_-r1p§.transformCoords3D(param1,_loc11_,_loc12_,0,sHelperPoint3D);
               }
               else
               {
                  sHelperPoint3D.setTo(_loc11_,_loc12_,0);
               }
               §_-t1m§.§_-Y1O§(param2,sHelperPoint3D,§_-O§);
               if(_loc6_ > §_-O§.x)
               {
                  _loc6_ = §_-O§.x;
               }
               if(_loc7_ < §_-O§.x)
               {
                  _loc7_ = §_-O§.x;
               }
               if(_loc8_ > §_-O§.y)
               {
                  _loc8_ = §_-O§.y;
               }
               if(_loc9_ < §_-O§.y)
               {
                  _loc9_ = §_-O§.y;
               }
               _loc13_++;
            }
            param5.setTo(_loc6_,_loc8_,_loc7_ - _loc6_,_loc9_ - _loc8_);
         }
         return param5;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "[VertexData \n";
         var _loc2_:Point = new Point();
         var _loc3_:Point = new Point();
         var _loc4_:int = 0;
         while(_loc4_ < this.§_-d18§)
         {
            this.getPosition(_loc4_,_loc2_);
            this.§_-Yn§(_loc4_,_loc3_);
            _loc1_ += "  [Vertex " + _loc4_ + ": " + "x=" + _loc2_.x.toFixed(1) + ", " + "y=" + _loc2_.y.toFixed(1) + ", " + "rgb=" + this.§_-AR§(_loc4_).toString(16) + ", " + "a=" + this.§_-E2h§(_loc4_).toFixed(2) + ", " + "u=" + _loc3_.x.toFixed(4) + ", " + "v=" + _loc3_.y.toFixed(4) + "]" + (_loc4_ == this.§_-d18§ - 1 ? "\n" : ",\n");
            _loc4_++;
         }
         return _loc1_ + "]";
      }
      
      public function get tinted() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:int = §_-c1S§;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-O22§)
         {
            _loc3_ = 0;
            while(_loc3_ < 4)
            {
               if(this.§_-J2K§[int(_loc1_ + _loc3_)] != 1)
               {
                  return true;
               }
               _loc3_++;
            }
            _loc1_ += §_-l1J§;
            _loc2_++;
         }
         return false;
      }
      
      public function §_-W2h§(param1:Boolean, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param1 == this.§_-9X§)
         {
            return;
         }
         if(param2)
         {
            _loc3_ = this.§_-O22§ * §_-l1J§;
            _loc4_ = §_-c1S§;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.§_-J2K§[int(_loc4_ + 3)];
               _loc6_ = this.§_-9X§ ? _loc5_ : 1;
               _loc7_ = param1 ? _loc5_ : 1;
               if(_loc6_ != 0)
               {
                  this.§_-J2K§[_loc4_] = this.§_-J2K§[_loc4_] / _loc6_ * _loc7_;
                  this.§_-J2K§[int(_loc4_ + 1)] = this.§_-J2K§[int(_loc4_ + 1)] / _loc6_ * _loc7_;
                  this.§_-J2K§[int(_loc4_ + 2)] = this.§_-J2K§[int(_loc4_ + 2)] / _loc6_ * _loc7_;
               }
               _loc4_ += §_-l1J§;
            }
         }
         this.§_-9X§ = param1;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-9X§;
      }
      
      public function set premultipliedAlpha(param1:Boolean) : void
      {
         this.§_-W2h§(param1);
      }
      
      public function get §_-d18§() : int
      {
         return this.§_-O22§;
      }
      
      public function set §_-d18§(param1:int) : void
      {
         this.§_-J2K§.fixed = false;
         this.§_-J2K§.length = param1 * §_-l1J§;
         var _loc2_:int = this.§_-O22§ * §_-l1J§ + §_-c1S§ + 3;
         var _loc3_:int = int(this.§_-J2K§.length);
         var _loc4_:int = _loc2_;
         while(_loc4_ < _loc3_)
         {
            this.§_-J2K§[_loc4_] = 1;
            _loc4_ += §_-l1J§;
         }
         this.§_-O22§ = param1;
         this.§_-J2K§.fixed = true;
      }
      
      public function get §_-H1O§() : Vector.<Number>
      {
         return this.§_-J2K§;
      }
   }
}

