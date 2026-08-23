package utils
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.xml.XMLNode;
   import flash.xml.XMLNodeType;
   import protocol.§_-Q17§;
   import protocol.§_-z1i§;
   
   public class StringUtil
   {
      
      private static const §_-9C§:Array = [gls("первым"),gls("вторым"),gls("третьим"),gls("четвертым"),gls("пятым"),gls("шестым"),gls("седьмым"),gls("восьмым"),gls("девятым"),gls("десятым"),gls("одиннадцатым"),gls("двенадцатым"),gls("тринадцатым"),gls("четырнадцатым"),gls("пятнадцатым")];
      
      private static const §_-Q2v§:Object = {
         "балл":[gls("баллов"),gls("балл"),gls("балла")],
         "день":[gls("дней"),gls("день"),gls("дня")],
         "час":[gls("часов"),gls("час"),gls("часа")],
         "минуту":[gls("минут"),gls("минуту"),gls("минуты")],
         "минута":[gls("минут"),gls("минута"),gls("минуты")],
         "секунду":[gls("секунд"),gls("секунду"),gls("секунды")],
         "голос":["голосов","голос","голоса"],
         "рубль":[gls("рублей"),gls("рубль"),gls("рубля")],
         "побед":[gls("побед"),gls("победа"),gls("победы")],
         "единица":[gls("единиц"),gls("единица"),gls("единицы")],
         "друг":[gls("друзей"),gls("друг"),gls("друга")],
         "ваш":[gls("ваших"),gls("ваш"),gls("ваших")],
         "раунд":[gls("раундов"),gls("раунд"),gls("раунда")],
         "OK":["OK","OK","OK"],
         "мэйлик":["мейликов","мейлик","мейлика"],
         "орехов":[gls("орехов"),gls("орех"),gls("ореха")],
         "монет":[gls("монет"),gls("монета"),gls("монеты")],
         "монетку":[gls("монеток"),gls("монетку"),gls("монетки")],
         "твой друг":[gls("твоих друзей"),gls("твой друг"),gls("твоих друга")],
         "играть":[gls("играют"),gls("играет"),gls("играют")],
         "звезда":[gls("звезд"),gls("звезда"),gls("звезды")],
         "подарок":[gls("подарков"),gls("подарок"),gls("подарка")],
         "ФМ":["ФМ","ФМ","ФМ"],
         "предмет":[gls("предметов"),gls("предмет"),gls("предмета")],
         "кредит":[gls("кредитов"),gls("кредит"),gls("кредита")],
         "участник":[gls("участников"),gls("участник"),gls("участника")],
         "белка":[gls("белок"),gls("белка"),gls("белки")],
         "человек":[gls("человек"),gls("человек"),gls("человека")],
         "заряд":[gls("зарядов"),gls("заряд"),gls("заряда")],
         "штука":[gls("штук"),gls("штука"),gls("штуки")],
         "маны":[gls("маны"),gls("ману"),gls("маны")],
         "перо":[gls("перьев"),gls("перо"),gls("пера")],
         "очко":[gls("очков"),gls("очко"),gls("очка")],
         "бонусное очко":[gls("бонусных очков"),gls("бонусное очко"),gls("бонусных очка")],
         "случайного друга":[gls("случайных друзей"),gls("случайного друга"),gls("случайных друзей")],
         "₽":[gls("₽"),gls("₽"),gls("₽")]
      };
      
      public function StringUtil()
      {
         super();
      }
      
      public static function §_-R5§(param1:int) : String
      {
         return §_-9C§[param1 - 1];
      }
      
      public static function stripHTML(param1:String) : String
      {
         param1 = XML(new XMLNode(XMLNodeType.TEXT_NODE,param1)).toXMLString();
         return StringUtil.§_-Sv§(param1);
      }
      
      public static function §_-U2s§(param1:String) : String
      {
         return param1.replace(/<[^><]*>/gi,"");
      }
      
      public static function word(param1:String, param2:int) : String
      {
         if(!(param1 in §_-Q2v§))
         {
            return "";
         }
         var _loc3_:Array = §_-Q2v§[param1];
         if(param2 % 100 >= 10 && param2 % 100 <= 20 && §_-Zy§.§_-BI§)
         {
            return _loc3_[0];
         }
         var _loc4_:int = param2 % 10;
         if(_loc4_ == 1)
         {
            return _loc3_[1];
         }
         if(_loc4_ >= 2 && _loc4_ <= 4 && §_-Zy§.§_-BI§)
         {
            return _loc3_[2];
         }
         return _loc3_[0];
      }
      
      public static function short(param1:String, param2:int) : String
      {
         if(param1.length <= param2)
         {
            return param1;
         }
         return param1.substr(0,param2 - 1);
      }
      
      public static function §_-a2b§(param1:TextField, param2:int) : void
      {
         while(param1.width > param2)
         {
            param1.text = param1.text.substr(0,param1.text.length - 1);
         }
      }
      
      public static function §_-X1v§(param1:TextField, param2:int) : void
      {
         var _loc3_:TextFormat = null;
         while(param1.textWidth > param2)
         {
            _loc3_ = param1.getTextFormat();
            _loc3_.size = int(_loc3_.size) - 1;
            param1.setTextFormat(_loc3_);
         }
      }
      
      public static function §_-Sv§(param1:String) : String
      {
         return StringUtil.§_-21d§(StringUtil.§_-12k§(param1));
      }
      
      public static function §_-21d§(param1:String) : String
      {
         var _loc2_:Number = param1.length;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1.charCodeAt(_loc3_) > 32)
            {
               return param1.substring(_loc3_);
            }
            _loc3_++;
         }
         return "";
      }
      
      public static function §_-12k§(param1:String) : String
      {
         var _loc2_:Number = param1.length;
         var _loc3_:Number = _loc2_;
         while(_loc3_ > 0)
         {
            if(param1.charCodeAt(_loc3_ - 1) > 32)
            {
               return param1.substring(0,_loc3_);
            }
            _loc3_--;
         }
         return "";
      }
      
      public static function §_-g7§(param1:String) : String
      {
         var _loc7_:String = null;
         if(!param1)
         {
            return param1;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc7_ = param1.charAt(_loc4_);
            if(_loc7_.toLowerCase() != _loc7_.toUpperCase())
            {
               _loc2_++;
               if(_loc7_ == _loc7_.toUpperCase())
               {
                  _loc3_++;
               }
            }
            _loc4_++;
         }
         if(_loc2_ == 0 || _loc3_ / _loc2_ < 0.8)
         {
            return param1;
         }
         var _loc5_:Array = param1.split(/\s+/);
         if(_loc5_.length == 1)
         {
            return param1;
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc5_[_loc6_] = §_-12F§(_loc5_[_loc6_]);
            _loc6_++;
         }
         return _loc5_.join(" ");
      }
      
      public static function §_-13m§(param1:int, param2:Boolean = false) : String
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         if(param2)
         {
            _loc3_ = int(param1 / (24 * 60 * 60));
            param1 %= 24 * 60 * 60;
            _loc4_ = new Date(0,0,0,0,0,param1).toTimeString().slice(0,8);
            if(_loc3_ > 0)
            {
               _loc4_ = _loc3_ + " " + StringUtil.word("день",_loc3_) + " " + _loc4_;
            }
         }
         else
         {
            _loc5_ = int(param1 / (60 * 60));
            _loc4_ = new Date(0,0,0,0,0,param1).toTimeString().slice(2,8);
            _loc4_ = (_loc5_ > 9 ? _loc5_ : "0" + _loc5_) + _loc4_;
         }
         return _loc4_;
      }
      
      public static function §_-hB§(param1:String, param2:int) : String
      {
         var _loc3_:TextField = new TextField();
         _loc3_.text = param1;
         while(_loc3_.textWidth > param2)
         {
            _loc3_.text = param1;
            param1 = param1.substr(0,param1.length - 1);
         }
         return param1;
      }
      
      public static function §_-H1n§(param1:Array, param2:String = ", ") : String
      {
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ += param1[_loc4_];
            if(_loc4_ != param1.length - 1)
            {
               _loc3_ += param2;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function §_-8g§(param1:String) : §_-z1i§
      {
         param1 = unescape(encodeURIComponent(param1));
         var _loc2_:§_-z1i§ = §_-Q17§.get(param1.length);
         _loc2_.writeUTFBytes(param1);
         _loc2_.compress();
         return _loc2_;
      }
      
      public static function §_-a14§(param1:§_-z1i§) : String
      {
         param1.uncompress();
         return param1.readUTFBytes(param1.length);
      }
      
      public static function §_-H2v§(param1:String) : Date
      {
         if(!param1 || param1.length < 16)
         {
            return null;
         }
         var _loc2_:Array = param1.substr(0,10).split("-");
         var _loc3_:Array = param1.substr(11,5).split(":");
         if(_loc2_.length != 3 || _loc3_.length != 2)
         {
            return null;
         }
         return new Date(_loc2_[0],_loc2_[1] - 1,_loc2_[2],_loc3_[0],_loc3_[1]);
      }
      
      public static function §_-l2W§(param1:*) : int
      {
         if(param1 is Number)
         {
            return param1 & 0xFFFFFF;
         }
         var _loc2_:String = StringUtil.§_-Sv§(param1);
         if(_loc2_.charAt(0) == "#")
         {
            _loc2_ = _loc2_.substr(1);
         }
         if(_loc2_.length == 3)
         {
            _loc2_ = _loc2_.charAt(0) + _loc2_.charAt(0) + _loc2_.charAt(1) + _loc2_.charAt(1) + _loc2_.charAt(2) + _loc2_.charAt(2);
         }
         if(_loc2_.length < 6)
         {
            return -1;
         }
         var _loc3_:Number = parseInt(_loc2_.substr(0,6),16);
         return isNaN(_loc3_) ? -1 : int(_loc3_);
      }
      
      private static function §_-12F§(param1:String) : String
      {
         var ch:String = null;
         var word:String = param1;
         var letters:int = 0;
         var i:int = 0;
         while(i < word.length)
         {
            ch = word.charAt(i);
            if(ch.toLowerCase() != ch.toUpperCase())
            {
               letters++;
            }
            i++;
         }
         if(letters <= 4)
         {
            return word;
         }
         return word.toLowerCase().replace(/^[a-zа-яёa-z]/i,function(param1:String):String
         {
            return param1.toUpperCase();
         });
      }
   }
}

