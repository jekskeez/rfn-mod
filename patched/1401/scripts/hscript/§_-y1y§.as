package hscript
{
   import §_-Jf§.§_-n2z§;
   import §_-Jf§.§_-y1y§;
   import flash.Boot;
   
   public class §_-y1y§
   {
      
      public var §_-I1x§:Array;
      
      public var §_-y25§:int;
      
      public var §_-wr§:int;
      
      public var §_-F1n§:§_-n6§;
      
      public var §_-j7§:§_-n2z§;
      
      public var §_-02W§:§_-Jf§.§_-y1y§;
      
      public function §_-y1y§(param1:§_-Jf§.§_-y1y§ = undefined)
      {
         if(Boot.§_-s2I§)
         {
            return;
         }
         §_-02W§ = param1;
         §_-y25§ = 0;
         §_-j7§ = new §_-n2z§();
         §_-F1n§ = new §_-n6§();
         §_-I1x§ = [null];
         §_-wr§ = 1;
      }
      
      public static function encode(param1:§_-eu§) : §_-Jf§.§_-y1y§
      {
         var _loc2_:hscript.§_-y1y§ = new hscript.§_-y1y§();
         _loc2_.§_-c1O§(param1);
         return _loc2_.§_-j7§.§_-61v§();
      }
      
      public static function §_-G2m§(param1:§_-Jf§.§_-y1y§) : §_-eu§
      {
         var _loc2_:hscript.§_-y1y§ = new hscript.§_-y1y§(param1);
         return _loc2_.§_-Dx§();
      }
      
      public function §_-7l§(param1:String) : void
      {
         var _loc3_:* = null as §_-Jf§.§_-y1y§;
         var _loc4_:int = 0;
         var _loc2_:* = §_-F1n§.get(param1);
         if(_loc2_ == null)
         {
            if(§_-wr§ == 256)
            {
               §_-F1n§ = new §_-n6§();
               §_-wr§ = 1;
            }
            §_-F1n§.set(param1,§_-wr§);
            §_-j7§.b.writeByte(0);
            _loc3_ = §_-Jf§.§_-y1y§.ofString(param1);
            §_-j7§.b.writeByte(_loc3_.length);
            §_-j7§.b.writeBytes(_loc3_.b);
            ++§_-wr§;
         }
         else
         {
            _loc4_ = _loc2_;
            §_-j7§.b.writeByte(_loc4_);
         }
      }
      
      public function §_-hQ§(param1:§_-g1n§) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:* = null as String;
         var _temp_1:* = param1;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 0:
               _loc3_ = int(_loc2_[0]);
               if(_loc3_ >= 0 && _loc3_ <= 255)
               {
                  §_-j7§.b.writeByte(0);
                  §_-j7§.b.writeByte(_loc3_);
               }
               else
               {
                  §_-j7§.b.writeByte(1);
                  §_-j7§.b.writeByte(_loc3_ & 0xFF);
                  §_-j7§.b.writeByte(_loc3_ >> 8 & 0xFF);
                  §_-j7§.b.writeByte(_loc3_ >> 16 & 0xFF);
                  §_-j7§.b.writeByte(_loc3_ >>> 24);
               }
               break;
            case 1:
               _loc6_ = Number(_loc2_[0]);
               §_-j7§.b.writeByte(2);
               §_-7l§(§_-630§.string(_loc6_));
               break;
            case 2:
               _loc7_ = _loc2_[0];
               §_-j7§.b.writeByte(3);
               §_-7l§(_loc7_);
               break;
            case 3:
               _loc3_ = int(_loc2_[0]);
               §_-j7§.b.writeByte(4);
               _loc5_ = _loc3_ & 0xFFFFFF;
               if((_loc5_ >> 30 & 1) != _loc5_ >>> 31)
               {
                  Boot.§_-tp§ = new Error();
                  throw "Overflow " + _loc5_;
               }
               _loc4_ = _loc5_;
               §_-j7§.b.writeByte(_loc4_ & 0xFF);
               §_-j7§.b.writeByte(_loc4_ >> 8 & 0xFF);
               §_-j7§.b.writeByte(_loc4_ >> 16);
               §§push(§_-j7§.b);
               _loc5_ = _loc3_ >>> 24;
               if((_loc5_ >> 30 & 1) != _loc5_ >>> 31)
               {
                  Boot.§_-tp§ = new Error();
                  throw "Overflow " + _loc5_;
               }
               §§pop().writeByte(_loc5_);
         }
      }
      
      public function §_-c1O§(param1:§_-eu§) : void
      {
         var _loc3_:* = null as §_-g1n§;
         var _loc4_:* = null as String;
         var _loc5_:* = null as §_-eu§;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as §_-eu§;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as §_-eu§;
         var _loc11_:* = null;
         §_-j7§.b.writeByte(param1.index);
         var _temp_1:* = param1;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 0:
               _loc3_ = _loc2_[0];
               §_-hQ§(_loc3_);
               break;
            case 1:
               _loc4_ = _loc2_[0];
               §_-7l§(_loc4_);
               break;
            case 2:
               _loc4_ = _loc2_[0];
               _loc5_ = _loc2_[2];
               §_-7l§(_loc4_);
               if(_loc5_ == null)
               {
                  §_-j7§.b.writeByte(255);
               }
               else
               {
                  §_-c1O§(_loc5_);
               }
               break;
            case 3:
               _loc5_ = _loc2_[0];
               §_-c1O§(_loc5_);
               break;
            case 4:
               _loc6_ = _loc2_[0];
               §_-j7§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc5_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-c1O§(_loc5_);
               }
               break;
            case 5:
               _loc5_ = _loc2_[0];
               _loc4_ = _loc2_[1];
               §_-c1O§(_loc5_);
               §_-7l§(_loc4_);
               break;
            case 6:
               _loc4_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               _loc8_ = _loc2_[2];
               §_-7l§(_loc4_);
               §_-c1O§(_loc5_);
               §_-c1O§(_loc8_);
               break;
            case 7:
               _loc4_ = _loc2_[0];
               _loc9_ = Boolean(_loc2_[1]);
               _loc5_ = _loc2_[2];
               §_-7l§(_loc4_);
               §_-j7§.b.writeByte(_loc9_ ? 1 : 0);
               §_-c1O§(_loc5_);
               break;
            case 8:
               _loc5_ = _loc2_[0];
               _loc6_ = _loc2_[1];
               §_-c1O§(_loc5_);
               §_-j7§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc8_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-c1O§(_loc8_);
               }
               break;
            case 9:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               _loc10_ = _loc2_[2];
               §_-c1O§(_loc5_);
               §_-c1O§(_loc8_);
               if(_loc10_ == null)
               {
                  §_-j7§.b.writeByte(255);
               }
               else
               {
                  §_-c1O§(_loc10_);
               }
               break;
            case 10:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               §_-c1O§(_loc5_);
               §_-c1O§(_loc8_);
               break;
            case 11:
               _loc4_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               _loc8_ = _loc2_[2];
               §_-7l§(_loc4_);
               §_-c1O§(_loc5_);
               §_-c1O§(_loc8_);
               break;
            case 12:
            case 13:
               break;
            case 14:
               _loc6_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               _loc4_ = _loc2_[2];
               §_-j7§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc11_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-7l§(_loc11_.name);
               }
               §_-c1O§(_loc5_);
               §_-7l§(_loc4_ == null ? "" : _loc4_);
               break;
            case 15:
               _loc5_ = _loc2_[0];
               if(_loc5_ == null)
               {
                  §_-j7§.b.writeByte(255);
               }
               else
               {
                  §_-c1O§(_loc5_);
               }
               break;
            case 16:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               §_-c1O§(_loc5_);
               §_-c1O§(_loc8_);
               break;
            case 17:
               _loc6_ = _loc2_[0];
               if(int(_loc6_.length) >= 255)
               {
                  Boot.§_-tp§ = new Error();
                  throw "assert";
               }
               §_-j7§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc5_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-c1O§(_loc5_);
               }
               break;
            case 18:
               _loc4_ = _loc2_[0];
               _loc6_ = _loc2_[1];
               §_-7l§(_loc4_);
               §_-j7§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc5_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-c1O§(_loc5_);
               }
               break;
            case 19:
               _loc5_ = _loc2_[0];
               §_-c1O§(_loc5_);
               break;
            case 20:
               _loc5_ = _loc2_[0];
               _loc4_ = _loc2_[1];
               _loc8_ = _loc2_[3];
               §_-c1O§(_loc5_);
               §_-7l§(_loc4_);
               §_-c1O§(_loc8_);
               break;
            case 21:
               _loc6_ = _loc2_[0];
               §_-j7§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc11_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-7l§(_loc11_.name);
                  §_-c1O§(_loc11_.e);
               }
               break;
            case 22:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               _loc10_ = _loc2_[2];
               §_-c1O§(_loc5_);
               §_-c1O§(_loc8_);
               §_-c1O§(_loc10_);
         }
      }
      
      public function §_-kY§() : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as String;
         var _temp_2:* = §_-02W§.b;
         §_-y25§ = (_loc2_ = §_-y25§) + 1;
         var _loc1_:int = int(_temp_2[_loc2_]);
         if(_loc1_ == 0)
         {
            _loc2_ = int(§_-02W§.b[§_-y25§]);
            _loc3_ = §_-02W§.§_-A5§(§_-y25§ + 1,_loc2_);
            §_-y25§ += _loc2_ + 1;
            if(int(§_-I1x§.length) == 255)
            {
               §_-I1x§ = [null];
            }
            §_-I1x§.push(_loc3_);
            return _loc3_;
         }
         return §_-I1x§[_loc1_];
      }
      
      public function §_-3S§() : §_-g1n§
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _temp_2:* = §_-02W§.b;
         §_-y25§ = (_loc1_ = §_-y25§) + 1;
         switch(int(_temp_2[_loc1_]))
         {
            case 0:
               var _temp_5:* = §_-g1n§;
               var _temp_4:* = §_-02W§.b;
               §_-y25§ = (_loc1_ = §_-y25§) + 1;
               return _temp_5.CInt(int(_temp_4[_loc1_]));
            case 1:
               _loc1_ = int(§_-02W§.b[§_-y25§]) | int(§_-02W§.b[§_-y25§ + 1]) << 8 | int(§_-02W§.b[§_-y25§ + 2]) << 16 | int(§_-02W§.b[§_-y25§ + 3]) << 24;
               §_-y25§ += 4;
               return §_-g1n§.CInt(_loc1_);
            case 2:
               return §_-g1n§.CFloat(§_-630§.parseFloat(§_-kY§()));
            case 3:
               return §_-g1n§.CString(§_-kY§());
            case 4:
               _loc1_ = int(§_-02W§.b[§_-y25§]) | int(§_-02W§.b[§_-y25§ + 1]) << 8 | int(§_-02W§.b[§_-y25§ + 2]) << 16;
               _loc2_ = int(§_-02W§.b[§_-y25§ + 3]);
               §_-y25§ += 4;
               return §_-g1n§.CInt32(_loc1_ | _loc2_ << 24);
            default:
               Boot.§_-tp§ = new Error();
               throw "Invalid code " + int(§_-02W§.b[§_-y25§ - 1]);
         }
      }
      
      public function §_-Dx§() : §_-eu§
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as String;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null as §_-eu§;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as §_-eu§;
         var _temp_2:* = §_-02W§.b;
         §_-y25§ = (_loc1_ = §_-y25§) + 1;
         switch(int(_temp_2[_loc1_]))
         {
            case 0:
               return §_-eu§.EConst(§_-3S§());
            case 1:
               return §_-eu§.EIdent(§_-kY§());
            case 2:
               _loc2_ = §_-kY§();
               return §_-eu§.EVar(_loc2_,null,§_-Dx§());
            case 3:
               return §_-eu§.EParent(§_-Dx§());
            case 4:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_4:* = §_-02W§.b;
               §_-y25§ = (_loc5_ = §_-y25§) + 1;
               _loc4_ = int(_temp_4[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-Dx§());
               }
               return §_-eu§.EBlock(_loc3_);
            case 5:
               _loc6_ = §_-Dx§();
               return §_-eu§.EField(_loc6_,§_-kY§());
            case 6:
               _loc2_ = §_-kY§();
               _loc6_ = §_-Dx§();
               return §_-eu§.EBinop(_loc2_,_loc6_,§_-Dx§());
            case 7:
               _loc2_ = §_-kY§();
               var _temp_6:* = §_-02W§.b;
               §_-y25§ = (_loc1_ = §_-y25§) + 1;
               _loc7_ = int(_temp_6[_loc1_]) != 0;
               return §_-eu§.EUnop(_loc2_,_loc7_,§_-Dx§());
            case 8:
               _loc6_ = §_-Dx§();
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_8:* = §_-02W§.b;
               §_-y25§ = (_loc5_ = §_-y25§) + 1;
               _loc4_ = int(_temp_8[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-Dx§());
               }
               return §_-eu§.ECall(_loc6_,_loc3_);
            case 9:
               _loc6_ = §_-Dx§();
               _loc8_ = §_-Dx§();
               return §_-eu§.EIf(_loc6_,_loc8_,§_-Dx§());
            case 10:
               _loc6_ = §_-Dx§();
               return §_-eu§.EWhile(_loc6_,§_-Dx§());
            case 11:
               _loc2_ = §_-kY§();
               _loc6_ = §_-Dx§();
               return §_-eu§.EFor(_loc2_,_loc6_,§_-Dx§());
            case 12:
               return §_-eu§.EBreak;
            case 13:
               return §_-eu§.EContinue;
            case 14:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_10:* = §_-02W§.b;
               §_-y25§ = (_loc5_ = §_-y25§) + 1;
               _loc4_ = int(_temp_10[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push({
                     "name":§_-kY§(),
                     "t":null
                  });
               }
               _loc6_ = §_-Dx§();
               _loc2_ = §_-kY§();
               return §_-eu§.EFunction(_loc3_,_loc6_,_loc2_ == "" ? null : _loc2_);
            case 15:
               return §_-eu§.EReturn(§_-Dx§());
            case 16:
               _loc6_ = §_-Dx§();
               return §_-eu§.EArray(_loc6_,§_-Dx§());
            case 17:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_12:* = §_-02W§.b;
               §_-y25§ = (_loc5_ = §_-y25§) + 1;
               _loc4_ = int(_temp_12[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-Dx§());
               }
               return §_-eu§.EArrayDecl(_loc3_);
            case 18:
               _loc2_ = §_-kY§();
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_14:* = §_-02W§.b;
               §_-y25§ = (_loc5_ = §_-y25§) + 1;
               _loc4_ = int(_temp_14[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-Dx§());
               }
               return §_-eu§.ENew(_loc2_,_loc3_);
            case 19:
               return §_-eu§.EThrow(§_-Dx§());
            case 20:
               _loc6_ = §_-Dx§();
               _loc2_ = §_-kY§();
               return §_-eu§.ETry(_loc6_,_loc2_,null,§_-Dx§());
            case 21:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_16:* = §_-02W§.b;
               §_-y25§ = (_loc5_ = §_-y25§) + 1;
               _loc4_ = int(_temp_16[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc2_ = §_-kY§();
                  _loc6_ = §_-Dx§();
                  _loc3_.push({
                     "name":_loc2_,
                     "e":_loc6_
                  });
               }
               return §_-eu§.EObject(_loc3_);
            case 255:
               return null;
            default:
               Boot.§_-tp§ = new Error();
               throw "Invalid code " + int(§_-02W§.b[§_-y25§ - 1]);
         }
      }
   }
}

