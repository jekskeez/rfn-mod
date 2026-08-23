package §_-s2e§
{
   import §_-X1k§.§_-Ac§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import views.§_-aW§;
   
   public class §_-U2d§ extends EventDispatcher
   {
      
      private static var _instance:§_-U2d§ = null;
      
      private static const §_-K9§:Array;
      
      if(!_loc1_)
      {
         _instance = null;
         if(!_loc1_)
         {
            §_-K9§ = ["runtime"];
         }
      }
      
      private var §_-V2R§:Vector.<§_-O17§>;
      
      private var §_-uu§:Array;
      
      private var §_-r1m§:Boolean = false;
      
      private var loaded:Boolean = false;
      
      private var §_-GS§:Sprite = null;
      
      public function §_-U2d§()
      {
         loop2:
         while(true)
         {
            if(!_loc2_)
            {
               this.§_-V2R§ = new Vector.<§_-O17§>();
               if(_loc1_)
               {
                  break;
               }
            }
            if(_loc2_)
            {
               var _temp_2:* = this;
               var _temp_1:* = this;
               var _loc2_:* = _loc2_;
               this = _temp_1;
               this = _temp_2;
               while(true)
               {
                  _instance = this;
                  if(!_loc1_)
                  {
                     if(!_loc1_)
                     {
                        break loop2;
                     }
                     if(_loc2_)
                     {
                        break;
                     }
                     addr0070:
                     while(true)
                     {
                        super();
                     }
                     break loop2;
                  }
                  if(!_loc2_)
                  {
                     continue;
                  }
                  var _temp_6:* = _loc1_;
                  var _temp_5:* = _loc1_;
                  _loc2_ = _loc2_;
                  var _loc1_:* = _temp_5;
                  _loc1_ = _temp_6;
               }
               var _temp_8:* = _loc2_;
               var _temp_7:* = _loc1_;
               this = this;
               _loc1_ = _temp_7;
               _loc2_ = _temp_8;
               §§goto(addr00a9);
            }
            this.§_-uu§ = [];
            §§goto(addr0098);
         }
         if(_loc2_)
         {
            var _temp_10:* = this;
            var _temp_9:* = _loc1_;
            _loc1_ = _loc1_;
            _loc1_ = _temp_9;
            this = _temp_10;
            §§goto(addr0070);
         }
         addr00a9:
      }
      
      public static function §_-XL§(param1:Function = null) : void
      {
         if(!_loc3_)
         {
            if(_instance.loaded)
            {
               if(!_loc3_)
               {
                  §§goto(addr0029);
               }
            }
            else
            {
               _instance.load(param1);
            }
            return;
         }
         addr0029:
      }
      
      public static function load(param1:Function = null, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:§_-i5§ = null;
         var _loc5_:Rectangle = null;
         loop5:
         while(true)
         {
            loop6:
            while(true)
            {
               loop13:
               while(true)
               {
                  if(!_loc7_)
                  {
                     loop14:
                     while(true)
                     {
                        loop15:
                        while(true)
                        {
                           loop16:
                           while(true)
                           {
                              loop17:
                              while(true)
                              {
                                 loop18:
                                 while(true)
                                 {
                                    loop19:
                                    while(true)
                                    {
                                       §§push(_instance.loaded);
                                       if(!_loc7_)
                                       {
                                          loop20:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                if(§§pop())
                                                {
                                                   if(!_loc6_)
                                                   {
                                                      param1();
                                                      if(!_loc6_)
                                                      {
                                                         return;
                                                      }
                                                      addr00e9:
                                                      §§push(param2);
                                                      if(!_loc7_)
                                                      {
                                                         break loop20;
                                                      }
                                                      break loop14;
                                                   }
                                                   addr0075:
                                                   §§push(param3);
                                                   if(_loc6_)
                                                   {
                                                      break;
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                   if(_loc7_)
                                                   {
                                                      break loop20;
                                                   }
                                                }
                                                else
                                                {
                                                   §§push(param2);
                                                   if(_loc7_)
                                                   {
                                                      break loop17;
                                                   }
                                                   §§push(!§§pop());
                                                   if(_loc7_)
                                                   {
                                                      break loop19;
                                                   }
                                                   var _temp_42:* = §§pop();
                                                   §§push(_temp_42);
                                                   §§push(_temp_42);
                                                   if(_loc6_)
                                                   {
                                                      break loop18;
                                                   }
                                                   if(§§pop())
                                                   {
                                                      if(_loc7_)
                                                      {
                                                         break loop17;
                                                      }
                                                      §§pop();
                                                      if(_loc6_)
                                                      {
                                                         break loop13;
                                                      }
                                                      §§goto(addr0075);
                                                   }
                                                }
                                                if(§§pop())
                                                {
                                                   if(!_loc6_)
                                                   {
                                                      addr008e:
                                                      while(true)
                                                      {
                                                         §§push(§_-aW§.instance);
                                                         §§push(true);
                                                         if(!_loc7_)
                                                         {
                                                            if(!§_-Ac§.§_-21c§)
                                                            {
                                                               §§push(0);
                                                               break;
                                                            }
                                                         }
                                                         §§push(97);
                                                         if(_loc6_)
                                                         {
                                                         }
                                                         break;
                                                      }
                                                      §§pop().close(§§pop(),§§pop());
                                                      if(!_loc6_)
                                                      {
                                                         break loop5;
                                                      }
                                                      break loop6;
                                                   }
                                                   break loop5;
                                                }
                                                §§push(!_instance.§_-GS§);
                                                if(!_loc6_)
                                                {
                                                   break;
                                                }
                                                break loop17;
                                             }
                                             var _temp_43:* = §§pop();
                                             §§push(_temp_43);
                                             §§push(_temp_43);
                                             if(_loc7_)
                                             {
                                                break loop18;
                                             }
                                             if(!§§pop())
                                             {
                                                break loop17;
                                             }
                                             if(_loc6_)
                                             {
                                                break loop16;
                                             }
                                             §§pop();
                                             if(_loc6_)
                                             {
                                                break loop15;
                                             }
                                             §§goto(addr00e9);
                                          }
                                       }
                                       break loop20;
                                    }
                                    §§goto(addr0114);
                                 }
                                 if(§§pop())
                                 {
                                    if(!_loc6_)
                                    {
                                       break loop14;
                                    }
                                    break loop16;
                                 }
                                 break loop19;
                              }
                              var _temp_41:* = §§pop();
                              §§push(_temp_41);
                              §§push(_temp_41);
                              break loop18;
                           }
                           §§goto(addr0114);
                        }
                        §§push(param3);
                        if(!_loc7_)
                        {
                           break loop16;
                        }
                        addr0114:
                        if(!§§pop())
                        {
                           continue loop7;
                        }
                        if(_loc6_)
                        {
                           break loop6;
                        }
                        §§goto(addr011e);
                     }
                     §§pop();
                     if(!_loc7_)
                     {
                        break loop15;
                     }
                     addr011e:
                     _instance.§_-GS§ = new Sprite();
                     if(!_loc6_)
                     {
                        break loop6;
                     }
                     break;
                  }
                  §§goto(addr008e);
               }
               §§goto(addr0315);
            }
            if(_loc7_)
            {
               var _temp_40:* = §_-U2d§;
               var _temp_39:* = param2;
               this = §_-U2d§;
               param2 = _temp_39;
               this = _temp_40;
               §§goto(addr0141);
            }
            else
            {
               §§goto(addr02f1);
            }
         }
         _instance.load(param1);
         loop7:
         while(true)
         {
            loop8:
            while(true)
            {
               if(!_loc7_)
               {
                  if(_loc7_)
                  {
                     var _temp_2:* = param1;
                     var _temp_1:* = _loc4_;
                     var _loc6_:* = _loc6_;
                     _loc4_ = _temp_1;
                     param1 = _temp_2;
                     loop1:
                     while(true)
                     {
                        _instance.§_-GS§.graphics.drawRect(-_instance.§_-GS§.x,-_instance.§_-GS§.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
                        if(!_loc6_)
                        {
                           if(_loc6_)
                           {
                              var _temp_6:* = _loc4_;
                              var _temp_5:* = _loc5_;
                              param3 = param3;
                              _loc5_ = _temp_5;
                              _loc4_ = _temp_6;
                              loop2:
                              while(true)
                              {
                                 _instance.§_-GS§.addChild(_loc4_);
                                 if(!_loc7_)
                                 {
                                    if(_loc7_)
                                    {
                                       var _temp_10:* = param1;
                                       var _temp_9:* = param1;
                                       _loc5_ = _loc5_;
                                       param1 = _temp_9;
                                       param1 = _temp_10;
                                       loop3:
                                       do
                                       {
                                          _instance.§_-GS§.y = (Game.starling.stage.stageHeight - _loc5_.height) * 0.5 - _loc5_.y;
                                          loop9:
                                          while(true)
                                          {
                                             if(!_loc6_)
                                             {
                                                if(_loc6_)
                                                {
                                                   var _temp_12:* = param1;
                                                   var _temp_11:* = param3;
                                                   var _loc7_:* = _loc7_;
                                                   param3 = _temp_11;
                                                   param1 = _temp_12;
                                                   addr022a:
                                                   _loc5_ = _instance.§_-GS§.getBounds(_instance.§_-GS§);
                                                   if(!_loc7_)
                                                   {
                                                      if(_loc7_)
                                                      {
                                                         var _temp_14:* = param3;
                                                         var _temp_13:* = param3;
                                                         _loc6_ = _loc6_;
                                                         param3 = _temp_13;
                                                         param3 = _temp_14;
                                                         while(true)
                                                         {
                                                            _loc4_ = new §_-i5§(gls("Подожди\nИдёт загрузка библиотеки..."),-90,-9,new TextFormat(§_-i5§.§_-p1s§,14,8812372,null,null,null,null,null,"center"),275);
                                                            addr028a:
                                                            if(_loc7_)
                                                            {
                                                               var _temp_18:* = _loc6_;
                                                               var _temp_17:* = _loc7_;
                                                               param3 = param3;
                                                               _loc7_ = _temp_17;
                                                               _loc6_ = _temp_18;
                                                               addr02a0:
                                                               Game.§_-q1L§.addChild(_instance.§_-GS§);
                                                               addr02ae:
                                                               if(!_loc7_)
                                                               {
                                                                  addr02b5:
                                                                  if(_loc7_)
                                                                  {
                                                                     break loop9;
                                                                  }
                                                                  if(!_loc7_)
                                                                  {
                                                                     break loop8;
                                                                  }
                                                                  var _temp_20:* = param3;
                                                                  var _temp_19:* = param1;
                                                                  this = §_-U2d§;
                                                                  param1 = _temp_19;
                                                                  param3 = _temp_20;
                                                                  _instance.§_-GS§.graphics.beginFill(0,0.2);
                                                               }
                                                               if(_loc6_)
                                                               {
                                                                  var _temp_22:* = §_-U2d§;
                                                                  var _temp_21:* = param2;
                                                                  _loc4_ = _loc4_;
                                                                  param2 = _temp_21;
                                                                  this = _temp_22;
                                                                  _instance.§_-GS§.addChild(new MovieWaitingContent()).filters = [new GlowFilter(16777215,1,7,7,8)];
                                                                  addr0315:
                                                                  if(_loc7_)
                                                                  {
                                                                     var _temp_24:* = param2;
                                                                     var _temp_23:* = _loc4_;
                                                                     param1 = param1;
                                                                     _loc4_ = _temp_23;
                                                                     param2 = _temp_24;
                                                                     break loop9;
                                                                  }
                                                                  continue;
                                                               }
                                                               continue loop1;
                                                            }
                                                            continue loop2;
                                                         }
                                                         break loop3;
                                                      }
                                                      break;
                                                   }
                                                   §§goto(addr02bb);
                                                }
                                                §§goto(addr02cd);
                                             }
                                             §§goto(addr02b5);
                                          }
                                       }
                                       while(!_loc7_);
                                       break;
                                    }
                                    §§goto(addr022a);
                                 }
                                 §§goto(addr028a);
                              }
                              break loop3;
                           }
                           §§goto(addr02a0);
                        }
                        §§goto(addr02ae);
                     }
                     break loop3;
                  }
                  break loop7;
               }
               §§goto(addr0315);
            }
            while(true)
            {
               continue loop7;
            }
            break loop3;
            addr0141:
         }
      }
      
      public static function get loaded() : Boolean
      {
         return _instance.loaded;
      }
      
      public static function listen(param1:String, param2:Function) : void
      {
         if(!_loc3_)
         {
            if(_instance.loaded)
            {
               if(!_loc4_)
               {
                  §§goto(addr002d);
               }
            }
            else
            {
               _instance.addEventListener(param1,param2);
            }
            return;
         }
         addr002d:
      }
      
      public static function §_-J2i§(param1:String, param2:Function) : void
      {
         if(!_loc4_)
         {
            if(_instance.loaded)
            {
               if(!_loc4_)
               {
                  §§goto(addr002f);
               }
            }
            else
            {
               _instance.removeEventListener(param1,param2);
            }
            return;
         }
         addr002f:
      }
      
      public static function get §_-O2B§() : int
      {
         var _loc2_:§_-O17§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in _instance.§_-V2R§)
         {
            _loc1_ += _loc2_.§_-O2B§;
         }
         return _loc1_;
      }
      
      public static function get §_-J2I§() : int
      {
         var _loc2_:§_-O17§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in _instance.§_-V2R§)
         {
            _loc1_ += _loc2_.§_-J2I§;
         }
         return _loc1_;
      }
      
      private function §_-V24§(param1:Event) : void
      {
         if(!_loc3_)
         {
            dispatchEvent(param1);
         }
      }
      
      private function onLoaded(param1:Event) : void
      {
         var _loc2_:§_-O17§ = null;
         loop3:
         while(true)
         {
            if(!_loc6_)
            {
               var _loc3_:int = 0;
               if(!_loc5_)
               {
                  var _loc4_:* = this.§_-V2R§;
                  if(!_loc6_)
                  {
                     while(true)
                     {
                        for each(_loc2_ in _loc4_)
                        {
                           if(_loc5_)
                           {
                              break;
                           }
                           if(!_loc2_.loaded)
                           {
                              break;
                           }
                           continue;
                        }
                     }
                     §§goto(addr0058);
                  }
               }
               if(!_loc5_)
               {
                  §_-p2U§.add("RuntimeLoader - onLoaded");
                  loop4:
                  while(true)
                  {
                     loop5:
                     while(true)
                     {
                        while(true)
                        {
                           if(!_loc6_)
                           {
                              this.loaded = true;
                              if(_loc6_)
                              {
                                 break;
                              }
                              if(this.§_-GS§ == null)
                              {
                                 break loop5;
                              }
                              if(_loc5_)
                              {
                                 break loop4;
                              }
                           }
                           Game.§_-q1L§.removeChild(this.§_-GS§);
                           if(!_loc6_)
                           {
                              break loop4;
                           }
                           break;
                        }
                        §§goto(addr013a);
                     }
                     Game.§_-23l§();
                     §§goto(addr0155);
                  }
                  if(_loc6_)
                  {
                     var _temp_2:* = this;
                     var _temp_1:* = this;
                     _loc4_ = _loc4_;
                     this = _temp_1;
                     this = _temp_2;
                  }
                  this.§_-GS§ = null;
                  if(!_loc5_)
                  {
                     if(!_loc6_)
                     {
                        break loop5;
                     }
                     var _temp_4:* = _loc5_;
                     var _temp_3:* = _loc6_;
                     var _loc6_:* = _loc6_;
                     _loc6_ = _temp_3;
                     var _loc5_:* = _temp_4;
                     loop1:
                     while(true)
                     {
                        dispatchEvent(new Event(Event.COMPLETE));
                        if(!_loc6_)
                        {
                           if(!_loc5_)
                           {
                              addr010d:
                              if(!_loc5_)
                              {
                                 break loop3;
                              }
                              var _temp_6:* = _loc6_;
                              var _temp_5:* = _loc5_;
                              _loc2_ = _loc2_;
                              _loc5_ = _temp_5;
                              _loc6_ = _temp_6;
                           }
                           else
                           {
                              addr0155:
                              if(_loc6_)
                              {
                                 var _temp_8:* = _loc4_;
                                 var _temp_7:* = _loc5_;
                                 _loc3_ = _loc3_;
                                 _loc5_ = _temp_7;
                                 _loc4_ = _temp_8;
                                 break loop3;
                              }
                           }
                           while(true)
                           {
                              this.§_-T2S§();
                              continue loop1;
                           }
                           break;
                        }
                     }
                     addr0058:
                     return;
                     addr00f1:
                  }
                  addr013a:
                  if(_loc6_)
                  {
                     var _temp_10:* = this;
                     var _temp_9:* = _loc5_;
                     param1 = param1;
                     _loc5_ = _temp_9;
                     this = _temp_10;
                     break loop5;
                  }
                  §§goto(addr00f1);
               }
               §§goto(addr010d);
            }
            §§goto(addr0155);
         }
      }
      
      private function §_-T2S§() : void
      {
         var _loc1_:int = 0;
         if(!_loc3_)
         {
            while(_loc1_ < this.§_-uu§.length)
            {
               this.§_-uu§[_loc1_]();
               if(!_loc3_)
               {
                  _loc1_++;
               }
            }
            if(!_loc4_)
            {
               this.§_-uu§ = [];
            }
         }
      }
      
      private function load(param1:Function) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:§_-O17§ = null;
         if(!_loc6_)
         {
            loop2:
            while(true)
            {
               if(param1 != null)
               {
                  if(_loc6_)
                  {
                     break;
                  }
                  this.§_-uu§.push(param1);
                  if(_loc6_)
                  {
                     break;
                  }
               }
               while(true)
               {
                  §§push(this.§_-r1m§);
                  if(!_loc7_)
                  {
                     if(§§pop())
                     {
                        if(!_loc7_)
                        {
                           return;
                        }
                        break;
                     }
                     this.§_-r1m§ = true;
                     if(_loc7_)
                     {
                        break loop2;
                     }
                     §§push(this.loaded);
                  }
                  if(§§pop())
                  {
                     if(!_loc6_)
                     {
                        this.§_-T2S§();
                        if(!_loc6_)
                        {
                           break loop2;
                        }
                        break;
                     }
                     break loop2;
                  }
                  var _loc4_:int = 0;
                  if(!_loc6_)
                  {
                     var _loc5_:* = §_-U2d§.§_-K9§;
                     if(!_loc7_)
                     {
                        loop0:
                        while(§§hasnext(_loc5_,_loc4_))
                        {
                           if(_loc6_)
                           {
                              var _temp_2:* = _loc3_;
                              var _temp_1:* = this;
                              _loc5_ = _loc5_;
                              this = _temp_1;
                              _loc3_ = _temp_2;
                           }
                           _loc2_ = §§nextvalue(_loc4_,_loc5_);
                           loop4:
                           while(true)
                           {
                              loop5:
                              while(true)
                              {
                                 if(_loc6_)
                                 {
                                    var _temp_4:* = param1;
                                    var _temp_3:* = param1;
                                    _loc3_ = _loc3_;
                                    param1 = _temp_3;
                                    param1 = _temp_4;
                                    while(true)
                                    {
                                       _loc3_.addEventListener(ProgressEvent.PROGRESS,this.§_-V24§);
                                       if(_loc6_)
                                       {
                                          break loop5;
                                       }
                                       if(!_loc7_)
                                       {
                                          break loop4;
                                       }
                                       var _temp_8:* = _loc4_;
                                       var _temp_7:* = _loc6_;
                                       var _loc7_:* = _loc7_;
                                       var _loc6_:* = _temp_7;
                                       _loc4_ = _temp_8;
                                    }
                                    break loop2;
                                    addr00d9:
                                 }
                                 _loc3_ = new §_-O17§();
                                 while(true)
                                 {
                                    if(!_loc6_)
                                    {
                                       if(_loc7_)
                                       {
                                          var _temp_10:* = this;
                                          var _temp_9:* = _loc2_;
                                          _loc6_ = _loc6_;
                                          _loc2_ = _temp_9;
                                          this = _temp_10;
                                          break loop4;
                                       }
                                       §§goto(addr00d9);
                                    }
                                    §§goto(addr0172);
                                 }
                                 §§goto(addr0183);
                              }
                              _loc3_.§_-01y§(_loc2_);
                              if(_loc6_)
                              {
                                 continue loop0;
                              }
                              §§goto(addr0172);
                           }
                           _loc3_.addEventListener(Event.COMPLETE,this.onLoaded);
                           if(_loc6_)
                           {
                              break loop5;
                           }
                           if(!_loc6_)
                           {
                           }
                           if(_loc2_ is String)
                           {
                              if(!_loc7_)
                              {
                                 break loop5;
                              }
                              addr0172:
                           }
                           else
                           {
                              _loc3_.loadBytes(_loc2_);
                              if(_loc6_)
                              {
                                 continue;
                              }
                           }
                           addr0183:
                           this.§_-V2R§.push(_loc3_);
                        }
                     }
                  }
                  break;
               }
            }
            return;
         }
      }
   }
}

