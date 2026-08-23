package starling.utils
{
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   
   public class §_-km§
   {
      
      public static const §_-L2w§:int = 8;
      
      public static const §_-9M§:int = 0;
      
      public static const §_-13V§:int = 2;
      
      public static const §_-i2H§:int = 6;
      
      private static var §_-G2g§:Point = new Point();
      
      private static var sHelperPoint3D:Vector3D = new Vector3D();
      
      private var §_-q11§:Vector.<Number>;
      
      private var §_-C2W§:Boolean;
      
      private var §_-k1v§:int;
      
      public function §_-km§(param1:int, param2:Boolean = false)
      {
         super();
         this.§_-q11§ = new Vector.<Number>(0);
         this.§_-C2W§ = param2;
         this.§_-IG§ = param1;
      }
      
      public function clone(param1:int = 0, param2:int = -1) : §_-km§
      {
         if(param2 < 0 || param1 + param2 > this.§_-k1v§)
         {
            param2 = this.§_-k1v§ - param1;
         }
         var _loc3_:§_-km§ = new §_-km§(0,this.§_-C2W§);
         _loc3_.§_-k1v§ = param2;
         _loc3_.§_-q11§ = this.§_-q11§.slice(param1 * §_-L2w§,param2 * §_-L2w§);
         _loc3_.§_-q11§.fixed = true;
         return _loc3_;
      }
      
      public function §_-13F§(param1:§_-km§, param2:int = 0, param3:int = 0, param4:int = -1) : void
      {
         this.§_-FY§(param1,param2,null,param3,param4);
      }
      
      public function §_-FY§(param1:§_-km§, param2:int = 0, param3:Matrix = null, param4:int = 0, param5:int = -1) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param5 < 0 || param4 + param5 > this.§_-k1v§)
         {
            param5 = this.§_-k1v§ - param4;
         }
         var _loc8_:Vector.<Number> = param1.§_-q11§;
         var _loc9_:* = int(param2 * §_-L2w§);
         var _loc10_:* = int(param4 * §_-L2w§);
         var _loc11_:int = (param4 + param5) * §_-L2w§;
         if(param3)
         {
            while(_loc10_ < _loc11_)
            {
               _loc6_ = this.§_-q11§[int(_loc10_++)];
               _loc7_ = this.§_-q11§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = param3.a * _loc6_ + param3.c * _loc7_ + param3.tx;
               _loc8_[int(_loc9_++)] = param3.d * _loc7_ + param3.b * _loc6_ + param3.ty;
               _loc8_[int(_loc9_++)] = this.§_-q11§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-q11§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-q11§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-q11§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-q11§[int(_loc10_++)];
               _loc8_[int(_loc9_++)] = this.§_-q11§[int(_loc10_++)];
            }
         }
         else
         {
            while(_loc10_ < _loc11_)
            {
               _loc8_[int(_loc9_++)] = this.§_-q11§[int(_loc10_++)];
            }
         }
      }
      
      public function append(param1:§_-km§) : void
      {
         this.§_-q11§.fixed = false;
         var _loc2_:* = int(this.§_-q11§.length);
         var _loc3_:Vector.<Number> = param1.§_-q11§;
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            this.§_-q11§[int(_loc2_++)] = _loc3_[_loc5_];
            _loc5_++;
         }
         this.§_-k1v§ += param1.§_-IG§;
         this.§_-q11§.fixed = true;
      }
      
      public function setPosition(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 * §_-L2w§ + §_-9M§;
         this.§_-q11§[_loc4_] = param2;
         this.§_-q11§[int(_loc4_ + 1)] = param3;
      }
      
      public function getPosition(param1:int, param2:Point) : void
      {
         var _loc3_:int = param1 * §_-L2w§ + §_-9M§;
         param2.x = this.§_-q11§[_loc3_];
         param2.y = this.§_-q11§[int(_loc3_ + 1)];
      }
      
      public function §_-GR§(param1:int, param2:uint, param3:Number) : void
      {
         if(param3 < 0.001)
         {
            param3 = 0.001;
         }
         else if(param3 > 1)
         {
            param3 = 1;
         }
         var _loc4_:int = param1 * §_-L2w§ + §_-13V§;
         var _loc5_:Number = this.§_-C2W§ ? param3 : 1;
         this.§_-q11§[_loc4_] = (param2 >> 16 & 0xFF) / 255 * _loc5_;
         this.§_-q11§[int(_loc4_ + 1)] = (param2 >> 8 & 0xFF) / 255 * _loc5_;
         this.§_-q11§[int(_loc4_ + 2)] = (param2 & 0xFF) / 255 * _loc5_;
         this.§_-q11§[int(_loc4_ + 3)] = param3;
      }
      
      public function setColor(param1:int, param2:uint) : void
      {
         var _loc3_:int = param1 * §_-L2w§ + §_-13V§;
         var _loc4_:Number = this.§_-C2W§ ? this.§_-q11§[int(_loc3_ + 3)] : 1;
         this.§_-q11§[_loc3_] = (param2 >> 16 & 0xFF) / 255 * _loc4_;
         this.§_-q11§[int(_loc3_ + 1)] = (param2 >> 8 & 0xFF) / 255 * _loc4_;
         this.§_-q11§[int(_loc3_ + 2)] = (param2 & 0xFF) / 255 * _loc4_;
      }
      
      public function §_-f1b§(param1:int) : uint
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc2_:int = param1 * §_-L2w§ + §_-13V§;
         var _loc3_:Number = this.§_-C2W§ ? this.§_-q11§[int(_loc2_ + 3)] : 1;
         if(_loc3_ == 0)
         {
            return 0;
         }
         _loc4_ = this.§_-q11§[_loc2_] / _loc3_;
         _loc5_ = this.§_-q11§[int(_loc2_ + 1)] / _loc3_;
         _loc6_ = this.§_-q11§[int(_loc2_ + 2)] / _loc3_;
         return int(_loc4_ * 255) << 16 | int(_loc5_ * 255) << 8 | int(_loc6_ * 255);
      }
      
      public function §_-t1R§(param1:int, param2:Number) : void
      {
         if(this.§_-C2W§)
         {
            this.§_-GR§(param1,this.§_-f1b§(param1),param2);
         }
         else
         {
            this.§_-q11§[int(param1 * §_-L2w§ + §_-13V§ + 3)] = param2;
         }
      }
      
      public function §_-s2w§(param1:int) : Number
      {
         var _loc2_:int = param1 * §_-L2w§ + §_-13V§ + 3;
         return this.§_-q11§[_loc2_];
      }
      
      public function §_-5m§(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 * §_-L2w§ + §_-i2H§;
         this.§_-q11§[_loc4_] = param2;
         this.§_-q11§[int(_loc4_ + 1)] = param3;
      }
      
      public function §_-H1t§(param1:int, param2:Point) : void
      {
         var _loc3_:int = param1 * §_-L2w§ + §_-i2H§;
         param2.x = this.§_-q11§[_loc3_];
         param2.y = this.§_-q11§[int(_loc3_ + 1)];
      }
      
      public function §_-33z§(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 * §_-L2w§ + §_-9M§;
         this.§_-q11§[_loc4_] += param2;
         this.§_-q11§[int(_loc4_ + 1)] = this.§_-q11§[int(_loc4_ + 1)] + param3;
      }
      
      public function §_-s1V§(param1:int, param2:Matrix, param3:int = 1) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = param1 * §_-L2w§ + §_-9M§;
         var _loc7_:int = 0;
         while(_loc7_ < param3)
         {
            _loc4_ = this.§_-q11§[_loc6_];
            _loc5_ = this.§_-q11§[int(_loc6_ + 1)];
            this.§_-q11§[_loc6_] = param2.a * _loc4_ + param2.c * _loc5_ + param2.tx;
            this.§_-q11§[int(_loc6_ + 1)] = param2.d * _loc5_ + param2.b * _loc4_ + param2.ty;
            _loc6_ += §_-L2w§;
            _loc7_++;
         }
      }
      
      public function §_-y2J§(param1:uint) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-k1v§)
         {
            this.setColor(_loc2_,param1);
            _loc2_++;
         }
      }
      
      public function §_-z1u§(param1:Number) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-k1v§)
         {
            this.§_-t1R§(_loc2_,param1);
            _loc2_++;
         }
      }
      
      public function §_-AX§(param1:int, param2:Number, param3:int = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2 == 1)
         {
            return;
         }
         if(param3 < 0 || param1 + param3 > this.§_-k1v§)
         {
            param3 = this.§_-k1v§ - param1;
         }
         if(this.§_-C2W§)
         {
            _loc4_ = 0;
            while(_loc4_ < param3)
            {
               this.§_-t1R§(param1 + _loc4_,this.§_-s2w§(param1 + _loc4_) * param2);
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = param1 * §_-L2w§ + §_-13V§ + 3;
            _loc4_ = 0;
            while(_loc4_ < param3)
            {
               this.§_-q11§[int(_loc5_ + _loc4_ * §_-L2w§)] = this.§_-q11§[int(_loc5_ + _loc4_ * §_-L2w§)] * param2;
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
         if(param3 < 0 || param2 + param3 > this.§_-k1v§)
         {
            param3 = this.§_-k1v§ - param2;
         }
         if(param3 == 0)
         {
            if(param1 == null)
            {
               param4.setEmpty();
            }
            else
            {
               §_-rI§.§_-Sy§(param1,0,0,§_-G2g§);
               param4.setTo(§_-G2g§.x,§_-G2g§.y,0,0);
            }
         }
         else
         {
            _loc5_ = Number.MAX_VALUE;
            _loc6_ = -Number.MAX_VALUE;
            _loc7_ = Number.MAX_VALUE;
            _loc8_ = -Number.MAX_VALUE;
            _loc9_ = param2 * §_-L2w§ + §_-9M§;
            if(param1 == null)
            {
               _loc12_ = 0;
               while(_loc12_ < param3)
               {
                  _loc10_ = this.§_-q11§[_loc9_];
                  _loc11_ = this.§_-q11§[int(_loc9_ + 1)];
                  _loc9_ += §_-L2w§;
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
                  _loc10_ = this.§_-q11§[_loc9_];
                  _loc11_ = this.§_-q11§[int(_loc9_ + 1)];
                  _loc9_ += §_-L2w§;
                  §_-rI§.§_-Sy§(param1,_loc10_,_loc11_,§_-G2g§);
                  if(_loc5_ > §_-G2g§.x)
                  {
                     _loc5_ = §_-G2g§.x;
                  }
                  if(_loc6_ < §_-G2g§.x)
                  {
                     _loc6_ = §_-G2g§.x;
                  }
                  if(_loc7_ > §_-G2g§.y)
                  {
                     _loc7_ = §_-G2g§.y;
                  }
                  if(_loc8_ < §_-G2g§.y)
                  {
                     _loc8_ = §_-G2g§.y;
                  }
                  _loc12_++;
               }
            }
            param4.setTo(_loc5_,_loc7_,_loc6_ - _loc5_,_loc8_ - _loc7_);
         }
         return param4;
      }
      
      public function §_-t14§(param1:Matrix3D, param2:Vector3D, param3:int = 0, param4:int = -1, param5:Rectangle = null) : Rectangle
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
         if(param4 < 0 || param3 + param4 > this.§_-k1v§)
         {
            param4 = this.§_-k1v§ - param3;
         }
         if(param4 == 0)
         {
            if(param1)
            {
               §_-rI§.transformCoords3D(param1,0,0,0,sHelperPoint3D);
            }
            else
            {
               sHelperPoint3D.setTo(0,0,0);
            }
            §_-xD§.§_-mR§(param2,sHelperPoint3D,§_-G2g§);
            param5.setTo(§_-G2g§.x,§_-G2g§.y,0,0);
         }
         else
         {
            _loc6_ = Number.MAX_VALUE;
            _loc7_ = -Number.MAX_VALUE;
            _loc8_ = Number.MAX_VALUE;
            _loc9_ = -Number.MAX_VALUE;
            _loc10_ = param3 * §_-L2w§ + §_-9M§;
            _loc13_ = 0;
            while(_loc13_ < param4)
            {
               _loc11_ = this.§_-q11§[_loc10_];
               _loc12_ = this.§_-q11§[int(_loc10_ + 1)];
               _loc10_ += §_-L2w§;
               if(param1)
               {
                  §_-rI§.transformCoords3D(param1,_loc11_,_loc12_,0,sHelperPoint3D);
               }
               else
               {
                  sHelperPoint3D.setTo(_loc11_,_loc12_,0);
               }
               §_-xD§.§_-mR§(param2,sHelperPoint3D,§_-G2g§);
               if(_loc6_ > §_-G2g§.x)
               {
                  _loc6_ = §_-G2g§.x;
               }
               if(_loc7_ < §_-G2g§.x)
               {
                  _loc7_ = §_-G2g§.x;
               }
               if(_loc8_ > §_-G2g§.y)
               {
                  _loc8_ = §_-G2g§.y;
               }
               if(_loc9_ < §_-G2g§.y)
               {
                  _loc9_ = §_-G2g§.y;
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
         while(_loc4_ < this.§_-IG§)
         {
            this.getPosition(_loc4_,_loc2_);
            this.§_-H1t§(_loc4_,_loc3_);
            _loc1_ += "  [Vertex " + _loc4_ + ": " + "x=" + _loc2_.x.toFixed(1) + ", " + "y=" + _loc2_.y.toFixed(1) + ", " + "rgb=" + this.§_-f1b§(_loc4_).toString(16) + ", " + "a=" + this.§_-s2w§(_loc4_).toFixed(2) + ", " + "u=" + _loc3_.x.toFixed(4) + ", " + "v=" + _loc3_.y.toFixed(4) + "]" + (_loc4_ == this.§_-IG§ - 1 ? "\n" : ",\n");
            _loc4_++;
         }
         return _loc1_ + "]";
      }
      
      public function get tinted() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:int = §_-13V§;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-k1v§)
         {
            _loc3_ = 0;
            while(_loc3_ < 4)
            {
               if(this.§_-q11§[int(_loc1_ + _loc3_)] != 1)
               {
                  return true;
               }
               _loc3_++;
            }
            _loc1_ += §_-L2w§;
            _loc2_++;
         }
         return false;
      }
      
      public function §_-S1Y§(param1:Boolean, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param1 == this.§_-C2W§)
         {
            return;
         }
         if(param2)
         {
            _loc3_ = this.§_-k1v§ * §_-L2w§;
            _loc4_ = §_-13V§;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.§_-q11§[int(_loc4_ + 3)];
               _loc6_ = this.§_-C2W§ ? _loc5_ : 1;
               _loc7_ = param1 ? _loc5_ : 1;
               if(_loc6_ != 0)
               {
                  this.§_-q11§[_loc4_] = this.§_-q11§[_loc4_] / _loc6_ * _loc7_;
                  this.§_-q11§[int(_loc4_ + 1)] = this.§_-q11§[int(_loc4_ + 1)] / _loc6_ * _loc7_;
                  this.§_-q11§[int(_loc4_ + 2)] = this.§_-q11§[int(_loc4_ + 2)] / _loc6_ * _loc7_;
               }
               _loc4_ += §_-L2w§;
            }
         }
         this.§_-C2W§ = param1;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-C2W§;
      }
      
      public function set premultipliedAlpha(param1:Boolean) : void
      {
         this.§_-S1Y§(param1);
      }
      
      public function get §_-IG§() : int
      {
         return this.§_-k1v§;
      }
      
      public function set §_-IG§(param1:int) : void
      {
         this.§_-q11§.fixed = false;
         this.§_-q11§.length = param1 * §_-L2w§;
         var _loc2_:int = this.§_-k1v§ * §_-L2w§ + §_-13V§ + 3;
         var _loc3_:int = int(this.§_-q11§.length);
         var _loc4_:int = _loc2_;
         while(_loc4_ < _loc3_)
         {
            this.§_-q11§[_loc4_] = 1;
            _loc4_ += §_-L2w§;
         }
         this.§_-k1v§ = param1;
         this.§_-q11§.fixed = true;
      }
      
      public function get §_-T1R§() : Vector.<Number>
      {
         return this.§_-q11§;
      }
   }
}

