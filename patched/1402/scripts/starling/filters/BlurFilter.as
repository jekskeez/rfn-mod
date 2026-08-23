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
      
      private static const §_-H2T§:String = "BF_n";
      
      private static const §_-e1J§:String = "BF_t";
      
      private static const §_-KN§:Number = 2;
      
      private var §_-42Z§:Program3D;
      
      private var §_-yF§:Program3D;
      
      private var §_-L1v§:Vector.<Number> = new <Number>[0,0,0,0];
      
      private var §_-n1R§:Vector.<Number> = new <Number>[0,0,0,0];
      
      private var §_-21g§:Vector.<Number> = new <Number>[1,1,1,1];
      
      private var §_-A1g§:Number;
      
      private var §_-z0§:Number;
      
      private var §_-L1z§:Boolean;
      
      private var §_-Sd§:Vector.<Number> = new Vector.<Number>(5,true);
      
      public function BlurFilter(param1:Number = 1, param2:Number = 1, param3:Number = 1)
      {
         super(1,param3);
         this.§_-A1g§ = param1;
         this.§_-z0§ = param2;
         this.§_-J17§();
      }
      
      public static function §_-53B§(param1:Number = 4, param2:Number = 0.785, param3:uint = 0, param4:Number = 0.5, param5:Number = 1, param6:Number = 0.5) : BlurFilter
      {
         var _loc7_:BlurFilter = new BlurFilter(param5,param5,param6);
         _loc7_.offsetX = Math.cos(param2) * param1;
         _loc7_.offsetY = Math.sin(param2) * param1;
         _loc7_.mode = §_-X2m§.§_-P2b§;
         _loc7_.§_-P15§(true,param3,param4);
         return _loc7_;
      }
      
      public static function §_-J23§(param1:uint = 16776960, param2:Number = 1, param3:Number = 1, param4:Number = 0.5) : BlurFilter
      {
         var _loc5_:BlurFilter = new BlurFilter(param3,param3,param4);
         _loc5_.mode = §_-X2m§.§_-P2b§;
         _loc5_.§_-P15§(true,param1,param2);
         return _loc5_;
      }
      
      override protected function §_-B1Y§() : void
      {
         this.§_-42Z§ = this.createProgram(false);
         this.§_-yF§ = this.createProgram(true);
      }
      
      private function createProgram(param1:Boolean) : Program3D
      {
         var _loc2_:String = param1 ? §_-e1J§ : §_-H2T§;
         var _loc3_:Starling = Starling.§_-n1s§;
         if(_loc3_.§_-AO§(_loc2_))
         {
            return _loc3_.§_-w1B§(_loc2_);
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
         return _loc3_.§_-cI§(_loc2_,_loc4_,_loc5_);
      }
      
      override protected function activate(param1:int, param2:Context3D, param3:Texture) : void
      {
         this.§_-52D§(param1,param3.nativeWidth,param3.nativeHeight);
         param2.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this.§_-L1v§);
         param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.§_-n1R§);
         if(this.§_-L1z§ && param1 == §_-pX§ - 1)
         {
            param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,1,this.§_-21g§);
            param2.setProgram(this.§_-yF§);
         }
         else
         {
            param2.setProgram(this.§_-42Z§);
         }
      }
      
      private function §_-52D§(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc5_:Boolean = param1 < this.§_-A1g§;
         if(_loc5_)
         {
            _loc4_ = Math.min(1,this.§_-A1g§ - param1) * §_-KN§;
            _loc6_ = 1 / param2;
         }
         else
         {
            _loc4_ = Math.min(1,this.§_-z0§ - (param1 - Math.ceil(this.§_-A1g§))) * §_-KN§;
            _loc6_ = 1 / param3;
         }
         _loc7_ = 2 * _loc4_ * _loc4_;
         var _loc8_:Number = 1 / Math.sqrt(_loc7_ * Math.PI);
         var _loc9_:int = 0;
         while(_loc9_ < 5)
         {
            this.§_-Sd§[_loc9_] = _loc8_ * Math.exp(-_loc9_ * _loc9_ / _loc7_);
            _loc9_++;
         }
         this.§_-n1R§[0] = this.§_-Sd§[0];
         this.§_-n1R§[1] = this.§_-Sd§[1] + this.§_-Sd§[2];
         this.§_-n1R§[2] = this.§_-Sd§[3] + this.§_-Sd§[4];
         var _loc10_:Number = this.§_-n1R§[0] + 2 * this.§_-n1R§[1] + 2 * this.§_-n1R§[2];
         var _loc11_:Number = 1 / _loc10_;
         this.§_-n1R§[0] *= _loc11_;
         this.§_-n1R§[1] *= _loc11_;
         this.§_-n1R§[2] *= _loc11_;
         var _loc12_:Number = (_loc6_ * this.§_-Sd§[1] + 2 * _loc6_ * this.§_-Sd§[2]) / this.§_-n1R§[1];
         var _loc13_:Number = (3 * _loc6_ * this.§_-Sd§[3] + 4 * _loc6_ * this.§_-Sd§[4]) / this.§_-n1R§[2];
         if(_loc5_)
         {
            this.§_-L1v§[0] = _loc12_;
            this.§_-L1v§[1] = 0;
            this.§_-L1v§[2] = _loc13_;
            this.§_-L1v§[3] = 0;
         }
         else
         {
            this.§_-L1v§[0] = 0;
            this.§_-L1v§[1] = _loc12_;
            this.§_-L1v§[2] = 0;
            this.§_-L1v§[3] = _loc13_;
         }
      }
      
      private function §_-J17§() : void
      {
         if(this.§_-A1g§ == 0 && this.§_-z0§ == 0)
         {
            this.§_-A1g§ = 0.001;
         }
         §_-pX§ = Math.ceil(this.§_-A1g§) + Math.ceil(this.§_-z0§);
         §_-q2Q§ = (3 + Math.ceil(this.§_-A1g§)) / §_-y1k§;
         §_-r1I§ = (3 + Math.ceil(this.§_-z0§)) / §_-y1k§;
      }
      
      public function §_-P15§(param1:Boolean, param2:uint = 0, param3:Number = 1) : void
      {
         this.§_-21g§[0] = Color.§_-u1j§(param2) / 255;
         this.§_-21g§[1] = Color.§_-r1r§(param2) / 255;
         this.§_-21g§[2] = Color.§_-H1H§(param2) / 255;
         this.§_-21g§[3] = param3;
         this.§_-L1z§ = param1;
      }
      
      public function get blurX() : Number
      {
         return this.§_-A1g§;
      }
      
      public function set blurX(param1:Number) : void
      {
         this.§_-A1g§ = param1;
         this.§_-J17§();
      }
      
      public function get blurY() : Number
      {
         return this.§_-z0§;
      }
      
      public function set blurY(param1:Number) : void
      {
         this.§_-z0§ = param1;
         this.§_-J17§();
      }
   }
}

