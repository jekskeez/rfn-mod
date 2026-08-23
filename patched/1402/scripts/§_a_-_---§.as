package
{
   import flash.display.Sprite;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class §_a_-_---§ extends Sprite
   {
      
      private static var §_a_--_-§:Class;
      
      private static var §_a_--_§:Class;
      
      private static var §_a_-__§:Class;
      
      private static var §_a_-____§:Array;
      
      private static var §_a_----§:Array;
      
      private static var §_a_-___-§:Boolean = false;
      
      private static var §_a_--§:int;
      
      var _temp_1:* = false;
      var _loc1_:Boolean = true;
      var _loc2_:Boolean = _temp_1;
      if(_loc1_)
      {
         §_a_--_-§ = §_a_-_-__§;
         loop2:
         while(true)
         {
            if(!_loc2_)
            {
               if(!_loc1_)
               {
                  var _temp_3:* = §_a_-_---§;
                  var _temp_2:* = _loc2_;
                  _loc1_ = _loc1_;
                  _loc2_ = _temp_2;
                  this = _temp_3;
                  loop0:
                  while(true)
                  {
                     §_a_----§ = new Array();
                     if(_loc1_)
                     {
                        if(_loc1_)
                        {
                           if(!_loc2_)
                           {
                              if(_loc2_)
                              {
                                 var _temp_9:* = _loc1_;
                                 var _temp_8:* = §_a_-_---§;
                                 _loc2_ = _loc2_;
                                 this = _temp_8;
                                 _loc1_ = _temp_9;
                                 addr0054:
                                 §_a_--_§ = §_a_-_§;
                                 if(_loc1_)
                                 {
                                    if(!_loc1_)
                                    {
                                       var _temp_11:* = §_a_-_---§;
                                       var _temp_10:* = _loc2_;
                                       this = §_a_-_---§;
                                       _loc2_ = _temp_10;
                                       this = _temp_11;
                                       do
                                       {
                                          §_a_-____§ = new Array();
                                          if(_loc1_)
                                          {
                                             continue loop0;
                                          }
                                          var _temp_13:* = §_a_-_---§;
                                          var _temp_12:* = §_a_-_---§;
                                          _loc1_ = _loc1_;
                                          this = _temp_12;
                                          this = _temp_13;
                                          §_a_-___-§ = false;
                                          if(!_loc2_)
                                          {
                                             break loop2;
                                          }
                                          var _temp_15:* = _loc2_;
                                          var _temp_14:* = §_a_-_---§;
                                          this = §_a_-_---§;
                                          this = _temp_14;
                                          _loc2_ = _temp_15;
                                       }
                                       while(!_loc2_);
                                       break;
                                       addr0070:
                                    }
                                    §_a_-__§ = §_a_---§;
                                    addr00a7:
                                    if(_loc2_)
                                    {
                                       break;
                                    }
                                    §§goto(addr0070);
                                 }
                                 §§goto(addr007a);
                              }
                              §§goto(addr008b);
                           }
                           §§goto(addr00a7);
                        }
                        §§goto(addr007a);
                     }
                     §§goto(addr0090);
                  }
                  var _temp_17:* = _loc1_;
                  var _temp_16:* = §_a_-_---§;
                  _loc2_ = _loc2_;
                  this = _temp_16;
                  _loc1_ = _temp_17;
                  break;
               }
               §§goto(addr0054);
            }
            §§goto(addr00a7);
         }
         return;
      }
      §§goto(addr0090);
      
      public function §_a_-_---§()
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(!_loc1_)
         {
            super();
         }
      }
      
      private static function §_a_-_--§() : void
      {
         var _temp_1:* = true;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = _temp_1;
         var _loc1_:ByteArray = new §_a_--_-§() as ByteArray;
         var _loc2_:ByteArray = new §_a_--_§() as ByteArray;
         var _loc3_:ByteArray = new §_a_-__§() as ByteArray;
         if(_loc8_)
         {
            _loc3_.endian = Endian.LITTLE_ENDIAN;
            if(!_loc7_)
            {
               §_a_--§ = _loc3_.readInt();
            }
         }
         var _loc4_:* = _loc2_.readByte();
         §§push(0);
         if(!_loc8_)
         {
            §§push((§§pop() - 100 + 1) * 119);
         }
         var _loc5_:* = §§pop();
         loop3:
         while(true)
         {
            if(!_loc7_)
            {
               while(true)
               {
                  §§push(_loc5_);
                  if(!_loc8_)
                  {
                     break;
                  }
                  if(§§pop() < _loc4_)
                  {
                     §_a_-__-_§(_loc2_);
                     if(_loc8_)
                     {
                        _loc5_++;
                     }
                     continue;
                  }
                  if(_loc8_)
                  {
                     §§push(_loc1_.readInt());
                     if(!_loc7_)
                     {
                        break;
                     }
                     break loop3;
                  }
               }
               _loc4_ = §§pop();
            }
            §§push(0);
            if(_loc7_)
            {
               §§push(-(§§pop() - 82 + 1 + 1 + 15 + 1) + 1);
            }
            break;
         }
         var _loc6_:* = §§pop();
         if(_loc8_)
         {
            loop1:
            while(_loc6_ < _loc4_)
            {
               if(_loc7_)
               {
                  var _temp_3:* = _loc4_;
                  var _temp_2:* = §_a_-_---§;
                  _loc2_ = _loc2_;
                  this = _temp_2;
                  _loc4_ = _temp_3;
                  while(true)
                  {
                     _loc6_++;
                     if(!_loc7_)
                     {
                        if(_loc8_)
                        {
                           continue loop1;
                        }
                        var _temp_7:* = _loc4_;
                        var _temp_6:* = _loc3_;
                        _loc7_ = _loc7_;
                        _loc3_ = _temp_6;
                        _loc4_ = _temp_7;
                        §_a_--__§(_loc1_,§_a_----§[_loc6_ % §_a_----§.length]);
                     }
                     if(!_loc8_)
                     {
                        var _temp_9:* = _loc8_;
                        var _temp_8:* = _loc5_;
                        _loc2_ = _loc2_;
                        _loc5_ = _temp_8;
                        _loc8_ = _temp_9;
                        continue loop1;
                     }
                  }
                  §§goto(addr012e);
               }
               §§goto(addr00ee);
            }
            if(_loc8_)
            {
               if(_loc7_)
               {
               }
               §_a_-___-§ = true;
            }
         }
         addr012e:
      }
      
      private static function §_a_--__§(param1:ByteArray, param2:ByteArray) : void
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc3_:int = param1.readInt();
         var _loc4_:ByteArray = new ByteArray();
         if(_loc7_)
         {
            §§push(param1);
            §§push(_loc4_);
            §§push(0);
            if(!_loc7_)
            {
               §§push((-(§§pop() - 1 + 7) + 1 + 1) * 15 * 64);
            }
            §§pop().readBytes(§§pop(),§§pop(),_loc3_);
         }
         var _loc5_:§_a_-_-_§ = new §_a_-_-_§(param2);
         _loc5_.§_a_---_§(_loc4_);
         if(_loc7_)
         {
            §§push(_loc4_);
            §§push(0);
            if(_loc6_)
            {
               §§push(-(§§pop() * 10 - 1 - 37) + 1);
            }
            §§pop().position = §§pop();
            if(_loc7_)
            {
               §_a_-____§.push(_loc4_.readUTFBytes(_loc4_.length));
            }
         }
      }
      
      private static function §_a_-__-_§(param1:ByteArray) : void
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         var _loc2_:ByteArray = new ByteArray();
         loop1:
         while(true)
         {
            if(!_loc3_)
            {
               §§push(param1);
               §§push(_loc2_);
               §§push(0);
               if(!_loc4_)
               {
                  §§push(-(§§pop() - 83 - 1));
               }
               §§pop().readBytes(§§pop(),§§pop(),16);
               if(_loc3_)
               {
                  break;
               }
            }
            loop2:
            while(true)
            {
               if(!_loc4_)
               {
                  var _temp_3:* = _loc4_;
                  var _temp_2:* = _loc2_;
                  _loc4_ = _loc4_;
                  _loc2_ = _temp_2;
                  _loc4_ = _temp_3;
                  while(true)
                  {
                     §_a_----§.push(_loc2_);
                     if(_loc3_)
                     {
                        break loop1;
                     }
                     if(_loc4_)
                     {
                        break loop2;
                     }
                     var _temp_5:* = §_a_-_---§;
                     var _temp_4:* = _loc2_;
                     _loc3_ = _loc3_;
                     _loc2_ = _temp_4;
                     this = _temp_5;
                     break loop1;
                  }
                  addr007b:
                  var _temp_7:* = §_a_-_---§;
                  var _temp_6:* = _loc2_;
                  _loc3_ = _loc3_;
                  _loc2_ = _temp_6;
                  this = _temp_7;
                  break;
                  addr0045:
               }
               §§push(_loc2_);
               §§push(0);
               if(!_loc4_)
               {
                  §§push(-((§§pop() + 1) * 32) * 47);
               }
               §§pop().position = §§pop();
               break loop1;
            }
            return;
         }
         if(!_loc3_)
         {
            §§goto(addr0045);
         }
         §§goto(addr007b);
      }
      
      public static function §_a_--_--§(param1:int) : String
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(!_loc2_)
         {
            if(!§_a_-___-§)
            {
               if(_loc3_)
               {
                  §_a_-_--§();
               }
            }
         }
         §§push(§_a_-____§);
         §§push(param1);
         if(!_loc2_)
         {
            §§push(§§pop() ^ §_a_--§);
         }
         return §§pop()[§§pop()];
      }
   }
}

