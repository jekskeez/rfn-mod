package starling.filters
{
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Program3D;
   import starling.core.Starling;
   import starling.textures.Texture;
   import starling.utils.Color;
   
   public class ColorMatrixFilter extends FragmentFilter
   {
      
      private static const §_-53K§:String = "CMF";
      
      private static const §_-42F§:Number = 0.299;
      
      private static const §_-TM§:Number = 0.587;
      
      private static const §_-T2q§:Number = 0.114;
      
      private static const §_-03F§:Vector.<Number> = new <Number>[0,0,0,0.0001];
      
      private static const §_-Tn§:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
      
      private static var sTmpMatrix1:Vector.<Number> = new Vector.<Number>(20,true);
      
      private static var sTmpMatrix2:Vector.<Number> = new Vector.<Number>(0);
      
      private var §_-y12§:Program3D;
      
      private var §_-J22§:Vector.<Number>;
      
      private var §_-GG§:Vector.<Number>;
      
      public function ColorMatrixFilter(param1:Vector.<Number> = null)
      {
         super();
         this.§_-J22§ = new Vector.<Number>(0);
         this.§_-GG§ = new Vector.<Number>(0);
         this.matrix = param1;
      }
      
      override protected function §_-B1Y§() : void
      {
         var _loc2_:String = null;
         var _loc1_:Starling = Starling.§_-n1s§;
         if(_loc1_.§_-AO§(§_-53K§))
         {
            this.§_-y12§ = _loc1_.§_-w1B§(§_-53K§);
         }
         else
         {
            _loc2_ = "tex ft0, v0,  fs0 <2d, clamp, linear, mipnone>  \n" + "max ft0, ft0, fc5              \n" + "div ft0.xyz, ft0.xyz, ft0.www  \n" + "m44 ft0, ft0, fc0              \n" + "add ft0, ft0, fc4              \n" + "mul ft0.xyz, ft0.xyz, ft0.www  \n" + "mov oc, ft0                    \n";
            this.§_-y12§ = _loc1_.§_-cI§(§_-53K§,§_-b11§,_loc2_);
         }
      }
      
      override protected function activate(param1:int, param2:Context3D, param3:Texture) : void
      {
         param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.§_-GG§);
         param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,5,§_-03F§);
         param2.setProgram(this.§_-y12§);
      }
      
      public function invert() : ColorMatrixFilter
      {
         return this.§_-51d§(-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,0);
      }
      
      public function §_-M2U§(param1:Number) : ColorMatrixFilter
      {
         param1 += 1;
         var _loc2_:Number = 1 - param1;
         var _loc3_:Number = _loc2_ * §_-42F§;
         var _loc4_:Number = _loc2_ * §_-TM§;
         var _loc5_:Number = _loc2_ * §_-T2q§;
         return this.§_-51d§(_loc3_ + param1,_loc4_,_loc5_,0,0,_loc3_,_loc4_ + param1,_loc5_,0,0,_loc3_,_loc4_,_loc5_ + param1,0,0,0,0,0,1,0);
      }
      
      public function §_-Qj§(param1:Number) : ColorMatrixFilter
      {
         var _loc2_:Number = param1 + 1;
         var _loc3_:Number = 128 * (1 - _loc2_);
         return this.§_-51d§(_loc2_,0,0,0,_loc3_,0,_loc2_,0,0,_loc3_,0,0,_loc2_,0,_loc3_,0,0,0,1,0);
      }
      
      public function §_-9I§(param1:Number) : ColorMatrixFilter
      {
         param1 *= 255;
         return this.§_-51d§(1,0,0,0,param1,0,1,0,0,param1,0,0,1,0,param1,0,0,0,1,0);
      }
      
      public function §_-cr§(param1:Number) : ColorMatrixFilter
      {
         param1 *= Math.PI;
         var _loc2_:Number = Math.cos(param1);
         var _loc3_:Number = Math.sin(param1);
         return this.§_-51d§(§_-42F§ + _loc2_ * (1 - §_-42F§) + _loc3_ * -§_-42F§,§_-TM§ + _loc2_ * -§_-TM§ + _loc3_ * -§_-TM§,§_-T2q§ + _loc2_ * -§_-T2q§ + _loc3_ * (1 - §_-T2q§),0,0,§_-42F§ + _loc2_ * -§_-42F§ + _loc3_ * 0.143,§_-TM§ + _loc2_ * (1 - §_-TM§) + _loc3_ * 0.14,§_-T2q§ + _loc2_ * -§_-T2q§ + _loc3_ * -0.283,0,0,§_-42F§ + _loc2_ * -§_-42F§ + _loc3_ * -(1 - §_-42F§),§_-TM§ + _loc2_ * -§_-TM§ + _loc3_ * §_-TM§,§_-T2q§ + _loc2_ * (1 - §_-T2q§) + _loc3_ * §_-T2q§,0,0,0,0,0,1,0);
      }
      
      public function tint(param1:uint, param2:Number = 1) : ColorMatrixFilter
      {
         var _loc3_:Number = Color.§_-u1j§(param1) / 255;
         var _loc4_:Number = Color.§_-r1r§(param1) / 255;
         var _loc5_:Number = Color.§_-H1H§(param1) / 255;
         var _loc6_:Number = 1 - param2;
         var _loc7_:Number = param2 * _loc3_;
         var _loc8_:Number = param2 * _loc4_;
         var _loc9_:Number = param2 * _loc5_;
         return this.§_-51d§(_loc6_ + _loc7_ * §_-42F§,_loc7_ * §_-TM§,_loc7_ * §_-T2q§,0,0,_loc8_ * §_-42F§,_loc6_ + _loc8_ * §_-TM§,_loc8_ * §_-T2q§,0,0,_loc9_ * §_-42F§,_loc9_ * §_-TM§,_loc6_ + _loc9_ * §_-T2q§,0,0,0,0,0,1,0);
      }
      
      public function reset() : ColorMatrixFilter
      {
         this.matrix = null;
         return this;
      }
      
      public function concat(param1:Vector.<Number>) : ColorMatrixFilter
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = 0;
            while(_loc4_ < 5)
            {
               sTmpMatrix1[int(_loc2_ + _loc4_)] = param1[_loc2_] * this.§_-J22§[_loc4_] + param1[int(_loc2_ + 1)] * this.§_-J22§[int(_loc4_ + 5)] + param1[int(_loc2_ + 2)] * this.§_-J22§[int(_loc4_ + 10)] + param1[int(_loc2_ + 3)] * this.§_-J22§[int(_loc4_ + 15)] + (_loc4_ == 4 ? param1[int(_loc2_ + 4)] : 0);
               _loc4_++;
            }
            _loc2_ += 5;
            _loc3_++;
         }
         this.§_-h1D§(sTmpMatrix1,this.§_-J22§);
         this.§_-K2y§();
         return this;
      }
      
      private function §_-51d§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number, param15:Number, param16:Number, param17:Number, param18:Number, param19:Number, param20:Number) : ColorMatrixFilter
      {
         sTmpMatrix2.length = 0;
         sTmpMatrix2.push(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param18,param19,param20);
         this.concat(sTmpMatrix2);
         return this;
      }
      
      private function §_-h1D§(param1:Vector.<Number>, param2:Vector.<Number>) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 20)
         {
            param2[_loc3_] = param1[_loc3_];
            _loc3_++;
         }
      }
      
      private function §_-K2y§() : void
      {
         this.§_-GG§.length = 0;
         this.§_-GG§.push(this.§_-J22§[0],this.§_-J22§[1],this.§_-J22§[2],this.§_-J22§[3],this.§_-J22§[5],this.§_-J22§[6],this.§_-J22§[7],this.§_-J22§[8],this.§_-J22§[10],this.§_-J22§[11],this.§_-J22§[12],this.§_-J22§[13],this.§_-J22§[15],this.§_-J22§[16],this.§_-J22§[17],this.§_-J22§[18],this.§_-J22§[4] / 255,this.§_-J22§[9] / 255,this.§_-J22§[14] / 255,this.§_-J22§[19] / 255);
      }
      
      public function get matrix() : Vector.<Number>
      {
         return this.§_-J22§;
      }
      
      public function set matrix(param1:Vector.<Number>) : void
      {
         if(Boolean(param1) && param1.length != 20)
         {
            throw new ArgumentError("Invalid matrix length: must be 20");
         }
         if(param1 == null)
         {
            this.§_-J22§.length = 0;
            this.§_-J22§.push.apply(this.§_-J22§,§_-Tn§);
         }
         else
         {
            this.§_-h1D§(param1,this.§_-J22§);
         }
         this.§_-K2y§();
      }
   }
}

