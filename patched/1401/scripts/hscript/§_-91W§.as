package hscript
{
   import §_-k11§.§_-E2d§;
   import §_-y1v§.§_-M2N§;
   import flash.Boot;
   
   public class §_-91W§
   {
      
      public var variables:§_-n6§;
      
      public var §_-W§:§_-n6§;
      
      public var §_-m26§:Array;
      
      public var §_-92U§:§_-n6§;
      
      public function §_-91W§()
      {
         if(Boot.§_-s2I§)
         {
            return;
         }
         §_-W§ = new §_-n6§();
         §_-m26§ = [];
         variables = new §_-n6§();
         variables.set("null",null);
         variables.set("true",true);
         variables.set("false",false);
         variables.set("trace",function(param1:*):void
         {
            §_-M2N§.trace(§_-630§.string(param1),{
               "fileName":"hscript",
               "lineNumber":0
            });
         });
         §_-7V§();
      }
      
      public function §_-u14§(param1:§_-eu§, param2:§_-eu§) : void
      {
         var _loc5_:* = null as §_-E2d§;
         var _loc4_:int = int(§_-m26§.length);
         loop0:
         while(§_-73I§(param1) == true)
         {
            try
            {
               §_-73I§(param2);
            }
            catch(_loc_e_:§_-E2d§)
            {
               _loc5_ = _loc_e_;
               switch(_loc5_.index)
               {
                  case 0:
                     break loop0;
                  case 1:
                     break;
                  case 2:
                     Boot.§_-tp§ = new Error();
                     throw _loc5_;
               }
            }
         }
         §_-42F§(_loc4_);
      }
      
      public function set(param1:*, param2:String, param3:*) : *
      {
         if(param1 == null)
         {
            Boot.§_-tp§ = new Error();
            throw hscript.Error.EInvalidAccess(param2);
         }
         param1[param2] = param3;
         return param3;
      }
      
      public function §_-42F§(param1:int) : void
      {
         var _loc2_:* = null;
         while(int(§_-m26§.length) > param1)
         {
            _loc2_ = §_-m26§.pop();
            §_-W§.set(_loc2_.n,_loc2_.old);
         }
      }
      
      public function §_-tX§(param1:*) : Object
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
               Boot.§_-tp§ = new Error();
               throw hscript.Error.EInvalidIterator(param1);
            }
            return param1;
         }
      }
      
      public function §_-7V§() : void
      {
         var me:§_-91W§ = this;
         §_-92U§ = new §_-n6§();
         §_-92U§.set("+",function(param1:§_-eu§, param2:§_-eu§):*
         {
            return me.§_-73I§(param1) + me.§_-73I§(param2);
         });
         §_-92U§.set("-",function(param1:§_-eu§, param2:§_-eu§):Number
         {
            return me.§_-73I§(param1) - me.§_-73I§(param2);
         });
         §_-92U§.set("*",function(param1:§_-eu§, param2:§_-eu§):Number
         {
            return me.§_-73I§(param1) * me.§_-73I§(param2);
         });
         §_-92U§.set("/",function(param1:§_-eu§, param2:§_-eu§):Number
         {
            return me.§_-73I§(param1) / me.§_-73I§(param2);
         });
         §_-92U§.set("%",function(param1:§_-eu§, param2:§_-eu§):Number
         {
            return me.§_-73I§(param1) % me.§_-73I§(param2);
         });
         §_-92U§.set("&",function(param1:§_-eu§, param2:§_-eu§):int
         {
            return me.§_-73I§(param1) & me.§_-73I§(param2);
         });
         §_-92U§.set("|",function(param1:§_-eu§, param2:§_-eu§):int
         {
            return me.§_-73I§(param1) | me.§_-73I§(param2);
         });
         §_-92U§.set("^",function(param1:§_-eu§, param2:§_-eu§):int
         {
            return me.§_-73I§(param1) ^ me.§_-73I§(param2);
         });
         §_-92U§.set("<<",function(param1:§_-eu§, param2:§_-eu§):int
         {
            return me.§_-73I§(param1) << me.§_-73I§(param2);
         });
         §_-92U§.set(">>",function(param1:§_-eu§, param2:§_-eu§):int
         {
            return me.§_-73I§(param1) >> me.§_-73I§(param2);
         });
         §_-92U§.set(">>>",function(param1:§_-eu§, param2:§_-eu§):int
         {
            return me.§_-73I§(param1) >>> me.§_-73I§(param2);
         });
         §_-92U§.set("==",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) == me.§_-73I§(param2);
         });
         §_-92U§.set("!=",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) != me.§_-73I§(param2);
         });
         §_-92U§.set(">=",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) >= me.§_-73I§(param2);
         });
         §_-92U§.set("<=",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) <= me.§_-73I§(param2);
         });
         §_-92U§.set(">",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) > me.§_-73I§(param2);
         });
         §_-92U§.set("<",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) < me.§_-73I§(param2);
         });
         §_-92U§.set("||",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) == true || me.§_-73I§(param2) == true;
         });
         §_-92U§.set("&&",function(param1:§_-eu§, param2:§_-eu§):Boolean
         {
            return me.§_-73I§(param1) == true && me.§_-73I§(param2) == true;
         });
         §_-92U§.set("=",§_-1f§);
         §_-92U§.set("...",function(param1:§_-eu§, param2:§_-eu§):IntIter
         {
            return new IntIter(me.§_-73I§(param1),me.§_-73I§(param2));
         });
         §_-P0§("+=",function(param1:*, param2:*):*
         {
            return param1 + param2;
         });
         §_-P0§("-=",function(param1:Number, param2:Number):Number
         {
            return param1 - param2;
         });
         §_-P0§("*=",function(param1:Number, param2:Number):Number
         {
            return param1 * param2;
         });
         §_-P0§("/=",function(param1:Number, param2:Number):Number
         {
            return param1 / param2;
         });
         §_-P0§("%=",function(param1:Number, param2:Number):Number
         {
            return param1 % param2;
         });
         §_-P0§("&=",function(param1:int, param2:int):int
         {
            return param1 & param2;
         });
         §_-P0§("|=",function(param1:int, param2:int):int
         {
            return param1 | param2;
         });
         §_-P0§("^=",function(param1:int, param2:int):int
         {
            return param1 ^ param2;
         });
         §_-P0§("<<=",function(param1:int, param2:int):int
         {
            return param1 << param2;
         });
         §_-P0§(">>=",function(param1:int, param2:int):int
         {
            return param1 >> param2;
         });
         §_-P0§(">>>=",function(param1:int, param2:int):int
         {
            return param1 >>> param2;
         });
      }
      
      public function §_-83g§(param1:§_-eu§, param2:Boolean, param3:int) : *
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null as §_-eu§;
         var _loc9_:* = null as §_-eu§;
         var _loc10_:* = null as Array;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _temp_1:* = param1;
         var _loc4_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc5_ = _loc4_[0];
               _loc6_ = §_-W§.get(_loc5_);
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
               _loc6_ = §_-73I§(_loc8_);
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
               _loc10_ = §_-73I§(_loc8_);
               _loc11_ = §_-73I§(_loc9_);
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
               Boot.§_-tp§ = new Error();
               throw hscript.Error.EInvalidOp(param3 > 0 ? "++" : "--");
         }
      }
      
      public function get(param1:*, param2:String) : *
      {
         if(param1 == null)
         {
            Boot.§_-tp§ = new Error();
            throw hscript.Error.EInvalidAccess(param2);
         }
         return §_-h1J§.field(param1,param2);
      }
      
      public function §_-L2o§(param1:String, param2:§_-eu§, param3:§_-eu§) : void
      {
         var _loc7_:* = null as §_-E2d§;
         var _loc5_:int = int(§_-m26§.length);
         §_-m26§.push({
            "n":param1,
            "old":§_-W§.get(param1)
         });
         var _loc6_:* = §_-tX§(§_-73I§(param2));
         loop0:
         while(_loc6_.hasNext())
         {
            §_-W§.set(param1,{"r":_loc6_.next()});
            try
            {
               §_-73I§(param3);
            }
            catch(_loc_e_:§_-E2d§)
            {
               _loc7_ = _loc_e_;
               switch(_loc7_.index)
               {
                  case 0:
                     break loop0;
                  case 1:
                     break;
                  case 2:
                     Boot.§_-tp§ = new Error();
                     throw _loc7_;
               }
            }
         }
         §_-42F§(_loc5_);
      }
      
      public function §_-w28§(param1:§_-eu§) : *
      {
         var _loc3_:* = null as §_-E2d§;
         var _loc4_:* = null as Array;
         var _loc5_:* = null;
         try
         {
            return §_-73I§(param1);
         }
         catch(_loc_e_:§_-E2d§)
         {
            _loc3_ = _loc_e_;
            var _temp_1:* = _loc3_;
            _loc4_ = _temp_1.params;
            switch(_temp_1.index)
            {
               case 0:
                  Boot.§_-tp§ = new Error();
                  throw "Invalid break";
               case 1:
                  Boot.§_-tp§ = new Error();
                  throw "Invalid continue";
               case 2:
                  return _loc4_[0];
               default:
                  return null;
            }
         }
      }
      
      public function §_-73I§(param1:§_-eu§) : *
      {
         var me:§_-91W§;
         var capturedLocals:§_-n6§;
         var fexpr:§_-eu§;
         var params:Array;
         var _loc4_:* = null as §_-g1n§;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:* = null as String;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null as §_-eu§;
         var _loc12_:int = 0;
         var _loc13_:* = null as §_-eu§;
         var _loc14_:Boolean = false;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc17_:* = null as Array;
         var _loc18_:* = null as §_-eu§;
         var _loc19_:* = null as Function;
         var _loc20_:* = null as §_-E2d§;
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
               _loc9_ = Type.resolveClass(§_-y6§.replace(_loc8_,"_","."));
               if(_loc9_ != null)
               {
                  return _loc9_;
               }
               _loc10_ = §_-W§.get(_loc8_);
               if(_loc10_ != null)
               {
                  return _loc10_.r;
               }
               _loc9_ = variables.get(_loc8_);
               if(_loc9_ == null && !variables.§_-Da§(_loc8_))
               {
                  Boot.§_-tp§ = new Error();
                  throw hscript.Error.EUnknownVariable(_loc8_);
               }
               return _loc9_;
               break;
            case 2:
               _loc8_ = _loc3_[0];
               _loc11_ = _loc3_[2];
               §_-m26§.push({
                  "n":_loc8_,
                  "old":§_-W§.get(_loc8_)
               });
               §_-W§.set(_loc8_,{"r":(_loc11_ == null ? null : §_-73I§(_loc11_))});
               return null;
            case 3:
               _loc11_ = _loc3_[0];
               return §_-73I§(_loc11_);
            case 4:
               _loc5_ = _loc3_[0];
               _loc6_ = int(§_-m26§.length);
               _loc9_ = null;
               _loc12_ = 0;
               while(_loc12_ < int(_loc5_.length))
               {
                  _loc11_ = _loc5_[_loc12_];
                  _loc12_++;
                  _loc9_ = §_-73I§(_loc11_);
               }
               §_-42F§(_loc6_);
               return _loc9_;
            case 5:
               _loc11_ = _loc3_[0];
               _loc8_ = _loc3_[1];
               return get(§_-73I§(_loc11_),_loc8_);
            case 6:
               _loc8_ = _loc3_[0];
               _loc11_ = _loc3_[1];
               _loc13_ = _loc3_[2];
               _loc9_ = §_-92U§.get(_loc8_);
               if(_loc9_ == null)
               {
                  Boot.§_-tp§ = new Error();
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
                  return §_-73I§(_loc11_) != true;
               }
               if(_loc15_ == "-")
               {
                  return -§_-73I§(_loc11_);
               }
               if(_loc15_ == "++")
               {
                  return §_-83g§(_loc11_,_loc14_,1);
               }
               if(_loc15_ == "--")
               {
                  return §_-83g§(_loc11_,_loc14_,-1);
               }
               if(_loc15_ == "~")
               {
                  return ~§_-73I§(_loc11_);
               }
               Boot.§_-tp§ = new Error();
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
                  _loc16_.push(§_-73I§(_loc13_));
               }
               var _temp_3:* = _loc11_;
               _loc17_ = _temp_3.params;
               switch(_temp_3.index)
               {
                  case 5:
                     _loc13_ = _loc17_[0];
                     _loc8_ = _loc17_[1];
                     _loc9_ = §_-73I§(_loc13_);
                     if(_loc9_ == null)
                     {
                        Boot.§_-tp§ = new Error();
                        throw hscript.Error.EInvalidAccess(_loc8_);
                     }
                     return call(_loc9_,§_-h1J§.field(_loc9_,_loc8_),_loc16_);
                     break;
                  default:
                     return call(null,§_-73I§(_loc11_),_loc16_);
               }
               break;
            case 9:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               _loc18_ = _loc3_[2];
               return §_-73I§(_loc11_) == true ? §_-73I§(_loc13_) : (_loc18_ == null ? null : §_-73I§(_loc18_));
            case 10:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               §_-u14§(_loc11_,_loc13_);
               return null;
            case 11:
               _loc8_ = _loc3_[0];
               _loc11_ = _loc3_[1];
               _loc13_ = _loc3_[2];
               §_-L2o§(_loc8_,_loc11_,_loc13_);
               return null;
            case 12:
               Boot.§_-tp§ = new Error();
               throw §_-E2d§.SBreak;
            case 13:
               Boot.§_-tp§ = new Error();
               throw §_-E2d§.SContinue;
            case 14:
               params = _loc3_[0];
               fexpr = _loc3_[1];
               _loc8_ = _loc3_[2];
               capturedLocals = §_-i2G§(§_-W§);
               me = this;
               _loc19_ = function(param1:Array):*
               {
                  var _loc6_:int = 0;
                  var _loc8_:* = null;
                  if(int(param1.length) != int(params.length))
                  {
                     Boot.§_-tp§ = new Error();
                     throw "Invalid number of parameters";
                  }
                  var _loc3_:§_-n6§ = me.§_-W§;
                  me.§_-W§ = me.§_-i2G§(capturedLocals);
                  var _loc4_:int = 0;
                  var _loc5_:int = int(params.length);
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_ = _loc4_++;
                     me.§_-W§.set(params[_loc6_].name,{"r":param1[_loc6_]});
                  }
                  var _loc7_:* = null;
                  try
                  {
                     _loc7_ = me.§_-w28§(fexpr);
                  }
                  catch(_loc_e_:*)
                  {
                     me.§_-W§ = _loc3_;
                     Boot.§_-tp§ = new Error();
                     throw _loc8_;
                  }
                  me.§_-W§ = _loc3_;
                  return _loc7_;
               };
               _loc9_ = §_-h1J§.§_-82D§(_loc19_);
               if(_loc8_ != null)
               {
                  variables.set(_loc8_,_loc9_);
               }
               return _loc9_;
            case 15:
               _loc11_ = _loc3_[0];
               Boot.§_-tp§ = new Error();
               throw §_-E2d§.SReturn(_loc11_ == null ? null : §_-73I§(_loc11_));
            case 16:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               return §_-73I§(_loc11_)[§_-73I§(_loc13_)];
            case 17:
               _loc5_ = _loc3_[0];
               _loc16_ = [];
               _loc6_ = 0;
               while(_loc6_ < int(_loc5_.length))
               {
                  _loc11_ = _loc5_[_loc6_];
                  _loc6_++;
                  _loc16_.push(§_-73I§(_loc11_));
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
                  _loc16_.push(§_-73I§(_loc11_));
               }
               return §_-Y1g§(_loc8_,_loc16_);
            case 19:
               _loc11_ = _loc3_[0];
               Boot.§_-tp§ = new Error();
               throw §_-73I§(_loc11_);
            case 20:
               _loc11_ = _loc3_[0];
               _loc8_ = _loc3_[1];
               _loc13_ = _loc3_[3];
               _loc6_ = int(§_-m26§.length);
               try
               {
                  try
                  {
                     _loc9_ = §_-73I§(_loc11_);
                     §_-42F§(_loc6_);
                     return _loc9_;
                  }
                  catch(_loc_e_:§_-E2d§)
                  {
                     _loc20_ = _loc_e_;
                     Boot.§_-tp§ = new Error();
                     throw _loc20_;
                  }
               }
               catch(_loc_e_:*)
               {
                  §_-42F§(_loc6_);
                  §_-m26§.push({
                     "n":_loc8_,
                     "old":§_-W§.get(_loc8_)
                  });
                  §_-W§.set(_loc8_,{"r":_loc9_});
                  _loc10_ = §_-73I§(_loc13_);
                  §_-42F§(_loc6_);
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
                  set(_loc9_,_loc10_.name,§_-73I§(_loc10_.e));
               }
               return _loc9_;
            case 22:
               _loc11_ = _loc3_[0];
               _loc13_ = _loc3_[1];
               _loc18_ = _loc3_[2];
               return §_-73I§(_loc11_) == true ? §_-73I§(_loc13_) : §_-73I§(_loc18_);
         }
         return null;
      }
      
      public function execute(param1:§_-eu§) : *
      {
         §_-W§ = new §_-n6§();
         return §_-w28§(param1);
      }
      
      public function §_-n2R§(param1:String, param2:Function, param3:§_-eu§, param4:§_-eu§) : *
      {
         var _loc5_:* = null;
         var _loc7_:* = null as String;
         var _loc8_:* = null;
         var _loc9_:* = null as §_-eu§;
         var _loc10_:* = null as §_-eu§;
         var _loc11_:* = null as Array;
         var _loc12_:int = 0;
         var _temp_1:* = param3;
         var _loc6_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc7_ = _loc6_[0];
               _loc8_ = §_-W§.get(_loc7_);
               _loc5_ = param2(§_-73I§(param3),§_-73I§(param4));
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
               _loc8_ = §_-73I§(_loc9_);
               _loc5_ = param2(get(_loc8_,_loc7_),§_-73I§(param4));
               _loc5_ = set(_loc8_,_loc7_,_loc5_);
               break;
            case 16:
               _loc9_ = _loc6_[0];
               _loc10_ = _loc6_[1];
               _loc11_ = §_-73I§(_loc9_);
               _loc12_ = §_-73I§(_loc10_);
               _loc5_ = param2(_loc11_[_loc12_],§_-73I§(param4));
               _loc11_[_loc12_] = _loc5_;
               break;
            default:
               Boot.§_-tp§ = new Error();
               throw hscript.Error.EInvalidOp(param1);
         }
         return _loc5_;
      }
      
      public function §_-i2G§(param1:§_-n6§) : §_-n6§
      {
         var _loc4_:* = null as String;
         var _loc2_:§_-n6§ = new §_-n6§();
         var _loc3_:* = param1.§_-W2L§();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            _loc2_.set(_loc4_,param1.get(_loc4_));
         }
         return _loc2_;
      }
      
      public function §_-Y1g§(param1:String, param2:Array) : *
      {
         return Type.§_-8D§(Type.resolveClass(param1),param2);
      }
      
      public function call(param1:*, param2:*, param3:Array) : *
      {
         return param2.apply(param1,param3);
      }
      
      public function §_-P0§(param1:String, param2:Function) : void
      {
         var op:String = param1;
         var fop:Function = param2;
         var me:§_-91W§ = this;
         §_-92U§.set(op,function(param1:§_-eu§, param2:§_-eu§):*
         {
            return me.§_-n2R§(op,fop,param1,param2);
         });
      }
      
      public function §_-1f§(param1:§_-eu§, param2:§_-eu§) : *
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null;
         var _loc7_:* = null as §_-eu§;
         var _loc8_:* = null as §_-eu§;
         var _loc3_:* = §_-73I§(param2);
         var _temp_1:* = param1;
         var _loc4_:Array = _temp_1.params;
         switch(_temp_1.index)
         {
            case 1:
               _loc5_ = _loc4_[0];
               _loc6_ = §_-W§.get(_loc5_);
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
               _loc3_ = set(§_-73I§(_loc7_),_loc5_,_loc3_);
               break;
            case 16:
               _loc7_ = _loc4_[0];
               _loc8_ = _loc4_[1];
               §_-73I§(_loc7_)[§_-73I§(_loc8_)] = _loc3_;
               break;
            default:
               Boot.§_-tp§ = new Error();
               throw hscript.Error.EInvalidOp("=");
         }
         return _loc3_;
      }
   }
}

