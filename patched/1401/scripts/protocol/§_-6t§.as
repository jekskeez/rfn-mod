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
   
   public class §_-6t§ extends EventDispatcher
   {
      
      private static const §_-z2q§:int = 65536;
      
      private static const §_-x1M§:int = 0;
      
      private static const §_-Yj§:int = 1;
      
      private static const §_-X2d§:int = 2;
      
      private static const §_-83b§:int = 8;
      
      private static const §_-C3I§:int = 9;
      
      private static const §_-v6§:int = 10;
      
      private var §_-i1k§:Socket;
      
      private var host:String;
      
      private var port:int;
      
      private var §_-e2O§:String;
      
      private var §_-ec§:Boolean = false;
      
      private var §_-618§:ByteArray = new ByteArray();
      
      private var §_-61n§:§_-U1M§ = null;
      
      private var §_-42V§:§_-U1M§ = new §_-U1M§();
      
      private var §_-F1f§:§_-U1M§ = new §_-U1M§();
      
      public function §_-6t§()
      {
         super();
      }
      
      public function get connected() : Boolean
      {
         return Boolean(this.§_-i1k§) && this.§_-i1k§.connected && this.§_-ec§;
      }
      
      public function connect(param1:String, param2:int = 80, param3:String = "/") : void
      {
         this.host = this.§_-Po§(param1);
         this.port = param2;
         this.§_-e2O§ = param3;
         this.§_-i1k§ = new Socket();
         this.§_-i1k§.addEventListener(Event.CONNECT,this.onConnect);
         this.§_-i1k§.addEventListener(ProgressEvent.SOCKET_DATA,this.§_-O25§);
         this.§_-i1k§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.§_-i1k§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.§_-i1k§.addEventListener(Event.CLOSE,this.§_-b2v§);
         this.§_-i1k§.connect(this.host,this.port);
      }
      
      public function close() : void
      {
         if(!this.connected)
         {
            return;
         }
         this.§_-1x§();
         try
         {
            this.§_-i1k§.close();
         }
         catch(err:Error)
         {
         }
         this.§_-ec§ = false;
         this.§_-618§.clear();
         if(this.§_-61n§)
         {
            §_-P1h§.add(this.§_-61n§);
            this.§_-61n§ = null;
         }
      }
      
      public function §_-239§(param1:§_-U1M§) : void
      {
         var _loc4_:int = 0;
         var _loc5_:§_-U1M§ = null;
         var _loc6_:Boolean = false;
         var _loc2_:int = int(param1.length);
         if(_loc2_ <= §_-z2q§)
         {
            this.§_-s2x§(§_-X2d§,param1,true);
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = Math.min(§_-z2q§,_loc2_ - _loc3_);
            _loc5_ = §_-P1h§.get(_loc4_);
            _loc5_.writeBytes(param1,_loc3_,_loc4_);
            _loc6_ = _loc3_ + _loc4_ >= _loc2_;
            this.§_-s2x§(§_-x1M§,_loc5_,_loc6_);
            §_-P1h§.add(_loc5_);
            _loc3_ += _loc4_;
         }
      }
      
      protected function §_-Ao§() : void
      {
         dispatchEvent(new Event(Event.CONNECT));
      }
      
      protected function §_-PG§(param1:§_-U1M§) : void
      {
      }
      
      protected function onError(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      protected function §_-b2v§(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      private function onConnect(param1:Event) : void
      {
         var _loc2_:String = "GET " + this.§_-e2O§ + " HTTP/1.1\r\n" + "Host: " + this.host + ":" + this.port + "\r\n" + "Upgrade: websocket\r\n" + "Connection: Upgrade\r\n" + "Sec-WebSocket-Key: " + this.§_-80§() + "\r\n" + "Sec-WebSocket-Version: 13\r\n\r\n";
         this.§_-i1k§.writeUTFBytes(_loc2_);
         this.§_-i1k§.flush();
      }
      
      private function §_-O25§(param1:ProgressEvent) : void
      {
         var _loc2_:int = int(this.§_-i1k§.bytesAvailable);
         var _loc3_:uint = this.§_-618§.position;
         var _loc4_:uint = this.§_-618§.length;
         this.§_-618§.position = _loc4_;
         this.§_-i1k§.readBytes(this.§_-618§,_loc4_,_loc2_);
         this.§_-618§.position = _loc3_;
         if(!this.§_-ec§)
         {
            this.§_-Z29§();
            return;
         }
         this.§_-hW§();
      }
      
      private function §_-Z29§() : void
      {
         this.§_-618§.position = 0;
         var _loc1_:String = this.§_-618§.readUTFBytes(this.§_-618§.length);
         if(_loc1_.indexOf("101") != -1 && _loc1_.toLowerCase().indexOf("upgrade: websocket") != -1)
         {
            this.§_-ec§ = true;
            this.§_-618§.clear();
            this.§_-Ao§();
         }
         else
         {
            this.§_-618§.position = 0;
         }
      }
      
      private function §_-hW§() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:§_-U1M§ = null;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:§_-U1M§ = null;
         while(true)
         {
            _loc1_ = this.§_-618§.position;
            if(this.§_-618§.bytesAvailable < 2)
            {
               this.§_-618§.position = _loc1_;
               break;
            }
            _loc2_ = int(this.§_-618§.readUnsignedByte());
            _loc3_ = int(this.§_-618§.readUnsignedByte());
            _loc4_ = (_loc2_ & 0x80) != 0;
            _loc5_ = _loc2_ & 0x0F;
            _loc6_ = (_loc3_ & 0x80) != 0;
            _loc7_ = _loc3_ & 0x7F;
            if(_loc7_ == 126)
            {
               if(this.§_-618§.bytesAvailable < 2)
               {
                  this.§_-618§.position = _loc1_;
                  break;
               }
               _loc7_ = int(this.§_-618§.readUnsignedShort());
            }
            else if(_loc7_ == 127)
            {
               if(this.§_-618§.bytesAvailable < 8)
               {
                  this.§_-618§.position = _loc1_;
                  break;
               }
               _loc9_ = this.§_-618§.readUnsignedInt();
               _loc10_ = this.§_-618§.readUnsignedInt();
               _loc7_ = _loc9_ * 4294967296 + _loc10_;
            }
            if(_loc6_)
            {
               if(this.§_-618§.bytesAvailable < 4)
               {
                  this.§_-618§.position = _loc1_;
                  break;
               }
               this.§_-42V§.length = 4;
               this.§_-42V§.position = 0;
               this.§_-618§.readBytes(this.§_-42V§,0,4);
               this.§_-42V§.position = 0;
            }
            if(this.§_-618§.bytesAvailable < _loc7_)
            {
               this.§_-618§.position = _loc1_;
               break;
            }
            _loc8_ = §_-P1h§.get(_loc7_);
            if(_loc7_ > 0)
            {
               this.§_-618§.readBytes(_loc8_,0,_loc7_);
               _loc8_.position = 0;
               if(_loc6_)
               {
                  _loc11_ = 0;
                  while(_loc11_ < _loc7_)
                  {
                     _loc8_[_loc11_] ^= this.§_-42V§[_loc11_ & 3];
                     _loc11_++;
                  }
               }
            }
            switch(_loc5_)
            {
               case §_-x1M§:
                  if(this.§_-61n§ == null)
                  {
                     this.close();
                     §_-P1h§.add(_loc8_);
                     return;
                  }
                  _loc8_.position = 0;
                  this.§_-61n§.position = this.§_-61n§.length;
                  this.§_-61n§.writeBytes(_loc8_);
                  §_-P1h§.add(_loc8_);
                  if(_loc4_)
                  {
                     this.§_-PG§(this.§_-61n§);
                     this.§_-61n§.position = 0;
                     this.§_-61n§ = null;
                  }
                  break;
               case §_-Yj§:
               case §_-X2d§:
                  if(_loc4_)
                  {
                     _loc8_.position = 0;
                     this.§_-PG§(_loc8_);
                  }
                  else
                  {
                     _loc8_.position = 0;
                     this.§_-61n§ = _loc8_;
                  }
                  break;
               case §_-83b§:
                  this.close();
                  §_-P1h§.add(_loc8_);
                  return;
               case §_-C3I§:
                  this.§_-CB§(§_-v6§,_loc8_);
                  break;
               case §_-v6§:
                  §_-P1h§.add(_loc8_);
                  break;
               default:
                  this.close();
                  §_-P1h§.add(_loc8_);
                  return;
            }
         }
         if(this.§_-618§.bytesAvailable > 0)
         {
            _loc12_ = int(this.§_-618§.bytesAvailable);
            _loc13_ = §_-P1h§.get(_loc12_);
            this.§_-618§.readBytes(_loc13_,0,_loc12_);
            this.§_-618§.clear();
            this.§_-618§.writeBytes(_loc13_);
            this.§_-618§.position = 0;
            §_-P1h§.add(_loc13_);
         }
         else
         {
            this.§_-618§.clear();
         }
      }
      
      private function §_-CB§(param1:int, param2:§_-U1M§ = null) : void
      {
         if(param2 == null)
         {
            param2 = §_-P1h§.get(0);
         }
         if(param2.length > 125)
         {
            §_-P1h§.add(param2);
            return;
         }
         this.§_-s2x§(param1,param2,true);
         §_-P1h§.add(param2);
      }
      
      private function §_-1x§() : void
      {
         this.§_-CB§(§_-83b§);
      }
      
      private function §_-s2x§(param1:int, param2:ByteArray, param3:Boolean = true) : void
      {
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:int = 0;
         if(!this.§_-i1k§ || !this.§_-i1k§.connected)
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
         var _loc7_:§_-U1M§ = §_-P1h§.get(_loc6_);
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
         this.§_-F1f§.length = 4;
         this.§_-F1f§.position = 0;
         var _loc10_:int = 0;
         while(_loc10_ < 4)
         {
            this.§_-F1f§.writeByte(Math.random() * 256 & 0xFF);
            _loc10_++;
         }
         this.§_-F1f§.position = 0;
         _loc7_.writeBytes(this.§_-F1f§);
         if(_loc4_ > 0)
         {
            param2.position = 0;
            _loc13_ = 0;
            while(_loc13_ < _loc4_)
            {
               _loc7_.writeByte(param2.readUnsignedByte() ^ this.§_-F1f§[_loc13_ & 3]);
               _loc13_++;
            }
         }
         _loc7_.position = 0;
         this.§_-i1k§.writeBytes(_loc7_);
         this.§_-i1k§.flush();
         §_-P1h§.add(_loc7_);
      }
      
      private function §_-Po§(param1:String) : String
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
      
      private function §_-80§() : String
      {
         var _loc1_:§_-U1M§ = §_-P1h§.get(16);
         var _loc2_:int = 0;
         while(_loc2_ < 16)
         {
            _loc1_.writeByte(Math.random() * 256 & 0xFF);
            _loc2_++;
         }
         _loc1_.position = 0;
         var _loc3_:String = Base64.encode(_loc1_);
         §_-P1h§.add(_loc1_);
         return _loc3_;
      }
   }
}

