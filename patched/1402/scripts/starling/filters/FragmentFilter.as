package starling.filters
{
   import §_-625§.§_-F1v§;
   import §_-625§.§_-j1b§;
   import §_-f1T§.Event;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.utils.getQualifiedClassName;
   import starling.core.Starling;
   import starling.core.§_-wz§;
   import starling.core.starling_internal;
   import starling.display.BlendMode;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   import starling.display.§_-81s§;
   import starling.display.§_-I2q§;
   import starling.textures.Texture;
   import starling.utils.§_-F2o§;
   import starling.utils.§_-U2i§;
   import starling.utils.§_-r1p§;
   import starling.utils.§_-s7§;
   import starling.utils.getNextPowerOfTwo;
   
   use namespace starling_internal;
   
   public class FragmentFilter
   {
      
      private static var §_-Tp§:Rectangle = new Rectangle();
      
      private static var §_-51P§:Matrix = new Matrix();
      
      private const §_-n1V§:int = 64;
      
      protected const §_-X22§:Boolean = true;
      
      protected const §_-b11§:String = "m44 op, va0, vc0 \n" + "mov v0, va1      \n";
      
      protected const §_-12l§:String = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";
      
      private var §_-I12§:int = 0;
      
      private var §_-l2c§:int = 1;
      
      private var §_-V2s§:int = 0;
      
      private var §_-Z1u§:int = 0;
      
      private var §_-y0§:int;
      
      private var §_-MU§:Vector.<Texture>;
      
      private var §_-t1P§:String;
      
      private var §_-11a§:Number;
      
      private var §_-G1d§:Number;
      
      private var §_-tb§:Number;
      
      private var §_-a1q§:Number;
      
      private var §_-925§:Number;
      
      private var §_-Q1L§:§_-U2i§;
      
      private var §_-1Q§:VertexBuffer3D;
      
      private var §_-11A§:Vector.<uint>;
      
      private var §_-5m§:IndexBuffer3D;
      
      private var §_-Lm§:Boolean;
      
      private var §_-iB§:§_-81s§;
      
      private var §_-fV§:Matrix = new Matrix();
      
      private var mHelperMatrix3D:Matrix3D = new Matrix3D();
      
      private var §_-p1P§:Rectangle = new Rectangle();
      
      private var mHelperRect2:Rectangle = new Rectangle();
      
      public function FragmentFilter(param1:int = 1, param2:Number = 1)
      {
         super();
         if(Capabilities.isDebugger && getQualifiedClassName(this) == "starling.filters::FragmentFilter")
         {
            throw new §_-F1v§();
         }
         if(param1 < 1)
         {
            throw new ArgumentError("At least one pass is required.");
         }
         this.§_-y0§ = param1;
         this.§_-G1d§ = this.§_-tb§ = 0;
         this.§_-a1q§ = this.§_-925§ = 0;
         this.§_-11a§ = param2;
         this.§_-MU§ = new Vector.<Texture>(0);
         this.§_-t1P§ = §_-X2m§.REPLACE;
         this.§_-Q1L§ = new §_-U2i§(4);
         this.§_-Q1L§.§_-N1O§(0,0,0);
         this.§_-Q1L§.§_-N1O§(1,1,0);
         this.§_-Q1L§.§_-N1O§(2,0,1);
         this.§_-Q1L§.§_-N1O§(3,1,1);
         this.§_-11A§ = new <uint>[0,1,2,1,3,2];
         this.§_-11A§.fixed = true;
         if(Starling.§_-n1s§.§_-J1d§)
         {
            this.§_-B1Y§();
         }
         Starling.§_-n1s§.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.§_-42J§,false,0,true);
      }
      
      public function dispose() : void
      {
         Starling.§_-n1s§.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.§_-42J§);
         if(this.§_-1Q§)
         {
            this.§_-1Q§.dispose();
         }
         if(this.§_-5m§)
         {
            this.§_-5m§.dispose();
         }
         this.§_-S2a§();
         this.§_-rY§();
      }
      
      private function §_-42J§(param1:Object) : void
      {
         this.§_-1Q§ = null;
         this.§_-5m§ = null;
         this.§_-S2a§();
         this.§_-B1Y§();
         if(this.§_-iB§)
         {
            this.§_-41F§();
         }
      }
      
      public function render(param1:DisplayObject, param2:§_-wz§, param3:Number) : void
      {
         if(this.mode == §_-X2m§.§_-G2X§)
         {
            param1.render(param2,param3);
         }
         if(this.§_-Lm§)
         {
            this.§_-Lm§ = false;
            this.§_-iB§ = this.§_-n1P§(param1,param2,1,true);
            this.§_-S2a§();
         }
         if(this.§_-iB§)
         {
            this.§_-iB§.render(param2,param3);
         }
         else
         {
            this.§_-n1P§(param1,param2,param3,false);
         }
         if(this.mode == §_-X2m§.§_-P2b§)
         {
            param1.render(param2,param3);
         }
      }
      
      private function §_-n1P§(param1:DisplayObject, param2:§_-wz§, param3:Number, param4:Boolean = false) : §_-81s§
      {
         var _loc5_:Texture = null;
         var _loc15_:uint = 0;
         var _loc16_:Texture = null;
         var _loc17_:Boolean = false;
         var _loc19_:§_-81s§ = null;
         var _loc20_:§_-I2q§ = null;
         var _loc6_:Texture = null;
         var _loc7_:Context3D = Starling.context;
         var _loc8_:DisplayObject = param1.stage;
         var _loc9_:Stage = Starling.§_-n1s§.stage;
         var _loc10_:Number = Starling.§_-n1s§.§_-Cj§;
         var _loc11_:Matrix = this.§_-fV§;
         var _loc12_:Matrix3D = this.mHelperMatrix3D;
         var _loc13_:Rectangle = this.§_-p1P§;
         var _loc14_:Rectangle = this.mHelperRect2;
         if(_loc7_ == null)
         {
            throw new §_-j1b§();
         }
         _loc17_ = !param4 && this.§_-a1q§ == 0 && this.§_-925§ == 0;
         this.§_-U1b§(param1,_loc8_,this.§_-11a§ * _loc10_,_loc17_,_loc13_,_loc14_);
         if(_loc13_.isEmpty())
         {
            this.§_-S2a§();
            return param4 ? new §_-81s§() : null;
         }
         this.§_-JD§(_loc7_,_loc14_);
         this.§_-T1v§(_loc14_.width,_loc14_.height,this.§_-11a§ * _loc10_);
         param2.§_-z24§();
         param2.raiseDrawCount(this.§_-y0§);
         param2.§_-V1d§();
         param2.pushMatrix3D();
         param2.§_-DM§(_loc14_,false);
         _loc11_.copyFrom(param2.§_-V2q§);
         _loc12_.copyFrom(param2.projectionMatrix3D);
         _loc16_ = param2.renderTarget;
         _loc15_ = param2.§_-72H§;
         if(Boolean(_loc16_) && !§_-s7§.§_-2Y§)
         {
            throw new IllegalOperationError("To nest filters, you need at least Flash Player / AIR version 15.");
         }
         if(param4)
         {
            _loc6_ = Texture.§_-p2i§(_loc14_.width,_loc14_.height,true,false,true,this.§_-11a§ * _loc10_);
         }
         param2.renderTarget = this.§_-MU§[0];
         param2.clear();
         param2.blendMode = BlendMode.NORMAL;
         param2.§_-72H§ = 0;
         param2.§_-L1j§(_loc13_.x,_loc13_.y,_loc14_.width,_loc14_.height,_loc9_.stageWidth,_loc9_.stageHeight,_loc9_.§_-oy§);
         param1.render(param2,param3);
         param2.§_-z24§();
         §_-wz§.setBlendFactors(true);
         param2.§_-Sw§();
         _loc7_.setVertexBufferAt(this.§_-I12§,this.§_-1Q§,§_-U2i§.§_-V2M§,Context3DVertexBufferFormat.FLOAT_2);
         _loc7_.setVertexBufferAt(this.§_-l2c§,this.§_-1Q§,§_-U2i§.§_-F2I§,Context3DVertexBufferFormat.FLOAT_2);
         var _loc18_:int = 0;
         while(_loc18_ < this.§_-y0§)
         {
            if(_loc18_ < this.§_-y0§ - 1)
            {
               param2.renderTarget = this.§_-u1§(_loc18_ + 1);
               param2.clear();
            }
            else if(param4)
            {
               param2.renderTarget = _loc6_;
               param2.clear();
            }
            else
            {
               param2.§_-b0§();
               param2.§_-V2q§ = _loc11_;
               param2.projectionMatrix3D = _loc12_;
               param2.renderTarget = _loc16_;
               param2.§_-32z§(this.§_-a1q§,this.§_-925§);
               param2.§_-72H§ = _loc15_;
               param2.blendMode = param1.blendMode;
               param2.§_-B2u§(true);
            }
            _loc5_ = this.§_-u1§(_loc18_);
            _loc7_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,this.§_-Z1u§,param2.mvpMatrix3D,true);
            _loc7_.setTextureAt(this.§_-V2s§,_loc5_.base);
            this.activate(_loc18_,_loc7_,_loc5_);
            _loc7_.drawTriangles(this.§_-5m§,0,2);
            this.deactivate(_loc18_,_loc7_,_loc5_);
            _loc18_++;
         }
         _loc7_.setVertexBufferAt(this.§_-I12§,null);
         _loc7_.setVertexBufferAt(this.§_-l2c§,null);
         _loc7_.setTextureAt(this.§_-V2s§,null);
         param2.§_-c2N§();
         param2.popMatrix3D();
         if(param4)
         {
            param2.§_-V2q§.copyFrom(_loc11_);
            param2.projectionMatrix3D.copyFrom(_loc12_);
            param2.renderTarget = _loc16_;
            param2.§_-b0§();
            _loc19_ = new §_-81s§();
            _loc20_ = new §_-I2q§(_loc6_);
            param1.§_-R1D§(_loc8_,§_-51P§).invert();
            §_-r1p§.prependTranslation(§_-51P§,_loc13_.x + this.§_-a1q§,_loc13_.y + this.§_-925§);
            _loc19_.§_-bQ§(_loc20_,1,§_-51P§);
            _loc19_.§_-62u§ = true;
            return _loc19_;
         }
         return null;
      }
      
      private function §_-JD§(param1:Context3D, param2:Rectangle) : void
      {
         this.§_-Q1L§.setPosition(0,param2.x,param2.y);
         this.§_-Q1L§.setPosition(1,param2.right,param2.y);
         this.§_-Q1L§.setPosition(2,param2.x,param2.bottom);
         this.§_-Q1L§.setPosition(3,param2.right,param2.bottom);
         if(this.§_-1Q§ == null)
         {
            this.§_-1Q§ = param1.createVertexBuffer(4,§_-U2i§.§_-l1J§);
            this.§_-5m§ = param1.createIndexBuffer(6);
            this.§_-5m§.uploadFromVector(this.§_-11A§,0,6);
         }
         this.§_-1Q§.uploadFromVector(this.§_-Q1L§.§_-H1O§,0,4);
      }
      
      private function §_-T1v§(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc6_:int = 0;
         var _loc4_:int = this.§_-y0§ > 1 ? 2 : 1;
         var _loc5_:Boolean = this.§_-MU§.length != _loc4_ || Math.abs(this.§_-MU§[0].nativeWidth - param1 * param3) > 0.1 || Math.abs(this.§_-MU§[0].nativeHeight - param2 * param3) > 0.1;
         if(_loc5_)
         {
            this.§_-S2a§();
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               this.§_-MU§[_loc6_] = Texture.§_-p2i§(param1,param2,true,false,true,param3);
               _loc6_++;
            }
         }
      }
      
      private function §_-u1§(param1:int) : Texture
      {
         return this.§_-MU§[param1 % 2];
      }
      
      private function §_-U1b§(param1:DisplayObject, param2:DisplayObject, param3:Number, param4:Boolean, param5:Rectangle, param6:Rectangle) : void
      {
         var _loc7_:Stage = null;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc8_:Number = this.§_-G1d§;
         var _loc9_:Number = this.§_-tb§;
         if(param2 is Stage)
         {
            _loc7_ = param2 as Stage;
            if(param1 == _loc7_ || param1 == param1.root)
            {
               _loc8_ = _loc9_ = 0;
               param5.setTo(0,0,_loc7_.stageWidth,_loc7_.stageHeight);
            }
            else
            {
               param1.getBounds(_loc7_,param5);
            }
            if(param4)
            {
               §_-Tp§.setTo(0,0,_loc7_.stageWidth,_loc7_.stageHeight);
               §_-F2o§.§_-42v§(param5,§_-Tp§,param5);
            }
         }
         else
         {
            param1.getBounds(param2,param5);
         }
         if(!param5.isEmpty())
         {
            param5.inflate(_loc8_,_loc9_);
            _loc10_ = 64 / param3;
            _loc11_ = param5.width > _loc10_ ? param5.width : _loc10_;
            _loc12_ = param5.height > _loc10_ ? param5.height : _loc10_;
            param6.setTo(param5.x,param5.y,getNextPowerOfTwo(_loc11_ * param3) / param3,getNextPowerOfTwo(_loc12_ * param3) / param3);
         }
      }
      
      private function §_-S2a§() : void
      {
         var _loc1_:Texture = null;
         for each(_loc1_ in this.§_-MU§)
         {
            _loc1_.dispose();
         }
         this.§_-MU§.length = 0;
      }
      
      private function §_-rY§() : void
      {
         if(this.§_-iB§)
         {
            this.§_-iB§.dispose();
            this.§_-iB§ = null;
         }
      }
      
      protected function §_-B1Y§() : void
      {
         throw new Error("Method has to be implemented in subclass!");
      }
      
      protected function activate(param1:int, param2:Context3D, param3:Texture) : void
      {
         throw new Error("Method has to be implemented in subclass!");
      }
      
      protected function deactivate(param1:int, param2:Context3D, param3:Texture) : void
      {
      }
      
      protected function §_-g2Y§(param1:String = null, param2:String = null) : Program3D
      {
         if(param1 == null)
         {
            param1 = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";
         }
         if(param2 == null)
         {
            param2 = this.§_-b11§;
         }
         return §_-wz§.§_-g2Y§(param2,param1);
      }
      
      public function §_-41F§() : void
      {
         this.§_-Lm§ = true;
         this.§_-rY§();
      }
      
      public function §_-dq§() : void
      {
         this.§_-Lm§ = false;
         this.§_-rY§();
      }
      
      starling_internal function §_-h2F§(param1:DisplayObject) : §_-81s§
      {
         var _loc2_:§_-wz§ = null;
         var _loc4_:§_-81s§ = null;
         var _loc3_:Stage = param1.stage;
         _loc2_ = new §_-wz§();
         param1.§_-R1D§(_loc3_,_loc2_.§_-mr§);
         _loc4_ = this.§_-n1P§(param1,_loc2_,1,true);
         _loc2_.dispose();
         return _loc4_;
      }
      
      public function get §_-f1I§() : Boolean
      {
         return this.§_-iB§ != null || this.§_-Lm§;
      }
      
      public function get §_-y1k§() : Number
      {
         return this.§_-11a§;
      }
      
      public function set §_-y1k§(param1:Number) : void
      {
         if(param1 <= 0)
         {
            throw new ArgumentError("Resolution must be > 0");
         }
         this.§_-11a§ = param1;
      }
      
      public function get mode() : String
      {
         return this.§_-t1P§;
      }
      
      public function set mode(param1:String) : void
      {
         this.§_-t1P§ = param1;
      }
      
      public function get offsetX() : Number
      {
         return this.§_-a1q§;
      }
      
      public function set offsetX(param1:Number) : void
      {
         this.§_-a1q§ = param1;
      }
      
      public function get offsetY() : Number
      {
         return this.§_-925§;
      }
      
      public function set offsetY(param1:Number) : void
      {
         this.§_-925§ = param1;
      }
      
      protected function get §_-q2Q§() : Number
      {
         return this.§_-G1d§;
      }
      
      protected function set §_-q2Q§(param1:Number) : void
      {
         this.§_-G1d§ = param1;
      }
      
      protected function get §_-r1I§() : Number
      {
         return this.§_-tb§;
      }
      
      protected function set §_-r1I§(param1:Number) : void
      {
         this.§_-tb§ = param1;
      }
      
      protected function set §_-pX§(param1:int) : void
      {
         this.§_-y0§ = param1;
      }
      
      protected function get §_-pX§() : int
      {
         return this.§_-y0§;
      }
      
      final protected function get §_-83C§() : int
      {
         return this.§_-I12§;
      }
      
      final protected function set §_-83C§(param1:int) : void
      {
         this.§_-I12§ = param1;
      }
      
      final protected function get §_-p2z§() : int
      {
         return this.§_-l2c§;
      }
      
      final protected function set §_-p2z§(param1:int) : void
      {
         this.§_-l2c§ = param1;
      }
      
      final protected function get §_-s24§() : int
      {
         return this.§_-V2s§;
      }
      
      final protected function set §_-s24§(param1:int) : void
      {
         this.§_-V2s§ = param1;
      }
      
      final protected function get §_-61c§() : int
      {
         return this.§_-Z1u§;
      }
      
      final protected function set §_-61c§(param1:int) : void
      {
         this.§_-Z1u§ = param1;
      }
   }
}

