package §_-68§
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
   
   public class §_-t19§ extends EventDispatcher
   {
      
      public var loaded:Boolean = false;
      
      protected var §_-p1X§:URLLoader;
      
      private var loader:Loader;
      
      private var §_-31I§:Boolean = false;
      
      private var §_-21z§:Boolean = false;
      
      private var §_-43k§:String;
      
      public function §_-t19§()
      {
         if(!_loc1_)
         {
            super();
         }
      }
      
      public function §_-538§(param1:String) : void
      {
         if(!_loc5_)
         {
            this.§_-43k§ = param1;
         }
         §§push(§_-p22§.§_-c1G§(this.§_-43k§));
         if(!_loc4_)
         {
            §§push(§§pop());
         }
         var _loc2_:* = §§pop();
         loop1:
         while(true)
         {
            while(true)
            {
               if(!_loc4_)
               {
                  this.§_-p1X§ = new URLLoader();
                  if(_loc5_)
                  {
                     break;
                  }
                  if(_loc5_)
                  {
                     var _temp_6:* = param1;
                     var _temp_5:* = _loc5_;
                     _loc2_ = _loc2_;
                     var _loc5_:* = _temp_5;
                     param1 = _temp_6;
                  }
                  this.§_-p1X§.dataFormat = URLLoaderDataFormat.BINARY;
                  if(_loc5_)
                  {
                     break loop1;
                  }
               }
               if(_loc5_)
               {
                  var _temp_8:* = _loc5_;
                  var _temp_7:* = param1;
                  var _loc3_:URLRequest = _loc3_;
                  param1 = _temp_7;
                  _loc5_ = _temp_8;
               }
               this.§_-p1X§.addEventListener(Event.COMPLETE,this.onLoaded);
               if(_loc5_)
               {
                  break;
               }
               while(true)
               {
                  if(_loc5_)
                  {
                     var _temp_10:* = param1;
                     var _temp_9:* = this;
                     _loc3_ = _loc3_;
                     this = _temp_9;
                     param1 = _temp_10;
                     §§goto(addr00c5);
                  }
                  §§goto(addr00ef);
               }
               §§goto(addr0128);
            }
            if(!_loc4_)
            {
            }
            _loc3_ = new URLRequest();
            if(!_loc4_)
            {
               _loc3_.url = _loc2_;
               if(!_loc5_)
               {
                  this.§_-p1X§.load(_loc3_);
               }
            }
            return;
         }
         if(!_loc4_)
         {
            do
            {
               this.§_-p1X§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
               if(_loc4_)
               {
                  break loop2;
               }
               if(!_loc4_)
               {
                  addr0128:
                  this.§_-p1X§.addEventListener(ProgressEvent.PROGRESS,this.§_-32q§);
                  break loop2;
               }
               var _temp_2:* = param1;
               var _temp_1:* = _loc2_;
               this = this;
               _loc2_ = _temp_1;
               param1 = _temp_2;
               this.§_-p1X§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
               if(_loc4_)
               {
                  break loop2;
               }
            }
            while(!_loc4_);
            addr00c5:
         }
         var _temp_4:* = param1;
         var _temp_3:* = this;
         param1 = param1;
         this = _temp_3;
         param1 = _temp_4;
         §§goto(addr0128);
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
                        this.loader.loadBytes(this.§_-tn§(new param1() as ByteArray),_loc2_);
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
      
      public function get §_-d2l§() : int
      {
         return this.§_-p1X§ == null || this.§_-p1X§.bytesTotal == 0 ? 2000000 : int(this.§_-p1X§.bytesTotal);
      }
      
      public function get §_-z28§() : int
      {
         return this.§_-p1X§ == null ? 0 : int(this.§_-p1X§.bytesLoaded);
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
                           this.loader.loadBytes(this.§_-tn§((param1.currentTarget as URLLoader).data),_loc2_);
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
      
      protected function §_-tn§(param1:ByteArray) : ByteArray
      {
         loop1:
         while(true)
         {
            loop2:
            while(true)
            {
               if(!_loc4_)
               {
                  loop3:
                  while(true)
                  {
                     §§push(param1.readUTFBytes(3) == §_a_-_---§.§_a_--_--§(-1820302793));
                     if(!_loc4_)
                     {
                        var _temp_1:* = §§pop();
                        while(true)
                        {
                           §§push(_temp_1);
                           §§push(_temp_1);
                           if(!_loc3_)
                           {
                              if(!§§pop())
                              {
                                 if(_loc3_)
                                 {
                                    break;
                                 }
                                 §§pop();
                                 if(_loc4_)
                                 {
                                    break loop3;
                                 }
                                 §§push(param1.readUTFBytes(3) == §_a_-_---§.§_a_--_--§(-1820302794));
                                 if(_loc3_)
                                 {
                                    break loop2;
                                 }
                              }
                              var _temp_2:* = §§pop();
                              §§push(_temp_2);
                              §§push(_temp_2);
                           }
                           if(!§§pop())
                           {
                              if(!_loc3_)
                              {
                                 break;
                              }
                           }
                           break loop2;
                        }
                     }
                     §§pop();
                     if(!_loc4_)
                     {
                        break;
                     }
                     break loop1;
                  }
               }
               §§push(param1.readUTFBytes(3) == §_a_-_---§.§_a_--_--§(-1820302796));
               break;
            }
            if(§§pop())
            {
               break;
            }
            var _loc2_:ByteArray = new ByteArray();
            loop5:
            while(true)
            {
               if(!_loc3_)
               {
                  _loc2_.writeUTFBytes(§_a_-_---§.§_a_--_--§(-1820302793));
                  if(!_loc3_)
                  {
                     if(_loc4_)
                     {
                        var _temp_4:* = this;
                        var _temp_3:* = this;
                        param1 = param1;
                        this = _temp_3;
                        this = _temp_4;
                        while(true)
                        {
                           _loc2_.writeBytes(param1);
                           if(!_loc4_)
                           {
                              addr00ec:
                              if(!_loc3_)
                              {
                                 break loop5;
                              }
                              var _temp_8:* = _loc2_;
                              var _temp_7:* = this;
                              var _loc4_:* = _loc4_;
                              this = _temp_7;
                              _loc2_ = _temp_8;
                              param1.position = 0;
                           }
                           addr0105:
                           if(_loc4_)
                           {
                              var _temp_10:* = _loc2_;
                              var _temp_9:* = this;
                              this = this;
                              this = _temp_9;
                              _loc2_ = _temp_10;
                              break loop5;
                           }
                        }
                        break loop1;
                     }
                     §§goto(addr00ff);
                  }
                  §§goto(addr00ec);
               }
               §§goto(addr0105);
            }
            return _loc2_;
         }
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
      
      private function §_-32q§(param1:ProgressEvent) : void
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
            while(true)
            {
               loop4:
               while(true)
               {
                  if(!_loc4_)
                  {
                     §§push(§_-TQ§);
                     §§push("Loader.onError ");
                     if(!_loc4_)
                     {
                        §§push(§§pop() + param1);
                     }
                     §§pop().add(§§pop());
                     loop5:
                     while(true)
                     {
                        if(!_loc4_)
                        {
                           loop6:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this.§_-31I§);
                                 if(!_loc4_)
                                 {
                                    if(!§§pop())
                                    {
                                       break;
                                    }
                                    if(_loc3_)
                                    {
                                       break loop6;
                                    }
                                    §§push(this.§_-21z§);
                                 }
                                 if(§§pop())
                                 {
                                    if(_loc4_)
                                    {
                                       break loop4;
                                    }
                                    §_-k2X§.§_-fm§(new Error("Can\'t load Lib " + this.§_-43k§ + "\n" + this,404));
                                    if(!_loc4_)
                                    {
                                       break loop4;
                                    }
                                 }
                                 else
                                 {
                                    this.§_-21z§ = true;
                                    if(_loc4_)
                                    {
                                       break loop6;
                                    }
                                 }
                                 while(true)
                                 {
                                    if(_loc4_)
                                    {
                                       var _temp_16:* = _loc3_;
                                       var _temp_15:* = _loc3_;
                                       var _loc4_:* = _loc4_;
                                       var _loc3_:* = _temp_15;
                                       _loc3_ = _temp_16;
                                       §§goto(addr00a2);
                                    }
                                    §§goto(addr0144);
                                 }
                                 §§goto(addr01b0);
                              }
                              this.§_-31I§ = true;
                              §§goto(addr0130);
                           }
                           addr019d:
                           if(_loc3_)
                           {
                              var _temp_4:* = param1;
                              var _temp_3:* = _loc4_;
                              _loc3_ = _loc3_;
                              _loc4_ = _temp_3;
                              param1 = _temp_4;
                              addr01b0:
                              §_-p22§.§_-I2p§.push(this.§_-43k§);
                              if(!_loc3_)
                              {
                                 while(true)
                                 {
                                    loop8:
                                    while(true)
                                    {
                                       loop9:
                                       while(true)
                                       {
                                          §§push(§_-p22§.§_-c1G§(this.§_-43k§));
                                          if(!_loc3_)
                                          {
                                             if(_loc4_)
                                             {
                                                break;
                                             }
                                             if(_loc4_)
                                             {
                                                break loop8;
                                             }
                                             §§push(§§pop());
                                          }
                                          while(true)
                                          {
                                             if(!_loc4_)
                                             {
                                                _loc2_ = §§pop();
                                                addr0114:
                                                if(!_loc3_)
                                                {
                                                   if(!_loc3_)
                                                   {
                                                      while(true)
                                                      {
                                                         this.§_-p1X§.load(new URLRequest(_loc2_));
                                                         if(!_loc4_)
                                                         {
                                                            if(!_loc3_)
                                                            {
                                                               if(_loc3_)
                                                               {
                                                                  break loop2;
                                                               }
                                                               if(!_loc4_)
                                                               {
                                                                  addr00ca:
                                                                  if(!_loc3_)
                                                                  {
                                                                     break loop5;
                                                                  }
                                                                  var _temp_8:* = param1;
                                                                  var _temp_7:* = _loc4_;
                                                                  _loc4_ = _loc4_;
                                                                  _loc4_ = _temp_7;
                                                                  param1 = _temp_8;
                                                                  continue loop9;
                                                               }
                                                               §§goto(addr019d);
                                                            }
                                                            §§goto(addr01bd);
                                                         }
                                                         else
                                                         {
                                                            §§goto(addr0114);
                                                         }
                                                      }
                                                      break loop4;
                                                      addr00a2:
                                                   }
                                                   var _temp_10:* = _loc2_;
                                                   var _temp_9:* = _loc3_;
                                                   param1 = param1;
                                                   _loc3_ = _temp_9;
                                                   _loc2_ = _temp_10;
                                                   break loop7;
                                                }
                                                addr0130:
                                                if(!_loc4_)
                                                {
                                                   break;
                                                }
                                                var _temp_12:* = _loc3_;
                                                var _temp_11:* = _loc2_;
                                                _loc4_ = _loc4_;
                                                _loc2_ = _temp_11;
                                                _loc3_ = _temp_12;
                                                §§push(§_-p22§.§_-c1G§(this.§_-43k§));
                                                if(!_loc3_)
                                                {
                                                   §§push(§§pop());
                                                   break loop8;
                                                }
                                             }
                                             §§goto(addr0182);
                                          }
                                          §§goto(addr01b0);
                                       }
                                       _loc2_ = §§pop();
                                       §§goto(addr019d);
                                    }
                                    _loc2_ = §§pop();
                                    if(!_loc3_)
                                    {
                                       if(!_loc3_)
                                       {
                                          addr0182:
                                          §§push(_loc2_);
                                          §§push("?");
                                          if(!_loc3_)
                                          {
                                             §§push(§§pop() + int(Math.random() * 10000));
                                          }
                                          §§push(§§pop() + §§pop());
                                          break loop9;
                                       }
                                       var _temp_6:* = this;
                                       var _temp_5:* = _loc2_;
                                       this = this;
                                       _loc2_ = _temp_5;
                                       this = _temp_6;
                                       §§goto(addr016c);
                                    }
                                    §§goto(addr019d);
                                 }
                                 break loop4;
                              }
                              var _temp_14:* = _loc2_;
                              var _temp_13:* = this;
                              _loc4_ = _loc4_;
                              this = _temp_13;
                              _loc2_ = _temp_14;
                           }
                           this.§_-p1X§.load(new URLRequest(_loc2_));
                           break loop2;
                        }
                        §§goto(addr0119);
                     }
                     §§goto(addr0202);
                  }
                  §§goto(addr00ca);
               }
               break loop1;
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
            addr0202:
            return;
         }
         addr016c:
         break loop3;
      }
   }
}

