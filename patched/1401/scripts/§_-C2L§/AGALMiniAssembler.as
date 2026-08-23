package §_-C2L§
{
   import flash.display3D.*;
   import flash.utils.*;
   
   public class AGALMiniAssembler
   {
      
      private static const §_-93j§:int = 2048;
      
      private static const FRAGMENT:String = "fragment";
      
      private static const VERTEX:String = "vertex";
      
      private static const §_-Y1z§:uint = 8;
      
      private static const §_-h2S§:uint = 12;
      
      private static const §_-KV§:uint = 16;
      
      private static const §_-915§:uint = 20;
      
      private static const §_-i1z§:uint = 24;
      
      private static const §_-b2l§:uint = 28;
      
      private static const §_-m1K§:uint = 1;
      
      private static const §_-EB§:uint = 2;
      
      private static const §_-3I§:uint = 32;
      
      private static const §_-J7§:uint = 64;
      
      private static const §_-K1J§:uint = 1;
      
      private static const §_-SH§:uint = 8;
      
      private static const §_-Ix§:uint = 16;
      
      private static const §_-73Z§:uint = 32;
      
      private static const §_-H1P§:uint = 64;
      
      private static const §_-UE§:uint = 128;
      
      private static const §_-42H§:uint = 256;
      
      private static const §_-V2g§:uint = 512;
      
      private static const §_-l1h§:uint = 1024;
      
      private static const §_-Rv§:String = "mov";
      
      private static const ADD:String = "add";
      
      private static const §_-b1d§:String = "sub";
      
      private static const §_-m5§:String = "mul";
      
      private static const §_-JJ§:String = "div";
      
      private static const §_-Z2e§:String = "rcp";
      
      private static const §_-6T§:String = "min";
      
      private static const §_-pG§:String = "max";
      
      private static const §_-dr§:String = "frc";
      
      private static const §_-eW§:String = "sqt";
      
      private static const §_-t2y§:String = "rsq";
      
      private static const §_-z1A§:String = "pow";
      
      private static const §_-E2r§:String = "log";
      
      private static const §_-f1m§:String = "exp";
      
      private static const §_-a2l§:String = "nrm";
      
      private static const §_-F1L§:String = "sin";
      
      private static const §_-UR§:String = "cos";
      
      private static const §_-226§:String = "crs";
      
      private static const DP3:String = "dp3";
      
      private static const DP4:String = "dp4";
      
      private static const §_-Dy§:String = "abs";
      
      private static const §_-I2e§:String = "neg";
      
      private static const §_-22X§:String = "sat";
      
      private static const M33:String = "m33";
      
      private static const M44:String = "m44";
      
      private static const M34:String = "m34";
      
      private static const §_-c1J§:String = "ddx";
      
      private static const §_-83q§:String = "ddy";
      
      private static const §_-T2n§:String = "ife";
      
      private static const §_-72K§:String = "ine";
      
      private static const §_-w1z§:String = "ifg";
      
      private static const §_-G2K§:String = "ifl";
      
      private static const §_-g16§:String = "els";
      
      private static const §_-134§:String = "eif";
      
      private static const §_-h20§:String = "ted";
      
      private static const §_-m2E§:String = "kil";
      
      private static const §_-n1y§:String = "tex";
      
      private static const §_-kJ§:String = "sge";
      
      private static const §_-p4§:String = "slt";
      
      private static const §_-W2W§:String = "sgn";
      
      private static const §_-x2S§:String = "seq";
      
      private static const §_-G2x§:String = "sne";
      
      private static const VA:String = "va";
      
      private static const VC:String = "vc";
      
      private static const §_-Pl§:String = "vt";
      
      private static const §_-I1H§:String = "vo";
      
      private static const VI:String = "vi";
      
      private static const §_-lg§:String = "fc";
      
      private static const §_-2x§:String = "ft";
      
      private static const FS:String = "fs";
      
      private static const FO:String = "fo";
      
      private static const §_-T1H§:String = "fd";
      
      private static const D2:String = "2d";
      
      private static const D3:String = "3d";
      
      private static const §_-C1v§:String = "cube";
      
      private static const §_-K2X§:String = "mipnearest";
      
      private static const §_-D17§:String = "miplinear";
      
      private static const §_-o2Y§:String = "mipnone";
      
      private static const §_-WZ§:String = "nomip";
      
      private static const §_-81Y§:String = "nearest";
      
      private static const LINEAR:String = "linear";
      
      private static const §_-X3§:String = "centroid";
      
      private static const §_-k21§:String = "single";
      
      private static const §_-rw§:String = "ignoresampler";
      
      private static const §_-B3X§:String = "repeat";
      
      private static const §_-P1b§:String = "wrap";
      
      private static const §_-4I§:String = "clamp";
      
      private static const §_-Az§:String = "rgba";
      
      private static const DXT1:String = "dxt1";
      
      private static const DXT5:String = "dxt5";
      
      private static const §_-G2f§:String = "video";
      
      protected static const §_-F1k§:RegExp = /^\s+|\s+$/g;
      
      private static var §_-B3o§:Boolean = false;
      
      private static const §_-F2q§:Dictionary = new Dictionary();
      
      private static const §_-KZ§:Dictionary = new Dictionary();
      
      private static const §_-e1S§:Dictionary = new Dictionary();
      
      private var §_-Q2r§:ByteArray = null;
      
      private var §_-XE§:String = "";
      
      private var §_-g1§:Boolean = false;
      
      public var §_-434§:Boolean = false;
      
      public function AGALMiniAssembler(param1:Boolean = false)
      {
         super();
         this.§_-g1§ = param1;
         if(!§_-B3o§)
         {
            init();
         }
      }
      
      private static function init() : void
      {
         §_-B3o§ = true;
         §_-F2q§[§_-Rv§] = new OpCode(§_-Rv§,2,0,0);
         §_-F2q§[ADD] = new OpCode(ADD,3,1,0);
         §_-F2q§[§_-b1d§] = new OpCode(§_-b1d§,3,2,0);
         §_-F2q§[§_-m5§] = new OpCode(§_-m5§,3,3,0);
         §_-F2q§[§_-JJ§] = new OpCode(§_-JJ§,3,4,0);
         §_-F2q§[§_-Z2e§] = new OpCode(§_-Z2e§,2,5,0);
         §_-F2q§[§_-6T§] = new OpCode(§_-6T§,3,6,0);
         §_-F2q§[§_-pG§] = new OpCode(§_-pG§,3,7,0);
         §_-F2q§[§_-dr§] = new OpCode(§_-dr§,2,8,0);
         §_-F2q§[§_-eW§] = new OpCode(§_-eW§,2,9,0);
         §_-F2q§[§_-t2y§] = new OpCode(§_-t2y§,2,10,0);
         §_-F2q§[§_-z1A§] = new OpCode(§_-z1A§,3,11,0);
         §_-F2q§[§_-E2r§] = new OpCode(§_-E2r§,2,12,0);
         §_-F2q§[§_-f1m§] = new OpCode(§_-f1m§,2,13,0);
         §_-F2q§[§_-a2l§] = new OpCode(§_-a2l§,2,14,0);
         §_-F2q§[§_-F1L§] = new OpCode(§_-F1L§,2,15,0);
         §_-F2q§[§_-UR§] = new OpCode(§_-UR§,2,16,0);
         §_-F2q§[§_-226§] = new OpCode(§_-226§,3,17,0);
         §_-F2q§[DP3] = new OpCode(DP3,3,18,0);
         §_-F2q§[DP4] = new OpCode(DP4,3,19,0);
         §_-F2q§[§_-Dy§] = new OpCode(§_-Dy§,2,20,0);
         §_-F2q§[§_-I2e§] = new OpCode(§_-I2e§,2,21,0);
         §_-F2q§[§_-22X§] = new OpCode(§_-22X§,2,22,0);
         §_-F2q§[M33] = new OpCode(M33,3,23,§_-Ix§);
         §_-F2q§[M44] = new OpCode(M44,3,24,§_-Ix§);
         §_-F2q§[M34] = new OpCode(M34,3,25,§_-Ix§);
         §_-F2q§[§_-c1J§] = new OpCode(§_-c1J§,2,26,§_-42H§ | §_-73Z§);
         §_-F2q§[§_-83q§] = new OpCode(§_-83q§,2,27,§_-42H§ | §_-73Z§);
         §_-F2q§[§_-T2n§] = new OpCode(§_-T2n§,2,28,§_-UE§ | §_-42H§ | §_-V2g§ | §_-K1J§);
         §_-F2q§[§_-72K§] = new OpCode(§_-72K§,2,29,§_-UE§ | §_-42H§ | §_-V2g§ | §_-K1J§);
         §_-F2q§[§_-w1z§] = new OpCode(§_-w1z§,2,30,§_-UE§ | §_-42H§ | §_-V2g§ | §_-K1J§);
         §_-F2q§[§_-G2K§] = new OpCode(§_-G2K§,2,31,§_-UE§ | §_-42H§ | §_-V2g§ | §_-K1J§);
         §_-F2q§[§_-g16§] = new OpCode(§_-g16§,0,32,§_-UE§ | §_-42H§ | §_-V2g§ | §_-l1h§ | §_-K1J§);
         §_-F2q§[§_-134§] = new OpCode(§_-134§,0,33,§_-UE§ | §_-42H§ | §_-l1h§ | §_-K1J§);
         §_-F2q§[§_-h20§] = new OpCode(§_-h20§,3,38,§_-73Z§ | §_-SH§ | §_-42H§);
         §_-F2q§[§_-m2E§] = new OpCode(§_-m2E§,1,39,§_-UE§ | §_-73Z§);
         §_-F2q§[§_-n1y§] = new OpCode(§_-n1y§,3,40,§_-73Z§ | §_-SH§);
         §_-F2q§[§_-kJ§] = new OpCode(§_-kJ§,3,41,0);
         §_-F2q§[§_-p4§] = new OpCode(§_-p4§,3,42,0);
         §_-F2q§[§_-W2W§] = new OpCode(§_-W2W§,2,43,0);
         §_-F2q§[§_-x2S§] = new OpCode(§_-x2S§,3,44,0);
         §_-F2q§[§_-G2x§] = new OpCode(§_-G2x§,3,45,0);
         §_-e1S§[§_-Az§] = new Sampler(§_-Az§,§_-Y1z§,0);
         §_-e1S§[DXT1] = new Sampler(DXT1,§_-Y1z§,1);
         §_-e1S§[DXT5] = new Sampler(DXT5,§_-Y1z§,2);
         §_-e1S§[§_-G2f§] = new Sampler(§_-G2f§,§_-Y1z§,3);
         §_-e1S§[D2] = new Sampler(D2,§_-h2S§,0);
         §_-e1S§[D3] = new Sampler(D3,§_-h2S§,2);
         §_-e1S§[§_-C1v§] = new Sampler(§_-C1v§,§_-h2S§,1);
         §_-e1S§[§_-K2X§] = new Sampler(§_-K2X§,§_-i1z§,1);
         §_-e1S§[§_-D17§] = new Sampler(§_-D17§,§_-i1z§,2);
         §_-e1S§[§_-o2Y§] = new Sampler(§_-o2Y§,§_-i1z§,0);
         §_-e1S§[§_-WZ§] = new Sampler(§_-WZ§,§_-i1z§,0);
         §_-e1S§[§_-81Y§] = new Sampler(§_-81Y§,§_-b2l§,0);
         §_-e1S§[LINEAR] = new Sampler(LINEAR,§_-b2l§,1);
         §_-e1S§[§_-X3§] = new Sampler(§_-X3§,§_-KV§,1 << 0);
         §_-e1S§[§_-k21§] = new Sampler(§_-k21§,§_-KV§,1 << 1);
         §_-e1S§[§_-rw§] = new Sampler(§_-rw§,§_-KV§,1 << 2);
         §_-e1S§[§_-B3X§] = new Sampler(§_-B3X§,§_-915§,1);
         §_-e1S§[§_-P1b§] = new Sampler(§_-P1b§,§_-915§,1);
         §_-e1S§[§_-4I§] = new Sampler(§_-4I§,§_-915§,0);
      }
      
      public function get error() : String
      {
         return this.§_-XE§;
      }
      
      public function get §_-B26§() : ByteArray
      {
         return this.§_-Q2r§;
      }
      
      public function assemble2(param1:Context3D, param2:uint, param3:String, param4:String) : Program3D
      {
         var _loc5_:ByteArray = this.§_-p14§(VERTEX,param3,param2);
         var _loc6_:ByteArray = this.§_-p14§(FRAGMENT,param4,param2);
         var _loc7_:Program3D = param1.createProgram();
         _loc7_.upload(_loc5_,_loc6_);
         return _loc7_;
      }
      
      public function §_-p14§(param1:String, param2:String, param3:uint = 1, param4:Boolean = false) : ByteArray
      {
         var _loc9_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:OpCode = null;
         var _loc17_:Array = null;
         var _loc18_:Boolean = false;
         var _loc19_:uint = 0;
         var _loc20_:uint = 0;
         var _loc21_:int = 0;
         var _loc22_:Boolean = false;
         var _loc23_:Array = null;
         var _loc24_:Array = null;
         var _loc25_:Register = null;
         var _loc26_:Array = null;
         var _loc27_:uint = 0;
         var _loc28_:uint = 0;
         var _loc29_:Array = null;
         var _loc30_:Boolean = false;
         var _loc31_:Boolean = false;
         var _loc32_:uint = 0;
         var _loc33_:uint = 0;
         var _loc34_:int = 0;
         var _loc35_:uint = 0;
         var _loc36_:uint = 0;
         var _loc37_:int = 0;
         var _loc38_:Array = null;
         var _loc39_:Register = null;
         var _loc40_:Array = null;
         var _loc41_:Array = null;
         var _loc42_:uint = 0;
         var _loc43_:uint = 0;
         var _loc44_:Number = NaN;
         var _loc45_:Sampler = null;
         var _loc46_:String = null;
         var _loc47_:uint = 0;
         var _loc48_:uint = 0;
         var _loc49_:String = null;
         var _loc5_:uint = uint(getTimer());
         this.§_-Q2r§ = new ByteArray();
         this.§_-XE§ = "";
         var _loc6_:Boolean = false;
         if(param1 == FRAGMENT)
         {
            _loc6_ = true;
         }
         else if(param1 != VERTEX)
         {
            this.§_-XE§ = "ERROR: mode needs to be \"" + FRAGMENT + "\" or \"" + VERTEX + "\" but is \"" + param1 + "\".";
         }
         this.§_-B26§.endian = Endian.LITTLE_ENDIAN;
         this.§_-B26§.writeByte(160);
         this.§_-B26§.writeUnsignedInt(param3);
         this.§_-B26§.writeByte(161);
         this.§_-B26§.writeByte(_loc6_ ? 1 : 0);
         this.§_-u2J§(param3,param4);
         var _loc7_:Array = param2.replace(/[\f\n\r\v]+/g,"\n").split("\n");
         var _loc8_:int = 0;
         var _loc10_:int = int(_loc7_.length);
         _loc9_ = 0;
         while(_loc9_ < _loc10_ && this.§_-XE§ == "")
         {
            _loc11_ = new String(_loc7_[_loc9_]);
            _loc11_ = _loc11_.replace(§_-F1k§,"");
            _loc12_ = _loc11_.search("//");
            if(_loc12_ != -1)
            {
               _loc11_ = _loc11_.slice(0,_loc12_);
            }
            _loc13_ = _loc11_.search(/<.*>/g);
            if(_loc13_ != -1)
            {
               _loc14_ = _loc11_.slice(_loc13_).match(/([\w\.\-\+]+)/gi);
               _loc11_ = _loc11_.slice(0,_loc13_);
            }
            _loc15_ = _loc11_.match(/^\w{3}/ig);
            if(!_loc15_)
            {
               if(_loc11_.length >= 3)
               {
                  trace("warning: bad line " + _loc9_ + ": " + _loc7_[_loc9_]);
               }
            }
            else
            {
               _loc16_ = §_-F2q§[_loc15_[0]];
               if(this.§_-g1§)
               {
                  trace(_loc16_);
               }
               if(_loc16_ == null)
               {
                  if(_loc11_.length >= 3)
                  {
                     trace("warning: bad line " + _loc9_ + ": " + _loc7_[_loc9_]);
                  }
               }
               else
               {
                  _loc11_ = _loc11_.slice(_loc11_.search(_loc16_.name) + _loc16_.name.length);
                  if(Boolean(_loc16_.flags & §_-42H§) && param3 < 2)
                  {
                     this.§_-XE§ = "error: opcode requires version 2.";
                     break;
                  }
                  if(Boolean(_loc16_.flags & §_-H1P§) && _loc6_)
                  {
                     this.§_-XE§ = "error: opcode is only allowed in vertex programs.";
                     break;
                  }
                  if(Boolean(_loc16_.flags & §_-73Z§) && !_loc6_)
                  {
                     this.§_-XE§ = "error: opcode is only allowed in fragment programs.";
                     break;
                  }
                  if(this.§_-434§)
                  {
                     trace("emit opcode=" + _loc16_);
                  }
                  this.§_-B26§.writeUnsignedInt(_loc16_.emitCode);
                  if(++_loc8_ > §_-93j§)
                  {
                     this.§_-XE§ = "error: too many opcodes. maximum is " + §_-93j§ + ".";
                     break;
                  }
                  _loc17_ = _loc11_.match(/vc\[([vof][acostdip]?)(\d*)?(\.[xyzw](\+\d{1,3})?)?\](\.[xyzw]{1,4})?|([vof][acostdip]?)(\d*)?(\.[xyzw]{1,4})?/gi);
                  if(!_loc17_ || _loc17_.length != _loc16_.numRegister)
                  {
                     this.§_-XE§ = "error: wrong number of operands. found " + _loc17_.length + " but expected " + _loc16_.numRegister + ".";
                     break;
                  }
                  _loc18_ = false;
                  _loc19_ = 64 + 64 + 32;
                  _loc20_ = _loc17_.length;
                  _loc21_ = 0;
                  while(_loc21_ < _loc20_)
                  {
                     _loc22_ = false;
                     _loc23_ = _loc17_[_loc21_].match(/\[.*\]/ig);
                     if(Boolean(_loc23_) && _loc23_.length > 0)
                     {
                        _loc17_[_loc21_] = _loc17_[_loc21_].replace(_loc23_[0],"0");
                        if(this.§_-434§)
                        {
                           trace("IS REL");
                        }
                        _loc22_ = true;
                     }
                     _loc24_ = _loc17_[_loc21_].match(/^\b[A-Za-z]{1,2}/ig);
                     if(!_loc24_)
                     {
                        this.§_-XE§ = "error: could not parse operand " + _loc21_ + " (" + _loc17_[_loc21_] + ").";
                        _loc18_ = true;
                        break;
                     }
                     _loc25_ = §_-KZ§[_loc24_[0]];
                     if(this.§_-g1§)
                     {
                        trace(_loc25_);
                     }
                     if(_loc25_ == null)
                     {
                        this.§_-XE§ = "error: could not find register name for operand " + _loc21_ + " (" + _loc17_[_loc21_] + ").";
                        _loc18_ = true;
                        break;
                     }
                     if(_loc6_)
                     {
                        if(!(_loc25_.flags & §_-3I§))
                        {
                           this.§_-XE§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") only allowed in vertex programs.";
                           _loc18_ = true;
                           break;
                        }
                        if(_loc22_)
                        {
                           this.§_-XE§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") relative adressing not allowed in fragment programs.";
                           _loc18_ = true;
                           break;
                        }
                     }
                     else if(!(_loc25_.flags & §_-J7§))
                     {
                        this.§_-XE§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") only allowed in fragment programs.";
                        _loc18_ = true;
                        break;
                     }
                     _loc17_[_loc21_] = _loc17_[_loc21_].slice(_loc17_[_loc21_].search(_loc25_.name) + _loc25_.name.length);
                     _loc26_ = _loc22_ ? _loc23_[0].match(/\d+/) : _loc17_[_loc21_].match(/\d+/);
                     _loc27_ = 0;
                     if(_loc26_)
                     {
                        _loc27_ = uint(_loc26_[0]);
                     }
                     if(_loc25_.range < _loc27_)
                     {
                        this.§_-XE§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") index exceeds limit of " + (_loc25_.range + 1) + ".";
                        _loc18_ = true;
                        break;
                     }
                     _loc28_ = 0;
                     _loc29_ = _loc17_[_loc21_].match(/(\.[xyzw]{1,4})/);
                     _loc30_ = _loc21_ == 0 && !(_loc16_.flags & §_-UE§);
                     _loc31_ = _loc21_ == 2 && Boolean(_loc16_.flags & §_-SH§);
                     _loc32_ = 0;
                     _loc33_ = 0;
                     _loc34_ = 0;
                     if(_loc30_ && _loc22_)
                     {
                        this.§_-XE§ = "error: relative can not be destination";
                        _loc18_ = true;
                        break;
                     }
                     if(_loc29_)
                     {
                        _loc28_ = 0;
                        _loc36_ = uint(_loc29_[0].length);
                        _loc37_ = 1;
                        while(_loc37_ < _loc36_)
                        {
                           _loc35_ = _loc29_[0].charCodeAt(_loc37_) - "x".charCodeAt(0);
                           if(_loc35_ > 2)
                           {
                              _loc35_ = 3;
                           }
                           if(_loc30_)
                           {
                              _loc28_ |= 1 << _loc35_;
                           }
                           else
                           {
                              _loc28_ |= _loc35_ << (_loc37_ - 1 << 1);
                           }
                           _loc37_++;
                        }
                        if(!_loc30_)
                        {
                           while(_loc37_ <= 4)
                           {
                              _loc28_ |= _loc35_ << (_loc37_ - 1 << 1);
                              _loc37_++;
                           }
                        }
                     }
                     else
                     {
                        _loc28_ = _loc30_ ? 15 : 228;
                     }
                     if(_loc22_)
                     {
                        _loc38_ = _loc23_[0].match(/[A-Za-z]{1,2}/ig);
                        _loc39_ = §_-KZ§[_loc38_[0]];
                        if(_loc39_ == null)
                        {
                           this.§_-XE§ = "error: bad index register";
                           _loc18_ = true;
                           break;
                        }
                        _loc32_ = _loc39_.emitCode;
                        _loc40_ = _loc23_[0].match(/(\.[xyzw]{1,1})/);
                        if(_loc40_.length == 0)
                        {
                           this.§_-XE§ = "error: bad index register select";
                           _loc18_ = true;
                           break;
                        }
                        _loc33_ = _loc40_[0].charCodeAt(1) - "x".charCodeAt(0);
                        if(_loc33_ > 2)
                        {
                           _loc33_ = 3;
                        }
                        _loc41_ = _loc23_[0].match(/\+\d{1,3}/ig);
                        if(_loc41_.length > 0)
                        {
                           _loc34_ = int(_loc41_[0]);
                        }
                        if(_loc34_ < 0 || _loc34_ > 255)
                        {
                           this.§_-XE§ = "error: index offset " + _loc34_ + " out of bounds. [0..255]";
                           _loc18_ = true;
                           break;
                        }
                        if(this.§_-434§)
                        {
                           trace("RELATIVE: type=" + _loc32_ + "==" + _loc38_[0] + " sel=" + _loc33_ + "==" + _loc40_[0] + " idx=" + _loc27_ + " offset=" + _loc34_);
                        }
                     }
                     if(this.§_-434§)
                     {
                        trace("  emit argcode=" + _loc25_ + "[" + _loc27_ + "][" + _loc28_ + "]");
                     }
                     if(_loc30_)
                     {
                        this.§_-B26§.writeShort(_loc27_);
                        this.§_-B26§.writeByte(_loc28_);
                        this.§_-B26§.writeByte(_loc25_.emitCode);
                        _loc19_ -= 32;
                     }
                     else if(_loc31_)
                     {
                        if(this.§_-434§)
                        {
                           trace("  emit sampler");
                        }
                        _loc42_ = 5;
                        _loc43_ = _loc14_ == null ? 0 : _loc14_.length;
                        _loc44_ = 0;
                        _loc37_ = 0;
                        while(_loc37_ < _loc43_)
                        {
                           if(this.§_-434§)
                           {
                              trace("    opt: " + _loc14_[_loc37_]);
                           }
                           _loc45_ = §_-e1S§[_loc14_[_loc37_]];
                           if(_loc45_ == null)
                           {
                              _loc44_ = Number(_loc14_[_loc37_]);
                              if(this.§_-434§)
                              {
                                 trace("    bias: " + _loc44_);
                              }
                           }
                           else
                           {
                              if(_loc45_.flag != §_-KV§)
                              {
                                 _loc42_ &= ~(15 << _loc45_.flag);
                              }
                              _loc42_ |= uint(_loc45_.mask) << uint(_loc45_.flag);
                           }
                           _loc37_++;
                        }
                        this.§_-B26§.writeShort(_loc27_);
                        this.§_-B26§.writeByte(int(_loc44_ * 8));
                        this.§_-B26§.writeByte(0);
                        this.§_-B26§.writeUnsignedInt(_loc42_);
                        if(this.§_-434§)
                        {
                           trace("    bits: " + (_loc42_ - 5));
                        }
                        _loc19_ -= 64;
                     }
                     else
                     {
                        if(_loc21_ == 0)
                        {
                           this.§_-B26§.writeUnsignedInt(0);
                           _loc19_ -= 32;
                        }
                        this.§_-B26§.writeShort(_loc27_);
                        this.§_-B26§.writeByte(_loc34_);
                        this.§_-B26§.writeByte(_loc28_);
                        this.§_-B26§.writeByte(_loc25_.emitCode);
                        this.§_-B26§.writeByte(_loc32_);
                        this.§_-B26§.writeShort(_loc22_ ? _loc33_ | 1 << 15 : 0);
                        _loc19_ -= 64;
                     }
                     _loc21_++;
                  }
                  _loc21_ = 0;
                  while(_loc21_ < _loc19_)
                  {
                     this.§_-B26§.writeByte(0);
                     _loc21_ += 8;
                  }
                  if(_loc18_)
                  {
                     break;
                  }
               }
            }
            _loc9_++;
         }
         if(this.§_-XE§ != "")
         {
            this.§_-XE§ += "\n  at line " + _loc9_ + " " + _loc7_[_loc9_];
            this.§_-B26§.length = 0;
            trace(this.§_-XE§);
         }
         if(this.§_-g1§)
         {
            _loc46_ = "generated bytecode:";
            _loc47_ = this.§_-B26§.length;
            _loc48_ = 0;
            while(_loc48_ < _loc47_)
            {
               if(!(_loc48_ % 16))
               {
                  _loc46_ += "\n";
               }
               if(!(_loc48_ % 4))
               {
                  _loc46_ += " ";
               }
               _loc49_ = this.§_-B26§[_loc48_].toString(16);
               if(_loc49_.length < 2)
               {
                  _loc49_ = "0" + _loc49_;
               }
               _loc46_ += _loc49_;
               _loc48_++;
            }
            trace(_loc46_);
         }
         if(this.§_-434§)
         {
            trace("AGALMiniAssembler.assemble time: " + (getTimer() - _loc5_) * 0.001 + "s");
         }
         return this.§_-B26§;
      }
      
      private function §_-u2J§(param1:uint, param2:Boolean) : void
      {
         §_-KZ§[VA] = new Register(VA,"vertex attribute",0,param2 ? 1024 : 7,§_-J7§ | §_-EB§);
         §_-KZ§[VC] = new Register(VC,"vertex constant",1,param2 ? 1024 : (param1 == 1 ? 127 : 250),§_-J7§ | §_-EB§);
         §_-KZ§[§_-Pl§] = new Register(§_-Pl§,"vertex temporary",2,param2 ? 1024 : (param1 == 1 ? 7 : 27),§_-J7§ | §_-m1K§ | §_-EB§);
         §_-KZ§[§_-I1H§] = new Register(§_-I1H§,"vertex output",3,param2 ? 1024 : 0,§_-J7§ | §_-m1K§);
         §_-KZ§[VI] = new Register(VI,"varying",4,param2 ? 1024 : (param1 == 1 ? 7 : 11),§_-J7§ | §_-3I§ | §_-EB§ | §_-m1K§);
         §_-KZ§[§_-lg§] = new Register(§_-lg§,"fragment constant",1,param2 ? 1024 : (param1 == 1 ? 27 : 63),§_-3I§ | §_-EB§);
         §_-KZ§[§_-2x§] = new Register(§_-2x§,"fragment temporary",2,param2 ? 1024 : (param1 == 1 ? 7 : 27),§_-3I§ | §_-m1K§ | §_-EB§);
         §_-KZ§[FS] = new Register(FS,"texture sampler",5,param2 ? 1024 : 7,§_-3I§ | §_-EB§);
         §_-KZ§[FO] = new Register(FO,"fragment output",3,param2 ? 1024 : (param1 == 1 ? 0 : 3),§_-3I§ | §_-m1K§);
         §_-KZ§[§_-T1H§] = new Register(§_-T1H§,"fragment depth output",6,param2 ? 1024 : (param1 == 1 ? uint(-1) : 0),§_-3I§ | §_-m1K§);
         §_-KZ§["op"] = §_-KZ§[§_-I1H§];
         §_-KZ§["i"] = §_-KZ§[VI];
         §_-KZ§["v"] = §_-KZ§[VI];
         §_-KZ§["oc"] = §_-KZ§[FO];
         §_-KZ§["od"] = §_-KZ§[§_-T1H§];
         §_-KZ§["fi"] = §_-KZ§[VI];
      }
   }
}

class OpCode
{
   
   private var _emitCode:uint;
   
   private var _flags:uint;
   
   private var _name:String;
   
   private var _numRegister:uint;
   
   public function OpCode(param1:String, param2:uint, param3:uint, param4:uint)
   {
      super();
      this._name = param1;
      this._numRegister = param2;
      this._emitCode = param3;
      this._flags = param4;
   }
   
   public function get emitCode() : uint
   {
      return this._emitCode;
   }
   
   public function get flags() : uint
   {
      return this._flags;
   }
   
   public function get name() : String
   {
      return this._name;
   }
   
   public function get numRegister() : uint
   {
      return this._numRegister;
   }
   
   public function toString() : String
   {
      return "[OpCode name=\"" + this._name + "\", numRegister=" + this._numRegister + ", emitCode=" + this._emitCode + ", flags=" + this._flags + "]";
   }
}

class Register
{
   
   private var _emitCode:uint;
   
   private var _name:String;
   
   private var _longName:String;
   
   private var _flags:uint;
   
   private var _range:uint;
   
   public function Register(param1:String, param2:String, param3:uint, param4:uint, param5:uint)
   {
      super();
      this._name = param1;
      this._longName = param2;
      this._emitCode = param3;
      this._range = param4;
      this._flags = param5;
   }
   
   public function get emitCode() : uint
   {
      return this._emitCode;
   }
   
   public function get longName() : String
   {
      return this._longName;
   }
   
   public function get name() : String
   {
      return this._name;
   }
   
   public function get flags() : uint
   {
      return this._flags;
   }
   
   public function get range() : uint
   {
      return this._range;
   }
   
   public function toString() : String
   {
      return "[Register name=\"" + this._name + "\", longName=\"" + this._longName + "\", emitCode=" + this._emitCode + ", range=" + this._range + ", flags=" + this._flags + "]";
   }
}

class Sampler
{
   
   private var _flag:uint;
   
   private var _mask:uint;
   
   private var _name:String;
   
   public function Sampler(param1:String, param2:uint, param3:uint)
   {
      super();
      this._name = param1;
      this._flag = param2;
      this._mask = param3;
   }
   
   public function get flag() : uint
   {
      return this._flag;
   }
   
   public function get mask() : uint
   {
      return this._mask;
   }
   
   public function get name() : String
   {
      return this._name;
   }
   
   public function toString() : String
   {
      return "[Sampler name=\"" + this._name + "\", flag=\"" + this._flag + "\", mask=" + this.mask + "]";
   }
}
