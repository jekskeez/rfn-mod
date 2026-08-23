package starling.filters
{
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Program3D;
   import starling.core.Starling;
   import starling.textures.Texture;
   import starling.utils.Color;
   
   public class BlurFilter extends FragmentFilter
   {
      
      private static const §_-MK§:String = "BF_n";
      
      private static const §_-62t§:String = "BF_t";
      
      private static const §_-Rh§:Number = 2;
      
      private var §_-o18§:Program3D;
      
      private var §_-h21§:Program3D;
      
      private var §_-91x§:Vector.<Number> = new <Number>[0,0,0,0];
      
      private var §_-J8§:Vector.<Number> = new <Number>[0,0,0,0];
      
      private var §_-Vt§:Vector.<Number> = new <Number>[1,1,1,1];
      
      private var §_-61P§:Number;
      
      private var §_-93m§:Number;
      
      private var §_-2D§:Boolean;
      
      private var §_-01K§:Vector.<Number> = new Vector.<Number>(5,true);
      
      public function BlurFilter(param1:Number = 1, param2:Number = 1, param3:Number = 1)
      {
         super(1,param3);
         this.§_-61P§ = param1;
         this.§_-93m§ = param2;
         this.§_-B3§();
      }
      
      public static function §_-M2O§(param1:Number = 4, param2:Number = 0.785, param3:uint = 0, param4:Number = 0.5, param5:Number = 1, param6:Number = 0.5) : BlurFilter
      {
         var _loc7_:BlurFilter = new BlurFilter(param5,param5,param6);
         _loc7_.offsetX = Math.cos(param2) * param1;
         _loc7_.offsetY = Math.sin(param2) * param1;
         _loc7_.mode = §_-1i§.§_-z2d§;
         _loc7_.§_-y2J§(true,param3,param4);
         return _loc7_;
      }
      
      public static function §_-q2e§(param1:uint = 16776960, param2:Number = 1, param3:Number = 1, param4:Number = 0.5) : BlurFilter
      {
         var _loc5_:BlurFilter = new BlurFilter(param3,param3,param4);
         _loc5_.mode = §_-1i§.§_-z2d§;
         _loc5_.§_-y2J§(true,param1,param2);
         return _loc5_;
      }
      
      override protected function §_-Rl§() : void
      {
         this.§_-o18§ = this.createProgram(false);
         this.§_-h21§ = this.createProgram(true);
      }
      
      private function createProgram(param1:Boolean) : Program3D
      {
         var _loc2_:String = param1 ? §_-62t§ : §_-MK§;
         var _loc3_:Starling = Starling.§_-y1l§;
         if(_loc3_.§_-B3H§(_loc2_))
         {
            return _loc3_.§_-y20§(_loc2_);
         }
         var _loc4_:String = "m44 op, va0, vc0       \n" + "mov v0, va1            \n" + "sub v1, va1, vc4.zwxx  \n" + "sub v2, va1, vc4.xyxx  \n" + "add v3, va1, vc4.xyxx  \n" + "add v4, va1, vc4.zwxx  \n";
         var _loc5_:String = "tex ft0,  v0, fs0 <2d, clamp, linear, mipnone> \n" + "mul ft5, ft0, fc0.xxxx                         \n" + "tex ft1,  v1, fs0 <2d, clamp, linear, mipnone> \n" + "mul ft1, ft1, fc0.zzzz                         \n" + "add ft5, ft5, ft1                              \n" + "tex ft2,  v2, fs0 <2d, clamp, linear, mipnone> \n" + "mul ft2, ft2, fc0.yyyy                         \n" + "add ft5, ft5, ft2                              \n" + "tex ft3,  v3, fs0 <2d, clamp, linear, mipnone> \n" + "mul ft3, ft3, fc0.yyyy                         \n" + "add ft5, ft5, ft3                              \n" + "tex ft4,  v4, fs0 <2d, clamp, linear, mipnone> \n" + "mul ft4, ft4, fc0.zzzz                         \n";
         if(param1)
         {
            _loc5_ += "add ft5, ft5, ft4                              \n" + "mul ft5.xyz, fc1.xyz, ft5.www                  \n" + "mul oc, ft5, fc1.wwww                          \n";
         }
         else
         {
            _loc5_ += "add  oc, ft5, ft4                              \n";
         }
         return _loc3_.§_-12E§(_loc2_,_loc4_,_loc5_);
      }
      
      override protected function activate(param1:int, param2:Context3D, param3:Texture) : void
      {
         this.§_-wg§(param1,param3.nativeWidth,param3.nativeHeight);
         param2.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this.§_-91x§);
         param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.§_-J8§);
         if(this.§_-2D§ && param1 == §_-H2Z§ - 1)
         {
            param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,1,this.§_-Vt§);
            param2.setProgram(this.§_-h21§);
         }
         else
         {
            param2.setProgram(this.§_-o18§);
         }
      }
      
      private function §_-wg§(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc5_:Boolean = param1 < this.§_-61P§;
         if(_loc5_)
         {
            _loc4_ = Math.min(1,this.§_-61P§ - param1) * §_-Rh§;
            _loc6_ = 1 / param2;
         }
         else
         {
            _loc4_ = Math.min(1,this.§_-93m§ - (param1 - Math.ceil(this.§_-61P§))) * §_-Rh§;
            _loc6_ = 1 / param3;
         }
         _loc7_ = 2 * _loc4_ * _loc4_;
         var _loc8_:Number = 1 / Math.sqrt(_loc7_ * Math.PI);
         var _loc9_:int = 0;
         while(_loc9_ < 5)
         {
            this.§_-01K§[_loc9_] = _loc8_ * Math.exp(-_loc9_ * _loc9_ / _loc7_);
            _loc9_++;
         }
         this.§_-J8§[0] = this.§_-01K§[0];
         this.§_-J8§[1] = this.§_-01K§[1] + this.§_-01K§[2];
         this.§_-J8§[2] = this.§_-01K§[3] + this.§_-01K§[4];
         var _loc10_:Number = this.§_-J8§[0] + 2 * this.§_-J8§[1] + 2 * this.§_-J8§[2];
         var _loc11_:Number = 1 / _loc10_;
         this.§_-J8§[0] *= _loc11_;
         this.§_-J8§[1] *= _loc11_;
         this.§_-J8§[2] *= _loc11_;
         var _loc12_:Number = (_loc6_ * this.§_-01K§[1] + 2 * _loc6_ * this.§_-01K§[2]) / this.§_-J8§[1];
         var _loc13_:Number = (3 * _loc6_ * this.§_-01K§[3] + 4 * _loc6_ * this.§_-01K§[4]) / this.§_-J8§[2];
         if(_loc5_)
         {
            this.§_-91x§[0] = _loc12_;
            this.§_-91x§[1] = 0;
            this.§_-91x§[2] = _loc13_;
            this.§_-91x§[3] = 0;
         }
         else
         {
            this.§_-91x§[0] = 0;
            this.§_-91x§[1] = _loc12_;
            this.§_-91x§[2] = 0;
            this.§_-91x§[3] = _loc13_;
         }
      }
      
      private function §_-B3§() : void
      {
         if(this.§_-61P§ == 0 && this.§_-93m§ == 0)
         {
            this.§_-61P§ = 0.001;
         }
         §_-H2Z§ = Math.ceil(this.§_-61P§) + Math.ceil(this.§_-93m§);
         §_-a1z§ = (3 + Math.ceil(this.§_-61P§)) / §_-s2D§;
         §_-82l§ = (3 + Math.ceil(this.§_-93m§)) / §_-s2D§;
      }
      
      public function §_-y2J§(param1:Boolean, param2:uint = 0, param3:Number = 1) : void
      {
         this.§_-Vt§[0] = Color.§_-C3b§(param2) / 255;
         this.§_-Vt§[1] = Color.§_-F1q§(param2) / 255;
         this.§_-Vt§[2] = Color.§_-N1y§(param2) / 255;
         this.§_-Vt§[3] = param3;
         this.§_-2D§ = param1;
      }
      
      public function get blurX() : Number
      {
         return this.§_-61P§;
      }
      
      public function set blurX(param1:Number) : void
      {
         this.§_-61P§ = param1;
         this.§_-B3§();
      }
      
      public function get blurY() : Number
      {
         return this.§_-93m§;
      }
      
      public function set blurY(param1:Number) : void
      {
         this.§_-93m§ = param1;
         this.§_-B3§();
      }
   }
}

