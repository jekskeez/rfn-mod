package hscript
{
   import §_-735§.§_-4k§;
   import §_-735§.§_-i2n§;
   import §_-x2C§.§_-B3m§;
   import §_-x2C§.§_-J2Z§;
   import §_-x2C§.§_-U2O§;
   import §_-x2C§.§_-dl§;
   import flash.Boot;
   
   public class §_-Q2N§
   {
      
      public static var §_-92d§:int = 0;
      
      public static var §_-f2w§:int = 0;
      
      public static var §_-720§:int = 0;
      
      public static var §_-t26§:int = 0;
      
      public var §_-wU§:§_-WD§;
      
      public var §_-V1q§:§_-4k§;
      
      public var §_-yh§:Array;
      
      public var §_-B3r§:§_-WD§;
      
      public var §_-O1H§:§_-WD§;
      
      public var §_-S20§:String;
      
      public var §_-t0§:int;
      
      public var input:§_-B3m§;
      
      public var §_-y15§:Array;
      
      public var §_-w2S§:String;
      
      public var char:int;
      
      public var §_-HK§:Boolean;
      
      public var §_-l2s§:Boolean;
      
      public function §_-Q2N§()
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         if(Boot.§_-PC§)
         {
            return;
         }
         §_-t0§ = 1;
         §_-S20§ = "+*/-=!><&|^%~";
         §_-w2S§ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
         var _loc1_:Array = [["%"],["*","/"],["+","-"],["<<",">>",">>>"],["|","&","^"],["==","!=",">","<",">=","<="],["..."],["&&"],["||"],["=","+=","-=","*=","/=","%=","<<=",">>=",">>>=","|=","&=","^="]];
         §_-O1H§ = new §_-WD§();
         §_-B3r§ = new §_-WD§();
         var _loc2_:int = 0;
         var _loc3_:int = int(_loc1_.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc5_ = 0;
            _loc6_ = _loc1_[_loc4_];
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               §_-O1H§.set(_loc7_,_loc4_);
               if(_loc4_ == 9)
               {
                  §_-B3r§.set(_loc7_,true);
               }
            }
         }
         §_-wU§ = new §_-WD§();
         _loc2_ = 0;
         _loc6_ = ["!","++","--","-","~"];
         while(_loc2_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc2_];
            _loc2_++;
            §_-wU§.set(_loc7_,_loc7_ == "++" || _loc7_ == "--");
         }
      }
      
      public function §_-C1S§(param1:Token) : *
      {
         Boot.§_-B2g§ = new Error();
         throw hscript.Error.EUnexpected(§_-x4§(param1));
      }
      
      public function §_-x4§(param1:Token) : String
      {
         var _loc3_:* = null as §_-92J§;
         var _loc4_:* = null as String;
         var _temp_1:* = param1;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 0:
               return "<eof>";
            case 1:
               _loc3_ = _loc2_[0];
               return §_-k1V§(_loc3_);
            case 2:
               _loc4_ = _loc2_[0];
               return _loc4_;
            case 3:
               _loc4_ = _loc2_[0];
               return _loc4_;
            case 4:
               return "(";
            case 5:
               return ")";
            case 6:
               return "{";
            case 7:
               return "}";
            case 8:
               return ".";
            case 9:
               return ",";
            case 10:
               return ";";
            case 11:
               return "[";
            case 12:
               return "]";
            case 13:
               return "?";
            case 14:
               return ":";
            default:
               return null;
         }
      }
      
      public function §_-Z1Q§(param1:String, param2:int) : Token
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = param1.charCodeAt(1);
         var _loc5_:§_-B3m§ = input;
         if(_loc4_ != 47)
         {
            if(_loc4_ == 42)
            {
               _loc7_ = §_-t0§;
               try
               {
                  do
                  {
                     while(param2 != 42)
                     {
                        if(param2 == 10)
                        {
                           ++§_-t0§;
                        }
                        null;
                        param2 = _loc5_.readByte();
                     }
                     null;
                     param2 = _loc5_.readByte();
                  }
                  while(param2 != 47);
               }
               catch(_loc_e_:*)
               {
                  §_-t0§ = _loc7_;
                  Boot.§_-B2g§ = new Error();
                  throw hscript.Error.EUnterminatedComment;
               }
               return token();
            }
            char = param2;
            return Token.TOp(param1);
         }
         try
         {
            while(param2 != 10 && param2 != 13)
            {
               null;
               param2 = _loc5_.readByte();
            }
            char = param2;
         }
         catch(_loc_e_:*)
         {
            return token();
         }
      }
      
      public function token() : Token
      {
         var _loc2_:* = null as §_-4k§;
         var _loc3_:* = null as §_-i2n§;
         var _loc4_:int = 0;
         var _loc5_:* = null as String;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = 0;
         var _loc9_:* = null as §_-92J§;
         var _loc10_:* = null;
         var _loc11_:* = 0;
         if(§_-V1q§.§_-T2M§ != null)
         {
            _loc2_ = §_-V1q§;
            _loc3_ = _loc2_.§_-T2M§;
            return _loc3_ == null ? null : (_loc2_.§_-T2M§ = _loc3_.next,_loc3_.§_-uw§);
         }
         if(char < 0)
         {
            _loc4_ = §_-S2D§();
         }
         else
         {
            _loc4_ = char;
            char = -1;
         }
         loop0:
         while(true)
         {
            switch(_loc4_)
            {
               case 0:
                  break loop0;
               case 9:
               case 13:
               case 32:
                  break;
               case 10:
                  ++§_-t0§;
                  break;
               case 34:
                  return Token.TConst(§_-92J§.CString(§_-M2r§(34)));
               case 39:
                  return Token.TConst(§_-92J§.CString(§_-M2r§(39)));
               case 40:
                  return Token.TPOpen;
               case 41:
                  return Token.TPClose;
               case 44:
                  return Token.TComma;
               case 46:
                  _loc4_ = §_-S2D§();
                  switch(_loc4_)
                  {
                     case 46:
                        _loc4_ = §_-S2D§();
                        if(_loc4_ != 46)
                        {
                           §_-c2A§(_loc4_);
                        }
                        return Token.TOp("...");
                     case 48:
                     case 49:
                     case 50:
                     case 51:
                     case 52:
                     case 53:
                     case 54:
                     case 55:
                     case 56:
                     case 57:
                        _loc8_ = _loc4_ - 48;
                        _loc11_ = 1;
                        loop3:
                        while(true)
                        {
                           _loc4_ = §_-S2D§();
                           _loc11_ *= 10;
                           switch(_loc4_)
                           {
                              case 48:
                              case 49:
                              case 50:
                              case 51:
                              case 52:
                              case 53:
                              case 54:
                              case 55:
                              case 56:
                              case 57:
                                 break;
                              default:
                                 break loop3;
                           }
                           _loc8_ = _loc8_ * 10 + (_loc4_ - 48);
                        }
                        char = _loc4_;
                        return Token.TConst(§_-92J§.CFloat(_loc8_ / _loc11_));
                     default:
                        char = _loc4_;
                        return Token.TDot;
                  }
                  break;
               case 48:
               case 49:
               case 50:
               case 51:
               case 52:
               case 53:
               case 54:
               case 55:
               case 56:
               case 57:
                  _loc6_ = (_loc4_ - 48) * 1;
                  _loc7_ = 0;
                  loop1:
                  while(true)
                  {
                     _loc4_ = §_-S2D§();
                     _loc7_ *= 10;
                     switch(_loc4_)
                     {
                        case 46:
                           if(_loc7_ > 0)
                           {
                              if(_loc7_ == 10 && §_-S2D§() == 46)
                              {
                                 _loc2_ = §_-V1q§;
                                 _loc2_.§_-T2M§ = new §_-i2n§(Token.TOp("..."),_loc2_.§_-T2M§);
                                 _loc8_ = int(_loc6_);
                                 return Token.TConst(_loc8_ == _loc6_ ? §_-92J§.CInt(_loc8_) : §_-92J§.CFloat(_loc6_));
                              }
                              §_-c2A§(_loc4_);
                           }
                           _loc7_ = 1;
                           break;
                        case 48:
                        case 49:
                        case 50:
                        case 51:
                        case 52:
                        case 53:
                        case 54:
                        case 55:
                        case 56:
                        case 57:
                           _loc6_ = _loc6_ * 10 + (_loc4_ - 48);
                           break;
                        case 120:
                           if(_loc6_ > 0 || _loc7_ > 0)
                           {
                              §_-c2A§(_loc4_);
                           }
                           _loc8_ = 0;
                           loop5:
                           while(true)
                           {
                              _loc4_ = §_-S2D§();
                              switch(_loc4_)
                              {
                                 case 48:
                                 case 49:
                                 case 50:
                                 case 51:
                                 case 52:
                                 case 53:
                                 case 54:
                                 case 55:
                                 case 56:
                                 case 57:
                                    _loc8_ = (_loc8_ << 4) + (_loc4_ - 48);
                                    break;
                                 case 65:
                                 case 66:
                                 case 67:
                                 case 68:
                                 case 69:
                                 case 70:
                                    _loc8_ = (_loc8_ << 4) + (_loc4_ - 55);
                                    break;
                                 case 97:
                                 case 98:
                                 case 99:
                                 case 100:
                                 case 101:
                                 case 102:
                                    _loc8_ = (_loc8_ << 4) + (_loc4_ - 87);
                                    break;
                                 default:
                                    break loop5;
                              }
                           }
                           char = _loc4_;
                           try
                           {
                              §§push(§_-92J§);
                              if((_loc8_ >> 30 & 1) != _loc8_ >>> 31)
                              {
                                 Boot.§_-B2g§ = new Error();
                                 throw "Overflow " + _loc8_;
                              }
                              §§push(§§pop().CInt(_loc8_));
                           }
                           catch(_loc_e_:*)
                           {
                              _loc9_ = §_-92J§.CInt32(_loc8_);
                              return Token.TConst(_loc9_);
                           }
                           break;
                        default:
                           break loop1;
                     }
                  }
                  char = _loc4_;
                  _loc8_ = int(_loc6_);
                  return Token.TConst(_loc7_ > 0 ? §_-92J§.CFloat(_loc6_ * 10 / _loc7_) : (_loc8_ == _loc6_ ? §_-92J§.CInt(_loc8_) : §_-92J§.CFloat(_loc6_)));
               case 58:
                  return Token.TDoubleDot;
               case 59:
                  return Token.TSemicolon;
               case 63:
                  return Token.TQuestion;
               case 91:
                  return Token.TBkOpen;
               case 93:
                  return Token.TBkClose;
               case 123:
                  return Token.TBrOpen;
               case 125:
                  return Token.TBrClose;
               default:
                  if(§_-yh§[_loc4_])
                  {
                     _loc5_ = String.fromCharCode(_loc4_);
                     while(true)
                     {
                        _loc4_ = §_-S2D§();
                        if(!§_-yh§[_loc4_])
                        {
                           break;
                        }
                        _loc5_ += String.fromCharCode(_loc4_);
                     }
                     if(_loc5_.charCodeAt(0) == 47)
                     {
                        return §_-Z1Q§(_loc5_,_loc4_);
                     }
                     char = _loc4_;
                     return Token.TOp(_loc5_);
                  }
                  if(§_-y15§[_loc4_])
                  {
                     _loc5_ = String.fromCharCode(_loc4_);
                     while(true)
                     {
                        _loc4_ = §_-S2D§();
                        if(!§_-y15§[_loc4_])
                        {
                           break;
                        }
                        _loc5_ += String.fromCharCode(_loc4_);
                     }
                     char = _loc4_;
                     return Token.TId(_loc5_);
                  }
                  §_-c2A§(_loc4_);
            }
            _loc4_ = §_-S2D§();
         }
         return Token.TEof;
      }
      
      public function §_-M2r§(param1:int) : String
      {
         var _loc8_:* = null;
         var _loc9_:* = null as String;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc3_:int = 0;
         var _loc4_:§_-J2Z§ = new §_-J2Z§();
         var _loc5_:Boolean = false;
         var _loc6_:int = §_-t0§;
         var _loc7_:§_-B3m§ = input;
         while(true)
         {
            try
            {
               null;
               _loc3_ = _loc7_.readByte();
            }
            catch(_loc_e_:*)
            {
               §_-t0§ = _loc6_;
               Boot.§_-B2g§ = new Error();
               throw hscript.Error.EUnterminatedString;
            }
            if(_loc5_)
            {
               _loc5_ = false;
               switch(_loc3_)
               {
                  case 34:
                  case 39:
                  case 92:
                     _loc4_.writeByte(_loc3_);
                     break;
                  case 47:
                     if(§_-l2s§)
                     {
                        _loc4_.writeByte(_loc3_);
                     }
                     else
                     {
                        §_-c2A§(_loc3_);
                     }
                     break;
                  case 110:
                     _loc4_.writeByte(10);
                     break;
                  case 114:
                     _loc4_.writeByte(13);
                     break;
                  case 116:
                     _loc4_.writeByte(9);
                     break;
                  case 117:
                     if(!§_-l2s§)
                     {
                        Boot.§_-B2g§ = new Error();
                        throw §_-c2A§(_loc3_);
                     }
                     _loc9_ = null;
                     try
                     {
                        null;
                        null;
                        null;
                        null;
                        _loc9_ = _loc7_.§_-M2r§(4);
                     }
                     catch(_loc_e_:*)
                     {
                        §_-t0§ = _loc6_;
                        Boot.§_-B2g§ = new Error();
                        throw hscript.Error.EUnterminatedString;
                     }
                     _loc10_ = 0;
                     _loc11_ = 0;
                     while(_loc11_ < 4)
                     {
                        _loc12_ = _loc11_++;
                        _loc10_ <<= 4;
                        _loc8_ = _loc9_.charCodeAt(_loc12_);
                        _loc13_ = _loc8_;
                        if(_loc13_ != 48)
                        {
                           if(_loc13_ != 49)
                           {
                              if(_loc13_ != 50)
                              {
                                 if(_loc13_ != 51)
                                 {
                                    if(_loc13_ != 52)
                                    {
                                       if(_loc13_ != 53)
                                       {
                                          if(_loc13_ != 54)
                                          {
                                             if(_loc13_ != 55)
                                             {
                                                if(_loc13_ != 56)
                                                {
                                                   if(_loc13_ != 57)
                                                   {
                                                      if(_loc13_ != 65)
                                                      {
                                                         if(_loc13_ != 66)
                                                         {
                                                            if(_loc13_ != 67)
                                                            {
                                                               if(_loc13_ != 68)
                                                               {
                                                                  if(_loc13_ != 69)
                                                                  {
                                                                     if(_loc13_ != 70)
                                                                     {
                                                                        if(_loc13_ != 97)
                                                                        {
                                                                           if(_loc13_ != 98)
                                                                           {
                                                                              if(_loc13_ != 99)
                                                                              {
                                                                                 if(_loc13_ != 100)
                                                                                 {
                                                                                    if(_loc13_ != 101)
                                                                                    {
                                                                                       if(_loc13_ != 102)
                                                                                       {
                                                                                          §_-c2A§(_loc8_);
                                                                                          continue;
                                                                                       }
                                                                                    }
                                                                                 }
                                                                              }
                                                                           }
                                                                        }
                                                                        _loc10_ += _loc8_ - 87;
                                                                        continue;
                                                                     }
                                                                  }
                                                               }
                                                            }
                                                         }
                                                      }
                                                      _loc10_ += _loc8_ - 55;
                                                      continue;
                                                   }
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                        }
                        _loc10_ += _loc8_ - 48;
                     }
                     if(_loc10_ <= 127)
                     {
                        _loc4_.writeByte(_loc10_);
                        break;
                     }
                     if(_loc10_ <= 2047)
                     {
                        _loc4_.writeByte(0xC0 | _loc10_ >> 6);
                        _loc4_.writeByte(0x80 | _loc10_ & 0x3F);
                        break;
                     }
                     _loc4_.writeByte(0xE0 | _loc10_ >> 12);
                     _loc4_.writeByte(0x80 | _loc10_ >> 6 & 0x3F);
                     _loc4_.writeByte(0x80 | _loc10_ & 0x3F);
                     break;
                  default:
                     §_-c2A§(_loc3_);
               }
            }
            else if(_loc3_ == 92)
            {
               _loc5_ = true;
            }
            else
            {
               if(_loc3_ == param1)
               {
                  break;
               }
               if(_loc3_ == 10)
               {
                  ++§_-t0§;
               }
               _loc4_.writeByte(_loc3_);
            }
         }
         return _loc4_.§_-eK§().toString();
      }
      
      public function §_-S2D§() : int
      {
         var _loc2_:* = null;
         null;
         try
         {
            §§push(input.readByte());
         }
         finally
         {
            return §§pop();
         }
      }
      
      public function push(param1:Token) : void
      {
         var _loc2_:§_-4k§ = §_-V1q§;
         _loc2_.§_-T2M§ = new §_-i2n§(param1,_loc2_.§_-T2M§);
      }
      
      public function §_-61o§(param1:§_-52O§) : int
      {
         return 0;
      }
      
      public function §_-q2E§(param1:§_-52O§) : int
      {
         return 0;
      }
      
      public function §_-K22§(param1:§_-F9§) : §_-F9§
      {
         var _loc4_:* = null as §_-4k§;
         var _loc5_:* = null as String;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as §_-F9§;
         var _loc2_:Token = token();
         var _temp_1:* = _loc2_;
         var _loc3_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 3:
               _loc5_ = _loc3_[0];
               if(_loc5_ != "->")
               {
                  _loc4_ = §_-V1q§;
                  _loc4_.§_-T2M§ = new §_-i2n§(_loc2_,_loc4_.§_-T2M§);
                  return param1;
               }
               var _loc6_:§_-F9§ = §_-m29§();
               var _temp_2:* = _loc6_;
               _loc3_ = _temp_2.params;
               switch(_temp_2.index)
               {
                  case 1:
                     _loc7_ = _loc3_[0];
                     _loc8_ = _loc3_[1];
                     _loc7_.unshift(param1);
                     return _loc6_;
                  default:
                     return §_-F9§.CTFun([param1],_loc6_);
               }
               break;
            default:
               _loc4_ = §_-V1q§;
               _loc4_.§_-T2M§ = new §_-i2n§(_loc2_,_loc4_.§_-T2M§);
               return param1;
         }
      }
      
      public function §_-m29§() : §_-F9§
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as §_-4k§;
         var _loc9_:* = null as Array;
         var _loc10_:* = null as String;
         var _loc11_:* = null as §_-F9§;
         var _loc12_:* = null as Token;
         var _loc1_:Token = token();
         var _temp_1:* = _loc1_;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 2:
               _loc3_ = _loc2_[0];
               _loc4_ = [_loc3_];
               while(true)
               {
                  _loc1_ = token();
                  if(_loc1_ != Token.TDot)
                  {
                     break;
                  }
                  _loc1_ = token();
                  var _temp_2:* = _loc1_;
                  _loc5_ = _temp_2.params;
                  switch(_temp_2.index)
                  {
                     case 2:
                        _loc6_ = _loc5_[0];
                        _loc4_.push(_loc6_);
                        break;
                     default:
                        §_-C1S§(_loc1_);
                  }
               }
               _loc5_ = null;
               var _temp_3:* = _loc1_;
               _loc7_ = _temp_3.params;
               switch(_temp_3.index)
               {
                  case 3:
                     _loc6_ = _loc7_[0];
                     if(_loc6_ == "<")
                     {
                        _loc5_ = [];
                        loop2:
                        while(true)
                        {
                           _loc5_.push(§_-m29§());
                           _loc1_ = token();
                           var _temp_4:* = _loc1_;
                           _loc9_ = _temp_4.params;
                           switch(_temp_4.index)
                           {
                              case 3:
                                 _loc10_ = _loc9_[0];
                                 if(_loc10_ == ">")
                                 {
                                    break loop2;
                                 }
                                 break;
                              case 9:
                           }
                           §_-C1S§(_loc1_);
                        }
                     }
                     break;
                  default:
                     _loc8_ = §_-V1q§;
                     _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
               }
               return §_-K22§(§_-F9§.CTPath(_loc4_,_loc5_));
            case 4:
               _loc11_ = §_-m29§();
               _loc12_ = token();
               if(_loc12_ != Token.TPClose)
               {
                  §_-C1S§(_loc12_);
               }
               return §_-K22§(§_-F9§.CTParent(_loc11_));
            case 6:
               _loc4_ = [];
               loop1:
               while(true)
               {
                  _loc1_ = token();
                  var _temp_5:* = _loc1_;
                  _loc5_ = _temp_5.params;
                  loop7:
                  switch(_temp_5.index)
                  {
                     case 2:
                        _loc3_ = _loc5_[0];
                        _loc12_ = token();
                        if(_loc12_ != Token.TDoubleDot)
                        {
                           §_-C1S§(_loc12_);
                        }
                        _loc4_.push({
                           "name":_loc3_,
                           "t":§_-m29§()
                        });
                        _loc1_ = token();
                        switch(_loc1_.index)
                        {
                           case 7:
                              §§goto(addr0305);
                           case 9:
                              break loop7;
                           default:
                              §_-C1S§(_loc1_);
                              break loop7;
                        }
                        break;
                     case 7:
                        break loop1;
                     default:
                        §_-C1S§(_loc1_);
                  }
               }
               addr0305:
               return §_-K22§(§_-F9§.CTAnon(_loc4_));
            default:
               return §_-C1S§(_loc1_);
         }
      }
      
      public function §_-w13§(param1:String) : §_-52O§
      {
         var _loc3_:* = null as §_-52O§;
         var _loc4_:* = null as §_-52O§;
         var _loc5_:* = null as §_-52O§;
         var _loc6_:Boolean = false;
         var _loc7_:* = null as Token;
         var _loc8_:* = null as §_-4k§;
         var _loc9_:* = null as String;
         var _loc10_:* = null as Array;
         var _loc11_:* = null as String;
         var _loc12_:* = null as §_-F9§;
         var _loc13_:* = null as Token;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc2_:String = param1;
         if(_loc2_ == "if")
         {
            _loc3_ = §_-y1T§();
            _loc4_ = §_-y1T§();
            _loc5_ = null;
            _loc6_ = false;
            _loc7_ = token();
            if(_loc7_ == Token.TSemicolon)
            {
               _loc6_ = true;
               _loc7_ = token();
            }
            if(Type.§_-v1x§(_loc7_,Token.TId("else")))
            {
               _loc5_ = §_-y1T§();
            }
            else
            {
               _loc8_ = §_-V1q§;
               _loc8_.§_-T2M§ = new §_-i2n§(_loc7_,_loc8_.§_-T2M§);
               if(_loc6_)
               {
                  _loc8_ = §_-V1q§;
                  _loc8_.§_-T2M§ = new §_-i2n§(Token.TSemicolon,_loc8_.§_-T2M§);
               }
            }
            return §_-52O§.EIf(_loc3_,_loc4_,_loc5_);
         }
         else if(_loc2_ == "var")
         {
            _loc7_ = token();
            _loc9_ = null;
            var _temp_1:* = _loc7_;
            _loc10_ = _temp_1.params;
            switch(_temp_1.index)
            {
               case 2:
                  _loc11_ = _loc10_[0];
                  _loc9_ = _loc11_;
                  break;
               default:
                  §_-C1S§(_loc7_);
            }
            _loc7_ = token();
            _loc12_ = null;
            if(_loc7_ == Token.TDoubleDot && §_-HK§)
            {
               _loc12_ = §_-m29§();
               _loc7_ = token();
            }
            _loc3_ = null;
            if(Type.§_-v1x§(_loc7_,Token.TOp("=")))
            {
               _loc3_ = §_-y1T§();
            }
            else
            {
               _loc8_ = §_-V1q§;
               _loc8_.§_-T2M§ = new §_-i2n§(_loc7_,_loc8_.§_-T2M§);
            }
            return §_-52O§.EVar(_loc9_,_loc12_,_loc3_);
         }
         else if(_loc2_ == "while")
         {
            _loc3_ = §_-y1T§();
            _loc4_ = §_-y1T§();
            return §_-52O§.EWhile(_loc3_,_loc4_);
         }
         else if(_loc2_ == "for")
         {
            _loc7_ = token();
            if(_loc7_ != Token.TPOpen)
            {
               §_-C1S§(_loc7_);
            }
            _loc7_ = token();
            _loc9_ = null;
            var _temp_2:* = _loc7_;
            _loc10_ = _temp_2.params;
            switch(_temp_2.index)
            {
               case 2:
                  _loc11_ = _loc10_[0];
                  _loc9_ = _loc11_;
                  break;
               default:
                  §_-C1S§(_loc7_);
            }
            _loc7_ = token();
            if(!Type.§_-v1x§(_loc7_,Token.TId("in")))
            {
               §_-C1S§(_loc7_);
            }
            _loc3_ = §_-y1T§();
            _loc13_ = token();
            if(_loc13_ != Token.TPClose)
            {
               §_-C1S§(_loc13_);
            }
            _loc4_ = §_-y1T§();
            return §_-52O§.EFor(_loc9_,_loc3_,_loc4_);
         }
         else if(_loc2_ == "break")
         {
            return §_-52O§.EBreak;
         }
         else if(_loc2_ == "continue")
         {
            return §_-52O§.EContinue;
         }
         else if(_loc2_ == "else")
         {
            return §_-C1S§(Token.TId(param1));
         }
         else if(_loc2_ == "function")
         {
            _loc7_ = token();
            _loc9_ = null;
            var _temp_3:* = _loc7_;
            _loc10_ = _temp_3.params;
            switch(_temp_3.index)
            {
               case 2:
                  _loc11_ = _loc10_[0];
                  _loc9_ = _loc11_;
                  break;
               default:
                  _loc8_ = §_-V1q§;
                  _loc8_.§_-T2M§ = new §_-i2n§(_loc7_,_loc8_.§_-T2M§);
            }
            _loc13_ = token();
            if(_loc13_ != Token.TPOpen)
            {
               §_-C1S§(_loc13_);
            }
            _loc10_ = [];
            _loc7_ = token();
            if(_loc7_ != Token.TPClose)
            {
               _loc6_ = true;
               while(_loc6_)
               {
                  _loc11_ = null;
                  var _temp_4:* = _loc7_;
                  _loc14_ = _temp_4.params;
                  switch(_temp_4.index)
                  {
                     case 2:
                        _loc15_ = _loc14_[0];
                        _loc11_ = _loc15_;
                        break;
                     default:
                        §_-C1S§(_loc7_);
                  }
                  _loc7_ = token();
                  _loc12_ = null;
                  if(_loc7_ == Token.TDoubleDot && §_-HK§)
                  {
                     _loc12_ = §_-m29§();
                     _loc7_ = token();
                  }
                  _loc10_.push({
                     "name":_loc11_,
                     "t":_loc12_
                  });
                  switch(_loc7_.index)
                  {
                     case 5:
                        _loc6_ = false;
                        break;
                     case 9:
                        _loc7_ = token();
                        break;
                     default:
                        §_-C1S§(_loc7_);
                  }
               }
            }
            _loc12_ = null;
            if(§_-HK§)
            {
               _loc7_ = token();
               if(_loc7_ != Token.TDoubleDot)
               {
                  _loc8_ = §_-V1q§;
                  _loc8_.§_-T2M§ = new §_-i2n§(_loc7_,_loc8_.§_-T2M§);
               }
               else
               {
                  _loc12_ = §_-m29§();
               }
            }
            _loc3_ = §_-y1T§();
            return §_-52O§.EFunction(_loc10_,_loc3_,_loc9_,_loc12_);
         }
         else if(_loc2_ == "return")
         {
            _loc7_ = token();
            _loc8_ = §_-V1q§;
            _loc8_.§_-T2M§ = new §_-i2n§(_loc7_,_loc8_.§_-T2M§);
            _loc3_ = _loc7_ == Token.TSemicolon ? null : §_-y1T§();
            return §_-52O§.EReturn(_loc3_);
         }
         else if(_loc2_ == "new")
         {
            _loc10_ = [];
            _loc7_ = token();
            var _temp_5:* = _loc7_;
            _loc14_ = _temp_5.params;
            switch(_temp_5.index)
            {
               case 2:
                  _loc9_ = _loc14_[0];
                  _loc10_.push(_loc9_);
                  break;
               default:
                  §_-C1S§(_loc7_);
            }
            _loc6_ = true;
            while(_loc6_)
            {
               _loc7_ = token();
               switch(_loc7_.index)
               {
                  case 4:
                     _loc6_ = false;
                     break;
                  case 8:
                     _loc7_ = token();
                     var _temp_6:* = _loc7_;
                     _loc16_ = _temp_6.params;
                     switch(_temp_6.index)
                     {
                        case 2:
                           _loc9_ = _loc16_[0];
                           _loc10_.push(_loc9_);
                           break;
                        default:
                           §_-C1S§(_loc7_);
                     }
                     break;
                  default:
                     §_-C1S§(_loc7_);
               }
            }
            _loc14_ = §_-yP§(Token.TPClose);
            return §_-52O§.ENew(_loc10_.join("."),_loc14_);
         }
         else if(_loc2_ == "throw")
         {
            _loc3_ = §_-y1T§();
            return §_-52O§.EThrow(_loc3_);
         }
         else if(_loc2_ == "try")
         {
            _loc3_ = §_-y1T§();
            _loc7_ = token();
            if(!Type.§_-v1x§(_loc7_,Token.TId("catch")))
            {
               §_-C1S§(_loc7_);
            }
            _loc13_ = token();
            if(_loc13_ != Token.TPOpen)
            {
               §_-C1S§(_loc13_);
            }
            _loc7_ = token();
            var _temp_7:* = _loc7_;
            _loc10_ = _temp_7.params;
            switch(_temp_7.index)
            {
               case 2:
                  _loc11_ = _loc10_[0];
                  §§push(_loc11_);
                  break;
               default:
                  §§push(§_-C1S§(_loc7_));
            }
            _loc9_ = §§pop();
            _loc13_ = token();
            if(_loc13_ != Token.TDoubleDot)
            {
               §_-C1S§(_loc13_);
            }
            _loc12_ = null;
            if(§_-HK§)
            {
               _loc12_ = §_-m29§();
            }
            else
            {
               _loc7_ = token();
               if(!Type.§_-v1x§(_loc7_,Token.TId("Dynamic")))
               {
                  §_-C1S§(_loc7_);
               }
            }
            _loc13_ = token();
            if(_loc13_ != Token.TPClose)
            {
               §_-C1S§(_loc13_);
            }
            _loc4_ = §_-y1T§();
            return §_-52O§.ETry(_loc3_,_loc9_,_loc12_,_loc4_);
         }
         else
         {
            return null;
         }
      }
      
      public function §_-wD§(param1:String) : §_-52O§
      {
         §_-t0§ = 1;
         return parse(new §_-dl§(param1));
      }
      
      public function §_-B2o§(param1:Object) : §_-52O§
      {
         var _loc3_:* = null as Token;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc7_:* = null as §_-92J§;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Token;
         var _loc2_:Array = [];
         loop0:
         while(true)
         {
            _loc3_ = token();
            _loc4_ = null;
            var _temp_1:* = _loc3_;
            _loc5_ = _temp_1.params;
            switch(_temp_1.index)
            {
               case 1:
                  _loc7_ = _loc5_[0];
                  if(!§_-l2s§)
                  {
                     §_-C1S§(_loc3_);
                  }
                  var _temp_2:* = _loc7_;
                  _loc8_ = _temp_2.params;
                  switch(_temp_2.index)
                  {
                     case 2:
                        _loc6_ = _loc8_[0];
                        _loc4_ = _loc6_;
                        break;
                     default:
                        §_-C1S§(_loc3_);
                  }
                  break;
               case 2:
                  _loc6_ = _loc5_[0];
                  _loc4_ = _loc6_;
                  break;
               case 7:
                  break loop0;
               default:
                  §_-C1S§(_loc3_);
            }
            _loc9_ = token();
            if(_loc9_ != Token.TDoubleDot)
            {
               §_-C1S§(_loc9_);
            }
            _loc2_.push({
               "name":_loc4_,
               "e":§_-y1T§()
            });
            _loc3_ = token();
            switch(_loc3_.index)
            {
               case 7:
                  §§goto(addr016a);
               default:
                  §_-C1S§(_loc3_);
                  break;
               case 9:
            }
         }
         addr016a:
         return §_-i25§(§_-52O§.EObject(_loc2_));
      }
      
      public function §_-fO§() : §_-52O§
      {
         var _loc3_:* = null as §_-4k§;
         var _loc1_:§_-52O§ = §_-y1T§();
         var _loc2_:Token = token();
         if(_loc2_ != Token.TSemicolon && _loc2_ != Token.TEof)
         {
            if(isBlock(_loc1_))
            {
               _loc3_ = §_-V1q§;
               _loc3_.§_-T2M§ = new §_-i2n§(_loc2_,_loc3_.§_-T2M§);
            }
            else
            {
               §_-C1S§(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function §_-i25§(param1:§_-52O§) : §_-52O§
      {
         var _loc4_:* = null as §_-4k§;
         var _loc5_:* = null as String;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         var _loc8_:* = null as §_-52O§;
         var _loc9_:* = null as Token;
         var _loc10_:* = null as §_-52O§;
         var _loc2_:Token = token();
         var _temp_1:* = _loc2_;
         var _loc3_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 3:
               _loc5_ = _loc3_[0];
               if(§_-wU§.get(_loc5_))
               {
                  if(isBlock(param1) || Boolean(§§pop()))
                  {
                     _loc4_ = §_-V1q§;
                     _loc4_.§_-T2M§ = new §_-i2n§(_loc2_,_loc4_.§_-T2M§);
                     return param1;
                  }
                  return §_-i25§(§_-52O§.EUnop(_loc5_,false,param1));
               }
               return §_-OX§(_loc5_,param1,§_-y1T§());
               break;
            case 4:
               return §_-i25§(§_-52O§.ECall(param1,§_-yP§(Token.TPClose)));
            case 8:
               _loc2_ = token();
               _loc5_ = null;
               var _temp_2:* = _loc2_;
               _loc6_ = _temp_2.params;
               switch(_temp_2.index)
               {
                  case 2:
                     _loc7_ = _loc6_[0];
                     _loc5_ = _loc7_;
                     break;
                  default:
                     §_-C1S§(_loc2_);
               }
               return §_-i25§(§_-52O§.EField(param1,_loc5_));
            case 11:
               _loc8_ = §_-y1T§();
               _loc9_ = token();
               if(_loc9_ != Token.TBkClose)
               {
                  §_-C1S§(_loc9_);
               }
               return §_-i25§(§_-52O§.EArray(param1,_loc8_));
            case 13:
               _loc8_ = §_-y1T§();
               _loc9_ = token();
               if(_loc9_ != Token.TDoubleDot)
               {
                  §_-C1S§(_loc9_);
               }
               _loc10_ = §_-y1T§();
               return §_-52O§.ETernary(param1,_loc8_,_loc10_);
            default:
               _loc4_ = §_-V1q§;
               _loc4_.§_-T2M§ = new §_-i2n§(_loc2_,_loc4_.§_-T2M§);
               return param1;
         }
      }
      
      public function §_-yP§(param1:Token) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:Token = token();
         if(_loc3_ == param1)
         {
            return _loc2_;
         }
         var _loc4_:§_-4k§ = §_-V1q§;
         _loc4_.§_-T2M§ = new §_-i2n§(_loc3_,_loc4_.§_-T2M§);
         loop0:
         while(true)
         {
            _loc2_.push(§_-y1T§());
            _loc3_ = token();
            switch(_loc3_.index)
            {
               default:
                  if(_loc3_ == param1)
                  {
                     break loop0;
                  }
                  §_-C1S§(_loc3_);
                  break;
               case 9:
            }
         }
         return _loc2_;
      }
      
      public function §_-y1T§() : §_-52O§
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as §_-52O§;
         var _loc5_:* = null as §_-92J§;
         var _loc6_:* = null as Token;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as §_-4k§;
         var _loc1_:Token = token();
         var _temp_1:* = _loc1_;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc5_ = _loc2_[0];
               return §_-i25§(§_-52O§.EConst(_loc5_));
            case 2:
               _loc3_ = _loc2_[0];
               _loc4_ = §_-w13§(_loc3_);
               if(_loc4_ == null)
               {
                  _loc4_ = §_-52O§.EIdent(_loc3_);
               }
               return §_-i25§(_loc4_);
            case 3:
               _loc3_ = _loc2_[0];
               if(§_-wU§.§_-UV§(_loc3_))
               {
                  return §_-p2K§(_loc3_,§_-y1T§());
               }
               return §_-C1S§(_loc1_);
               break;
            case 4:
               _loc4_ = §_-y1T§();
               _loc6_ = token();
               if(_loc6_ != Token.TPClose)
               {
                  §_-C1S§(_loc6_);
               }
               return §_-i25§(§_-52O§.EParent(_loc4_));
            case 6:
               _loc1_ = token();
               var _temp_2:* = _loc1_;
               _loc7_ = _temp_2.params;
               switch(_temp_2.index)
               {
                  case 1:
                     _loc5_ = _loc7_[0];
                     if(§_-l2s§)
                     {
                        switch(_loc5_.index)
                        {
                           case 2:
                              _loc6_ = token();
                              _loc8_ = §_-V1q§;
                              _loc8_.§_-T2M§ = new §_-i2n§(_loc6_,_loc8_.§_-T2M§);
                              _loc8_ = §_-V1q§;
                              _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
                              switch(_loc6_.index)
                              {
                                 case 14:
                                    return §_-i25§(§_-B2o§(0));
                              }
                              break;
                           default:
                              _loc8_ = §_-V1q§;
                              _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
                        }
                        break;
                     }
                     _loc8_ = §_-V1q§;
                     _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
                     break;
                  case 2:
                     _loc3_ = _loc7_[0];
                     _loc6_ = token();
                     _loc8_ = §_-V1q§;
                     _loc8_.§_-T2M§ = new §_-i2n§(_loc6_,_loc8_.§_-T2M§);
                     _loc8_ = §_-V1q§;
                     _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
                     switch(_loc6_.index)
                     {
                        case 14:
                           return §_-i25§(§_-B2o§(0));
                     }
                     break;
                  case 7:
                     return §_-i25§(§_-52O§.EObject([]));
                  default:
                     _loc8_ = §_-V1q§;
                     _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
               }
               _loc7_ = [];
               while(true)
               {
                  _loc7_.push(§_-fO§());
                  _loc1_ = token();
                  if(_loc1_ == Token.TBrClose)
                  {
                     break;
                  }
                  _loc8_ = §_-V1q§;
                  _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
               }
               return §_-52O§.EBlock(_loc7_);
            case 11:
               _loc7_ = [];
               _loc1_ = token();
               while(_loc1_ != Token.TBkClose)
               {
                  _loc8_ = §_-V1q§;
                  _loc8_.§_-T2M§ = new §_-i2n§(_loc1_,_loc8_.§_-T2M§);
                  _loc7_.push(§_-y1T§());
                  _loc1_ = token();
                  if(_loc1_ == Token.TComma)
                  {
                     _loc1_ = token();
                  }
               }
               return §_-i25§(§_-52O§.EArrayDecl(_loc7_));
            default:
               return §_-C1S§(_loc1_);
         }
      }
      
      public function parse(param1:§_-B3m§) : §_-52O§
      {
         var _loc4_:int = 0;
         var _loc6_:* = null as Token;
         var _loc7_:* = null as §_-4k§;
         §_-V1q§ = new §_-4k§();
         char = -1;
         input = param1;
         §_-yh§ = [];
         §_-y15§ = [];
         var _loc2_:int = 0;
         var _loc3_:int = §_-S20§.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            §_-yh§[§_-S20§.charCodeAt(_loc4_)] = true;
         }
         _loc2_ = 0;
         _loc3_ = §_-w2S§.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            §_-y15§[§_-w2S§.charCodeAt(_loc4_)] = true;
         }
         var _loc5_:Array = [];
         while(true)
         {
            _loc6_ = token();
            if(_loc6_ == Token.TEof)
            {
               break;
            }
            _loc7_ = §_-V1q§;
            _loc7_.§_-T2M§ = new §_-i2n§(_loc6_,_loc7_.§_-T2M§);
            _loc5_.push(§_-fO§());
         }
         return int(_loc5_.length) == 1 ? _loc5_[0] : §_-52O§.EBlock(_loc5_);
      }
      
      public function §_-V2Y§(param1:§_-52O§, param2:Object = undefined, param3:Object = undefined) : §_-52O§
      {
         return param1;
      }
      
      public function §_-p2K§(param1:String, param2:§_-52O§) : §_-52O§
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as §_-52O§;
         var _loc6_:* = null as §_-52O§;
         var _loc7_:* = null as §_-52O§;
         var _temp_1:* = param2;
         var _loc3_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 6:
               _loc4_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               _loc6_ = _loc3_[2];
               return §_-52O§.EBinop(_loc4_,§_-p2K§(param1,_loc5_),_loc6_);
            case 22:
               _loc5_ = _loc3_[0];
               _loc6_ = _loc3_[1];
               _loc7_ = _loc3_[2];
               return §_-52O§.ETernary(§_-p2K§(param1,_loc5_),_loc6_,_loc7_);
            default:
               return §_-52O§.EUnop(param1,true,param2);
         }
      }
      
      public function §_-OX§(param1:String, param2:§_-52O§, param3:§_-52O§) : §_-52O§
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as §_-52O§;
         var _loc7_:* = null as §_-52O§;
         var _loc8_:* = null as §_-52O§;
         var _temp_1:* = param3;
         var _loc4_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 6:
               _loc5_ = _loc4_[0];
               _loc6_ = _loc4_[1];
               _loc7_ = _loc4_[2];
               return §_-O1H§.get(param1) <= §_-O1H§.get(_loc5_) && !§_-B3r§.§_-UV§(param1) ? §_-52O§.EBinop(_loc5_,§_-OX§(param1,param2,_loc6_),_loc7_) : §_-52O§.EBinop(param1,param2,param3);
            case 22:
               _loc6_ = _loc4_[0];
               _loc7_ = _loc4_[1];
               _loc8_ = _loc4_[2];
               if(§_-B3r§.§_-UV§(param1))
               {
                  §§push(§_-52O§.EBinop(param1,param2,param3));
                  break;
               }
               return §_-52O§.ETernary(§_-OX§(param1,param2,_loc6_),_loc7_,_loc8_);
            default:
               return §_-52O§.EBinop(param1,param2,param3);
         }
      }
      
      public function isBlock(param1:§_-52O§) : Boolean
      {
         var _loc3_:* = null as §_-52O§;
         var _loc4_:* = null as §_-52O§;
         var _loc5_:Boolean = false;
         var _temp_1:* = param1;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 2:
               _loc3_ = _loc2_[2];
               return _loc3_ != null && isBlock(_loc3_);
            case 4:
            case 21:
               return true;
            case 6:
               _loc3_ = _loc2_[2];
               return isBlock(_loc3_);
            case 7:
               _loc5_ = Boolean(_loc2_[1]);
               _loc3_ = _loc2_[2];
               return !_loc5_ && isBlock(_loc3_);
            case 9:
               _loc3_ = _loc2_[1];
               _loc4_ = _loc2_[2];
               return _loc4_ != null ? isBlock(_loc4_) : isBlock(_loc3_);
            case 10:
               _loc3_ = _loc2_[1];
               return isBlock(_loc3_);
            case 11:
               _loc3_ = _loc2_[2];
               return isBlock(_loc3_);
            case 14:
               _loc3_ = _loc2_[1];
               return isBlock(_loc3_);
            case 15:
               _loc3_ = _loc2_[0];
               §§push(false);
               if(_loc3_ != null)
               {
                  §§pop();
                  return isBlock(_loc3_);
               }
               break;
            default:
               return false;
         }
      }
      
      public function §_-c2A§(param1:int) : void
      {
         Boot.§_-B2g§ = new Error();
         throw hscript.Error.EInvalidChar(param1);
      }
      
      public function §_-f2r§() : void
      {
      }
      
      public function §_-QV§(param1:§_-52O§) : §_-52O§
      {
         return param1;
      }
      
      public function error(param1:hscript.Error, param2:int, param3:int) : void
      {
         Boot.§_-B2g§ = new Error();
         throw param1;
      }
      
      public function §_-33s§(param1:Token) : void
      {
         var _loc2_:Token = token();
         if(_loc2_ != param1)
         {
            §_-C1S§(_loc2_);
         }
      }
      
      public function §_-k1V§(param1:§_-92J§) : String
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:* = null as String;
         var _temp_1:* = param1;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 0:
               _loc3_ = int(_loc2_[0]);
               return §_-Mk§.string(_loc3_);
            case 1:
               _loc4_ = Number(_loc2_[0]);
               return §_-Mk§.string(_loc4_);
            case 2:
               _loc5_ = _loc2_[0];
               return _loc5_;
            case 3:
               _loc3_ = int(_loc2_[0]);
               return §_-Mk§.string(_loc3_);
            default:
               return null;
         }
      }
   }
}

