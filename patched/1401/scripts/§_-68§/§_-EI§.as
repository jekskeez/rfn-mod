package §_-68§
{
   import §_-I10§.§_-Q2v§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import views.§_-Vm§;
   
   public class §_-EI§ extends EventDispatcher
   {
      
      private static var _instance:§_-EI§ = null;
      
      private static const §_-n5§:Array;
      
      if(!_loc1_)
      {
         _instance = null;
         if(!_loc1_)
         {
            §_-n5§ = ["runtime"];
         }
      }
      
      private var §_-SQ§:Vector.<§_-t19§>;
      
      private var §_-VN§:Array;
      
      private var §_-21P§:Boolean = false;
      
      private var loaded:Boolean = false;
      
      private var §_-u1K§:Sprite = null;
      
      public function §_-EI§()
      {
         loop2:
         while(true)
         {
            if(!_loc2_)
            {
               this.§_-SQ§ = new Vector.<§_-t19§>();
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
            this.§_-VN§ = [];
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
      
      public static function §_-v2f§(param1:Function = null) : void
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
         var _loc4_:§_-22V§ = null;
         var _loc5_:Rectangle = null;
         loop5:
         while(true)
         {
            if(!_loc7_)
            {
               while(true)
               {
                  loop7:
                  while(true)
                  {
                     loop12:
                     while(true)
                     {
                        loop13:
                        while(true)
                        {
                           loop14:
                           while(true)
                           {
                              §§push(_instance.loaded);
                              if(!_loc7_)
                              {
                                 while(true)
                                 {
                                    if(!§§pop())
                                    {
                                       §§push(param2);
                                       if(!_loc7_)
                                       {
                                          §§push(!§§pop());
                                          if(!_loc7_)
                                          {
                                             var _temp_24:* = §§pop();
                                             §§push(_temp_24);
                                             §§push(_temp_24);
                                             if(!_loc6_)
                                             {
                                                loop16:
                                                while(true)
                                                {
                                                   loop17:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         if(§§pop())
                                                         {
                                                            if(_loc7_)
                                                            {
                                                               break loop7;
                                                            }
                                                            §§pop();
                                                            if(_loc6_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(param3);
                                                            if(_loc6_)
                                                            {
                                                               break loop17;
                                                            }
                                                            §§push(Boolean(§§pop()));
                                                            if(_loc7_)
                                                            {
                                                               break loop16;
                                                            }
                                                         }
                                                         if(!§§pop())
                                                         {
                                                            §§push(!_instance.§_-u1K§);
                                                            if(!_loc6_)
                                                            {
                                                               break loop17;
                                                            }
                                                            break loop7;
                                                         }
                                                         if(_loc7_)
                                                         {
                                                            break loop8;
                                                         }
                                                      }
                                                      §§push(param2);
                                                      if(!_loc7_)
                                                      {
                                                         break loop16;
                                                      }
                                                      continue loop8;
                                                   }
                                                   var _temp_25:* = §§pop();
                                                   §§push(_temp_25);
                                                   §§push(_temp_25);
                                                   if(_loc7_)
                                                   {
                                                      break loop12;
                                                   }
                                                   if(!§§pop())
                                                   {
                                                      break loop7;
                                                   }
                                                   if(_loc6_)
                                                   {
                                                      break loop14;
                                                   }
                                                   §§pop();
                                                   if(!_loc6_)
                                                   {
                                                      break loop18;
                                                   }
                                                   §§goto(addr0109);
                                                }
                                                §§push(!§§pop());
                                                if(!_loc7_)
                                                {
                                                   break loop7;
                                                }
                                                break loop13;
                                             }
                                             break loop12;
                                          }
                                          break loop13;
                                       }
                                       break loop7;
                                    }
                                    if(!_loc6_)
                                    {
                                       param1();
                                       if(!_loc6_)
                                       {
                                          return;
                                       }
                                       break;
                                    }
                                    while(true)
                                    {
                                       §§push(§_-Vm§.instance);
                                       §§push(true);
                                       if(!_loc7_)
                                       {
                                          if(!§_-Q2v§.§_-U2F§)
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
                                       break;
                                    }
                                    §§goto(addr011c);
                                 }
                                 §§goto(addr00bd);
                              }
                              break loop16;
                           }
                           §§goto(addr0111);
                        }
                        §§goto(addr0112);
                     }
                     if(!§§pop())
                     {
                        break loop13;
                     }
                     if(!_loc6_)
                     {
                        continue loop8;
                     }
                     §§goto(addr0111);
                  }
                  var _temp_23:* = §§pop();
                  §§push(_temp_23);
                  §§push(_temp_23);
                  break loop12;
               }
               §§pop();
               loop8:
               while(true)
               {
                  while(true)
                  {
                     if(!_loc6_)
                     {
                        addr0112:
                        addr0109:
                        §§push(param3);
                        if(!_loc7_)
                        {
                           addr0111:
                           §§push(!§§pop());
                        }
                        if(!§§pop())
                        {
                           break;
                        }
                        if(!_loc6_)
                        {
                           addr011c:
                           _instance.§_-u1K§ = new Sprite();
                           if(_loc7_)
                           {
                              break loop8;
                           }
                        }
                     }
                     if(_loc7_)
                     {
                        var _temp_2:* = §_-EI§;
                        var _temp_1:* = param2;
                        this = §_-EI§;
                        param2 = _temp_1;
                        this = _temp_2;
                        break;
                     }
                     _instance.§_-u1K§.addChild(new MovieWaitingContent()).filters = [new GlowFilter(16777215,1,7,7,8)];
                     break loop8;
                  }
                  loop0:
                  while(true)
                  {
                     _instance.load(param1);
                     if(!_loc7_)
                     {
                        if(_loc7_)
                        {
                           var _temp_4:* = param1;
                           var _temp_3:* = _loc4_;
                           var _loc6_:* = _loc6_;
                           _loc4_ = _temp_3;
                           param1 = _temp_4;
                           loop1:
                           while(true)
                           {
                              _instance.§_-u1K§.graphics.drawRect(-_instance.§_-u1K§.x,-_instance.§_-u1K§.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
                              if(!_loc7_)
                              {
                                 if(!_loc6_)
                                 {
                                    if(_loc6_)
                                    {
                                       var _temp_8:* = _loc4_;
                                       var _temp_7:* = _loc5_;
                                       param3 = param3;
                                       _loc5_ = _temp_7;
                                       _loc4_ = _temp_8;
                                       loop2:
                                       while(true)
                                       {
                                          _instance.§_-u1K§.addChild(_loc4_);
                                          if(!_loc6_)
                                          {
                                             if(_loc7_)
                                             {
                                                var _temp_12:* = param1;
                                                var _temp_11:* = param1;
                                                _loc5_ = _loc5_;
                                                param1 = _temp_11;
                                                param1 = _temp_12;
                                                loop3:
                                                do
                                                {
                                                   _instance.§_-u1K§.y = (Game.starling.stage.stageHeight - _loc5_.height) * 0.5 - _loc5_.y;
                                                   loop10:
                                                   while(true)
                                                   {
                                                      if(!_loc7_)
                                                      {
                                                         loop11:
                                                         while(true)
                                                         {
                                                            if(!_loc7_)
                                                            {
                                                               if(!_loc6_)
                                                               {
                                                                  break;
                                                               }
                                                               var _temp_14:* = param1;
                                                               var _temp_13:* = param3;
                                                               var _loc7_:* = _loc7_;
                                                               param3 = _temp_13;
                                                               param1 = _temp_14;
                                                               _loc5_ = _instance.§_-u1K§.getBounds(_instance.§_-u1K§);
                                                            }
                                                            if(_loc7_)
                                                            {
                                                               var _temp_16:* = param3;
                                                               var _temp_15:* = param3;
                                                               _loc6_ = _loc6_;
                                                               param3 = _temp_15;
                                                               param3 = _temp_16;
                                                               while(true)
                                                               {
                                                                  _loc4_ = new §_-22V§(gls("Подожди\nИдёт загрузка библиотеки..."),-90,-9,new TextFormat(§_-22V§.§_-pJ§,14,8812372,null,null,null,null,null,"center"),275);
                                                                  addr0290:
                                                                  if(_loc7_)
                                                                  {
                                                                     var _temp_18:* = _loc6_;
                                                                     var _temp_17:* = _loc7_;
                                                                     param3 = param3;
                                                                     _loc7_ = _temp_17;
                                                                     _loc6_ = _temp_18;
                                                                     addr02a6:
                                                                     Game.§_-d2t§.addChild(_instance.§_-u1K§);
                                                                     addr02b4:
                                                                     if(!_loc7_)
                                                                     {
                                                                        if(_loc7_)
                                                                        {
                                                                           var _temp_20:* = param3;
                                                                           var _temp_19:* = param1;
                                                                           this = §_-EI§;
                                                                           param1 = _temp_19;
                                                                           param3 = _temp_20;
                                                                           break loop11;
                                                                        }
                                                                        continue loop0;
                                                                     }
                                                                     break loop10;
                                                                  }
                                                                  continue loop2;
                                                               }
                                                               break loop3;
                                                            }
                                                            break loop10;
                                                         }
                                                         _instance.§_-u1K§.graphics.beginFill(0,0.2);
                                                      }
                                                      addr02dd:
                                                      if(!_loc6_)
                                                      {
                                                         continue loop1;
                                                      }
                                                      var _temp_22:* = §_-EI§;
                                                      var _temp_21:* = param2;
                                                      _loc4_ = _loc4_;
                                                      param2 = _temp_21;
                                                      this = _temp_22;
                                                      §§goto(addr02f1);
                                                   }
                                                }
                                                while(!_loc7_);
                                                break;
                                             }
                                             §§goto(addr0237);
                                          }
                                          §§goto(addr0290);
                                       }
                                       break loop3;
                                    }
                                    §§goto(addr02a6);
                                 }
                                 §§goto(addr02dd);
                              }
                              §§goto(addr02b4);
                           }
                           break loop3;
                        }
                        break loop5;
                     }
                     break loop8;
                  }
                  addr0141:
                  §§goto(addr0141);
                  addr00bd:
               }
            }
            break loop8;
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
      
      public static function §_-T1P§(param1:String, param2:Function) : void
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
      
      public static function get §_-d2l§() : int
      {
         var _loc2_:§_-t19§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in _instance.§_-SQ§)
         {
            _loc1_ += _loc2_.§_-d2l§;
         }
         return _loc1_;
      }
      
      public static function get §_-z28§() : int
      {
         var _loc2_:§_-t19§ = null;
         var _loc1_:int = 0;
         for each(_loc2_ in _instance.§_-SQ§)
         {
            _loc1_ += _loc2_.§_-z28§;
         }
         return _loc1_;
      }
      
      private function §_-32q§(param1:Event) : void
      {
         if(!_loc3_)
         {
            dispatchEvent(param1);
         }
      }
      
      private function onLoaded(param1:Event) : void
      {
         var _loc2_:§_-t19§ = null;
         loop3:
         while(true)
         {
            while(true)
            {
               if(!_loc6_)
               {
                  var _loc3_:int = 0;
                  if(!_loc5_)
                  {
                     var _loc4_:* = this.§_-SQ§;
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
                        §§goto(addr0055);
                     }
                  }
                  if(_loc5_)
                  {
                     break;
                  }
                  §_-TQ§.add("RuntimeLoader - onLoaded");
                  if(_loc5_)
                  {
                     break loop3;
                  }
               }
               this.loaded = true;
               if(!_loc5_)
               {
                  break;
               }
               §§goto(addr0109);
            }
            while(true)
            {
               if(this.§_-u1K§ != null)
               {
                  if(!_loc5_)
                  {
                     Game.§_-d2t§.removeChild(this.§_-u1K§);
                     if(!_loc6_)
                     {
                        break loop3;
                     }
                     §§goto(addr0151);
                  }
                  §§goto(addr0136);
               }
               §§goto(addr014a);
            }
            §§goto(addr0167);
         }
         if(_loc6_)
         {
            var _temp_2:* = this;
            var _temp_1:* = this;
            _loc4_ = _loc4_;
            this = _temp_1;
            this = _temp_2;
         }
         this.§_-u1K§ = null;
         loop5:
         while(true)
         {
            if(!_loc6_)
            {
               if(_loc6_)
               {
                  var _temp_4:* = _loc5_;
                  var _temp_3:* = _loc6_;
                  var _loc6_:* = _loc6_;
                  _loc6_ = _temp_3;
                  var _loc5_:* = _temp_4;
                  loop1:
                  while(true)
                  {
                     dispatchEvent(new Event(Event.COMPLETE));
                     if(!_loc5_)
                     {
                        if(!_loc5_)
                        {
                           addr0109:
                           if(!_loc5_)
                           {
                              break loop5;
                           }
                           var _temp_8:* = _loc6_;
                           var _temp_7:* = _loc5_;
                           _loc2_ = _loc2_;
                           _loc5_ = _temp_7;
                           _loc6_ = _temp_8;
                           while(true)
                           {
                              this.§_-92v§();
                              addr0136:
                              if(!_loc6_)
                              {
                                 continue loop1;
                              }
                              var _temp_10:* = this;
                              var _temp_9:* = _loc5_;
                              param1 = param1;
                              _loc5_ = _temp_9;
                              this = _temp_10;
                              Game.§_-A1Q§();
                           }
                           break;
                           addr0131:
                        }
                        addr0151:
                        if(!_loc6_)
                        {
                           §§goto(addr0131);
                        }
                        var _temp_12:* = _loc4_;
                        var _temp_11:* = _loc5_;
                        _loc3_ = _loc3_;
                        _loc5_ = _temp_11;
                        _loc4_ = _temp_12;
                        break loop5;
                     }
                     §§goto(addr0136);
                  }
                  addr0055:
                  return;
               }
               §§goto(addr014a);
            }
            §§goto(addr0136);
         }
         addr0167:
      }
      
      private function §_-92v§() : void
      {
         var _loc1_:int = 0;
         if(!_loc3_)
         {
            while(_loc1_ < this.§_-VN§.length)
            {
               this.§_-VN§[_loc1_]();
               if(!_loc3_)
               {
                  _loc1_++;
               }
            }
            if(!_loc4_)
            {
               this.§_-VN§ = [];
            }
         }
      }
      
      private function load(param1:Function) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:§_-t19§ = null;
         if(!_loc6_)
         {
            loop2:
            while(true)
            {
               while(true)
               {
                  if(param1 != null)
                  {
                     if(_loc6_)
                     {
                        break;
                     }
                     this.§_-VN§.push(param1);
                     if(_loc6_)
                     {
                        break loop2;
                     }
                  }
                  §§push(this.§_-21P§);
                  if(!_loc7_)
                  {
                     if(§§pop())
                     {
                        if(!_loc6_)
                        {
                           return;
                        }
                        break loop2;
                     }
                     this.§_-21P§ = true;
                     if(!_loc7_)
                     {
                        break loop2;
                     }
                     break;
                  }
                  §§goto(addr0065);
               }
               this.§_-92v§();
               if(!_loc6_)
               {
                  return;
               }
            }
            addr0065:
            if(this.loaded)
            {
               if(!_loc6_)
               {
                  break loop3;
               }
            }
            else
            {
               var _loc4_:int = 0;
               if(!_loc6_)
               {
                  var _loc5_:* = §_-EI§.§_-n5§;
                  if(!_loc7_)
                  {
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
                                    _loc3_.addEventListener(ProgressEvent.PROGRESS,this.§_-32q§);
                                    if(_loc6_)
                                    {
                                       break loop5;
                                    }
                                    if(!_loc6_)
                                    {
                                       if(!_loc7_)
                                       {
                                          break loop4;
                                       }
                                       var _temp_8:* = _loc4_;
                                       var _temp_7:* = _loc6_;
                                       var _loc7_:* = _loc7_;
                                       var _loc6_:* = _temp_7;
                                       _loc4_ = _temp_8;
                                       _loc3_ = new §_-t19§();
                                    }
                                    if(_loc7_)
                                    {
                                       var _temp_10:* = this;
                                       var _temp_9:* = _loc2_;
                                       _loc6_ = _loc6_;
                                       _loc2_ = _temp_9;
                                       this = _temp_10;
                                       break loop4;
                                    }
                                 }
                                 break loop3;
                              }
                              §§goto(addr010d);
                           }
                           §§goto(addr0183);
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
                           if(_loc7_)
                           {
                              break loop5;
                           }
                           _loc3_.§_-538§(_loc2_);
                           if(!_loc7_)
                           {
                              break loop5;
                           }
                        }
                        else
                        {
                           _loc3_.loadBytes(_loc2_);
                           if(!_loc6_)
                           {
                              addr0183:
                              this.§_-SQ§.push(_loc3_);
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

