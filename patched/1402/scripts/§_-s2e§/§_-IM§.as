package §_-s2e§
{
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   
   public class §_-IM§ extends EventDispatcher
   {
      
      public static var §_-d23§:Object = null;
      
      public static var §_-wl§:Array;
      
      private static const §_-GZ§:String = "hero";
      
      private static const §_-O2P§:String = "clothesHero";
      
      private static const §_-43N§:String = "lang";
      
      private static const §_-K9§:Array;
      
      if(!_loc2_)
      {
         §_-d23§ = null;
         loop2:
         while(true)
         {
            loop3:
            while(true)
            {
               if(!_loc1_)
               {
                  if(_loc1_)
                  {
                     var _temp_2:* = _loc1_;
                     var _temp_1:* = _loc2_;
                     this = §_-IM§;
                     var _loc2_:* = _temp_1;
                     var _loc1_:* = _temp_2;
                     loop0:
                     while(true)
                     {
                        if(_loc2_)
                        {
                           break loop2;
                        }
                        if(!_loc2_)
                        {
                           if(!_loc2_)
                           {
                              break loop3;
                           }
                           var _temp_6:* = §_-IM§;
                           var _temp_5:* = _loc1_;
                           _loc2_ = _loc2_;
                           _loc1_ = _temp_5;
                           this = _temp_6;
                           §_-wl§ = [];
                           if(_loc1_)
                           {
                              break loop2;
                           }
                           if(_loc1_)
                           {
                              var _temp_8:* = §_-IM§;
                              var _temp_7:* = _loc2_;
                              _loc2_ = _loc2_;
                              _loc2_ = _temp_7;
                              this = _temp_8;
                              while(true)
                              {
                                 if(_loc1_)
                                 {
                                    break loop2;
                                 }
                                 if(_loc1_)
                                 {
                                    var _temp_10:* = _loc1_;
                                    var _temp_9:* = _loc2_;
                                    this = §_-IM§;
                                    _loc2_ = _temp_9;
                                    _loc1_ = _temp_10;
                                    continue;
                                 }
                                 continue loop0;
                              }
                              break;
                              addr007f:
                           }
                        }
                        if(_loc2_)
                        {
                           break;
                        }
                        §§goto(addr007f);
                     }
                     var _temp_12:* = _loc2_;
                     var _temp_11:* = _loc1_;
                     _loc1_ = _loc1_;
                     _loc1_ = _temp_11;
                     _loc2_ = _temp_12;
                     break;
                  }
                  §§goto(addr0053);
               }
               §§goto(addr0085);
            }
            §_-K9§ = ["seasonalContent","base","news",§_-GZ§,§_-O2P§,§_-43N§];
            break;
         }
      }
      break loop2;
      
      private var §_-b1t§:Vector.<Object>;
      
      private var §_-V2R§:Vector.<§_-O17§>;
      
      public function §_-IM§()
      {
         if(!_loc2_)
         {
            this.§_-b1t§ = new Vector.<Object>();
            if(!_loc1_)
            {
               loop1:
               while(true)
               {
                  if(_loc1_)
                  {
                     var _temp_2:* = _loc1_;
                     var _temp_1:* = _loc1_;
                     var _loc2_:* = _loc2_;
                     var _loc1_:* = _temp_1;
                     _loc1_ = _temp_2;
                     do
                     {
                        super();
                        if(_loc1_)
                        {
                           continue;
                        }
                        if(!_loc1_)
                        {
                           break loop1;
                        }
                        var _temp_4:* = _loc2_;
                        var _temp_3:* = this;
                        _loc2_ = _loc2_;
                        this = _temp_3;
                        _loc2_ = _temp_4;
                     }
                     while(!_loc1_);
                     addr0083:
                     var _temp_6:* = _loc2_;
                     var _temp_5:* = this;
                     _loc2_ = _loc2_;
                     this = _temp_5;
                     _loc2_ = _temp_6;
                     break;
                     addr0049:
                  }
                  this.§_-V2R§ = new Vector.<§_-O17§>();
                  if(!_loc1_)
                  {
                     §§goto(addr0049);
                  }
                  §§goto(addr0083);
               }
               return;
            }
         }
         §§goto(addr0052);
      }
      
      public static function §_-61O§(param1:String) : String
      {
         var _loc2_:* = null;
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               if(!_loc3_)
               {
                  while(true)
                  {
                     §§push(param1);
                     if(!_loc4_)
                     {
                        loop3:
                        while(true)
                        {
                           §§push(§§pop() == §_-43N§);
                           if(!_loc3_)
                           {
                              loop4:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(!_loc4_)
                                    {
                                       var _temp_2:* = §§pop();
                                       §§push(_temp_2);
                                       §§push(_temp_2);
                                       if(_loc4_)
                                       {
                                          break;
                                       }
                                       if(!§§pop())
                                       {
                                          break loop4;
                                       }
                                       if(_loc4_)
                                       {
                                          break loop4;
                                       }
                                    }
                                    §§pop();
                                    if(!_loc4_)
                                    {
                                       §§push(Boolean(§_-d23§["langs"]));
                                       if(!_loc4_)
                                       {
                                          break loop4;
                                       }
                                       break loop3;
                                    }
                                    break loop0;
                                 }
                                 if(!§§pop())
                                 {
                                    break loop3;
                                 }
                                 if(_loc4_)
                                 {
                                    break loop3;
                                 }
                              }
                              var _temp_1:* = §§pop();
                              §§push(_temp_1);
                              §§push(_temp_1);
                              break loop5;
                           }
                           §§pop();
                           if(!_loc3_)
                           {
                              §§push(Boolean(§_-d23§["langs"][§_-Zy§.§_-73r§]));
                              break;
                           }
                           break loop0;
                        }
                        if(§§pop())
                        {
                           if(_loc3_)
                           {
                              break;
                           }
                           §§push(§_-Zy§.§_-S12§);
                           if(!_loc4_)
                           {
                              §§push(§§pop() + §_-d23§["langs"][§_-Zy§.§_-73r§]);
                              if(!_loc4_)
                              {
                                 addr00da:
                                 _loc2_ = §§pop();
                                 if(!_loc4_)
                                 {
                                    break;
                                 }
                                 break loop0;
                              }
                              break loop1;
                           }
                        }
                        else
                        {
                           §§push(§_-Zy§.§_-S12§);
                           if(_loc3_)
                           {
                              break loop1;
                           }
                           §§push(§§pop() + §_-d23§[param1]);
                           if(_loc4_)
                           {
                              break loop1;
                           }
                        }
                        _loc2_ = §§pop();
                        break loop0;
                     }
                     §§goto(addr00da);
                  }
               }
               break loop0;
            }
            return §§pop();
         }
         §§push(_loc2_);
         break loop1;
      }
      
      public function §_-M17§() : void
      {
         if(!_loc1_)
         {
            while(true)
            {
               §§push(!§_-Zy§.§_-Tc§);
               if(!_loc1_)
               {
                  var _temp_1:* = §§pop();
                  §§push(_temp_1);
                  if(_temp_1)
                  {
                     break;
                  }
                  if(_loc1_)
                  {
                     break;
                  }
               }
               §§pop();
               §§goto(addr0063);
            }
            if(§§pop())
            {
               if(!_loc1_)
               {
                  §§goto(addr0055);
               }
            }
            else
            {
               this.load(§_-Zy§.§_-Tc§.libraries);
            }
            addr0063:
            if(!_loc1_)
            {
               §§push(!§_-Zy§.§_-Tc§.libraries);
               break loop0;
            }
            return;
         }
         addr0055:
      }
      
      public function get §_-O2B§() : int
      {
         var _loc2_:§_-O17§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.§_-V2R§)
         {
            _loc1_ += _loc2_.§_-O2B§;
         }
         return _loc1_;
      }
      
      public function get §_-J2I§() : int
      {
         var _loc2_:§_-O17§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.§_-V2R§)
         {
            _loc1_ += _loc2_.§_-J2I§;
         }
         return _loc1_;
      }
      
      public function get loaded() : Boolean
      {
         var _loc1_:§_-O17§ = null;
         if(this.§_-b1t§.length > 0)
         {
            return false;
         }
         for each(_loc1_ in this.§_-V2R§)
         {
            if(!_loc1_.loaded)
            {
               return false;
            }
         }
         return true;
      }
      
      private function §_-V24§(param1:ProgressEvent) : void
      {
         if(!_loc2_)
         {
            dispatchEvent(param1);
         }
      }
      
      private function load(param1:Object = null) : void
      {
         var _loc2_:§_-O17§ = null;
         var _loc3_:* = undefined;
         while(true)
         {
            if(!_loc8_)
            {
               if(param1 == null)
               {
                  break;
               }
               if(_loc8_)
               {
                  break;
               }
            }
            §_-IM§.§_-d23§ = param1;
            if(!_loc7_)
            {
               break;
            }
            §§goto(addr01c0);
         }
         var _loc4_:int = 0;
         if(!_loc8_)
         {
            var _loc5_:* = §_-IM§.§_-K9§;
            if(!_loc7_)
            {
               loop0:
               for each(_loc3_ in _loc5_)
               {
                  loop2:
                  while(true)
                  {
                     if(!_loc8_)
                     {
                        var _loc6_:* = _loc3_;
                        loop3:
                        while(true)
                        {
                           if(!_loc8_)
                           {
                              loop4:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(§_-GZ§);
                                    if(!_loc8_)
                                    {
                                       if(§§pop() !== _loc6_)
                                       {
                                          §§push(§_-O2P§);
                                          if(!_loc7_)
                                          {
                                             if(§§pop() === _loc6_)
                                             {
                                                if(!_loc8_)
                                                {
                                                   addr011b:
                                                   §§push(1);
                                                   break loop3;
                                                }
                                                break loop4;
                                             }
                                             §§push(§_-43N§);
                                          }
                                          addr0124:
                                          if(§§pop() === _loc6_)
                                          {
                                             break loop4;
                                          }
                                          §§push(3);
                                          break;
                                       }
                                       if(!_loc7_)
                                       {
                                          §§push(0);
                                          if(!_loc7_)
                                          {
                                             break;
                                          }
                                          break loop3;
                                       }
                                       §§goto(addr011b);
                                    }
                                    §§goto(addr0124);
                                 }
                                 addr014a:
                                 switch(§§pop())
                                 {
                                    case 0:
                                       _loc2_ = new §_-O1h§();
                                       if(!_loc8_)
                                       {
                                          break;
                                       }
                                       break loop2;
                                    case 1:
                                       _loc2_ = new §_-UB§();
                                       if(!_loc7_)
                                       {
                                          break;
                                       }
                                       addr00a4:
                                       continue loop0;
                                    case 2:
                                       if(!§_-Zy§.§_-BI§)
                                       {
                                          _loc2_ = new §_-13B§();
                                          break;
                                       }
                                       §§goto(addr00a4);
                                       break;
                                    default:
                                       _loc2_ = new §_-O17§();
                                 }
                                 addr015d:
                                 _loc2_.addEventListener(ProgressEvent.PROGRESS,this.§_-V24§);
                                 if(!_loc7_)
                                 {
                                    if(_loc3_ is String)
                                    {
                                       if(!_loc7_)
                                       {
                                          break loop2;
                                       }
                                       addr019c:
                                    }
                                    else
                                    {
                                       _loc2_.loadBytes(_loc3_);
                                       if(_loc8_)
                                       {
                                          continue loop0;
                                       }
                                    }
                                    this.§_-V2R§.push(_loc2_);
                                 }
                                 continue loop0;
                              }
                              §§push(2);
                              if(_loc7_)
                              {
                              }
                              break loop5;
                           }
                           §§goto(addr011b);
                        }
                        §§goto(addr014a);
                     }
                     §§goto(addr015d);
                  }
                  _loc2_.§_-01y§(_loc3_);
                  if(_loc7_)
                  {
                     continue;
                  }
                  §§goto(addr019c);
               }
            }
         }
         addr01c0:
      }
   }
}

