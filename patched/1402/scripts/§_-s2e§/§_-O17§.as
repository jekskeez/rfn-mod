package §_-s2e§
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class §_-O17§ extends EventDispatcher
   {
      
      public var loaded:Boolean = false;
      
      protected var §_-w1f§:URLLoader;
      
      private var loader:Loader;
      
      private var §_-H1X§:Boolean = false;
      
      private var §_-XA§:Boolean = false;
      
      private var §_-Y1k§:String;
      
      public function §_-O17§()
      {
         if(!_loc1_)
         {
            super();
         }
      }
      
      public function §_-01y§(param1:String) : void
      {
         if(!_loc4_)
         {
            this.§_-Y1k§ = param1;
         }
         §§push(§_-IM§.§_-61O§(this.§_-Y1k§));
         if(!_loc4_)
         {
            §§push(§§pop());
         }
         var _loc2_:* = §§pop();
         loop1:
         while(true)
         {
            if(!_loc4_)
            {
               this.§_-w1f§ = new URLLoader();
               if(_loc5_)
               {
                  break;
               }
            }
            if(_loc5_)
            {
               var _temp_2:* = param1;
               var _temp_1:* = _loc5_;
               _loc2_ = _loc2_;
               var _loc5_:* = _temp_1;
               param1 = _temp_2;
            }
            this.§_-w1f§.dataFormat = URLLoaderDataFormat.BINARY;
            if(_loc4_)
            {
               break;
            }
            if(_loc5_)
            {
               var _temp_4:* = _loc5_;
               var _temp_3:* = param1;
               var _loc3_:URLRequest = _loc3_;
               param1 = _temp_3;
               _loc5_ = _temp_4;
            }
            this.§_-w1f§.addEventListener(Event.COMPLETE,this.onLoaded);
            if(!_loc4_)
            {
               loop2:
               while(true)
               {
                  if(_loc5_)
                  {
                     var _temp_6:* = param1;
                     var _temp_5:* = this;
                     _loc3_ = _loc3_;
                     this = _temp_5;
                     param1 = _temp_6;
                     do
                     {
                        this.§_-w1f§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
                        if(_loc5_)
                        {
                           break loop1;
                        }
                        if(!_loc4_)
                        {
                           break loop2;
                        }
                        var _temp_8:* = param1;
                        var _temp_7:* = _loc2_;
                        this = this;
                        _loc2_ = _temp_7;
                        param1 = _temp_8;
                     }
                     while(!_loc4_);
                     var _temp_10:* = param1;
                     var _temp_9:* = this;
                     param1 = param1;
                     this = _temp_9;
                     param1 = _temp_10;
                     addr010c:
                     break;
                     addr00c5:
                  }
                  this.§_-w1f§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
                  if(_loc4_)
                  {
                     break loop1;
                  }
                  if(!_loc4_)
                  {
                     §§goto(addr00c5);
                  }
                  §§goto(addr010c);
               }
               this.§_-w1f§.addEventListener(ProgressEvent.PROGRESS,this.§_-V24§);
               break;
            }
            §§goto(addr00dd);
         }
         if(!_loc4_)
         {
         }
         _loc3_ = new URLRequest();
         if(!_loc4_)
         {
            _loc3_.url = _loc2_;
            if(!_loc4_)
            {
               this.§_-w1f§.load(_loc3_);
            }
         }
      }
      
      public function loadBytes(param1:Class) : void
      {
         var _loc2_:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         loop1:
         while(true)
         {
            if(!_loc4_)
            {
               _loc2_.allowCodeImport = true;
               if(_loc3_)
               {
                  break;
               }
            }
            if(_loc3_)
            {
               var _temp_2:* = this;
               var _temp_1:* = _loc3_;
               var _loc3_:* = _loc3_;
               _loc3_ = _temp_1;
               this = _temp_2;
            }
            this.loader = new Loader();
            if(!_loc4_)
            {
               loop2:
               while(true)
               {
                  if(_loc3_)
                  {
                     var _temp_4:* = param1;
                     var _temp_3:* = _loc2_;
                     var _loc4_:* = _loc4_;
                     _loc2_ = _temp_3;
                     param1 = _temp_4;
                     while(true)
                     {
                        this.loader.loadBytes(this.§_-u27§(new param1() as ByteArray),_loc2_);
                        if(_loc4_)
                        {
                           break loop1;
                        }
                        if(!_loc3_)
                        {
                           break loop2;
                        }
                        var _temp_6:* = _loc4_;
                        var _temp_5:* = _loc4_;
                        _loc2_ = _loc2_;
                        _loc4_ = _temp_5;
                        _loc4_ = _temp_6;
                        break loop1;
                     }
                     addr00d9:
                     var _temp_8:* = this;
                     var _temp_7:* = _loc4_;
                     _loc2_ = _loc2_;
                     _loc4_ = _temp_7;
                     this = _temp_8;
                     break;
                     addr007e:
                  }
                  this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
                  break loop1;
               }
               return;
            }
            §§goto(addr009a);
         }
         if(!_loc3_)
         {
            §§goto(addr007e);
         }
         §§goto(addr00d9);
      }
      
      public function get §_-O2B§() : int
      {
         return this.§_-w1f§ == null || this.§_-w1f§.bytesTotal == 0 ? 2000000 : int(this.§_-w1f§.bytesTotal);
      }
      
      public function get §_-J2I§() : int
      {
         return this.§_-w1f§ == null ? 0 : int(this.§_-w1f§.bytesLoaded);
      }
      
      protected function onLoaded(param1:Event) : void
      {
         var _loc2_:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         if(!_loc4_)
         {
            _loc2_.allowCodeImport = true;
            if(!_loc3_)
            {
               loop1:
               while(true)
               {
                  if(_loc4_)
                  {
                     var _temp_2:* = this;
                     var _temp_1:* = _loc2_;
                     var _loc3_:* = _loc3_;
                     _loc2_ = _temp_1;
                     this = _temp_2;
                     do
                     {
                        this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
                        if(!_loc4_)
                        {
                           if(_loc4_)
                           {
                              continue;
                           }
                           if(_loc3_)
                           {
                              var _temp_4:* = _loc3_;
                              var _temp_3:* = this;
                              var _loc4_:* = _loc4_;
                              this = _temp_3;
                              _loc3_ = _temp_4;
                           }
                           this.loader.loadBytes(this.§_-u27§((param1.currentTarget as URLLoader).data),_loc2_);
                        }
                        if(!_loc3_)
                        {
                           break loop1;
                        }
                        var _temp_6:* = param1;
                        var _temp_5:* = _loc3_;
                        _loc3_ = _loc3_;
                        _loc3_ = _temp_5;
                        param1 = _temp_6;
                     }
                     while(!_loc4_);
                     addr00df:
                     var _temp_8:* = _loc2_;
                     var _temp_7:* = _loc4_;
                     param1 = param1;
                     _loc4_ = _temp_7;
                     _loc2_ = _temp_8;
                     break;
                     addr004d:
                  }
                  this.loader = new Loader();
                  if(!_loc4_)
                  {
                     §§goto(addr004d);
                  }
                  §§goto(addr00df);
               }
               return;
            }
         }
         §§goto(addr007f);
      }
      
      protected function §_-u27§(param1:ByteArray) : ByteArray
      {
         loop1:
         while(true)
         {
            loop2:
            while(true)
            {
               loop4:
               while(true)
               {
                  while(true)
                  {
                     if(!_loc4_)
                     {
                        §§push(param1.readUTFBytes(3) == §_a_-_---§.§_a_--_--§(-1820302793));
                        if(_loc4_)
                        {
                           break loop2;
                        }
                        var _temp_10:* = §§pop();
                        §§push(_temp_10);
                        §§push(_temp_10);
                        if(_loc3_)
                        {
                           break;
                        }
                        if(§§pop())
                        {
                           break loop4;
                        }
                        if(_loc4_)
                        {
                           break loop2;
                        }
                        §§pop();
                        if(_loc3_)
                        {
                           break loop1;
                        }
                     }
                     §§push(param1.readUTFBytes(3) == §_a_-_---§.§_a_--_--§(-1820302794));
                     if(!_loc4_)
                     {
                        break loop4;
                     }
                     break loop2;
                  }
                  if(!§§pop())
                  {
                     if(!_loc3_)
                     {
                        break loop2;
                     }
                  }
                  §§goto(addr0095);
               }
               var _temp_9:* = §§pop();
               §§push(_temp_9);
               §§push(_temp_9);
               break loop6;
            }
            §§pop();
            while(true)
            {
               if(!_loc3_)
               {
                  break loop1;
               }
               break;
            }
            §§goto(addr0099);
         }
         addr0095:
         if(param1.readUTFBytes(3) != §_a_-_---§.§_a_--_--§(-1820302796))
         {
            var _loc2_:ByteArray = new ByteArray();
            loop3:
            while(true)
            {
               if(!_loc3_)
               {
                  _loc2_.writeUTFBytes(§_a_-_---§.§_a_--_--§(-1820302793));
                  if(!_loc3_)
                  {
                     if(_loc4_)
                     {
                        var _temp_2:* = this;
                        var _temp_1:* = this;
                        param1 = param1;
                        this = _temp_1;
                        this = _temp_2;
                        while(true)
                        {
                           _loc2_.writeBytes(param1);
                           if(!_loc4_)
                           {
                              addr00ec:
                              if(!_loc3_)
                              {
                                 break loop3;
                              }
                              var _temp_6:* = _loc2_;
                              var _temp_5:* = this;
                              var _loc4_:* = _loc4_;
                              this = _temp_5;
                              _loc2_ = _temp_6;
                              param1.position = 0;
                           }
                           addr0105:
                           if(_loc4_)
                           {
                              var _temp_8:* = _loc2_;
                              var _temp_7:* = this;
                              this = this;
                              this = _temp_7;
                              _loc2_ = _temp_8;
                              break loop3;
                           }
                        }
                        §§goto(addr0099);
                     }
                     §§goto(addr00ff);
                  }
                  §§goto(addr00ec);
               }
               §§goto(addr0105);
            }
            return _loc2_;
         }
         addr0099:
         return param1;
      }
      
      protected function onComplete(param1:Event) : void
      {
         while(true)
         {
            if(!_loc3_)
            {
               this.loaded = true;
               if(_loc3_)
               {
                  break;
               }
            }
            dispatchEvent(param1 == null ? new Event(Event.COMPLETE) : param1);
            break;
         }
      }
      
      private function §_-V24§(param1:ProgressEvent) : void
      {
         if(!_loc3_)
         {
            dispatchEvent(param1);
         }
      }
      
      private function onError(param1:Event) : void
      {
         var _loc2_:* = null;
         loop2:
         while(true)
         {
            loop3:
            while(true)
            {
               if(!_loc3_)
               {
                  §§push(§_-p2U§);
                  §§push("Loader.onError ");
                  if(!_loc4_)
                  {
                     §§push(§§pop() + param1);
                  }
                  §§pop().add(§§pop());
                  while(true)
                  {
                     loop5:
                     while(true)
                     {
                        while(true)
                        {
                           if(!_loc3_)
                           {
                              §§push(this.§_-H1X§);
                              if(_loc3_)
                              {
                                 break;
                              }
                              if(!§§pop())
                              {
                                 break loop5;
                              }
                              if(_loc4_)
                              {
                                 continue loop8;
                              }
                           }
                           §§push(this.§_-XA§);
                           break;
                        }
                        if(§§pop())
                        {
                           if(!_loc4_)
                           {
                              §_-uR§.§_-P1h§(new Error("Can\'t load Lib " + this.§_-Y1k§ + "\n" + this,404));
                              if(!_loc3_)
                              {
                                 break loop3;
                              }
                           }
                           break loop7;
                        }
                        this.§_-XA§ = true;
                        if(_loc4_)
                        {
                           break loop7;
                        }
                        if(_loc4_)
                        {
                           var _temp_16:* = _loc3_;
                           var _temp_15:* = _loc3_;
                           var _loc4_:* = _loc4_;
                           var _loc3_:* = _temp_15;
                           _loc3_ = _temp_16;
                           §§goto(addr009d);
                        }
                        else
                        {
                           §§goto(addr0141);
                        }
                     }
                     this.§_-H1X§ = true;
                     §§goto(addr0122);
                  }
                  loop6:
                  while(true)
                  {
                     loop7:
                     while(true)
                     {
                        loop8:
                        while(true)
                        {
                           loop9:
                           while(true)
                           {
                              if(_loc4_)
                              {
                                 var _temp_4:* = _loc3_;
                                 var _temp_3:* = _loc2_;
                                 _loc4_ = _loc4_;
                                 _loc2_ = _temp_3;
                                 _loc3_ = _temp_4;
                                 addr014c:
                                 addr0141:
                                 §§push(§_-IM§.§_-61O§(this.§_-Y1k§));
                                 if(!_loc3_)
                                 {
                                    _loc2_ = §§pop();
                                    addr0153:
                                    if(_loc3_)
                                    {
                                       break;
                                    }
                                    addr017a:
                                    §§push(_loc2_);
                                    §§push("?");
                                    if(!_loc4_)
                                    {
                                       §§push(§§pop() + int(Math.random() * 10000));
                                    }
                                    §§push(§§pop() + §§pop());
                                 }
                                 addr0195:
                                 _loc2_ = §§pop();
                                 if(_loc3_)
                                 {
                                    break loop7;
                                 }
                                 if(!_loc3_)
                                 {
                                    break loop6;
                                 }
                                 var _temp_6:* = param1;
                                 var _temp_5:* = _loc4_;
                                 _loc3_ = _loc3_;
                                 _loc4_ = _temp_5;
                                 param1 = _temp_6;
                              }
                              §_-IM§.§_-wl§.push(this.§_-Y1k§);
                              if(!_loc3_)
                              {
                                 while(true)
                                 {
                                    loop10:
                                    while(true)
                                    {
                                       loop11:
                                       while(true)
                                       {
                                          loop12:
                                          while(true)
                                          {
                                             §§push(§_-IM§.§_-61O§(this.§_-Y1k§));
                                             if(!_loc4_)
                                             {
                                                if(_loc4_)
                                                {
                                                   break;
                                                }
                                                if(!_loc4_)
                                                {
                                                   §§push(§§pop());
                                                }
                                                else
                                                {
                                                   §§goto(addr014c);
                                                }
                                             }
                                             if(!_loc4_)
                                             {
                                                _loc2_ = §§pop();
                                                if(!_loc3_)
                                                {
                                                   while(true)
                                                   {
                                                      this.§_-w1f§.load(new URLRequest(_loc2_));
                                                      if(!_loc4_)
                                                      {
                                                         if(!_loc3_)
                                                         {
                                                            if(!_loc3_)
                                                            {
                                                               if(!_loc3_)
                                                               {
                                                                  break loop8;
                                                               }
                                                               var _temp_8:* = param1;
                                                               var _temp_7:* = _loc4_;
                                                               _loc4_ = _loc4_;
                                                               _loc4_ = _temp_7;
                                                               param1 = _temp_8;
                                                               continue loop12;
                                                            }
                                                            addr0122:
                                                            if(_loc3_)
                                                            {
                                                               break loop7;
                                                            }
                                                            if(_loc3_)
                                                            {
                                                               break loop11;
                                                            }
                                                            continue loop9;
                                                         }
                                                         §§goto(addr01bb);
                                                      }
                                                      else
                                                      {
                                                         §§goto(addr00fc);
                                                      }
                                                   }
                                                   break loop3;
                                                   addr009d:
                                                }
                                                var _temp_10:* = _loc2_;
                                                var _temp_9:* = _loc3_;
                                                param1 = param1;
                                                _loc3_ = _temp_9;
                                                _loc2_ = _temp_10;
                                                break loop5;
                                             }
                                             break loop10;
                                          }
                                          §§goto(addr017a);
                                       }
                                       §§goto(addr0153);
                                    }
                                    §§goto(addr0195);
                                 }
                                 break loop3;
                              }
                              var _temp_12:* = _loc2_;
                              var _temp_11:* = this;
                              _loc4_ = _loc4_;
                              this = _temp_11;
                              _loc2_ = _temp_12;
                              break loop6;
                           }
                           var _temp_14:* = this;
                           var _temp_13:* = _loc2_;
                           this = this;
                           _loc2_ = _temp_13;
                           this = _temp_14;
                           §§goto(addr0164);
                        }
                        return;
                     }
                     if(_loc3_)
                     {
                        var _temp_2:* = param1;
                        var _temp_1:* = param1;
                        _loc4_ = _loc4_;
                        param1 = _temp_1;
                        param1 = _temp_2;
                        break loop8;
                     }
                     addr0164:
                     break loop2;
                  }
                  this.§_-w1f§.load(new URLRequest(_loc2_));
                  break loop7;
               }
               break;
            }
            break loop1;
         }
      }
   }
}

