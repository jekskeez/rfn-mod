package protocol
{
   import by.blooddy.crypto.Base64;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class §_-F2Q§ extends EventDispatcher
   {
      
      private static const §_-q2§:int = 65536;
      
      private static const §_-Q1c§:int = 0;
      
      private static const §_-ps§:int = 1;
      
      private static const §_-t1L§:int = 2;
      
      private static const §_-sx§:int = 8;
      
      private static const §_-Z25§:int = 9;
      
      private static const §_-jf§:int = 10;
      
      private var §_-53Z§:Socket;
      
      private var host:String;
      
      private var port:int;
      
      private var §_-426§:String;
      
      private var §_-N1a§:Boolean = false;
      
      private var §_-L1I§:ByteArray = new ByteArray();
      
      private var §_-H2V§:§_-z1i§ = null;
      
      private var §_-x1L§:§_-z1i§ = new §_-z1i§();
      
      private var §_-a1X§:§_-z1i§ = new §_-z1i§();
      
      public function §_-F2Q§()
      {
         super();
      }
      
      public function get connected() : Boolean
      {
         return Boolean(this.§_-53Z§) && this.§_-53Z§.connected && this.§_-N1a§;
      }
      
      public function connect(param1:String, param2:int = 80, param3:String = "/") : void
      {
         this.host = this.§_-o2m§(param1);
         this.port = param2;
         this.§_-426§ = param3;
         this.§_-53Z§ = new Socket();
         this.§_-53Z§.addEventListener(Event.CONNECT,this.onConnect);
         this.§_-53Z§.addEventListener(ProgressEvent.SOCKET_DATA,this.§_-82B§);
         this.§_-53Z§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.§_-53Z§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.§_-53Z§.addEventListener(Event.CLOSE,this.§_-m1O§);
         this.§_-53Z§.connect(this.host,this.port);
      }
      
      public function close() : void
      {
         if(!this.connected)
         {
            return;
         }
         this.§_-w1i§();
         try
         {
            this.§_-53Z§.close();
         }
         catch(err:Error)
         {
         }
         this.§_-N1a§ = false;
         this.§_-L1I§.clear();
         if(this.§_-H2V§)
         {
            §_-Q17§.add(this.§_-H2V§);
            this.§_-H2V§ = null;
         }
      }
      
      public function §_-w18§(param1:§_-z1i§) : void
      {
         var _loc4_:int = 0;
         var _loc5_:§_-z1i§ = null;
         var _loc6_:Boolean = false;
         var _loc2_:int = int(param1.length);
         if(_loc2_ <= §_-q2§)
         {
            this.§_-K15§(§_-t1L§,param1,true);
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = Math.min(§_-q2§,_loc2_ - _loc3_);
            _loc5_ = §_-Q17§.get(_loc4_);
            _loc5_.writeBytes(param1,_loc3_,_loc4_);
            _loc6_ = _loc3_ + _loc4_ >= _loc2_;
            this.§_-K15§(§_-Q1c§,_loc5_,_loc6_);
            §_-Q17§.add(_loc5_);
            _loc3_ += _loc4_;
         }
      }
      
      protected function §_-S1Y§() : void
      {
         dispatchEvent(new Event(Event.CONNECT));
      }
      
      protected function §_-zB§(param1:§_-z1i§) : void
      {
      }
      
      protected function onError(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      protected function §_-m1O§(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      private function onConnect(param1:Event) : void
      {
         var _loc2_:String = "GET " + this.§_-426§ + " HTTP/1.1\r\n" + "Host: " + this.host + ":" + this.port + "\r\n" + "Upgrade: websocket\r\n" + "Connection: Upgrade\r\n" + "Sec-WebSocket-Key: " + this.§_-B2T§() + "\r\n" + "Sec-WebSocket-Version: 13\r\n\r\n";
         this.§_-53Z§.writeUTFBytes(_loc2_);
         this.§_-53Z§.flush();
      }
      
      private function §_-82B§(param1:ProgressEvent) : void
      {
         var _loc2_:int = int(this.§_-53Z§.bytesAvailable);
         var _loc3_:uint = this.§_-L1I§.position;
         var _loc4_:uint = this.§_-L1I§.length;
         this.§_-L1I§.position = _loc4_;
         this.§_-53Z§.readBytes(this.§_-L1I§,_loc4_,_loc2_);
         this.§_-L1I§.position = _loc3_;
         if(!this.§_-N1a§)
         {
            this.§_-U1q§();
            return;
         }
         this.§_-8m§();
      }
      
      private function §_-U1q§() : void
      {
         this.§_-L1I§.position = 0;
         var _loc1_:String = this.§_-L1I§.readUTFBytes(this.§_-L1I§.length);
         if(_loc1_.indexOf("101") != -1 && _loc1_.toLowerCase().indexOf("upgrade: websocket") != -1)
         {
            this.§_-N1a§ = true;
            this.§_-L1I§.clear();
            this.§_-S1Y§();
         }
         else
         {
            this.§_-L1I§.position = 0;
         }
      }
      
      private function §_-8m§() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:§_-z1i§ = null;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:§_-z1i§ = null;
         while(true)
         {
            _loc1_ = this.§_-L1I§.position;
            if(this.§_-L1I§.bytesAvailable < 2)
            {
               this.§_-L1I§.position = _loc1_;
               break;
            }
            _loc2_ = int(this.§_-L1I§.readUnsignedByte());
            _loc3_ = int(this.§_-L1I§.readUnsignedByte());
            _loc4_ = (_loc2_ & 0x80) != 0;
            _loc5_ = _loc2_ & 0x0F;
            _loc6_ = (_loc3_ & 0x80) != 0;
            _loc7_ = _loc3_ & 0x7F;
            if(_loc7_ == 126)
            {
               if(this.§_-L1I§.bytesAvailable < 2)
               {
                  this.§_-L1I§.position = _loc1_;
                  break;
               }
               _loc7_ = int(this.§_-L1I§.readUnsignedShort());
            }
            else if(_loc7_ == 127)
            {
               if(this.§_-L1I§.bytesAvailable < 8)
               {
                  this.§_-L1I§.position = _loc1_;
                  break;
               }
               _loc9_ = this.§_-L1I§.readUnsignedInt();
               _loc10_ = this.§_-L1I§.readUnsignedInt();
               _loc7_ = _loc9_ * 4294967296 + _loc10_;
            }
            if(_loc6_)
            {
               if(this.§_-L1I§.bytesAvailable < 4)
               {
                  this.§_-L1I§.position = _loc1_;
                  break;
               }
               this.§_-x1L§.length = 4;
               this.§_-x1L§.position = 0;
               this.§_-L1I§.readBytes(this.§_-x1L§,0,4);
               this.§_-x1L§.position = 0;
            }
            if(this.§_-L1I§.bytesAvailable < _loc7_)
            {
               this.§_-L1I§.position = _loc1_;
               break;
            }
            _loc8_ = §_-Q17§.get(_loc7_);
            if(_loc7_ > 0)
            {
               this.§_-L1I§.readBytes(_loc8_,0,_loc7_);
               _loc8_.position = 0;
               if(_loc6_)
               {
                  _loc11_ = 0;
                  while(_loc11_ < _loc7_)
                  {
                     _loc8_[_loc11_] ^= this.§_-x1L§[_loc11_ & 3];
                     _loc11_++;
                  }
               }
            }
            switch(_loc5_)
            {
               case §_-Q1c§:
                  if(this.§_-H2V§ == null)
                  {
                     this.close();
                     §_-Q17§.add(_loc8_);
                     return;
                  }
                  _loc8_.position = 0;
                  this.§_-H2V§.position = this.§_-H2V§.length;
                  this.§_-H2V§.writeBytes(_loc8_);
                  §_-Q17§.add(_loc8_);
                  if(_loc4_)
                  {
                     this.§_-zB§(this.§_-H2V§);
                     this.§_-H2V§.position = 0;
                     this.§_-H2V§ = null;
                  }
                  break;
               case §_-ps§:
               case §_-t1L§:
                  if(_loc4_)
                  {
                     _loc8_.position = 0;
                     this.§_-zB§(_loc8_);
                  }
                  else
                  {
                     _loc8_.position = 0;
                     this.§_-H2V§ = _loc8_;
                  }
                  break;
               case §_-sx§:
                  this.close();
                  §_-Q17§.add(_loc8_);
                  return;
               case §_-Z25§:
                  this.§_-i2F§(§_-jf§,_loc8_);
                  break;
               case §_-jf§:
                  §_-Q17§.add(_loc8_);
                  break;
               default:
                  this.close();
                  §_-Q17§.add(_loc8_);
                  return;
            }
         }
         if(this.§_-L1I§.bytesAvailable > 0)
         {
            _loc12_ = int(this.§_-L1I§.bytesAvailable);
            _loc13_ = §_-Q17§.get(_loc12_);
            this.§_-L1I§.readBytes(_loc13_,0,_loc12_);
            this.§_-L1I§.clear();
            this.§_-L1I§.writeBytes(_loc13_);
            this.§_-L1I§.position = 0;
            §_-Q17§.add(_loc13_);
         }
         else
         {
            this.§_-L1I§.clear();
         }
      }
      
      private function §_-i2F§(param1:int, param2:§_-z1i§ = null) : void
      {
         if(param2 == null)
         {
            param2 = §_-Q17§.get(0);
         }
         if(param2.length > 125)
         {
            §_-Q17§.add(param2);
            return;
         }
         this.§_-K15§(param1,param2,true);
         §_-Q17§.add(param2);
      }
      
      private function §_-w1i§() : void
      {
         this.§_-i2F§(§_-sx§);
      }
      
      private function §_-K15§(param1:int, param2:ByteArray, param3:Boolean = true) : void
      {
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:int = 0;
         if(!this.§_-53Z§ || !this.§_-53Z§.connected)
         {
            return;
         }
         var _loc4_:int = param2 ? int(param2.length) : 0;
         var _loc5_:int = 2;
         if(_loc4_ > 65535)
         {
            _loc5_ += 8;
         }
         else if(_loc4_ > 125)
         {
            _loc5_ += 2;
         }
         _loc5_ += 4;
         var _loc6_:int = _loc5_ + _loc4_;
         var _loc7_:§_-z1i§ = §_-Q17§.get(_loc6_);
         _loc7_.endian = Endian.BIG_ENDIAN;
         var _loc8_:int = (param3 ? 128 : 0) | param1 & 0x0F;
         _loc7_.writeByte(_loc8_);
         var _loc9_:int = 128;
         if(_loc4_ <= 125)
         {
            _loc7_.writeByte(_loc9_ | _loc4_);
         }
         else if(_loc4_ <= 65535)
         {
            _loc7_.writeByte(_loc9_ | 0x7E);
            _loc7_.writeShort(_loc4_);
         }
         else
         {
            _loc7_.writeByte(_loc9_ | 0x7F);
            _loc11_ = Math.floor(_loc4_ / 4294967296);
            _loc12_ = uint(_loc4_ & 0xFFFFFFFF);
            _loc7_.writeUnsignedInt(_loc11_);
            _loc7_.writeUnsignedInt(_loc12_);
         }
         this.§_-a1X§.length = 4;
         this.§_-a1X§.position = 0;
         var _loc10_:int = 0;
         while(_loc10_ < 4)
         {
            this.§_-a1X§.writeByte(Math.random() * 256 & 0xFF);
            _loc10_++;
         }
         this.§_-a1X§.position = 0;
         _loc7_.writeBytes(this.§_-a1X§);
         if(_loc4_ > 0)
         {
            param2.position = 0;
            _loc13_ = 0;
            while(_loc13_ < _loc4_)
            {
               _loc7_.writeByte(param2.readUnsignedByte() ^ this.§_-a1X§[_loc13_ & 3]);
               _loc13_++;
            }
         }
         _loc7_.position = 0;
         this.§_-53Z§.writeBytes(_loc7_);
         this.§_-53Z§.flush();
         §_-Q17§.add(_loc7_);
      }
      
      private function §_-o2m§(param1:String) : String
      {
         if(param1.indexOf("ws://") == 0)
         {
            return param1.substr(5);
         }
         if(param1.indexOf("wss://") == 0)
         {
            return param1.substr(6);
         }
         return param1;
      }
      
      private function §_-B2T§() : String
      {
         var _loc1_:§_-z1i§ = §_-Q17§.get(16);
         var _loc2_:int = 0;
         while(_loc2_ < 16)
         {
            _loc1_.writeByte(Math.random() * 256 & 0xFF);
            _loc2_++;
         }
         _loc1_.position = 0;
         var _loc3_:String = Base64.encode(_loc1_);
         §_-Q17§.add(_loc1_);
         return _loc3_;
      }
   }
}

