package hscript
{
   import §_-735§.§_-t23§;
   import §_-Tf§.§_-i2C§;
   import flash.Boot;
   
   public class §_-y2D§
   {
      
      public var variables:§_-WD§;
      
      public var §_-52n§:§_-WD§;
      
      public var §_-a2I§:Array;
      
      public var §_-X2K§:§_-WD§;
      
      public function §_-y2D§()
      {
         if(Boot.§_-PC§)
         {
            return;
         }
         §_-52n§ = new §_-WD§();
         §_-a2I§ = [];
         variables = new §_-WD§();
         variables.set("null",null);
         variables.set("true",true);
         variables.set("false",false);
         variables.set("trace",function(param1:*):void
         {
            §_-t23§.trace(§_-Mk§.string(param1),{
               "fileName":"hscript",
               "lineNumber":0
            });
         });
         §_-Y29§();
      }
      
      public function §_-VE§(param1:§_-52O§, param2:§_-52O§) : void
      {
         var _loc5_:* = null as §_-i2C§;
         var _loc4_:int = int(§_-a2I§.length);
         loop0:
         while(§_-QV§(param1) == true)
         {
            try
            {
               §_-QV§(param2);
            }
            catch(_loc_e_:§_-i2C§)
            {
               _loc5_ = _loc_e_;
               switch(_loc5_.index)
               {
                  case 0:
                     break loop0;
                  case 1:
                     break;
                  case 2:
                     Boot.§_-B2g§ = new Error();
                     throw _loc5_;
               }
            }
         }
         §_-U12§(_loc4_);
      }
      
      public function set(param1:*, param2:String, param3:*) : *
      {
         if(param1 == null)
         {
            Boot.§_-B2g§ = new Error();
            throw hscript.Error.EInvalidAccess(param2);
         }
         param1[param2] = param3;
         return param3;
      }
      
      public function §_-U12§(param1:int) : void
      {
         var _loc2_:* = null;
         while(int(§_-a2I§.length) > param1)
         {
            _loc2_ = §_-a2I§.pop();
            §_-52n§.set(_loc2_.n,_loc2_.old);
         }
      }
      
      public function §_-7T§(param1:*) : Object
      {
         var _loc3_:* = null;
         try
         {
            param1 = param1.iterator();
         }
         catch(_loc_e_:*)
         {
            if(param1.hasNext == null || param1.next == null)
            {
               Boot.§_-B2g§ = new Error();
               throw hscript.Error.EInvalidIterator(param1);
            }
            return param1;
         }
      }
      
      public function §_-Y29§() : void
      {
         var me:§_-y2D§ = this;
         §_-X2K§ = new §_-WD§();
         §_-X2K§.set("+",function(param1:§_-52O§, param2:§_-52O§):*
         {
            return me.§_-QV§(param1) + me.§_-QV§(param2);
         });
         §_-X2K§.set("-",function(param1:§_-52O§, param2:§_-52O§):Number
         {
            return me.§_-QV§(param1) - me.§_-QV§(param2);
         });
         §_-X2K§.set("*",function(param1:§_-52O§, param2:§_-52O§):Number
         {
            return me.§_-QV§(param1) * me.§_-QV§(param2);
         });
         §_-X2K§.set("/",function(param1:§_-52O§, param2:§_-52O§):Number
         {
            return me.§_-QV§(param1) / me.§_-QV§(param2);
         });
         §_-X2K§.set("%",function(param1:§_-52O§, param2:§_-52O§):Number
         {
            return me.§_-QV§(param1) % me.§_-QV§(param2);
         });
         §_-X2K§.set("&",function(param1:§_-52O§, param2:§_-52O§):int
         {
            return me.§_-QV§(param1) & me.§_-QV§(param2);
         });
         §_-X2K§.set("|",function(param1:§_-52O§, param2:§_-52O§):int
         {
            return me.§_-QV§(param1) | me.§_-QV§(param2);
         });
         §_-X2K§.set("^",function(param1:§_-52O§, param2:§_-52O§):int
         {
            return me.§_-QV§(param1) ^ me.§_-QV§(param2);
         });
         §_-X2K§.set("<<",function(param1:§_-52O§, param2:§_-52O§):int
         {
            return me.§_-QV§(param1) << me.§_-QV§(param2);
         });
         §_-X2K§.set(">>",function(param1:§_-52O§, param2:§_-52O§):int
         {
            return me.§_-QV§(param1) >> me.§_-QV§(param2);
         });
         §_-X2K§.set(">>>",function(param1:§_-52O§, param2:§_-52O§):int
         {
            return me.§_-QV§(param1) >>> me.§_-QV§(param2);
         });
         §_-X2K§.set("==",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) == me.§_-QV§(param2);
         });
         §_-X2K§.set("!=",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) != me.§_-QV§(param2);
         });
         §_-X2K§.set(">=",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) >= me.§_-QV§(param2);
         });
         §_-X2K§.set("<=",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) <= me.§_-QV§(param2);
         });
         §_-X2K§.set(">",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) > me.§_-QV§(param2);
         });
         §_-X2K§.set("<",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) < me.§_-QV§(param2);
         });
         §_-X2K§.set("||",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) == true || me.§_-QV§(param2) == true;
         });
         §_-X2K§.set("&&",function(param1:§_-52O§, param2:§_-52O§):Boolean
         {
            return me.§_-QV§(param1) == true && me.§_-QV§(param2) == true;
         });
         §_-X2K§.set("=",§_-A1e§);
         §_-X2K§.set("...",function(param1:§_-52O§, param2:§_-52O§):IntIter
         {
            return new IntIter(me.§_-QV§(param1),me.§_-QV§(param2));
         });
         §_-R28§("+=",function(param1:*, param2:*):*
         {
            return param1 + param2;
         });
         §_-R28§("-=",function(param1:Number, param2:Number):Number
         {
            return param1 - param2;
         });
         §_-R28§("*=",function(param1:Number, param2:Number):Number
         {
            return param1 * param2;
         });
         §_-R28§("/=",function(param1:Number, param2:Number):Number
         {
            return param1 / param2;
         });
         §_-R28§("%=",function(param1:Number, param2:Number):Number
         {
            return param1 % param2;
         });
         §_-R28§("&=",function(param1:int, param2:int):int
         {
            return param1 & param2;
         });
         §_-R28§("|=",function(param1:int, param2:int):int
         {
            return param1 | param2;
         });
         §_-R28§("^=",function(param1:int, param2:int):int
         {
            return param1 ^ param2;
         });
         §_-R28§("<<=",function(param1:int, param2:int):int
         {
            return param1 << param2;
         });
         §_-R28§(">>=",function(param1:int, param2:int):int
         {
            return param1 >> param2;
         });
         §_-R28§(">>>=",function(param1:int, param2:int):int
         {
            return param1 >>> param2;
         });
      }
      
      public function §_-R2r§(param1:§_-52O§, param2:Boolean, param3:int) : *
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null as §_-52O§;
         var _loc9_:* = null as §_-52O§;
         var _loc10_:* = null as Array;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _temp_1:* = param1;
         var _loc4_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc5_ = _loc4_[0];
               _loc6_ = §_-52n§.get(_loc5_);
               _loc7_ = _loc6_ == null ? variables.get(_loc5_) : _loc6_.r;
               if(param2)
               {
                  _loc7_ += param3;
                  if(_loc6_ == null)
                  {
                     variables.set(_loc5_,_loc7_);
                  }
                  else
                  {
                     _loc6_.r = _loc7_;
                  }
               }
               else if(_loc6_ == null)
               {
                  variables.set(_loc5_,_loc7_ + param3);
               }
               else
               {
                  _loc6_.r = _loc7_ + param3;
               }
               return _loc7_;
            case 5:
               _loc8_ = _loc4_[0];
               _loc5_ = _loc4_[1];
               _loc6_ = §_-QV§(_loc8_);
               _loc7_ = get(_loc6_,_loc5_);
               if(param2)
               {
                  _loc7_ += param3;
                  set(_loc6_,_loc5_,_loc7_);
               }
               else
               {
                  set(_loc6_,_loc5_,_loc7_ + param3);
               }
               return _loc7_;
            case 16:
               _loc8_ = _loc4_[0];
               _loc9_ = _loc4_[1];
               _loc10_ = §_-QV§(_loc8_);
               _loc11_ = §_-QV§(_loc9_);
               _loc12_ = int(_loc10_[_loc11_]);
               if(param2)
               {
                  _loc12_ += param3;
                  _loc10_[_loc11_] = _loc12_;
               }
               else
               {
                  _loc10_[_loc11_] = _loc12_ + param3;
               }
               return _loc12_;
            default:
               Boot.§_-B2g§ = new Error();
               throw hscript.Error.EInvalidOp(param3 > 0 ? "++" : "--");
         }
      }
      
      public function get(param1:*, param2:String) : *
      {
         if(param1 == null)
         {
            Boot.§_-B2g§ = new Error();
            throw hscript.Error.EInvalidAccess(param2);
         }
         return §_-53k§.field(param1,param2);
      }
      
      public function §_-r1O§(param1:String, param2:§_-52O§, param3:§_-52O§) : void
      {
         var _loc7_:* = null as §_-i2C§;
         var _loc5_:int = int(§_-a2I§.length);
         §_-a2I§.push({
            "n":param1,
            "old":§_-52n§.get(param1)
         });
         var _loc6_:* = §_-7T§(§_-QV§(param2));
         loop0:
         while(_loc6_.hasNext())
         {
            §_-52n§.set(param1,{"r":_loc6_.next()});
            try
            {
               §_-QV§(param3);
            }
            catch(_loc_e_:§_-i2C§)
            {
               _loc7_ = _loc_e_;
               switch(_loc7_.index)
               {
                  case 0:
                     break loop0;
                  case 1:
                     break;
                  case 2:
                     Boot.§_-B2g§ = new Error();
                     throw _loc7_;
               }
            }
         }
         §_-U12§(_loc5_);
      }
      
      public function §_-o2g§(param1:§_-52O§) : *
      {
         var _loc3_:* = null as §_-i2C§;
         var _loc4_:* = null as Array;
         var _loc5_:* = null;
         try
         {
            return §_-QV§(param1);
         }
         catch(_loc_e_:§_-i2C§)
         {
            _loc3_ = _loc_e_;
            var _temp_1:* = _loc3_;
            _loc4_ = _temp_1.params;
            switch(_temp_1.index)
            {
               case 0:
                  Boot.§_-B2g§ = new Error();
                  throw "Invalid break";
               case 1:
                  Boot.§_-B2g§ = new Error();
                  throw "Invalid continue";
               case 2:
                  return _loc4_[0];
               default:
                  return null;
            }
         }
      }
      
      public function §_-QV§(param1:§_-52O§) : *
      {
         var me:§_-y2D§;
         var capturedLocals:§_-WD§;
         var fexpr:§_-52O§;
         var params:Array;
         var _loc4_:* = null as §_-92J§;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:* = null as String;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null as §_-52O§;
         var _loc12_:int = 0;
         var _loc13_:* = null as §_-52O§;
         var _loc14_:Boolean = false;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc17_:* = null as Array;
         var _loc18_:* = null as §_-52O§;
         var _loc19_:* = null as Function;
         var _loc20_:* = null as §_-i2C§;
         var _temp_1:* = param1;
         var _loc3_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 0:
               _loc4_ = _loc3_[0];
               var _temp_2:* = _loc4_;
               _loc5_ = _temp_2.params;
               switch(_temp_2.index)
               {
                  case 0:
                     return int(_loc5_[0]);
                  case 1:
                     return Number(_loc5_[0]);
                  case 2:
                     return _loc5_[0];
                  case 3:
                     return int(_loc5_[0]);
               }
               break;
            case 1:
               _loc8_ = _loc3_[0];
               _loc9_ = Type.resolveClass(§_-m13§.replace(_loc8_,"_","."));
               if(_loc9_ != null)
               {
                  return _loc9_;
               }
               _loc10_ = §_-52n§.get(_loc8_);
               if(_loc10_ != null)
               {
                  return _loc10_.r;
               }
               _loc9_ = variables.get(_loc8_);
               if(_loc9_ == null && !variables.§_-UV§(_loc8_))
               {
                  Boot.§_-B2g§ = new Error();
                  throw hscript.Error.EUnknownVariable(_loc8_);
               }
               return _loc9_;
               break;
            case 2:
               _loc8_ = _loc3_[0];
               _loc11_ = _loc3_[2];
               §_-a2I§.push({
                  "n":_loc8_,
                  "old":§_-52n§.get(_loc8_)
               });
               §_-52n§.set(_loc8_,{"r":(_loc11_ == null ? null : §_-QV§(_loc11_))});
               return null;
            case 3:
               _loc11_ = _loc3_[0];
               return §_-QV§(_loc11_);
            case 4:
               _loc5_ = _loc3_[0];
               _loc6_ = int(§_-a2I§.length);
               _loc9_ = null;
               _loc12_ = 0;
               while(_loc12_ < int(_loc5_.length))
               {
                  _loc11_ = _loc5_[_loc12_];
                  _loc12_++;
                  _loc9_ = §_-QV§(_loc11_);
               }
               §_-U12§(_loc6_);
               return _loc9_;
            case 5:
               _loc11_ = _loc3_[0];
               _loc8_ = _loc3_[1];
               return get(§_-QV§(_loc11_),_loc8_);
            case 6:
               _loc8_ = _loc3_[0];
               _loc11_ = _loc3_[1];
               _loc13_ = _loc3_[2];
               _loc9_ = §_-X2K§.get(_loc8_);
               if(_loc9_ == null)
               {
                  Boot.§_-B2g§ = new Error();
                  throw hscript.Error.EInvalidOp(_loc8_);
               }
               return _loc9_(_loc11_,_loc13_);
               break;
            case 7:
               _loc8_ = _loc3_[0];
               _loc14_ = Boolean(_loc3_[1]);
               _loc11_ = _loc3_[2];
               _loc15_ = _loc8_;
               if(_loc15_ == "!")
               {
                  return §_-QV§(_loc11_) != true;
               }
               if(_loc15_ == "-")
               {
                  return -§_-QV§(_loc11_);
               }
               if(_loc15_ == "++")
               {
                  return §_-R2r§(_loc11_,_loc14_,1);
               }
               if(_loc15_ == "--")
               {
                  return §_-R2r§(_loc11_,_loc14_,-1);
               }
               if(_loc15_ == "~")
               {
                  return ~§_-QV§(_loc11_);
               }
               Boot.§_-B2g§ = new Error();
               throw hscript.Error.EInvalidOp(_loc8_);
               break;
            case 8:
               _loc11_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               _loc16_ = [];
               _loc6_ = 0;
               while(_loc6_ < int(_loc5_.length))
               {
                  _loc13_ = _loc5_[_loc6_];
                  _loc6_++;
                  _loc16_.push(§_-QV§(_loc13_));
               }
               var _temp_3:* = _loc11_;
               _loc17_ = _temp_3.params;
               switch(_temp_3.index)
               {
                  case 5:
                     _loc13_ = _loc17_[0];
                     _loc8_ = _loc17_[1];
                     _loc9_ = §_-QV§(_loc13_);
                     if(_loc9_ == null)
                     {
                        Boot.§_-B2g§ = new Error();
                        throw hscript.Error.EInvalidAccess(_loc8_);
                     }
                     return call(_loc9_,§_-53k§.field(_loc9_,_loc8_),_loc16_);
                     break;
                  default:
                     return call(null,§_-QV§(_loc11_),_loc16_);
               }
               break;
            case 9:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               _loc18_ = _loc3_[2];
               return §_-QV§(_loc11_) == true ? §_-QV§(_loc13_) : (_loc18_ == null ? null : §_-QV§(_loc18_));
            case 10:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               §_-VE§(_loc11_,_loc13_);
               return null;
            case 11:
               _loc8_ = _loc3_[0];
               _loc11_ = _loc3_[1];
               _loc13_ = _loc3_[2];
               §_-r1O§(_loc8_,_loc11_,_loc13_);
               return null;
            case 12:
               Boot.§_-B2g§ = new Error();
               throw §_-i2C§.SBreak;
            case 13:
               Boot.§_-B2g§ = new Error();
               throw §_-i2C§.SContinue;
            case 14:
               params = _loc3_[0];
               fexpr = _loc3_[1];
               _loc8_ = _loc3_[2];
               capturedLocals = §_-43i§(§_-52n§);
               me = this;
               _loc19_ = function(param1:Array):*
               {
                  var _loc6_:int = 0;
                  var _loc8_:* = null;
                  if(int(param1.length) != int(params.length))
                  {
                     Boot.§_-B2g§ = new Error();
                     throw "Invalid number of parameters";
                  }
                  var _loc3_:§_-WD§ = me.§_-52n§;
                  me.§_-52n§ = me.§_-43i§(capturedLocals);
                  var _loc4_:int = 0;
                  var _loc5_:int = int(params.length);
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_ = _loc4_++;
                     me.§_-52n§.set(params[_loc6_].name,{"r":param1[_loc6_]});
                  }
                  var _loc7_:* = null;
                  try
                  {
                     _loc7_ = me.§_-o2g§(fexpr);
                  }
                  catch(_loc_e_:*)
                  {
                     me.§_-52n§ = _loc3_;
                     Boot.§_-B2g§ = new Error();
                     throw _loc8_;
                  }
                  me.§_-52n§ = _loc3_;
                  return _loc7_;
               };
               _loc9_ = §_-53k§.§_-79§(_loc19_);
               if(_loc8_ != null)
               {
                  variables.set(_loc8_,_loc9_);
               }
               return _loc9_;
            case 15:
               _loc11_ = _loc3_[0];
               Boot.§_-B2g§ = new Error();
               throw §_-i2C§.SReturn(_loc11_ == null ? null : §_-QV§(_loc11_));
            case 16:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               return §_-QV§(_loc11_)[§_-QV§(_loc13_)];
            case 17:
               _loc5_ = _loc3_[0];
               _loc16_ = [];
               _loc6_ = 0;
               while(_loc6_ < int(_loc5_.length))
               {
                  _loc11_ = _loc5_[_loc6_];
                  _loc6_++;
                  _loc16_.push(§_-QV§(_loc11_));
               }
               return _loc16_;
            case 18:
               _loc8_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               _loc16_ = [];
               _loc6_ = 0;
               while(_loc6_ < int(_loc5_.length))
               {
                  _loc11_ = _loc5_[_loc6_];
                  _loc6_++;
                  _loc16_.push(§_-QV§(_loc11_));
               }
               return §_-23z§(_loc8_,_loc16_);
            case 19:
               _loc11_ = _loc3_[0];
               Boot.§_-B2g§ = new Error();
               throw §_-QV§(_loc11_);
            case 20:
               _loc11_ = _loc3_[0];
               _loc8_ = _loc3_[1];
               _loc13_ = _loc3_[3];
               _loc6_ = int(§_-a2I§.length);
               try
               {
                  try
                  {
                     _loc9_ = §_-QV§(_loc11_);
                     §_-U12§(_loc6_);
                     return _loc9_;
                  }
                  catch(_loc_e_:§_-i2C§)
                  {
                     _loc20_ = _loc_e_;
                     Boot.§_-B2g§ = new Error();
                     throw _loc20_;
                  }
               }
               catch(_loc_e_:*)
               {
                  §_-U12§(_loc6_);
                  §_-a2I§.push({
                     "n":_loc8_,
                     "old":§_-52n§.get(_loc8_)
                  });
                  §_-52n§.set(_loc8_,{"r":_loc9_});
                  _loc10_ = §_-QV§(_loc13_);
                  §_-U12§(_loc6_);
                  return _loc10_;
               }
               break;
            case 21:
               _loc5_ = _loc3_[0];
               _loc9_ = {};
               _loc6_ = 0;
               while(_loc6_ < int(_loc5_.length))
               {
                  _loc10_ = _loc5_[_loc6_];
                  _loc6_++;
                  set(_loc9_,_loc10_.name,§_-QV§(_loc10_.e));
               }
               return _loc9_;
            case 22:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               _loc18_ = _loc3_[2];
               return §_-QV§(_loc11_) == true ? §_-QV§(_loc13_) : §_-QV§(_loc18_);
         }
         return null;
      }
      
      public function execute(param1:§_-52O§) : *
      {
         §_-52n§ = new §_-WD§();
         return §_-o2g§(param1);
      }
      
      public function §_-s16§(param1:String, param2:Function, param3:§_-52O§, param4:§_-52O§) : *
      {
         var _loc5_:* = null;
         var _loc7_:* = null as String;
         var _loc8_:* = null;
         var _loc9_:* = null as §_-52O§;
         var _loc10_:* = null as §_-52O§;
         var _loc11_:* = null as Array;
         var _loc12_:int = 0;
         var _temp_1:* = param3;
         var _loc6_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc7_ = _loc6_[0];
               _loc8_ = §_-52n§.get(_loc7_);
               _loc5_ = param2(§_-QV§(param3),§_-QV§(param4));
               if(_loc8_ == null)
               {
                  variables.set(_loc7_,_loc5_);
               }
               else
               {
                  _loc8_.r = _loc5_;
               }
               break;
            case 5:
               _loc9_ = _loc6_[0];
               _loc7_ = _loc6_[1];
               _loc8_ = §_-QV§(_loc9_);
               _loc5_ = param2(get(_loc8_,_loc7_),§_-QV§(param4));
               _loc5_ = set(_loc8_,_loc7_,_loc5_);
               break;
            case 16:
               _loc9_ = _loc6_[0];
               _loc10_ = _loc6_[1];
               _loc11_ = §_-QV§(_loc9_);
               _loc12_ = §_-QV§(_loc10_);
               _loc5_ = param2(_loc11_[_loc12_],§_-QV§(param4));
               _loc11_[_loc12_] = _loc5_;
               break;
            default:
               Boot.§_-B2g§ = new Error();
               throw hscript.Error.EInvalidOp(param1);
         }
         return _loc5_;
      }
      
      public function §_-43i§(param1:§_-WD§) : §_-WD§
      {
         var _loc4_:* = null as String;
         var _loc2_:§_-WD§ = new §_-WD§();
         var _loc3_:* = param1.§_-H2g§();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            _loc2_.set(_loc4_,param1.get(_loc4_));
         }
         return _loc2_;
      }
      
      public function §_-23z§(param1:String, param2:Array) : *
      {
         return Type.§_-b2u§(Type.resolveClass(param1),param2);
      }
      
      public function call(param1:*, param2:*, param3:Array) : *
      {
         return param2.apply(param1,param3);
      }
      
      public function §_-R28§(param1:String, param2:Function) : void
      {
         var op:String = param1;
         var fop:Function = param2;
         var me:§_-y2D§ = this;
         §_-X2K§.set(op,function(param1:§_-52O§, param2:§_-52O§):*
         {
            return me.§_-s16§(op,fop,param1,param2);
         });
      }
      
      public function §_-A1e§(param1:§_-52O§, param2:§_-52O§) : *
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null;
         var _loc7_:* = null as §_-52O§;
         var _loc8_:* = null as §_-52O§;
         var _loc3_:* = §_-QV§(param2);
         var _temp_1:* = param1;
         var _loc4_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc5_ = _loc4_[0];
               _loc6_ = §_-52n§.get(_loc5_);
               if(_loc6_ == null)
               {
                  variables.set(_loc5_,_loc3_);
               }
               else
               {
                  _loc6_.r = _loc3_;
               }
               break;
            case 5:
               _loc7_ = _loc4_[0];
               _loc5_ = _loc4_[1];
               _loc3_ = set(§_-QV§(_loc7_),_loc5_,_loc3_);
               break;
            case 16:
               _loc7_ = _loc4_[0];
               _loc8_ = _loc4_[1];
               §_-QV§(_loc7_)[§_-QV§(_loc8_)] = _loc3_;
               break;
            default:
               Boot.§_-B2g§ = new Error();
               throw hscript.Error.EInvalidOp("=");
         }
         return _loc3_;
      }
   }
}

