package
{
   import §_-X1k§.§_-HZ§;
   
   public class §_-Qw§
   {
      
      private static const §_-d2p§:String = "(?:^|[^A-Za-zА-Яа-яЁё])";
      
      private static const §_-vu§:String = "(?=$|[^A-Za-zА-Яа-яЁё])";
      
      private static const §_-M24§:String = "\\^$.|?*+()[]{}/";
      
      private static const §_-23L§:RegExp = /[A-Za-zА-ЯЁа-яё]/;
      
      private static const §_-F2j§:RegExp = /[A-Za-z]/;
      
      private static const §_-A2g§:RegExp = /[Ѐ-ӿ]/;
      
      private static const §_-S15§:RegExp = /[̀-ͯ]/;
      
      private static const §_-z1S§:RegExp = /\s/;
      
      private static var §_-j2N§:Object = {};
      
      private static var §_-TT§:Array = [];
      
      private static var §_-p29§:Array = [];
      
      private static var §_-u21§:Boolean = false;
      
      public function §_-Qw§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc2_:String = null;
         var _loc3_:RegExp = null;
         var _loc1_:Object = §_-HZ§.§_-q1z§;
         §_-u21§ = false;
         §_-j2N§ = {};
         §_-TT§ = [];
         §_-p29§ = [];
         if(!_loc1_ || !_loc1_.chars || !_loc1_.dictionary)
         {
            return;
         }
         §_-L20§(_loc1_.chars);
         for each(_loc2_ in _loc1_.dictionary)
         {
            _loc3_ = §_-v2e§(_loc2_);
            if(_loc3_)
            {
               §_-TT§.push(_loc3_);
               §_-p29§.push(§_-s1P§(_loc2_));
            }
         }
         §_-u21§ = true;
      }
      
      public static function §_-L16§(param1:String) : Boolean
      {
         return !param1 || §_-u21§ && §_-oR§(param1) == null;
      }
      
      public static function §_-73w§(param1:String) : String
      {
         if(!Game.toggle)
         {
            return param1;
         }
         var _loc4_:Object = null;
         if(!param1 || !§_-u21§)
         {
            return param1;
         }
         var _loc2_:String = param1;
         var _loc3_:* = 0;
         while(_loc3_++ < 64)
         {
            _loc4_ = §_-oR§(_loc2_);
            if(!_loc4_)
            {
               break;
            }
            _loc2_ = _loc2_.substring(0,_loc4_.start) + _loc2_.substring(_loc4_.end);
         }
         return _loc2_;
      }
      
      private static function §_-oR§(param1:String) : Object
      {
         var _loc5_:RegExp = null;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Object = normalize(param1);
         var _loc3_:Boolean = !_loc2_.hasCyrillic;
         var _loc4_:int = 0;
         while(_loc4_ < §_-TT§.length)
         {
            if(!(_loc3_ && Boolean(§_-p29§[_loc4_])))
            {
               _loc5_ = §_-TT§[_loc4_];
               _loc5_.lastIndex = 0;
               _loc6_ = _loc5_.exec(_loc2_.text);
               if(!(!_loc6_ || !_loc6_[1]))
               {
                  _loc7_ = _loc6_.index + _loc6_[0].length;
                  _loc8_ = _loc7_ - _loc6_[1].length;
                  return {
                     "start":_loc2_.starts[_loc8_],
                     "end":_loc2_.ends[_loc7_ - 1]
                  };
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private static function normalize(param1:String) : Object
      {
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         var _loc16_:Object = null;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:Array = null;
         var _loc5_:int = -1;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            _loc12_ = param1.charAt(_loc7_);
            if(§_-S15§.test(_loc12_))
            {
               if(Boolean(_loc4_) && _loc4_.length > 0)
               {
                  _loc4_[_loc4_.length - 1].end = _loc7_ + 1;
               }
               _loc7_++;
            }
            else
            {
               _loc13_ = 1;
               _loc14_ = null;
               if(_loc7_ + 1 < param1.length)
               {
                  _loc14_ = §_-j2N§[param1.substr(_loc7_,2).toLowerCase()];
               }
               if(_loc14_)
               {
                  _loc13_ = 2;
               }
               else
               {
                  _loc14_ = §_-j2N§[_loc12_.toLowerCase()] || _loc12_.toLowerCase();
               }
               if(§_-71F§(_loc14_))
               {
                  if(!_loc4_)
                  {
                     if(_loc2_.length > 0)
                     {
                        _loc3_.push({
                           "start":_loc5_,
                           "end":_loc7_,
                           "hasSpace":_loc6_
                        });
                     }
                     _loc4_ = [];
                     _loc2_.push(_loc4_);
                  }
                  _loc15_ = 0;
                  while(_loc15_ < _loc14_.length)
                  {
                     _loc4_.push({
                        "text":_loc14_.charAt(_loc15_),
                        "start":_loc7_,
                        "end":_loc7_ + _loc13_
                     });
                     _loc15_++;
                  }
               }
               else
               {
                  if(_loc4_)
                  {
                     _loc4_ = null;
                     _loc5_ = _loc7_;
                     _loc6_ = false;
                  }
                  _loc6_ ||= §_-z1S§.test(_loc12_);
               }
               _loc7_ += _loc13_;
            }
         }
         _loc7_ = 0;
         while(_loc7_ < _loc2_.length)
         {
            _loc2_[_loc7_] = §_-PF§(_loc2_[_loc7_]);
            _loc7_++;
         }
         var _loc8_:String = "";
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:Boolean = false;
         _loc7_ = 0;
         while(_loc7_ < _loc2_.length)
         {
            if(_loc7_ > 0 && !§_-Q18§(_loc2_[_loc7_ - 1],_loc2_[_loc7_],_loc3_[_loc7_ - 1]))
            {
               _loc8_ += " ";
               _loc9_.push(_loc3_[_loc7_ - 1].start);
               _loc10_.push(_loc3_[_loc7_ - 1].end);
            }
            for each(_loc16_ in _loc2_[_loc7_])
            {
               _loc8_ += _loc16_.text;
               _loc9_.push(_loc16_.start);
               _loc10_.push(_loc16_.end);
               _loc11_ ||= §_-A2g§.test(_loc16_.text);
            }
            _loc7_++;
         }
         return {
            "text":_loc8_,
            "starts":_loc9_,
            "ends":_loc10_,
            "hasCyrillic":_loc11_
         };
      }
      
      private static function §_-PF§(param1:Array) : Array
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:* = 0;
         while(_loc3_ < param1.length)
         {
            if(§_-F2j§.test(param1[_loc3_].text) && _loc3_ > 0 && §_-A2g§.test(param1[_loc3_ - 1].text))
            {
               _loc5_ = _loc3_;
               while(_loc5_ < param1.length && §_-F2j§.test(param1[_loc5_].text))
               {
                  _loc5_++;
               }
               if(_loc5_ < param1.length && §_-A2g§.test(param1[_loc5_].text))
               {
                  _loc3_ = _loc5_;
                  continue;
               }
            }
            _loc4_ = param1[_loc3_++];
            if(_loc2_.length > 0 && _loc2_[_loc2_.length - 1].text == _loc4_.text)
            {
               _loc2_[_loc2_.length - 1].end = _loc4_.end;
            }
            else
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      private static function §_-Q18§(param1:Array, param2:Array, param3:Object) : Boolean
      {
         return param1.length <= 2 && param2.length <= 2 || !param3.hasSpace && (param1.length <= 2 || param2.length <= 2);
      }
      
      private static function §_-71F§(param1:String) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!§_-23L§.test(param1.charAt(_loc2_)))
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      private static function §_-L20§(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         for(_loc2_ in param1)
         {
            _loc3_ = _loc2_.toLowerCase();
            §_-j2N§[_loc3_] = _loc3_;
            for each(_loc4_ in param1[_loc2_])
            {
               _loc5_ = _loc4_.toLowerCase();
               if(!§_-j2N§[_loc5_])
               {
                  §_-j2N§[_loc5_] = _loc3_;
               }
            }
         }
      }
      
      private static function §_-v2e§(param1:String) : RegExp
      {
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:Object = null;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:String = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Boolean = param1.charAt(0) == "*";
         var _loc3_:Boolean = param1.length > 1 && param1.charAt(param1.length - 1) == "*";
         var _loc4_:int = _loc2_ ? 1 : 0;
         var _loc5_:int = _loc3_ ? int(param1.length - 1) : param1.length;
         var _loc6_:String = "";
         var _loc7_:String = null;
         var _loc8_:int = _loc4_;
         while(_loc8_ < _loc5_)
         {
            _loc10_ = param1.charAt(_loc8_);
            if(_loc10_ == "[")
            {
               _loc11_ = param1.indexOf("]",_loc8_ + 1);
               if(_loc11_ < 0 || _loc11_ >= _loc5_)
               {
                  _loc6_ += §_-33P§(_loc10_);
                  _loc8_++;
               }
               else
               {
                  _loc12_ = [];
                  _loc13_ = {};
                  _loc14_ = _loc8_ + 1;
                  while(_loc14_ < _loc11_)
                  {
                     _loc15_ = §_-82K§(param1.charAt(_loc14_));
                     if(!_loc13_[_loc15_])
                     {
                        _loc13_[_loc15_] = true;
                        _loc12_.push(§_-33P§(_loc15_));
                     }
                     _loc14_++;
                  }
                  _loc6_ += "(?:" + _loc12_.join("|") + ")";
                  _loc7_ = null;
                  _loc8_ = _loc11_ + 1;
               }
            }
            else if(_loc10_ == "\\" && _loc8_ + 1 < _loc5_)
            {
               _loc6_ += §_-33P§(§_-82K§(param1.charAt(_loc8_ + 1)));
               _loc7_ = null;
               _loc8_ += 2;
            }
            else if(_loc10_ == " ")
            {
               _loc6_ += "\\s*";
               _loc7_ = null;
               _loc8_++;
            }
            else if(_loc10_ == "*")
            {
               _loc6_ += ".*";
               _loc7_ = null;
               _loc8_++;
            }
            else
            {
               _loc16_ = §_-82K§(_loc10_);
               if(_loc16_ != _loc7_)
               {
                  _loc6_ += §_-33P§(_loc16_);
               }
               _loc7_ = _loc16_;
               _loc8_++;
            }
         }
         if(!_loc6_)
         {
            return null;
         }
         var _loc9_:String = (_loc2_ ? "" : §_-d2p§) + "(" + _loc6_ + ")" + (_loc3_ ? "" : §_-vu§);
         try
         {
            return new RegExp(_loc9_,"gi");
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      private static function §_-82K§(param1:String) : String
      {
         var _loc2_:String = param1.toLowerCase();
         return §_-j2N§[_loc2_] || _loc2_;
      }
      
      private static function §_-s1P§(param1:String) : Boolean
      {
         var _loc4_:String = null;
         if(param1.length < 3 || param1.charAt(0) != "*" || param1.charAt(param1.length - 1) != "*")
         {
            return false;
         }
         if(!§_-A2g§.test(param1))
         {
            return false;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 1;
         while(_loc3_ < param1.length - 1)
         {
            _loc4_ = param1.charAt(_loc3_);
            if(_loc4_ != "[" && _loc4_ != "]" && _loc4_ != "\\")
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_ <= 4;
      }
      
      private static function §_-33P§(param1:String) : String
      {
         var _loc4_:String = null;
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1.charAt(_loc3_);
            _loc2_ += §_-M24§.indexOf(_loc4_) >= 0 ? "\\" + _loc4_ : _loc4_;
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

