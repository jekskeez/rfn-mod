package §_-539§
{
   import flash.display3D.*;
   import flash.utils.*;
   
   public class AGALMiniAssembler
   {
      
      private static const §_-K2i§:int = 2048;
      
      private static const FRAGMENT:String = "fragment";
      
      private static const VERTEX:String = "vertex";
      
      private static const §_-g1Y§:uint = 8;
      
      private static const §_-7a§:uint = 12;
      
      private static const §_-U18§:uint = 16;
      
      private static const §_-P1q§:uint = 20;
      
      private static const §_-Ny§:uint = 24;
      
      private static const §_-B1e§:uint = 28;
      
      private static const §_-uv§:uint = 1;
      
      private static const §_-aF§:uint = 2;
      
      private static const §_-yu§:uint = 32;
      
      private static const §_-b2i§:uint = 64;
      
      private static const §_-A0§:uint = 1;
      
      private static const §_-7o§:uint = 8;
      
      private static const §_-U2l§:uint = 16;
      
      private static const §_-yb§:uint = 32;
      
      private static const §_-61h§:uint = 64;
      
      private static const §_-B3A§:uint = 128;
      
      private static const §_-U2v§:uint = 256;
      
      private static const §_-Zp§:uint = 512;
      
      private static const §_-315§:uint = 1024;
      
      private static const §_-cg§:String = "mov";
      
      private static const ADD:String = "add";
      
      private static const §_-y1X§:String = "sub";
      
      private static const §_-Y2V§:String = "mul";
      
      private static const §_-C2Z§:String = "div";
      
      private static const §_-Ap§:String = "rcp";
      
      private static const §_-02V§:String = "min";
      
      private static const §_-b8§:String = "max";
      
      private static const §_-mC§:String = "frc";
      
      private static const §_-Zh§:String = "sqt";
      
      private static const §_-e2D§:String = "rsq";
      
      private static const §_-w2j§:String = "pow";
      
      private static const §_-a27§:String = "log";
      
      private static const §_-wS§:String = "exp";
      
      private static const §_-p2W§:String = "nrm";
      
      private static const §_-1D§:String = "sin";
      
      private static const §_-71c§:String = "cos";
      
      private static const §_-oq§:String = "crs";
      
      private static const DP3:String = "dp3";
      
      private static const DP4:String = "dp4";
      
      private static const §_-63y§:String = "abs";
      
      private static const §_-U2e§:String = "neg";
      
      private static const §_-hy§:String = "sat";
      
      private static const M33:String = "m33";
      
      private static const M44:String = "m44";
      
      private static const M34:String = "m34";
      
      private static const §_-82U§:String = "ddx";
      
      private static const §_-Q1P§:String = "ddy";
      
      private static const §_-J1n§:String = "ife";
      
      private static const §_-y2t§:String = "ine";
      
      private static const §_-z1e§:String = "ifg";
      
      private static const §_-K2l§:String = "ifl";
      
      private static const §_-X1V§:String = "els";
      
      private static const §_-z2S§:String = "eif";
      
      private static const §_-E22§:String = "ted";
      
      private static const §_-6W§:String = "kil";
      
      private static const §_-P2z§:String = "tex";
      
      private static const §_-M1v§:String = "sge";
      
      private static const §_-vc§:String = "slt";
      
      private static const §_-91V§:String = "sgn";
      
      private static const §_-en§:String = "seq";
      
      private static const §_-5A§:String = "sne";
      
      private static const VA:String = "va";
      
      private static const VC:String = "vc";
      
      private static const §_-zP§:String = "vt";
      
      private static const §_-D1b§:String = "vo";
      
      private static const VI:String = "vi";
      
      private static const §_-nJ§:String = "fc";
      
      private static const §_-M2o§:String = "ft";
      
      private static const FS:String = "fs";
      
      private static const FO:String = "fo";
      
      private static const §_-4U§:String = "fd";
      
      private static const D2:String = "2d";
      
      private static const D3:String = "3d";
      
      private static const §_-FP§:String = "cube";
      
      private static const §_-928§:String = "mipnearest";
      
      private static const §_-d2d§:String = "miplinear";
      
      private static const §_-OI§:String = "mipnone";
      
      private static const §_-Q1y§:String = "nomip";
      
      private static const §_-v2k§:String = "nearest";
      
      private static const LINEAR:String = "linear";
      
      private static const §_-H1U§:String = "centroid";
      
      private static const §_-93F§:String = "single";
      
      private static const §_-32N§:String = "ignoresampler";
      
      private static const §_-83R§:String = "repeat";
      
      private static const §_-x2M§:String = "wrap";
      
      private static const §_-Or§:String = "clamp";
      
      private static const §_-Gj§:String = "rgba";
      
      private static const DXT1:String = "dxt1";
      
      private static const DXT5:String = "dxt5";
      
      private static const §_-TL§:String = "video";
      
      protected static const §_-Ux§:RegExp = /^\s+|\s+$/g;
      
      private static var §_-E1e§:Boolean = false;
      
      private static const §_-R20§:Dictionary = new Dictionary();
      
      private static const §_-73e§:Dictionary = new Dictionary();
      
      private static const §_-C1G§:Dictionary = new Dictionary();
      
      private var §_-g1d§:ByteArray = null;
      
      private var §_-z1C§:String = "";
      
      private var §_-f2Z§:Boolean = false;
      
      public var §_-i1j§:Boolean = false;
      
      public function AGALMiniAssembler(param1:Boolean = false)
      {
         super();
         this.§_-f2Z§ = param1;
         if(!§_-E1e§)
         {
            init();
         }
      }
      
      private static function init() : void
      {
         §_-E1e§ = true;
         §_-R20§[§_-cg§] = new OpCode(§_-cg§,2,0,0);
         §_-R20§[ADD] = new OpCode(ADD,3,1,0);
         §_-R20§[§_-y1X§] = new OpCode(§_-y1X§,3,2,0);
         §_-R20§[§_-Y2V§] = new OpCode(§_-Y2V§,3,3,0);
         §_-R20§[§_-C2Z§] = new OpCode(§_-C2Z§,3,4,0);
         §_-R20§[§_-Ap§] = new OpCode(§_-Ap§,2,5,0);
         §_-R20§[§_-02V§] = new OpCode(§_-02V§,3,6,0);
         §_-R20§[§_-b8§] = new OpCode(§_-b8§,3,7,0);
         §_-R20§[§_-mC§] = new OpCode(§_-mC§,2,8,0);
         §_-R20§[§_-Zh§] = new OpCode(§_-Zh§,2,9,0);
         §_-R20§[§_-e2D§] = new OpCode(§_-e2D§,2,10,0);
         §_-R20§[§_-w2j§] = new OpCode(§_-w2j§,3,11,0);
         §_-R20§[§_-a27§] = new OpCode(§_-a27§,2,12,0);
         §_-R20§[§_-wS§] = new OpCode(§_-wS§,2,13,0);
         §_-R20§[§_-p2W§] = new OpCode(§_-p2W§,2,14,0);
         §_-R20§[§_-1D§] = new OpCode(§_-1D§,2,15,0);
         §_-R20§[§_-71c§] = new OpCode(§_-71c§,2,16,0);
         §_-R20§[§_-oq§] = new OpCode(§_-oq§,3,17,0);
         §_-R20§[DP3] = new OpCode(DP3,3,18,0);
         §_-R20§[DP4] = new OpCode(DP4,3,19,0);
         §_-R20§[§_-63y§] = new OpCode(§_-63y§,2,20,0);
         §_-R20§[§_-U2e§] = new OpCode(§_-U2e§,2,21,0);
         §_-R20§[§_-hy§] = new OpCode(§_-hy§,2,22,0);
         §_-R20§[M33] = new OpCode(M33,3,23,§_-U2l§);
         §_-R20§[M44] = new OpCode(M44,3,24,§_-U2l§);
         §_-R20§[M34] = new OpCode(M34,3,25,§_-U2l§);
         §_-R20§[§_-82U§] = new OpCode(§_-82U§,2,26,§_-U2v§ | §_-yb§);
         §_-R20§[§_-Q1P§] = new OpCode(§_-Q1P§,2,27,§_-U2v§ | §_-yb§);
         §_-R20§[§_-J1n§] = new OpCode(§_-J1n§,2,28,§_-B3A§ | §_-U2v§ | §_-Zp§ | §_-A0§);
         §_-R20§[§_-y2t§] = new OpCode(§_-y2t§,2,29,§_-B3A§ | §_-U2v§ | §_-Zp§ | §_-A0§);
         §_-R20§[§_-z1e§] = new OpCode(§_-z1e§,2,30,§_-B3A§ | §_-U2v§ | §_-Zp§ | §_-A0§);
         §_-R20§[§_-K2l§] = new OpCode(§_-K2l§,2,31,§_-B3A§ | §_-U2v§ | §_-Zp§ | §_-A0§);
         §_-R20§[§_-X1V§] = new OpCode(§_-X1V§,0,32,§_-B3A§ | §_-U2v§ | §_-Zp§ | §_-315§ | §_-A0§);
         §_-R20§[§_-z2S§] = new OpCode(§_-z2S§,0,33,§_-B3A§ | §_-U2v§ | §_-315§ | §_-A0§);
         §_-R20§[§_-E22§] = new OpCode(§_-E22§,3,38,§_-yb§ | §_-7o§ | §_-U2v§);
         §_-R20§[§_-6W§] = new OpCode(§_-6W§,1,39,§_-B3A§ | §_-yb§);
         §_-R20§[§_-P2z§] = new OpCode(§_-P2z§,3,40,§_-yb§ | §_-7o§);
         §_-R20§[§_-M1v§] = new OpCode(§_-M1v§,3,41,0);
         §_-R20§[§_-vc§] = new OpCode(§_-vc§,3,42,0);
         §_-R20§[§_-91V§] = new OpCode(§_-91V§,2,43,0);
         §_-R20§[§_-en§] = new OpCode(§_-en§,3,44,0);
         §_-R20§[§_-5A§] = new OpCode(§_-5A§,3,45,0);
         §_-C1G§[§_-Gj§] = new Sampler(§_-Gj§,§_-g1Y§,0);
         §_-C1G§[DXT1] = new Sampler(DXT1,§_-g1Y§,1);
         §_-C1G§[DXT5] = new Sampler(DXT5,§_-g1Y§,2);
         §_-C1G§[§_-TL§] = new Sampler(§_-TL§,§_-g1Y§,3);
         §_-C1G§[D2] = new Sampler(D2,§_-7a§,0);
         §_-C1G§[D3] = new Sampler(D3,§_-7a§,2);
         §_-C1G§[§_-FP§] = new Sampler(§_-FP§,§_-7a§,1);
         §_-C1G§[§_-928§] = new Sampler(§_-928§,§_-Ny§,1);
         §_-C1G§[§_-d2d§] = new Sampler(§_-d2d§,§_-Ny§,2);
         §_-C1G§[§_-OI§] = new Sampler(§_-OI§,§_-Ny§,0);
         §_-C1G§[§_-Q1y§] = new Sampler(§_-Q1y§,§_-Ny§,0);
         §_-C1G§[§_-v2k§] = new Sampler(§_-v2k§,§_-B1e§,0);
         §_-C1G§[LINEAR] = new Sampler(LINEAR,§_-B1e§,1);
         §_-C1G§[§_-H1U§] = new Sampler(§_-H1U§,§_-U18§,1 << 0);
         §_-C1G§[§_-93F§] = new Sampler(§_-93F§,§_-U18§,1 << 1);
         §_-C1G§[§_-32N§] = new Sampler(§_-32N§,§_-U18§,1 << 2);
         §_-C1G§[§_-83R§] = new Sampler(§_-83R§,§_-P1q§,1);
         §_-C1G§[§_-x2M§] = new Sampler(§_-x2M§,§_-P1q§,1);
         §_-C1G§[§_-Or§] = new Sampler(§_-Or§,§_-P1q§,0);
      }
      
      public function get error() : String
      {
         return this.§_-z1C§;
      }
      
      public function get §_-p8§() : ByteArray
      {
         return this.§_-g1d§;
      }
      
      public function assemble2(param1:Context3D, param2:uint, param3:String, param4:String) : Program3D
      {
         var _loc5_:ByteArray = this.§_-12Q§(VERTEX,param3,param2);
         var _loc6_:ByteArray = this.§_-12Q§(FRAGMENT,param4,param2);
         var _loc7_:Program3D = param1.createProgram();
         _loc7_.upload(_loc5_,_loc6_);
         return _loc7_;
      }
      
      public function §_-12Q§(param1:String, param2:String, param3:uint = 1, param4:Boolean = false) : ByteArray
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
         this.§_-g1d§ = new ByteArray();
         this.§_-z1C§ = "";
         var _loc6_:Boolean = false;
         if(param1 == FRAGMENT)
         {
            _loc6_ = true;
         }
         else if(param1 != VERTEX)
         {
            this.§_-z1C§ = "ERROR: mode needs to be \"" + FRAGMENT + "\" or \"" + VERTEX + "\" but is \"" + param1 + "\".";
         }
         this.§_-p8§.endian = Endian.LITTLE_ENDIAN;
         this.§_-p8§.writeByte(160);
         this.§_-p8§.writeUnsignedInt(param3);
         this.§_-p8§.writeByte(161);
         this.§_-p8§.writeByte(_loc6_ ? 1 : 0);
         this.§_-Z15§(param3,param4);
         var _loc7_:Array = param2.replace(/[\f\n\r\v]+/g,"\n").split("\n");
         var _loc8_:int = 0;
         var _loc10_:int = int(_loc7_.length);
         _loc9_ = 0;
         while(_loc9_ < _loc10_ && this.§_-z1C§ == "")
         {
            _loc11_ = new String(_loc7_[_loc9_]);
            _loc11_ = _loc11_.replace(§_-Ux§,"");
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
               _loc16_ = §_-R20§[_loc15_[0]];
               if(this.§_-f2Z§)
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
                  if(Boolean(_loc16_.flags & §_-U2v§) && param3 < 2)
                  {
                     this.§_-z1C§ = "error: opcode requires version 2.";
                     break;
                  }
                  if(Boolean(_loc16_.flags & §_-61h§) && _loc6_)
                  {
                     this.§_-z1C§ = "error: opcode is only allowed in vertex programs.";
                     break;
                  }
                  if(Boolean(_loc16_.flags & §_-yb§) && !_loc6_)
                  {
                     this.§_-z1C§ = "error: opcode is only allowed in fragment programs.";
                     break;
                  }
                  if(this.§_-i1j§)
                  {
                     trace("emit opcode=" + _loc16_);
                  }
                  this.§_-p8§.writeUnsignedInt(_loc16_.emitCode);
                  if(++_loc8_ > §_-K2i§)
                  {
                     this.§_-z1C§ = "error: too many opcodes. maximum is " + §_-K2i§ + ".";
                     break;
                  }
                  _loc17_ = _loc11_.match(/vc\[([vof][acostdip]?)(\d*)?(\.[xyzw](\+\d{1,3})?)?\](\.[xyzw]{1,4})?|([vof][acostdip]?)(\d*)?(\.[xyzw]{1,4})?/gi);
                  if(!_loc17_ || _loc17_.length != _loc16_.numRegister)
                  {
                     this.§_-z1C§ = "error: wrong number of operands. found " + _loc17_.length + " but expected " + _loc16_.numRegister + ".";
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
                        if(this.§_-i1j§)
                        {
                           trace("IS REL");
                        }
                        _loc22_ = true;
                     }
                     _loc24_ = _loc17_[_loc21_].match(/^\b[A-Za-z]{1,2}/ig);
                     if(!_loc24_)
                     {
                        this.§_-z1C§ = "error: could not parse operand " + _loc21_ + " (" + _loc17_[_loc21_] + ").";
                        _loc18_ = true;
                        break;
                     }
                     _loc25_ = §_-73e§[_loc24_[0]];
                     if(this.§_-f2Z§)
                     {
                        trace(_loc25_);
                     }
                     if(_loc25_ == null)
                     {
                        this.§_-z1C§ = "error: could not find register name for operand " + _loc21_ + " (" + _loc17_[_loc21_] + ").";
                        _loc18_ = true;
                        break;
                     }
                     if(_loc6_)
                     {
                        if(!(_loc25_.flags & §_-yu§))
                        {
                           this.§_-z1C§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") only allowed in vertex programs.";
                           _loc18_ = true;
                           break;
                        }
                        if(_loc22_)
                        {
                           this.§_-z1C§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") relative adressing not allowed in fragment programs.";
                           _loc18_ = true;
                           break;
                        }
                     }
                     else if(!(_loc25_.flags & §_-b2i§))
                     {
                        this.§_-z1C§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") only allowed in fragment programs.";
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
                        this.§_-z1C§ = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") index exceeds limit of " + (_loc25_.range + 1) + ".";
                        _loc18_ = true;
                        break;
                     }
                     _loc28_ = 0;
                     _loc29_ = _loc17_[_loc21_].match(/(\.[xyzw]{1,4})/);
                     _loc30_ = _loc21_ == 0 && !(_loc16_.flags & §_-B3A§);
                     _loc31_ = _loc21_ == 2 && Boolean(_loc16_.flags & §_-7o§);
                     _loc32_ = 0;
                     _loc33_ = 0;
                     _loc34_ = 0;
                     if(_loc30_ && _loc22_)
                     {
                        this.§_-z1C§ = "error: relative can not be destination";
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
                        _loc39_ = §_-73e§[_loc38_[0]];
                        if(_loc39_ == null)
                        {
                           this.§_-z1C§ = "error: bad index register";
                           _loc18_ = true;
                           break;
                        }
                        _loc32_ = _loc39_.emitCode;
                        _loc40_ = _loc23_[0].match(/(\.[xyzw]{1,1})/);
                        if(_loc40_.length == 0)
                        {
                           this.§_-z1C§ = "error: bad index register select";
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
                           this.§_-z1C§ = "error: index offset " + _loc34_ + " out of bounds. [0..255]";
                           _loc18_ = true;
                           break;
                        }
                        if(this.§_-i1j§)
                        {
                           trace("RELATIVE: type=" + _loc32_ + "==" + _loc38_[0] + " sel=" + _loc33_ + "==" + _loc40_[0] + " idx=" + _loc27_ + " offset=" + _loc34_);
                        }
                     }
                     if(this.§_-i1j§)
                     {
                        trace("  emit argcode=" + _loc25_ + "[" + _loc27_ + "][" + _loc28_ + "]");
                     }
                     if(_loc30_)
                     {
                        this.§_-p8§.writeShort(_loc27_);
                        this.§_-p8§.writeByte(_loc28_);
                        this.§_-p8§.writeByte(_loc25_.emitCode);
                        _loc19_ -= 32;
                     }
                     else if(_loc31_)
                     {
                        if(this.§_-i1j§)
                        {
                           trace("  emit sampler");
                        }
                        _loc42_ = 5;
                        _loc43_ = _loc14_ == null ? 0 : _loc14_.length;
                        _loc44_ = 0;
                        _loc37_ = 0;
                        while(_loc37_ < _loc43_)
                        {
                           if(this.§_-i1j§)
                           {
                              trace("    opt: " + _loc14_[_loc37_]);
                           }
                           _loc45_ = §_-C1G§[_loc14_[_loc37_]];
                           if(_loc45_ == null)
                           {
                              _loc44_ = Number(_loc14_[_loc37_]);
                              if(this.§_-i1j§)
                              {
                                 trace("    bias: " + _loc44_);
                              }
                           }
                           else
                           {
                              if(_loc45_.flag != §_-U18§)
                              {
                                 _loc42_ &= ~(15 << _loc45_.flag);
                              }
                              _loc42_ |= uint(_loc45_.mask) << uint(_loc45_.flag);
                           }
                           _loc37_++;
                        }
                        this.§_-p8§.writeShort(_loc27_);
                        this.§_-p8§.writeByte(int(_loc44_ * 8));
                        this.§_-p8§.writeByte(0);
                        this.§_-p8§.writeUnsignedInt(_loc42_);
                        if(this.§_-i1j§)
                        {
                           trace("    bits: " + (_loc42_ - 5));
                        }
                        _loc19_ -= 64;
                     }
                     else
                     {
                        if(_loc21_ == 0)
                        {
                           this.§_-p8§.writeUnsignedInt(0);
                           _loc19_ -= 32;
                        }
                        this.§_-p8§.writeShort(_loc27_);
                        this.§_-p8§.writeByte(_loc34_);
                        this.§_-p8§.writeByte(_loc28_);
                        this.§_-p8§.writeByte(_loc25_.emitCode);
                        this.§_-p8§.writeByte(_loc32_);
                        this.§_-p8§.writeShort(_loc22_ ? _loc33_ | 1 << 15 : 0);
                        _loc19_ -= 64;
                     }
                     _loc21_++;
                  }
                  _loc21_ = 0;
                  while(_loc21_ < _loc19_)
                  {
                     this.§_-p8§.writeByte(0);
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
         if(this.§_-z1C§ != "")
         {
            this.§_-z1C§ += "\n  at line " + _loc9_ + " " + _loc7_[_loc9_];
            this.§_-p8§.length = 0;
            trace(this.§_-z1C§);
         }
         if(this.§_-f2Z§)
         {
            _loc46_ = "generated bytecode:";
            _loc47_ = this.§_-p8§.length;
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
               _loc49_ = this.§_-p8§[_loc48_].toString(16);
               if(_loc49_.length < 2)
               {
                  _loc49_ = "0" + _loc49_;
               }
               _loc46_ += _loc49_;
               _loc48_++;
            }
            trace(_loc46_);
         }
         if(this.§_-i1j§)
         {
            trace("AGALMiniAssembler.assemble time: " + (getTimer() - _loc5_) * 0.001 + "s");
         }
         return this.§_-p8§;
      }
      
      private function §_-Z15§(param1:uint, param2:Boolean) : void
      {
         §_-73e§[VA] = new Register(VA,"vertex attribute",0,param2 ? 1024 : 7,§_-b2i§ | §_-aF§);
         §_-73e§[VC] = new Register(VC,"vertex constant",1,param2 ? 1024 : (param1 == 1 ? 127 : 250),§_-b2i§ | §_-aF§);
         §_-73e§[§_-zP§] = new Register(§_-zP§,"vertex temporary",2,param2 ? 1024 : (param1 == 1 ? 7 : 27),§_-b2i§ | §_-uv§ | §_-aF§);
         §_-73e§[§_-D1b§] = new Register(§_-D1b§,"vertex output",3,param2 ? 1024 : 0,§_-b2i§ | §_-uv§);
         §_-73e§[VI] = new Register(VI,"varying",4,param2 ? 1024 : (param1 == 1 ? 7 : 11),§_-b2i§ | §_-yu§ | §_-aF§ | §_-uv§);
         §_-73e§[§_-nJ§] = new Register(§_-nJ§,"fragment constant",1,param2 ? 1024 : (param1 == 1 ? 27 : 63),§_-yu§ | §_-aF§);
         §_-73e§[§_-M2o§] = new Register(§_-M2o§,"fragment temporary",2,param2 ? 1024 : (param1 == 1 ? 7 : 27),§_-yu§ | §_-uv§ | §_-aF§);
         §_-73e§[FS] = new Register(FS,"texture sampler",5,param2 ? 1024 : 7,§_-yu§ | §_-aF§);
         §_-73e§[FO] = new Register(FO,"fragment output",3,param2 ? 1024 : (param1 == 1 ? 0 : 3),§_-yu§ | §_-uv§);
         §_-73e§[§_-4U§] = new Register(§_-4U§,"fragment depth output",6,param2 ? 1024 : (param1 == 1 ? uint(-1) : 0),§_-yu§ | §_-uv§);
         §_-73e§["op"] = §_-73e§[§_-D1b§];
         §_-73e§["i"] = §_-73e§[VI];
         §_-73e§["v"] = §_-73e§[VI];
         §_-73e§["oc"] = §_-73e§[FO];
         §_-73e§["od"] = §_-73e§[§_-4U§];
         §_-73e§["fi"] = §_-73e§[VI];
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
