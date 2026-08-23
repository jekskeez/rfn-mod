package protocol
{
   import flash.events.Event;
   import flash.utils.Endian;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class Connection extends §_-6t§
   {
      
      public static const CONNECTION_CLOSED:String = "connectionClosed";
      
      public static const §_-l2L§:String = "connectionError";
      
      private static const §_-63p§:int = 60000;
      
      private static const §_-L2j§:int = 3;
      
      private static var _instance:Connection;
      
      private static var §_-PN§:int = 0;
      
      private var host:String;
      
      private var §_-91F§:Array;
      
      private var deviceType:int;
      
      private var §_-EU§:int;
      
      private var §_-r2l§:int;
      
      private var §_-i2z§:int;
      
      private var §_-m1E§:int;
      
      private var §_-81x§:Vector.<Array> = new Vector.<Array>();
      
      private var §_-J25§:Vector.<Array> = new Vector.<Array>();
      
      public function Connection()
      {
         super();
         _instance = this;
         var _loc1_:int = 0;
         while(_loc1_ < §_-S2I§.§_-6n§)
         {
            this.§_-81x§.push([]);
            this.§_-J25§.push([]);
            _loc1_++;
         }
      }
      
      public static function listen(param1:Function, param2:Array, param3:int = 0) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = int(param2.length);
         if(param3 == 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _instance.§_-81x§[param2[_loc5_]].push(param1);
               _loc5_++;
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _instance.§_-J25§[param2[_loc5_]].push({
                  "function":param1,
                  "priority":param3
               });
               _instance.§_-J25§[param2[_loc5_]].sort(§_-v27§);
               _loc5_++;
            }
         }
      }
      
      public static function §_-R1M§(param1:int, param2:Array) : void
      {
         var _loc3_:§_-J1C§ = new §_-J1C§(param1,param2);
         _instance.dispatch(_loc3_);
      }
      
      public static function forget(param1:Function, param2:Array) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = int(param2.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _instance.§_-81x§[param2[_loc4_]];
            _loc6_ = _loc5_.indexOf(param1);
            if(_loc6_ != -1)
            {
               _loc5_.splice(_loc6_,1);
            }
            _loc5_ = _instance.§_-J25§[param2[_loc4_]];
            _loc7_ = int(_loc5_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc7_)
            {
               if(_loc5_[_loc6_]["function"] == param1)
               {
                  _loc5_.splice(_loc6_,1);
                  break;
               }
               _loc6_++;
            }
            _loc4_++;
         }
      }
      
      public static function connect(param1:String, param2:*, param3:int) : void
      {
         var host:String = param1;
         var port:* = param2;
         var deviceType:int = param3;
         Connection.§_-PN§ = 0;
         _instance.host = host;
         if(!(port is Array))
         {
            _instance.§_-91F§ = [port];
         }
         else
         {
            _instance.§_-91F§ = port.slice();
         }
         _instance.§_-r2l§ = _instance.§_-91F§.shift();
         _instance.deviceType = deviceType;
         _instance.§_-i2z§ = 0;
         §_-TQ§.add("Connecting to: " + _instance.host + ":" + _instance.§_-r2l§);
         try
         {
            _instance.connect(_instance.host,_instance.§_-r2l§);
         }
         catch(e:Error)
         {
            _instance.§_-13e§();
         }
      }
      
      public static function §_-W12§() : void
      {
         if(!connected)
         {
            return;
         }
         _instance.close();
      }
      
      public static function get connected() : Boolean
      {
         return _instance.connected;
      }
      
      public static function §_-T13§(param1:§_-h2B§) : void
      {
         var size:int = 0;
         var totalSize:int = 0;
         var buffer:§_-U1M§ = null;
         var packet:§_-h2B§ = param1;
         try
         {
            size = packet.length + §_-U1M§.§_-p1M§(§_-PN§).length;
            totalSize = §_-U1M§.§_-p1M§(size).length + size;
            buffer = §_-P1h§.get(totalSize);
            buffer.endian = Endian.LITTLE_ENDIAN;
            buffer.§_-s15§(size);
            buffer.§_-s15§(§_-PN§++);
            buffer.writeBytes(packet);
            _instance.§_-239§(buffer);
            §_-P1h§.add(buffer);
         }
         catch(e:Error)
         {
            §_-TQ§.add("WebSocket disconnected: " + e.message);
         }
      }
      
      public static function §_-Li§(param1:int, ... rest) : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:§_-h2B§ = new §_-h2B§(param1,_instance.deviceType);
         switch(_loc3_.type)
         {
            case §_-h2B§.§_-325§:
               break;
            default:
               §_-TQ§.add("Sending packet with type " + _loc3_.type);
               _loc4_ = "";
               _loc5_ = int(rest.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc4_ += (rest[_loc6_] is §_-U1M§ ? "[A: length " + rest[_loc6_].length + "]" : rest[_loc6_]) + (_loc6_ != rest.length - 1 ? ", " : "");
                  _loc6_++;
               }
               §_-TQ§.add("Data: " + _loc4_);
         }
         _loc3_.load(rest);
         §_-T13§(_loc3_);
      }
      
      private static function §_-v27§(param1:Object, param2:Object) : int
      {
         return param1.priority > param2.priority ? 1 : -1;
      }
      
      override protected function §_-Ao§() : void
      {
         dispatchEvent(new Event(Event.CONNECT));
         §_-TQ§.add("WebSocket connected");
      }
      
      override protected function §_-PG§(param1:§_-U1M§) : void
      {
         param1.endian = Endian.LITTLE_ENDIAN;
         this.§_-Um§(param1);
      }
      
      override protected function §_-b2v§(param1:Event) : void
      {
         dispatchEvent(new Event(CONNECTION_CLOSED));
      }
      
      override protected function onError(param1:Event) : void
      {
         dispatchEvent(new Event(§_-l2L§));
         §_-TQ§.add("Connection error: " + param1.type);
         §_-k2X§.setStatus(gls("Невозможно подключиться к игровому серверу!"));
      }
      
      private function §_-Um§(param1:§_-U1M§) : void
      {
         var buffer:§_-U1M§ = param1;
         var packet:§_-S2I§ = new §_-S2I§(buffer);
         §_-TQ§.add(packet);
         switch(packet.type)
         {
            case §_-S2I§.§_-w1R§:
               if(!("5" in packet))
               {
                  break;
               }
               try
               {
                  packet[5] = JSON.parse(packet[5]);
               }
               catch(e:Error)
               {
                  §_-TQ§.add("Connection/receiveData error: " + e.message);
               }
               break;
            case §_-S2I§.§_-b1y§:
               try
               {
                  packet[1] = JSON.parse(packet[1]);
               }
               catch(e:Error)
               {
                  §_-TQ§.add("Connection/receiveData error: " + e.message);
               }
               break;
            case §_-S2I§.§_-aY§:
               §_-Li§(§_-h2B§.§_-03T§);
               this.§_-sx§();
         }
         this.dispatch(packet);
         §_-P1h§.add(buffer);
      }
      
      private function dispatch(param1:§_-S2I§) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Function = null;
         var _loc2_:Array = this.§_-J25§[param1.type];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc3_];
            _loc5_["function"](param1);
            if(_loc2_[_loc3_] === _loc5_)
            {
               _loc3_++;
            }
         }
         var _loc4_:Array = this.§_-81x§[param1.type];
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc3_];
            _loc6_(param1);
            if(_loc4_[_loc3_] === _loc6_)
            {
               _loc3_++;
            }
         }
      }
      
      private function §_-13e§() : void
      {
         if(this.§_-i2z§ >= §_-L2j§)
         {
            this.onError(new Event(§_-l2L§));
            return;
         }
         ++this.§_-i2z§;
         setTimeout(this.connect,this.§_-i2z§ * 200,this.host,this.§_-r2l§);
      }
      
      private function §_-sx§() : void
      {
         clearTimeout(this.§_-EU§);
         this.§_-m1E§ = 0;
         if(!connected)
         {
            return;
         }
         this.§_-EU§ = setTimeout(this.§_-m1B§,§_-63p§);
      }
      
      private function §_-m1B§() : void
      {
         if(this.§_-m1E§ < §_-L2j§)
         {
            ++this.§_-m1E§;
         }
         else
         {
            close();
         }
      }
   }
}

