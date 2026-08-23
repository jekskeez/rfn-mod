package §_-68§
{
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   
   public class §_-p22§ extends EventDispatcher
   {
      
      public static var §_-b1H§:Object = null;
      
      public static var §_-I2p§:Array;
      
      private static const §_-R2r§:String = "hero";
      
      private static const §_-KK§:String = "clothesHero";
      
      private static const §_-ra§:String = "lang";
      
      private static const §_-n5§:Array;
      
      if(!_loc2_)
      {
         §_-b1H§ = null;
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
                     this = §_-p22§;
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
                           var _temp_6:* = §_-p22§;
                           var _temp_5:* = _loc1_;
                           _loc2_ = _loc2_;
                           _loc1_ = _temp_5;
                           this = _temp_6;
                           §_-I2p§ = [];
                           if(_loc1_)
                           {
                              break loop2;
                           }
                           if(_loc1_)
                           {
                              var _temp_8:* = §_-p22§;
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
                                    this = §_-p22§;
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
            §_-n5§ = ["seasonalContent","base","news",§_-R2r§,§_-KK§,§_-ra§];
            break;
         }
      }
      break loop2;
      
      private var §_-B2k§:Vector.<Object>;
      
      private var §_-SQ§:Vector.<§_-t19§>;
      
      public function §_-p22§()
      {
         if(!_loc2_)
         {
            this.§_-B2k§ = new Vector.<Object>();
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
                  this.§_-SQ§ = new Vector.<§_-t19§>();
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
      
      public static function §_-c1G§(param1:String) : String
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
                           §§push(§§pop() == §_-ra§);
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
                                       §§push(Boolean(§_-b1H§["langs"]));
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
                              §§push(Boolean(§_-b1H§["langs"][§_-a9§.§_-L2p§]));
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
                           §§push(§_-a9§.§_-hL§);
                           if(!_loc4_)
                           {
                              §§push(§§pop() + §_-b1H§["langs"][§_-a9§.§_-L2p§]);
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
                           §§push(§_-a9§.§_-hL§);
                           if(_loc3_)
                           {
                              break loop1;
                           }
                           §§push(§§pop() + §_-b1H§[param1]);
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
      
      public function §_-F1Z§() : void
      {
         if(!_loc1_)
         {
            while(true)
            {
               §§push(!§_-a9§.§_-gk§);
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
               this.load(§_-a9§.§_-gk§.libraries);
            }
            addr0063:
            if(!_loc1_)
            {
               §§push(!§_-a9§.§_-gk§.libraries);
               break loop0;
            }
            return;
         }
         addr0055:
      }
      
      public function get §_-d2l§() : int
      {
         var _loc2_:§_-t19§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.§_-SQ§)
         {
            _loc1_ += _loc2_.§_-d2l§;
         }
         return _loc1_;
      }
      
      public function get §_-z28§() : int
      {
         var _loc2_:§_-t19§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.§_-SQ§)
         {
            _loc1_ += _loc2_.§_-z28§;
         }
         return _loc1_;
      }
      
      public function get loaded() : Boolean
      {
         var _loc1_:§_-t19§ = null;
         if(this.§_-B2k§.length > 0)
         {
            return false;
         }
         for each(_loc1_ in this.§_-SQ§)
         {
            if(!_loc1_.loaded)
            {
               return false;
            }
         }
         return true;
      }
      
      private function §_-32q§(param1:ProgressEvent) : void
      {
         if(!_loc2_)
         {
            dispatchEvent(param1);
         }
      }
      
      private function load(param1:Object = null) : void
      {
         var _loc2_:§_-t19§ = null;
         var _loc3_:* = undefined;
         if(!_loc7_)
         {
            while(true)
            {
               if(param1 != null)
               {
                  if(_loc7_)
                  {
                     break;
                  }
                  §_-p22§.§_-b1H§ = param1;
                  if(_loc8_)
                  {
                     break;
                  }
               }
               var _loc4_:int = 0;
               if(!_loc8_)
               {
                  var _loc5_:* = §_-p22§.§_-n5§;
                  if(!_loc7_)
                  {
                     loop0:
                     for each(_loc3_ in _loc5_)
                     {
                        if(!_loc8_)
                        {
                           var _loc6_:* = _loc3_;
                           loop2:
                           while(true)
                           {
                              loop3:
                              while(true)
                              {
                                 if(!_loc7_)
                                 {
                                    loop4:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(§_-R2r§);
                                          if(!_loc8_)
                                          {
                                             if(§§pop() === _loc6_)
                                             {
                                                if(!_loc7_)
                                                {
                                                   addr00f7:
                                                   §§push(0);
                                                   if(!_loc7_)
                                                   {
                                                      break loop3;
                                                   }
                                                   break loop2;
                                                }
                                                break;
                                             }
                                             §§push(§_-KK§);
                                             if(_loc7_)
                                             {
                                                break loop4;
                                             }
                                          }
                                          if(§§pop() === _loc6_)
                                          {
                                             if(!_loc8_)
                                             {
                                                §§push(1);
                                                if(_loc8_)
                                                {
                                                }
                                                break loop3;
                                             }
                                             break;
                                          }
                                          §§push(§_-ra§);
                                          break loop4;
                                       }
                                       §§push(2);
                                       break loop2;
                                    }
                                    if(§§pop() === _loc6_)
                                    {
                                       break loop5;
                                    }
                                    §§push(3);
                                    break;
                                 }
                                 §§goto(addr00f7);
                              }
                              switch(§§pop())
                              {
                                 case 0:
                                    _loc2_ = new §_-M10§();
                                    if(!_loc8_)
                                    {
                                       break;
                                    }
                                    continue loop0;
                                 case 1:
                                    _loc2_ = new §_-c1l§();
                                    if(!_loc7_)
                                    {
                                       break;
                                    }
                                    addr00a6:
                                    continue loop0;
                                 case 2:
                                    if(!§_-a9§.§_-sc§)
                                    {
                                       _loc2_ = new §_-j2J§();
                                       break;
                                    }
                                    §§goto(addr00a6);
                                    break;
                                 default:
                                    _loc2_ = new §_-t19§();
                              }
                           }
                           break loop3;
                        }
                        _loc2_.addEventListener(ProgressEvent.PROGRESS,this.§_-32q§);
                        while(true)
                        {
                           if(!_loc7_)
                           {
                              if(!(_loc3_ is String))
                              {
                                 _loc2_.loadBytes(_loc3_);
                                 if(!_loc8_)
                                 {
                                    break;
                                 }
                                 continue loop0;
                              }
                              if(_loc8_)
                              {
                                 break;
                              }
                              _loc2_.§_-538§(_loc3_);
                              if(_loc7_)
                              {
                                 break;
                              }
                           }
                           break;
                        }
                        this.§_-SQ§.push(_loc2_);
                     }
                  }
               }
               break;
            }
         }
      }
   }
}

