package hscript
{
   import §_-Jf§.§_-02j§;
   import §_-Jf§.§_-EP§;
   import §_-Jf§.§_-r1D§;
   import §_-Jf§.§_-y1y§;
   import §_-y1v§.§_-73r§;
   import §_-y1v§.§_-Gj§;
   import flash.Boot;
   
   public class §_-e2L§
   {
      
      public static var §_-LQ§:int = 0;
      
      public static var §_-ez§:int = 0;
      
      public static var §_-S2S§:int = 0;
      
      public static var §_-R1p§:int = 0;
      
      public var §_-h2Z§:§_-n6§;
      
      public var §_-j1t§:§_-73r§;
      
      public var §_-X9§:Array;
      
      public var §_-m2b§:§_-n6§;
      
      public var §_-uf§:§_-n6§;
      
      public var §_-P§:String;
      
      public var §_-x5§:int;
      
      public var input:§_-r1D§;
      
      public var §_-ux§:Array;
      
      public var §_-52l§:String;
      
      public var char:int;
      
      public var §_-42n§:Boolean;
      
      public var §_-4T§:Boolean;
      
      public function §_-e2L§()
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         if(Boot.§_-s2I§)
         {
            return;
         }
         §_-x5§ = 1;
         §_-P§ = "+*/-=!><&|^%~";
         §_-52l§ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
         var _loc1_:Array = [["%"],["*","/"],["+","-"],["<<",">>",">>>"],["|","&","^"],["==","!=",">","<",">=","<="],["..."],["&&"],["||"],["=","+=","-=","*=","/=","%=","<<=",">>=",">>>=","|=","&=","^="]];
         §_-uf§ = new §_-n6§();
         §_-m2b§ = new §_-n6§();
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
               §_-uf§.set(_loc7_,_loc4_);
               if(_loc4_ == 9)
               {
                  §_-m2b§.set(_loc7_,true);
               }
            }
         }
         §_-h2Z§ = new §_-n6§();
         _loc2_ = 0;
         _loc6_ = ["!","++","--","-","~"];
         while(_loc2_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc2_];
            _loc2_++;
            §_-h2Z§.set(_loc7_,_loc7_ == "++" || _loc7_ == "--");
         }
      }
      
      public function §_-5a§(param1:Token) : *
      {
         Boot.§_-tp§ = new Error();
         throw hscript.Error.EUnexpected(§_-02T§(param1));
      }
      
      public function §_-02T§(param1:Token) : String
      {
         var _loc3_:* = null as §_-g1n§;
         var _loc4_:* = null as String;
         var _temp_1:* = param1;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 0:
               return "<eof>";
            case 1:
               _loc3_ = _loc2_[0];
               return §_-22Z§(_loc3_);
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
      
      public function §_-l2l§(param1:String, param2:int) : Token
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = param1.charCodeAt(1);
         var _loc5_:§_-r1D§ = input;
         if(_loc4_ != 47)
         {
            if(_loc4_ == 42)
            {
               _loc7_ = §_-x5§;
               try
               {
                  do
                  {
                     while(param2 != 42)
                     {
                        if(param2 == 10)
                        {
                           ++§_-x5§;
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
                  §_-x5§ = _loc7_;
                  Boot.§_-tp§ = new Error();
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
         var _loc2_:* = null as §_-73r§;
         var _loc3_:* = null as §_-Gj§;
         var _loc4_:int = 0;
         var _loc5_:* = null as String;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = 0;
         var _loc9_:* = null as §_-g1n§;
         var _loc10_:* = null;
         var _loc11_:* = 0;
         if(§_-j1t§.§_-gi§ != null)
         {
            _loc2_ = §_-j1t§;
            _loc3_ = _loc2_.§_-gi§;
            return _loc3_ == null ? null : (_loc2_.§_-gi§ = _loc3_.next,_loc3_.§_-Rs§);
         }
         if(char < 0)
         {
            _loc4_ = §_-333§();
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
                  ++§_-x5§;
                  break;
               case 34:
                  return Token.TConst(§_-g1n§.CString(§_-A5§(34)));
               case 39:
                  return Token.TConst(§_-g1n§.CString(§_-A5§(39)));
               case 40:
                  return Token.TPOpen;
               case 41:
                  return Token.TPClose;
               case 44:
                  return Token.TComma;
               case 46:
                  _loc4_ = §_-333§();
                  switch(_loc4_)
                  {
                     case 46:
                        _loc4_ = §_-333§();
                        if(_loc4_ != 46)
                        {
                           §_-82a§(_loc4_);
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
                           _loc4_ = §_-333§();
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
                        return Token.TConst(§_-g1n§.CFloat(_loc8_ / _loc11_));
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
                     _loc4_ = §_-333§();
                     _loc7_ *= 10;
                     switch(_loc4_)
                     {
                        case 46:
                           if(_loc7_ > 0)
                           {
                              if(_loc7_ == 10 && §_-333§() == 46)
                              {
                                 _loc2_ = §_-j1t§;
                                 _loc2_.§_-gi§ = new §_-Gj§(Token.TOp("..."),_loc2_.§_-gi§);
                                 _loc8_ = int(_loc6_);
                                 return Token.TConst(_loc8_ == _loc6_ ? §_-g1n§.CInt(_loc8_) : §_-g1n§.CFloat(_loc6_));
                              }
                              §_-82a§(_loc4_);
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
                              §_-82a§(_loc4_);
                           }
                           _loc8_ = 0;
                           loop5:
                           while(true)
                           {
                              _loc4_ = §_-333§();
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
                              §§push(§_-g1n§);
                              if((_loc8_ >> 30 & 1) != _loc8_ >>> 31)
                              {
                                 Boot.§_-tp§ = new Error();
                                 throw "Overflow " + _loc8_;
                              }
                              §§push(§§pop().CInt(_loc8_));
                           }
                           catch(_loc_e_:*)
                           {
                              _loc9_ = §_-g1n§.CInt32(_loc8_);
                              return Token.TConst(_loc9_);
                           }
                           break;
                        default:
                           break loop1;
                     }
                  }
                  char = _loc4_;
                  _loc8_ = int(_loc6_);
                  return Token.TConst(_loc7_ > 0 ? §_-g1n§.CFloat(_loc6_ * 10 / _loc7_) : (_loc8_ == _loc6_ ? §_-g1n§.CInt(_loc8_) : §_-g1n§.CFloat(_loc6_)));
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
                  if(§_-X9§[_loc4_])
                  {
                     _loc5_ = String.fromCharCode(_loc4_);
                     while(true)
                     {
                        _loc4_ = §_-333§();
                        if(!§_-X9§[_loc4_])
                        {
                           break;
                        }
                        _loc5_ += String.fromCharCode(_loc4_);
                     }
                     if(_loc5_.charCodeAt(0) == 47)
                     {
                        return §_-l2l§(_loc5_,_loc4_);
                     }
                     char = _loc4_;
                     return Token.TOp(_loc5_);
                  }
                  if(§_-ux§[_loc4_])
                  {
                     _loc5_ = String.fromCharCode(_loc4_);
                     while(true)
                     {
                        _loc4_ = §_-333§();
                        if(!§_-ux§[_loc4_])
                        {
                           break;
                        }
                        _loc5_ += String.fromCharCode(_loc4_);
                     }
                     char = _loc4_;
                     return Token.TId(_loc5_);
                  }
                  §_-82a§(_loc4_);
            }
            _loc4_ = §_-333§();
         }
         return Token.TEof;
      }
      
      public function §_-A5§(param1:int) : String
      {
         var _loc8_:* = null;
         var _loc9_:* = null as String;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc3_:int = 0;
         var _loc4_:§_-02j§ = new §_-02j§();
         var _loc5_:Boolean = false;
         var _loc6_:int = §_-x5§;
         var _loc7_:§_-r1D§ = input;
         while(true)
         {
            try
            {
               null;
               _loc3_ = _loc7_.readByte();
            }
            catch(_loc_e_:*)
            {
               §_-x5§ = _loc6_;
               Boot.§_-tp§ = new Error();
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
                     if(§_-4T§)
                     {
                        _loc4_.writeByte(_loc3_);
                     }
                     else
                     {
                        §_-82a§(_loc3_);
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
                     if(!§_-4T§)
                     {
                        Boot.§_-tp§ = new Error();
                        throw §_-82a§(_loc3_);
                     }
                     _loc9_ = null;
                     try
                     {
                        null;
                        null;
                        null;
                        null;
                        _loc9_ = _loc7_.§_-A5§(4);
                     }
                     catch(_loc_e_:*)
                     {
                        §_-x5§ = _loc6_;
                        Boot.§_-tp§ = new Error();
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
                                                                                          §_-82a§(_loc8_);
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
                     §_-82a§(_loc3_);
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
                  ++§_-x5§;
               }
               _loc4_.writeByte(_loc3_);
            }
         }
         return _loc4_.§_-61v§().toString();
      }
      
      public function §_-333§() : int
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
         var _loc2_:§_-73r§ = §_-j1t§;
         _loc2_.§_-gi§ = new §_-Gj§(param1,_loc2_.§_-gi§);
      }
      
      public function §_-o6§(param1:§_-eu§) : int
      {
         return 0;
      }
      
      public function §_-D1X§(param1:§_-eu§) : int
      {
         return 0;
      }
      
      public function §_-c2q§(param1:§_-V2E§) : §_-V2E§
      {
         var _loc4_:* = null as §_-73r§;
         var _loc5_:* = null as String;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as §_-V2E§;
         var _loc2_:Token = token();
         var _temp_1:* = _loc2_;
         var _loc3_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 3:
               _loc5_ = _loc3_[0];
               if(_loc5_ != "->")
               {
                  _loc4_ = §_-j1t§;
                  _loc4_.§_-gi§ = new §_-Gj§(_loc2_,_loc4_.§_-gi§);
                  return param1;
               }
               var _loc6_:§_-V2E§ = §_-Uu§();
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
                     return §_-V2E§.CTFun([param1],_loc6_);
               }
               break;
            default:
               _loc4_ = §_-j1t§;
               _loc4_.§_-gi§ = new §_-Gj§(_loc2_,_loc4_.§_-gi§);
               return param1;
         }
      }
      
      public function §_-Uu§() : §_-V2E§
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as §_-73r§;
         var _loc9_:* = null as Array;
         var _loc10_:* = null as String;
         var _loc11_:* = null as §_-V2E§;
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
                        §_-5a§(_loc1_);
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
                           _loc5_.push(§_-Uu§());
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
                           §_-5a§(_loc1_);
                        }
                     }
                     break;
                  default:
                     _loc8_ = §_-j1t§;
                     _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
               }
               return §_-c2q§(§_-V2E§.CTPath(_loc4_,_loc5_));
            case 4:
               _loc11_ = §_-Uu§();
               _loc12_ = token();
               if(_loc12_ != Token.TPClose)
               {
                  §_-5a§(_loc12_);
               }
               return §_-c2q§(§_-V2E§.CTParent(_loc11_));
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
                           §_-5a§(_loc12_);
                        }
                        _loc4_.push({
                           "name":_loc3_,
                           "t":§_-Uu§()
                        });
                        _loc1_ = token();
                        switch(_loc1_.index)
                        {
                           case 7:
                              §§goto(addr0305);
                           case 9:
                              break loop7;
                           default:
                              §_-5a§(_loc1_);
                              break loop7;
                        }
                        break;
                     case 7:
                        break loop1;
                     default:
                        §_-5a§(_loc1_);
                  }
               }
               addr0305:
               return §_-c2q§(§_-V2E§.CTAnon(_loc4_));
            default:
               return §_-5a§(_loc1_);
         }
      }
      
      public function §_-av§(param1:String) : §_-eu§
      {
         var _loc3_:* = null as §_-eu§;
         var _loc4_:* = null as §_-eu§;
         var _loc5_:* = null as §_-eu§;
         var _loc6_:Boolean = false;
         var _loc7_:* = null as Token;
         var _loc8_:* = null as §_-73r§;
         var _loc9_:* = null as String;
         var _loc10_:* = null as Array;
         var _loc11_:* = null as String;
         var _loc12_:* = null as §_-V2E§;
         var _loc13_:* = null as Token;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc2_:String = param1;
         if(_loc2_ == "if")
         {
            _loc3_ = §_-No§();
            _loc4_ = §_-No§();
            _loc5_ = null;
            _loc6_ = false;
            _loc7_ = token();
            if(_loc7_ == Token.TSemicolon)
            {
               _loc6_ = true;
               _loc7_ = token();
            }
            if(Type.§_-8G§(_loc7_,Token.TId("else")))
            {
               _loc5_ = §_-No§();
            }
            else
            {
               _loc8_ = §_-j1t§;
               _loc8_.§_-gi§ = new §_-Gj§(_loc7_,_loc8_.§_-gi§);
               if(_loc6_)
               {
                  _loc8_ = §_-j1t§;
                  _loc8_.§_-gi§ = new §_-Gj§(Token.TSemicolon,_loc8_.§_-gi§);
               }
            }
            return §_-eu§.EIf(_loc3_,_loc4_,_loc5_);
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
                  §_-5a§(_loc7_);
            }
            _loc7_ = token();
            _loc12_ = null;
            if(_loc7_ == Token.TDoubleDot && §_-42n§)
            {
               _loc12_ = §_-Uu§();
               _loc7_ = token();
            }
            _loc3_ = null;
            if(Type.§_-8G§(_loc7_,Token.TOp("=")))
            {
               _loc3_ = §_-No§();
            }
            else
            {
               _loc8_ = §_-j1t§;
               _loc8_.§_-gi§ = new §_-Gj§(_loc7_,_loc8_.§_-gi§);
            }
            return §_-eu§.EVar(_loc9_,_loc12_,_loc3_);
         }
         else if(_loc2_ == "while")
         {
            _loc3_ = §_-No§();
            _loc4_ = §_-No§();
            return §_-eu§.EWhile(_loc3_,_loc4_);
         }
         else if(_loc2_ == "for")
         {
            _loc7_ = token();
            if(_loc7_ != Token.TPOpen)
            {
               §_-5a§(_loc7_);
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
                  §_-5a§(_loc7_);
            }
            _loc7_ = token();
            if(!Type.§_-8G§(_loc7_,Token.TId("in")))
            {
               §_-5a§(_loc7_);
            }
            _loc3_ = §_-No§();
            _loc13_ = token();
            if(_loc13_ != Token.TPClose)
            {
               §_-5a§(_loc13_);
            }
            _loc4_ = §_-No§();
            return §_-eu§.EFor(_loc9_,_loc3_,_loc4_);
         }
         else if(_loc2_ == "break")
         {
            return §_-eu§.EBreak;
         }
         else if(_loc2_ == "continue")
         {
            return §_-eu§.EContinue;
         }
         else if(_loc2_ == "else")
         {
            return §_-5a§(Token.TId(param1));
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
                  _loc8_ = §_-j1t§;
                  _loc8_.§_-gi§ = new §_-Gj§(_loc7_,_loc8_.§_-gi§);
            }
            _loc13_ = token();
            if(_loc13_ != Token.TPOpen)
            {
               §_-5a§(_loc13_);
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
                        §_-5a§(_loc7_);
                  }
                  _loc7_ = token();
                  _loc12_ = null;
                  if(_loc7_ == Token.TDoubleDot && §_-42n§)
                  {
                     _loc12_ = §_-Uu§();
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
                        §_-5a§(_loc7_);
                  }
               }
            }
            _loc12_ = null;
            if(§_-42n§)
            {
               _loc7_ = token();
               if(_loc7_ != Token.TDoubleDot)
               {
                  _loc8_ = §_-j1t§;
                  _loc8_.§_-gi§ = new §_-Gj§(_loc7_,_loc8_.§_-gi§);
               }
               else
               {
                  _loc12_ = §_-Uu§();
               }
            }
            _loc3_ = §_-No§();
            return §_-eu§.EFunction(_loc10_,_loc3_,_loc9_,_loc12_);
         }
         else if(_loc2_ == "return")
         {
            _loc7_ = token();
            _loc8_ = §_-j1t§;
            _loc8_.§_-gi§ = new §_-Gj§(_loc7_,_loc8_.§_-gi§);
            _loc3_ = _loc7_ == Token.TSemicolon ? null : §_-No§();
            return §_-eu§.EReturn(_loc3_);
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
                  §_-5a§(_loc7_);
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
                           §_-5a§(_loc7_);
                     }
                     break;
                  default:
                     §_-5a§(_loc7_);
               }
            }
            _loc14_ = §_-116§(Token.TPClose);
            return §_-eu§.ENew(_loc10_.join("."),_loc14_);
         }
         else if(_loc2_ == "throw")
         {
            _loc3_ = §_-No§();
            return §_-eu§.EThrow(_loc3_);
         }
         else if(_loc2_ == "try")
         {
            _loc3_ = §_-No§();
            _loc7_ = token();
            if(!Type.§_-8G§(_loc7_,Token.TId("catch")))
            {
               §_-5a§(_loc7_);
            }
            _loc13_ = token();
            if(_loc13_ != Token.TPOpen)
            {
               §_-5a§(_loc13_);
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
                  §§push(§_-5a§(_loc7_));
            }
            _loc9_ = §§pop();
            _loc13_ = token();
            if(_loc13_ != Token.TDoubleDot)
            {
               §_-5a§(_loc13_);
            }
            _loc12_ = null;
            if(§_-42n§)
            {
               _loc12_ = §_-Uu§();
            }
            else
            {
               _loc7_ = token();
               if(!Type.§_-8G§(_loc7_,Token.TId("Dynamic")))
               {
                  §_-5a§(_loc7_);
               }
            }
            _loc13_ = token();
            if(_loc13_ != Token.TPClose)
            {
               §_-5a§(_loc13_);
            }
            _loc4_ = §_-No§();
            return §_-eu§.ETry(_loc3_,_loc9_,_loc12_,_loc4_);
         }
         else
         {
            return null;
         }
      }
      
      public function §_-B2G§(param1:String) : §_-eu§
      {
         §_-x5§ = 1;
         return parse(new §_-EP§(param1));
      }
      
      public function §_-s1n§(param1:Object) : §_-eu§
      {
         var _loc3_:* = null as Token;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc7_:* = null as §_-g1n§;
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
                  if(!§_-4T§)
                  {
                     §_-5a§(_loc3_);
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
                        §_-5a§(_loc3_);
                  }
                  break;
               case 2:
                  _loc6_ = _loc5_[0];
                  _loc4_ = _loc6_;
                  break;
               case 7:
                  break loop0;
               default:
                  §_-5a§(_loc3_);
            }
            _loc9_ = token();
            if(_loc9_ != Token.TDoubleDot)
            {
               §_-5a§(_loc9_);
            }
            _loc2_.push({
               "name":_loc4_,
               "e":§_-No§()
            });
            _loc3_ = token();
            switch(_loc3_.index)
            {
               case 7:
                  §§goto(addr016a);
               default:
                  §_-5a§(_loc3_);
                  break;
               case 9:
            }
         }
         addr016a:
         return §_-Bx§(§_-eu§.EObject(_loc2_));
      }
      
      public function §_-UU§() : §_-eu§
      {
         var _loc3_:* = null as §_-73r§;
         var _loc1_:§_-eu§ = §_-No§();
         var _loc2_:Token = token();
         if(_loc2_ != Token.TSemicolon && _loc2_ != Token.TEof)
         {
            if(isBlock(_loc1_))
            {
               _loc3_ = §_-j1t§;
               _loc3_.§_-gi§ = new §_-Gj§(_loc2_,_loc3_.§_-gi§);
            }
            else
            {
               §_-5a§(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function §_-Bx§(param1:§_-eu§) : §_-eu§
      {
         var _loc4_:* = null as §_-73r§;
         var _loc5_:* = null as String;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         var _loc8_:* = null as §_-eu§;
         var _loc9_:* = null as Token;
         var _loc10_:* = null as §_-eu§;
         var _loc2_:Token = token();
         var _temp_1:* = _loc2_;
         var _loc3_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 3:
               _loc5_ = _loc3_[0];
               if(§_-h2Z§.get(_loc5_))
               {
                  if(isBlock(param1) || Boolean(§§pop()))
                  {
                     _loc4_ = §_-j1t§;
                     _loc4_.§_-gi§ = new §_-Gj§(_loc2_,_loc4_.§_-gi§);
                     return param1;
                  }
                  return §_-Bx§(§_-eu§.EUnop(_loc5_,false,param1));
               }
               return §_-m1w§(_loc5_,param1,§_-No§());
               break;
            case 4:
               return §_-Bx§(§_-eu§.ECall(param1,§_-116§(Token.TPClose)));
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
                     §_-5a§(_loc2_);
               }
               return §_-Bx§(§_-eu§.EField(param1,_loc5_));
            case 11:
               _loc8_ = §_-No§();
               _loc9_ = token();
               if(_loc9_ != Token.TBkClose)
               {
                  §_-5a§(_loc9_);
               }
               return §_-Bx§(§_-eu§.EArray(param1,_loc8_));
            case 13:
               _loc8_ = §_-No§();
               _loc9_ = token();
               if(_loc9_ != Token.TDoubleDot)
               {
                  §_-5a§(_loc9_);
               }
               _loc10_ = §_-No§();
               return §_-eu§.ETernary(param1,_loc8_,_loc10_);
            default:
               _loc4_ = §_-j1t§;
               _loc4_.§_-gi§ = new §_-Gj§(_loc2_,_loc4_.§_-gi§);
               return param1;
         }
      }
      
      public function §_-116§(param1:Token) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:Token = token();
         if(_loc3_ == param1)
         {
            return _loc2_;
         }
         var _loc4_:§_-73r§ = §_-j1t§;
         _loc4_.§_-gi§ = new §_-Gj§(_loc3_,_loc4_.§_-gi§);
         loop0:
         while(true)
         {
            _loc2_.push(§_-No§());
            _loc3_ = token();
            switch(_loc3_.index)
            {
               default:
                  if(_loc3_ == param1)
                  {
                     break loop0;
                  }
                  §_-5a§(_loc3_);
                  break;
               case 9:
            }
         }
         return _loc2_;
      }
      
      public function §_-No§() : §_-eu§
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as §_-eu§;
         var _loc5_:* = null as §_-g1n§;
         var _loc6_:* = null as Token;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as §_-73r§;
         var _loc1_:Token = token();
         var _temp_1:* = _loc1_;
         var _loc2_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc5_ = _loc2_[0];
               return §_-Bx§(§_-eu§.EConst(_loc5_));
            case 2:
               _loc3_ = _loc2_[0];
               _loc4_ = §_-av§(_loc3_);
               if(_loc4_ == null)
               {
                  _loc4_ = §_-eu§.EIdent(_loc3_);
               }
               return §_-Bx§(_loc4_);
            case 3:
               _loc3_ = _loc2_[0];
               if(§_-h2Z§.§_-Da§(_loc3_))
               {
                  return §_-21C§(_loc3_,§_-No§());
               }
               return §_-5a§(_loc1_);
               break;
            case 4:
               _loc4_ = §_-No§();
               _loc6_ = token();
               if(_loc6_ != Token.TPClose)
               {
                  §_-5a§(_loc6_);
               }
               return §_-Bx§(§_-eu§.EParent(_loc4_));
            case 6:
               _loc1_ = token();
               var _temp_2:* = _loc1_;
               _loc7_ = _temp_2.params;
               switch(_temp_2.index)
               {
                  case 1:
                     _loc5_ = _loc7_[0];
                     if(§_-4T§)
                     {
                        switch(_loc5_.index)
                        {
                           case 2:
                              _loc6_ = token();
                              _loc8_ = §_-j1t§;
                              _loc8_.§_-gi§ = new §_-Gj§(_loc6_,_loc8_.§_-gi§);
                              _loc8_ = §_-j1t§;
                              _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
                              switch(_loc6_.index)
                              {
                                 case 14:
                                    return §_-Bx§(§_-s1n§(0));
                              }
                              break;
                           default:
                              _loc8_ = §_-j1t§;
                              _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
                        }
                        break;
                     }
                     _loc8_ = §_-j1t§;
                     _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
                     break;
                  case 2:
                     _loc3_ = _loc7_[0];
                     _loc6_ = token();
                     _loc8_ = §_-j1t§;
                     _loc8_.§_-gi§ = new §_-Gj§(_loc6_,_loc8_.§_-gi§);
                     _loc8_ = §_-j1t§;
                     _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
                     switch(_loc6_.index)
                     {
                        case 14:
                           return §_-Bx§(§_-s1n§(0));
                     }
                     break;
                  case 7:
                     return §_-Bx§(§_-eu§.EObject([]));
                  default:
                     _loc8_ = §_-j1t§;
                     _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
               }
               _loc7_ = [];
               while(true)
               {
                  _loc7_.push(§_-UU§());
                  _loc1_ = token();
                  if(_loc1_ == Token.TBrClose)
                  {
                     break;
                  }
                  _loc8_ = §_-j1t§;
                  _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
               }
               return §_-eu§.EBlock(_loc7_);
            case 11:
               _loc7_ = [];
               _loc1_ = token();
               while(_loc1_ != Token.TBkClose)
               {
                  _loc8_ = §_-j1t§;
                  _loc8_.§_-gi§ = new §_-Gj§(_loc1_,_loc8_.§_-gi§);
                  _loc7_.push(§_-No§());
                  _loc1_ = token();
                  if(_loc1_ == Token.TComma)
                  {
                     _loc1_ = token();
                  }
               }
               return §_-Bx§(§_-eu§.EArrayDecl(_loc7_));
            default:
               return §_-5a§(_loc1_);
         }
      }
      
      public function parse(param1:§_-r1D§) : §_-eu§
      {
         var _loc4_:int = 0;
         var _loc6_:* = null as Token;
         var _loc7_:* = null as §_-73r§;
         §_-j1t§ = new §_-73r§();
         char = -1;
         input = param1;
         §_-X9§ = [];
         §_-ux§ = [];
         var _loc2_:int = 0;
         var _loc3_:int = §_-P§.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            §_-X9§[§_-P§.charCodeAt(_loc4_)] = true;
         }
         _loc2_ = 0;
         _loc3_ = §_-52l§.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            §_-ux§[§_-52l§.charCodeAt(_loc4_)] = true;
         }
         var _loc5_:Array = [];
         while(true)
         {
            _loc6_ = token();
            if(_loc6_ == Token.TEof)
            {
               break;
            }
            _loc7_ = §_-j1t§;
            _loc7_.§_-gi§ = new §_-Gj§(_loc6_,_loc7_.§_-gi§);
            _loc5_.push(§_-UU§());
         }
         return int(_loc5_.length) == 1 ? _loc5_[0] : §_-eu§.EBlock(_loc5_);
      }
      
      public function §_-t1j§(param1:§_-eu§, param2:Object = undefined, param3:Object = undefined) : §_-eu§
      {
         return param1;
      }
      
      public function §_-21C§(param1:String, param2:§_-eu§) : §_-eu§
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as §_-eu§;
         var _loc6_:* = null as §_-eu§;
         var _loc7_:* = null as §_-eu§;
         var _temp_1:* = param2;
         var _loc3_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 6:
               _loc4_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               _loc6_ = _loc3_[2];
               return §_-eu§.EBinop(_loc4_,§_-21C§(param1,_loc5_),_loc6_);
            case 22:
               _loc5_ = _loc3_[0];
               _loc6_ = _loc3_[1];
               _loc7_ = _loc3_[2];
               return §_-eu§.ETernary(§_-21C§(param1,_loc5_),_loc6_,_loc7_);
            default:
               return §_-eu§.EUnop(param1,true,param2);
         }
      }
      
      public function §_-m1w§(param1:String, param2:§_-eu§, param3:§_-eu§) : §_-eu§
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as §_-eu§;
         var _loc7_:* = null as §_-eu§;
         var _loc8_:* = null as §_-eu§;
         var _temp_1:* = param3;
         var _loc4_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 6:
               _loc5_ = _loc4_[0];
               _loc6_ = _loc4_[1];
               _loc7_ = _loc4_[2];
               return §_-uf§.get(param1) <= §_-uf§.get(_loc5_) && !§_-m2b§.§_-Da§(param1) ? §_-eu§.EBinop(_loc5_,§_-m1w§(param1,param2,_loc6_),_loc7_) : §_-eu§.EBinop(param1,param2,param3);
            case 22:
               _loc6_ = _loc4_[0];
               _loc7_ = _loc4_[1];
               _loc8_ = _loc4_[2];
               if(§_-m2b§.§_-Da§(param1))
               {
                  §§push(§_-eu§.EBinop(param1,param2,param3));
                  break;
               }
               return §_-eu§.ETernary(§_-m1w§(param1,param2,_loc6_),_loc7_,_loc8_);
            default:
               return §_-eu§.EBinop(param1,param2,param3);
         }
      }
      
      public function isBlock(param1:§_-eu§) : Boolean
      {
         var _loc3_:* = null as §_-eu§;
         var _loc4_:* = null as §_-eu§;
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
      
      public function §_-82a§(param1:int) : void
      {
         Boot.§_-tp§ = new Error();
         throw hscript.Error.EInvalidChar(param1);
      }
      
      public function §_-b2b§() : void
      {
      }
      
      public function §_-73I§(param1:§_-eu§) : §_-eu§
      {
         return param1;
      }
      
      public function error(param1:hscript.Error, param2:int, param3:int) : void
      {
         Boot.§_-tp§ = new Error();
         throw param1;
      }
      
      public function §_-C11§(param1:Token) : void
      {
         var _loc2_:Token = token();
         if(_loc2_ != param1)
         {
            §_-5a§(_loc2_);
         }
      }
      
      public function §_-22Z§(param1:§_-g1n§) : String
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
               return §_-630§.string(_loc3_);
            case 1:
               _loc4_ = Number(_loc2_[0]);
               return §_-630§.string(_loc4_);
            case 2:
               _loc5_ = _loc2_[0];
               return _loc5_;
            case 3:
               _loc3_ = int(_loc2_[0]);
               return §_-630§.string(_loc3_);
            default:
               return null;
         }
      }
   }
}

