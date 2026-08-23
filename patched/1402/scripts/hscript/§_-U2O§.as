package hscript
{
   import §_-x2C§.§_-23v§;
   import §_-x2C§.§_-U2O§;
   import flash.Boot;
   
   public class §_-U2O§
   {
      
      public var §_-62d§:Array;
      
      public var §_-w2F§:int;
      
      public var §_-G1N§:int;
      
      public var §_-p1b§:§_-WD§;
      
      public var §_-U1H§:§_-23v§;
      
      public var §_-GA§:§_-x2C§.§_-U2O§;
      
      public function §_-U2O§(param1:§_-x2C§.§_-U2O§ = undefined)
      {
         if(Boot.§_-PC§)
         {
            return;
         }
         §_-GA§ = param1;
         §_-w2F§ = 0;
         §_-U1H§ = new §_-23v§();
         §_-p1b§ = new §_-WD§();
         §_-62d§ = [null];
         §_-G1N§ = 1;
      }
      
      public static function encode(param1:§_-52O§) : §_-x2C§.§_-U2O§
      {
         var _loc2_:hscript.§_-U2O§ = new hscript.§_-U2O§();
         _loc2_.§_-P1U§(param1);
         return _loc2_.§_-U1H§.§_-eK§();
      }
      
      public static function §_-Y2a§(param1:§_-x2C§.§_-U2O§) : §_-52O§
      {
         var _loc2_:hscript.§_-U2O§ = new hscript.§_-U2O§(param1);
         return _loc2_.§_-kN§();
      }
      
      public function §_-HN§(param1:String) : void
      {
         var _loc3_:* = null as §_-x2C§.§_-U2O§;
         var _loc4_:int = 0;
         var _loc2_:* = §_-p1b§.get(param1);
         if(_loc2_ == null)
         {
            if(§_-G1N§ == 256)
            {
               §_-p1b§ = new §_-WD§();
               §_-G1N§ = 1;
            }
            §_-p1b§.set(param1,§_-G1N§);
            §_-U1H§.b.writeByte(0);
            _loc3_ = §_-x2C§.§_-U2O§.ofString(param1);
            §_-U1H§.b.writeByte(_loc3_.length);
            §_-U1H§.b.writeBytes(_loc3_.b);
            ++§_-G1N§;
         }
         else
         {
            _loc4_ = _loc2_;
            §_-U1H§.b.writeByte(_loc4_);
         }
      }
      
      public function §_-n2C§(param1:§_-92J§) : void
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
                  §_-U1H§.b.writeByte(0);
                  §_-U1H§.b.writeByte(_loc3_);
               }
               else
               {
                  §_-U1H§.b.writeByte(1);
                  §_-U1H§.b.writeByte(_loc3_ & 0xFF);
                  §_-U1H§.b.writeByte(_loc3_ >> 8 & 0xFF);
                  §_-U1H§.b.writeByte(_loc3_ >> 16 & 0xFF);
                  §_-U1H§.b.writeByte(_loc3_ >>> 24);
               }
               break;
            case 1:
               _loc6_ = Number(_loc2_[0]);
               §_-U1H§.b.writeByte(2);
               §_-HN§(§_-Mk§.string(_loc6_));
               break;
            case 2:
               _loc7_ = _loc2_[0];
               §_-U1H§.b.writeByte(3);
               §_-HN§(_loc7_);
               break;
            case 3:
               _loc3_ = int(_loc2_[0]);
               §_-U1H§.b.writeByte(4);
               _loc5_ = _loc3_ & 0xFFFFFF;
               if((_loc5_ >> 30 & 1) != _loc5_ >>> 31)
               {
                  Boot.§_-B2g§ = new Error();
                  throw "Overflow " + _loc5_;
               }
               _loc4_ = _loc5_;
               §_-U1H§.b.writeByte(_loc4_ & 0xFF);
               §_-U1H§.b.writeByte(_loc4_ >> 8 & 0xFF);
               §_-U1H§.b.writeByte(_loc4_ >> 16);
               §§push(§_-U1H§.b);
               _loc5_ = _loc3_ >>> 24;
               if((_loc5_ >> 30 & 1) != _loc5_ >>> 31)
               {
                  Boot.§_-B2g§ = new Error();
                  throw "Overflow " + _loc5_;
               }
               §§pop().writeByte(_loc5_);
         }
      }
      
      public function §_-P1U§(param1:§_-52O§) : void
      {
         var _loc3_:* = null as §_-92J§;
         var _loc4_:* = null as String;
         var _loc5_:* = null as §_-52O§;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as §_-52O§;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as §_-52O§;
         var _loc11_:* = null;
         §_-U1H§.b.writeByte(param1.index);
         var _temp_1:* = param1;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 0:
               _loc3_ = _loc2_[0];
               §_-n2C§(_loc3_);
               break;
            case 1:
               _loc4_ = _loc2_[0];
               §_-HN§(_loc4_);
               break;
            case 2:
               _loc4_ = _loc2_[0];
               _loc5_ = _loc2_[2];
               §_-HN§(_loc4_);
               if(_loc5_ == null)
               {
                  §_-U1H§.b.writeByte(255);
               }
               else
               {
                  §_-P1U§(_loc5_);
               }
               break;
            case 3:
               _loc5_ = _loc2_[0];
               §_-P1U§(_loc5_);
               break;
            case 4:
               _loc6_ = _loc2_[0];
               §_-U1H§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc5_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-P1U§(_loc5_);
               }
               break;
            case 5:
               _loc5_ = _loc2_[0];
               _loc4_ = _loc2_[1];
               §_-P1U§(_loc5_);
               §_-HN§(_loc4_);
               break;
            case 6:
               _loc4_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               _loc8_ = _loc2_[2];
               §_-HN§(_loc4_);
               §_-P1U§(_loc5_);
               §_-P1U§(_loc8_);
               break;
            case 7:
               _loc4_ = _loc2_[0];
               _loc9_ = Boolean(_loc2_[1]);
               _loc5_ = _loc2_[2];
               §_-HN§(_loc4_);
               §_-U1H§.b.writeByte(_loc9_ ? 1 : 0);
               §_-P1U§(_loc5_);
               break;
            case 8:
               _loc5_ = _loc2_[0];
               _loc6_ = _loc2_[1];
               §_-P1U§(_loc5_);
               §_-U1H§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc8_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-P1U§(_loc8_);
               }
               break;
            case 9:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               _loc10_ = _loc2_[2];
               §_-P1U§(_loc5_);
               §_-P1U§(_loc8_);
               if(_loc10_ == null)
               {
                  §_-U1H§.b.writeByte(255);
               }
               else
               {
                  §_-P1U§(_loc10_);
               }
               break;
            case 10:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               §_-P1U§(_loc5_);
               §_-P1U§(_loc8_);
               break;
            case 11:
               _loc4_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               _loc8_ = _loc2_[2];
               §_-HN§(_loc4_);
               §_-P1U§(_loc5_);
               §_-P1U§(_loc8_);
               break;
            case 12:
            case 13:
               break;
            case 14:
               _loc6_ = _loc2_[0];
               _loc5_ = _loc2_[1];
               _loc4_ = _loc2_[2];
               §_-U1H§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc11_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-HN§(_loc11_.name);
               }
               §_-P1U§(_loc5_);
               §_-HN§(_loc4_ == null ? "" : _loc4_);
               break;
            case 15:
               _loc5_ = _loc2_[0];
               if(_loc5_ == null)
               {
                  §_-U1H§.b.writeByte(255);
               }
               else
               {
                  §_-P1U§(_loc5_);
               }
               break;
            case 16:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               §_-P1U§(_loc5_);
               §_-P1U§(_loc8_);
               break;
            case 17:
               _loc6_ = _loc2_[0];
               if(int(_loc6_.length) >= 255)
               {
                  Boot.§_-B2g§ = new Error();
                  throw "assert";
               }
               §_-U1H§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc5_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-P1U§(_loc5_);
               }
               break;
            case 18:
               _loc4_ = _loc2_[0];
               _loc6_ = _loc2_[1];
               §_-HN§(_loc4_);
               §_-U1H§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc5_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-P1U§(_loc5_);
               }
               break;
            case 19:
               _loc5_ = _loc2_[0];
               §_-P1U§(_loc5_);
               break;
            case 20:
               _loc5_ = _loc2_[0];
               _loc4_ = _loc2_[1];
               _loc8_ = _loc2_[3];
               §_-P1U§(_loc5_);
               §_-HN§(_loc4_);
               §_-P1U§(_loc8_);
               break;
            case 21:
               _loc6_ = _loc2_[0];
               §_-U1H§.b.writeByte(int(_loc6_.length));
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc11_ = _loc6_[_loc7_];
                  _loc7_++;
                  §_-HN§(_loc11_.name);
                  §_-P1U§(_loc11_.e);
               }
               break;
            case 22:
               _loc5_ = _loc2_[0];
               _loc8_ = _loc2_[1];
               _loc10_ = _loc2_[2];
               §_-P1U§(_loc5_);
               §_-P1U§(_loc8_);
               §_-P1U§(_loc10_);
         }
      }
      
      public function §_-e8§() : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as String;
         var _temp_2:* = §_-GA§.b;
         §_-w2F§ = (_loc2_ = §_-w2F§) + 1;
         var _loc1_:int = int(_temp_2[_loc2_]);
         if(_loc1_ == 0)
         {
            _loc2_ = int(§_-GA§.b[§_-w2F§]);
            _loc3_ = §_-GA§.§_-M2r§(§_-w2F§ + 1,_loc2_);
            §_-w2F§ += _loc2_ + 1;
            if(int(§_-62d§.length) == 255)
            {
               §_-62d§ = [null];
            }
            §_-62d§.push(_loc3_);
            return _loc3_;
         }
         return §_-62d§[_loc1_];
      }
      
      public function §_-225§() : §_-92J§
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _temp_2:* = §_-GA§.b;
         §_-w2F§ = (_loc1_ = §_-w2F§) + 1;
         switch(int(_temp_2[_loc1_]))
         {
            case 0:
               var _temp_5:* = §_-92J§;
               var _temp_4:* = §_-GA§.b;
               §_-w2F§ = (_loc1_ = §_-w2F§) + 1;
               return _temp_5.CInt(int(_temp_4[_loc1_]));
            case 1:
               _loc1_ = int(§_-GA§.b[§_-w2F§]) | int(§_-GA§.b[§_-w2F§ + 1]) << 8 | int(§_-GA§.b[§_-w2F§ + 2]) << 16 | int(§_-GA§.b[§_-w2F§ + 3]) << 24;
               §_-w2F§ += 4;
               return §_-92J§.CInt(_loc1_);
            case 2:
               return §_-92J§.CFloat(§_-Mk§.parseFloat(§_-e8§()));
            case 3:
               return §_-92J§.CString(§_-e8§());
            case 4:
               _loc1_ = int(§_-GA§.b[§_-w2F§]) | int(§_-GA§.b[§_-w2F§ + 1]) << 8 | int(§_-GA§.b[§_-w2F§ + 2]) << 16;
               _loc2_ = int(§_-GA§.b[§_-w2F§ + 3]);
               §_-w2F§ += 4;
               return §_-92J§.CInt32(_loc1_ | _loc2_ << 24);
            default:
               Boot.§_-B2g§ = new Error();
               throw "Invalid code " + int(§_-GA§.b[§_-w2F§ - 1]);
         }
      }
      
      public function §_-kN§() : §_-52O§
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as String;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null as §_-52O§;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as §_-52O§;
         var _temp_2:* = §_-GA§.b;
         §_-w2F§ = (_loc1_ = §_-w2F§) + 1;
         switch(int(_temp_2[_loc1_]))
         {
            case 0:
               return §_-52O§.EConst(§_-225§());
            case 1:
               return §_-52O§.EIdent(§_-e8§());
            case 2:
               _loc2_ = §_-e8§();
               return §_-52O§.EVar(_loc2_,null,§_-kN§());
            case 3:
               return §_-52O§.EParent(§_-kN§());
            case 4:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_4:* = §_-GA§.b;
               §_-w2F§ = (_loc5_ = §_-w2F§) + 1;
               _loc4_ = int(_temp_4[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-kN§());
               }
               return §_-52O§.EBlock(_loc3_);
            case 5:
               _loc6_ = §_-kN§();
               return §_-52O§.EField(_loc6_,§_-e8§());
            case 6:
               _loc2_ = §_-e8§();
               _loc6_ = §_-kN§();
               return §_-52O§.EBinop(_loc2_,_loc6_,§_-kN§());
            case 7:
               _loc2_ = §_-e8§();
               var _temp_6:* = §_-GA§.b;
               §_-w2F§ = (_loc1_ = §_-w2F§) + 1;
               _loc7_ = int(_temp_6[_loc1_]) != 0;
               return §_-52O§.EUnop(_loc2_,_loc7_,§_-kN§());
            case 8:
               _loc6_ = §_-kN§();
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_8:* = §_-GA§.b;
               §_-w2F§ = (_loc5_ = §_-w2F§) + 1;
               _loc4_ = int(_temp_8[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-kN§());
               }
               return §_-52O§.ECall(_loc6_,_loc3_);
            case 9:
               _loc6_ = §_-kN§();
               _loc8_ = §_-kN§();
               return §_-52O§.EIf(_loc6_,_loc8_,§_-kN§());
            case 10:
               _loc6_ = §_-kN§();
               return §_-52O§.EWhile(_loc6_,§_-kN§());
            case 11:
               _loc2_ = §_-e8§();
               _loc6_ = §_-kN§();
               return §_-52O§.EFor(_loc2_,_loc6_,§_-kN§());
            case 12:
               return §_-52O§.EBreak;
            case 13:
               return §_-52O§.EContinue;
            case 14:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_10:* = §_-GA§.b;
               §_-w2F§ = (_loc5_ = §_-w2F§) + 1;
               _loc4_ = int(_temp_10[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push({
                     "name":§_-e8§(),
                     "t":null
                  });
               }
               _loc6_ = §_-kN§();
               _loc2_ = §_-e8§();
               return §_-52O§.EFunction(_loc3_,_loc6_,_loc2_ == "" ? null : _loc2_);
            case 15:
               return §_-52O§.EReturn(§_-kN§());
            case 16:
               _loc6_ = §_-kN§();
               return §_-52O§.EArray(_loc6_,§_-kN§());
            case 17:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_12:* = §_-GA§.b;
               §_-w2F§ = (_loc5_ = §_-w2F§) + 1;
               _loc4_ = int(_temp_12[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-kN§());
               }
               return §_-52O§.EArrayDecl(_loc3_);
            case 18:
               _loc2_ = §_-e8§();
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_14:* = §_-GA§.b;
               §_-w2F§ = (_loc5_ = §_-w2F§) + 1;
               _loc4_ = int(_temp_14[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc3_.push(§_-kN§());
               }
               return §_-52O§.ENew(_loc2_,_loc3_);
            case 19:
               return §_-52O§.EThrow(§_-kN§());
            case 20:
               _loc6_ = §_-kN§();
               _loc2_ = §_-e8§();
               return §_-52O§.ETry(_loc6_,_loc2_,null,§_-kN§());
            case 21:
               _loc3_ = [];
               _loc1_ = 0;
               var _temp_16:* = §_-GA§.b;
               §_-w2F§ = (_loc5_ = §_-w2F§) + 1;
               _loc4_ = int(_temp_16[_loc5_]);
               while(_loc1_ < _loc4_)
               {
                  _loc5_ = _loc1_++;
                  _loc2_ = §_-e8§();
                  _loc6_ = §_-kN§();
                  _loc3_.push({
                     "name":_loc2_,
                     "e":_loc6_
                  });
               }
               return §_-52O§.EObject(_loc3_);
            case 255:
               return null;
            default:
               Boot.§_-B2g§ = new Error();
               throw "Invalid code " + int(§_-GA§.b[§_-w2F§ - 1]);
         }
      }
   }
}

