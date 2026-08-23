package
{
   import §_-I10§.§_-t2V§;
   
   public class §_-019§
   {
      
      private static const §_-p1j§:String = "(?:^|[^A-Za-zА-Яа-яЁё])";
      
      private static const §_-J2O§:String = "(?=$|[^A-Za-zА-Яа-яЁё])";
      
      private static const §_-E2E§:String = "\\^$.|?*+()[]{}/";
      
      private static const §_-11y§:RegExp = /[A-Za-zА-ЯЁа-яё]/;
      
      private static const §_-f1o§:RegExp = /[A-Za-z]/;
      
      private static const §_-k1D§:RegExp = /[Ѐ-ӿ]/;
      
      private static const §_-i2F§:RegExp = /[̀-ͯ]/;
      
      private static const §_-Y10§:RegExp = /\s/;
      
      private static var §_-TN§:Object = {};
      
      private static var §_-3b§:Array = [];
      
      private static var §_-Zi§:Array = [];
      
      private static var §_-P20§:Boolean = false;
      
      public function §_-019§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc2_:String = null;
         var _loc3_:RegExp = null;
         var _loc1_:Object = §_-t2V§.§_-J2X§;
         §_-P20§ = false;
         §_-TN§ = {};
         §_-3b§ = [];
         §_-Zi§ = [];
         if(!_loc1_ || !_loc1_.chars || !_loc1_.dictionary)
         {
            return;
         }
         §_-g2A§(_loc1_.chars);
         for each(_loc2_ in _loc1_.dictionary)
         {
            _loc3_ = §_-Ow§(_loc2_);
            if(_loc3_)
            {
               §_-3b§.push(_loc3_);
               §_-Zi§.push(§_-nQ§(_loc2_));
            }
         }
         §_-P20§ = true;
      }
      
      public static function §_-B2p§(param1:String) : Boolean
      {
         return !param1 || §_-P20§ && §_-u1b§(param1) == null;
      }
      
      public static function §_-l2k§(param1:String) : String
      {
         if(!Game.toggle)
         {
            return param1;
         }
         var _loc4_:Object = null;
         if(!param1 || !§_-P20§)
         {
            return param1;
         }
         var _loc2_:String = param1;
         var _loc3_:* = 0;
         while(_loc3_++ < 64)
         {
            _loc4_ = §_-u1b§(_loc2_);
            if(!_loc4_)
            {
               break;
            }
            _loc2_ = _loc2_.substring(0,_loc4_.start) + _loc2_.substring(_loc4_.end);
         }
         return _loc2_;
      }
      
      private static function §_-u1b§(param1:String) : Object
      {
         var _loc5_:RegExp = null;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Object = normalize(param1);
         var _loc3_:Boolean = !_loc2_.hasCyrillic;
         var _loc4_:int = 0;
         while(_loc4_ < §_-3b§.length)
         {
            if(!(_loc3_ && Boolean(§_-Zi§[_loc4_])))
            {
               _loc5_ = §_-3b§[_loc4_];
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
            if(§_-i2F§.test(_loc12_))
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
                  _loc14_ = §_-TN§[param1.substr(_loc7_,2).toLowerCase()];
               }
               if(_loc14_)
               {
                  _loc13_ = 2;
               }
               else
               {
                  _loc14_ = §_-TN§[_loc12_.toLowerCase()] || _loc12_.toLowerCase();
               }
               if(§_-A2c§(_loc14_))
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
                  _loc6_ ||= §_-Y10§.test(_loc12_);
               }
               _loc7_ += _loc13_;
            }
         }
         _loc7_ = 0;
         while(_loc7_ < _loc2_.length)
         {
            _loc2_[_loc7_] = §_-zV§(_loc2_[_loc7_]);
            _loc7_++;
         }
         var _loc8_:String = "";
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:Boolean = false;
         _loc7_ = 0;
         while(_loc7_ < _loc2_.length)
         {
            if(_loc7_ > 0 && !§_-51U§(_loc2_[_loc7_ - 1],_loc2_[_loc7_],_loc3_[_loc7_ - 1]))
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
               _loc11_ ||= §_-k1D§.test(_loc16_.text);
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
      
      private static function §_-zV§(param1:Array) : Array
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:* = 0;
         while(_loc3_ < param1.length)
         {
            if(§_-f1o§.test(param1[_loc3_].text) && _loc3_ > 0 && §_-k1D§.test(param1[_loc3_ - 1].text))
            {
               _loc5_ = _loc3_;
               while(_loc5_ < param1.length && §_-f1o§.test(param1[_loc5_].text))
               {
                  _loc5_++;
               }
               if(_loc5_ < param1.length && §_-k1D§.test(param1[_loc5_].text))
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
      
      private static function §_-51U§(param1:Array, param2:Array, param3:Object) : Boolean
      {
         return param1.length <= 2 && param2.length <= 2 || !param3.hasSpace && (param1.length <= 2 || param2.length <= 2);
      }
      
      private static function §_-A2c§(param1:String) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!§_-11y§.test(param1.charAt(_loc2_)))
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      private static function §_-g2A§(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         for(_loc2_ in param1)
         {
            _loc3_ = _loc2_.toLowerCase();
            §_-TN§[_loc3_] = _loc3_;
            for each(_loc4_ in param1[_loc2_])
            {
               _loc5_ = _loc4_.toLowerCase();
               if(!§_-TN§[_loc5_])
               {
                  §_-TN§[_loc5_] = _loc3_;
               }
            }
         }
      }
      
      private static function §_-Ow§(param1:String) : RegExp
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
                  _loc6_ += §_-P12§(_loc10_);
                  _loc8_++;
               }
               else
               {
                  _loc12_ = [];
                  _loc13_ = {};
                  _loc14_ = _loc8_ + 1;
                  while(_loc14_ < _loc11_)
                  {
                     _loc15_ = §_-C2d§(param1.charAt(_loc14_));
                     if(!_loc13_[_loc15_])
                     {
                        _loc13_[_loc15_] = true;
                        _loc12_.push(§_-P12§(_loc15_));
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
               _loc6_ += §_-P12§(§_-C2d§(param1.charAt(_loc8_ + 1)));
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
               _loc16_ = §_-C2d§(_loc10_);
               if(_loc16_ != _loc7_)
               {
                  _loc6_ += §_-P12§(_loc16_);
               }
               _loc7_ = _loc16_;
               _loc8_++;
            }
         }
         if(!_loc6_)
         {
            return null;
         }
         var _loc9_:String = (_loc2_ ? "" : §_-p1j§) + "(" + _loc6_ + ")" + (_loc3_ ? "" : §_-J2O§);
         try
         {
            return new RegExp(_loc9_,"gi");
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      private static function §_-C2d§(param1:String) : String
      {
         var _loc2_:String = param1.toLowerCase();
         return §_-TN§[_loc2_] || _loc2_;
      }
      
      private static function §_-nQ§(param1:String) : Boolean
      {
         var _loc4_:String = null;
         if(param1.length < 3 || param1.charAt(0) != "*" || param1.charAt(param1.length - 1) != "*")
         {
            return false;
         }
         if(!§_-k1D§.test(param1))
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
      
      private static function §_-P12§(param1:String) : String
      {
         var _loc4_:String = null;
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1.charAt(_loc3_);
            _loc2_ += §_-E2E§.indexOf(_loc4_) >= 0 ? "\\" + _loc4_ : _loc4_;
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

