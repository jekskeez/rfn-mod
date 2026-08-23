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
      
      private static const §_-72t§:String = "CMF";
      
      private static const §_-z2F§:Number = 0.299;
      
      private static const §_-m1G§:Number = 0.587;
      
      private static const §_-6W§:Number = 0.114;
      
      private static const §_-01v§:Vector.<Number> = new <Number>[0,0,0,0.0001];
      
      private static const §_-417§:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
      
      private static var sTmpMatrix1:Vector.<Number> = new Vector.<Number>(20,true);
      
      private static var sTmpMatrix2:Vector.<Number> = new Vector.<Number>(0);
      
      private var §_-c24§:Program3D;
      
      private var §_-Z1H§:Vector.<Number>;
      
      private var §_-l1a§:Vector.<Number>;
      
      public function ColorMatrixFilter(param1:Vector.<Number> = null)
      {
         super();
         this.§_-Z1H§ = new Vector.<Number>(0);
         this.§_-l1a§ = new Vector.<Number>(0);
         this.matrix = param1;
      }
      
      override protected function §_-Rl§() : void
      {
         var _loc2_:String = null;
         var _loc1_:Starling = Starling.§_-y1l§;
         if(_loc1_.§_-B3H§(§_-72t§))
         {
            this.§_-c24§ = _loc1_.§_-y20§(§_-72t§);
         }
         else
         {
            _loc2_ = "tex ft0, v0,  fs0 <2d, clamp, linear, mipnone>  \n" + "max ft0, ft0, fc5              \n" + "div ft0.xyz, ft0.xyz, ft0.www  \n" + "m44 ft0, ft0, fc0              \n" + "add ft0, ft0, fc4              \n" + "mul ft0.xyz, ft0.xyz, ft0.www  \n" + "mov oc, ft0                    \n";
            this.§_-c24§ = _loc1_.§_-12E§(§_-72t§,§_-S2U§,_loc2_);
         }
      }
      
      override protected function activate(param1:int, param2:Context3D, param3:Texture) : void
      {
         param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.§_-l1a§);
         param2.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,5,§_-01v§);
         param2.setProgram(this.§_-c24§);
      }
      
      public function invert() : ColorMatrixFilter
      {
         return this.§_-E1b§(-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,0);
      }
      
      public function §_-K2N§(param1:Number) : ColorMatrixFilter
      {
         param1 += 1;
         var _loc2_:Number = 1 - param1;
         var _loc3_:Number = _loc2_ * §_-z2F§;
         var _loc4_:Number = _loc2_ * §_-m1G§;
         var _loc5_:Number = _loc2_ * §_-6W§;
         return this.§_-E1b§(_loc3_ + param1,_loc4_,_loc5_,0,0,_loc3_,_loc4_ + param1,_loc5_,0,0,_loc3_,_loc4_,_loc5_ + param1,0,0,0,0,0,1,0);
      }
      
      public function §_-e2R§(param1:Number) : ColorMatrixFilter
      {
         var _loc2_:Number = param1 + 1;
         var _loc3_:Number = 128 * (1 - _loc2_);
         return this.§_-E1b§(_loc2_,0,0,0,_loc3_,0,_loc2_,0,0,_loc3_,0,0,_loc2_,0,_loc3_,0,0,0,1,0);
      }
      
      public function §_-X2F§(param1:Number) : ColorMatrixFilter
      {
         param1 *= 255;
         return this.§_-E1b§(1,0,0,0,param1,0,1,0,0,param1,0,0,1,0,param1,0,0,0,1,0);
      }
      
      public function §_-J1a§(param1:Number) : ColorMatrixFilter
      {
         param1 *= Math.PI;
         var _loc2_:Number = Math.cos(param1);
         var _loc3_:Number = Math.sin(param1);
         return this.§_-E1b§(§_-z2F§ + _loc2_ * (1 - §_-z2F§) + _loc3_ * -§_-z2F§,§_-m1G§ + _loc2_ * -§_-m1G§ + _loc3_ * -§_-m1G§,§_-6W§ + _loc2_ * -§_-6W§ + _loc3_ * (1 - §_-6W§),0,0,§_-z2F§ + _loc2_ * -§_-z2F§ + _loc3_ * 0.143,§_-m1G§ + _loc2_ * (1 - §_-m1G§) + _loc3_ * 0.14,§_-6W§ + _loc2_ * -§_-6W§ + _loc3_ * -0.283,0,0,§_-z2F§ + _loc2_ * -§_-z2F§ + _loc3_ * -(1 - §_-z2F§),§_-m1G§ + _loc2_ * -§_-m1G§ + _loc3_ * §_-m1G§,§_-6W§ + _loc2_ * (1 - §_-6W§) + _loc3_ * §_-6W§,0,0,0,0,0,1,0);
      }
      
      public function tint(param1:uint, param2:Number = 1) : ColorMatrixFilter
      {
         var _loc3_:Number = Color.§_-C3b§(param1) / 255;
         var _loc4_:Number = Color.§_-F1q§(param1) / 255;
         var _loc5_:Number = Color.§_-N1y§(param1) / 255;
         var _loc6_:Number = 1 - param2;
         var _loc7_:Number = param2 * _loc3_;
         var _loc8_:Number = param2 * _loc4_;
         var _loc9_:Number = param2 * _loc5_;
         return this.§_-E1b§(_loc6_ + _loc7_ * §_-z2F§,_loc7_ * §_-m1G§,_loc7_ * §_-6W§,0,0,_loc8_ * §_-z2F§,_loc6_ + _loc8_ * §_-m1G§,_loc8_ * §_-6W§,0,0,_loc9_ * §_-z2F§,_loc9_ * §_-m1G§,_loc6_ + _loc9_ * §_-6W§,0,0,0,0,0,1,0);
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
               sTmpMatrix1[int(_loc2_ + _loc4_)] = param1[_loc2_] * this.§_-Z1H§[_loc4_] + param1[int(_loc2_ + 1)] * this.§_-Z1H§[int(_loc4_ + 5)] + param1[int(_loc2_ + 2)] * this.§_-Z1H§[int(_loc4_ + 10)] + param1[int(_loc2_ + 3)] * this.§_-Z1H§[int(_loc4_ + 15)] + (_loc4_ == 4 ? param1[int(_loc2_ + 4)] : 0);
               _loc4_++;
            }
            _loc2_ += 5;
            _loc3_++;
         }
         this.§_-K2O§(sTmpMatrix1,this.§_-Z1H§);
         this.§_-S2H§();
         return this;
      }
      
      private function §_-E1b§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number, param15:Number, param16:Number, param17:Number, param18:Number, param19:Number, param20:Number) : ColorMatrixFilter
      {
         sTmpMatrix2.length = 0;
         sTmpMatrix2.push(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param18,param19,param20);
         this.concat(sTmpMatrix2);
         return this;
      }
      
      private function §_-K2O§(param1:Vector.<Number>, param2:Vector.<Number>) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 20)
         {
            param2[_loc3_] = param1[_loc3_];
            _loc3_++;
         }
      }
      
      private function §_-S2H§() : void
      {
         this.§_-l1a§.length = 0;
         this.§_-l1a§.push(this.§_-Z1H§[0],this.§_-Z1H§[1],this.§_-Z1H§[2],this.§_-Z1H§[3],this.§_-Z1H§[5],this.§_-Z1H§[6],this.§_-Z1H§[7],this.§_-Z1H§[8],this.§_-Z1H§[10],this.§_-Z1H§[11],this.§_-Z1H§[12],this.§_-Z1H§[13],this.§_-Z1H§[15],this.§_-Z1H§[16],this.§_-Z1H§[17],this.§_-Z1H§[18],this.§_-Z1H§[4] / 255,this.§_-Z1H§[9] / 255,this.§_-Z1H§[14] / 255,this.§_-Z1H§[19] / 255);
      }
      
      public function get matrix() : Vector.<Number>
      {
         return this.§_-Z1H§;
      }
      
      public function set matrix(param1:Vector.<Number>) : void
      {
         if(Boolean(param1) && param1.length != 20)
         {
            throw new ArgumentError("Invalid matrix length: must be 20");
         }
         if(param1 == null)
         {
            this.§_-Z1H§.length = 0;
            this.§_-Z1H§.push.apply(this.§_-Z1H§,§_-417§);
         }
         else
         {
            this.§_-K2O§(param1,this.§_-Z1H§);
         }
         this.§_-S2H§();
      }
   }
}

