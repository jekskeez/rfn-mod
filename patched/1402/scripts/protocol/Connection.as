package protocol
{
   import flash.events.Event;
   import flash.utils.Endian;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class Connection extends §_-F2Q§
   {
      
      public static const CONNECTION_CLOSED:String = "connectionClosed";
      
      public static const §_-GN§:String = "connectionError";
      
      private static const §_-e1q§:int = 60000;
      
      private static const §_-22s§:int = 3;
      
      private static var _instance:Connection;
      
      private static var §_-52§:int = 0;
      
      private var host:String;
      
      private var §_-B2K§:Array;
      
      private var deviceType:int;
      
      private var §_-u1v§:int;
      
      private var §_-82z§:int;
      
      private var §_-q1S§:int;
      
      private var §_-12g§:int;
      
      private var §_-H2A§:Vector.<Array> = new Vector.<Array>();
      
      private var §_-Hs§:Vector.<Array> = new Vector.<Array>();
      
      public function Connection()
      {
         super();
         _instance = this;
         var _loc1_:int = 0;
         while(_loc1_ < §_-s2l§.§_-x2G§)
         {
            this.§_-H2A§.push([]);
            this.§_-Hs§.push([]);
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
               _instance.§_-H2A§[param2[_loc5_]].push(param1);
               _loc5_++;
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _instance.§_-Hs§[param2[_loc5_]].push({
                  "function":param1,
                  "priority":param3
               });
               _instance.§_-Hs§[param2[_loc5_]].sort(§_-Lc§);
               _loc5_++;
            }
         }
      }
      
      public static function §_-u2v§(param1:int, param2:Array) : void
      {
         var _loc3_:§_-Kd§ = new §_-Kd§(param1,param2);
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
            _loc5_ = _instance.§_-H2A§[param2[_loc4_]];
            _loc6_ = _loc5_.indexOf(param1);
            if(_loc6_ != -1)
            {
               _loc5_.splice(_loc6_,1);
            }
            _loc5_ = _instance.§_-Hs§[param2[_loc4_]];
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
         Connection.§_-52§ = 0;
         _instance.host = host;
         if(!(port is Array))
         {
            _instance.§_-B2K§ = [port];
         }
         else
         {
            _instance.§_-B2K§ = port.slice();
         }
         _instance.§_-82z§ = _instance.§_-B2K§.shift();
         _instance.deviceType = deviceType;
         _instance.§_-q1S§ = 0;
         §_-p2U§.add("Connecting to: " + _instance.host + ":" + _instance.§_-82z§);
         try
         {
            _instance.connect(_instance.host,_instance.§_-82z§);
         }
         catch(e:Error)
         {
            _instance.§_-X1t§();
         }
      }
      
      public static function §_-P6§() : void
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
      
      public static function §_-tT§(param1:§_-u1O§) : void
      {
         var size:int = 0;
         var totalSize:int = 0;
         var buffer:§_-z1i§ = null;
         var packet:§_-u1O§ = param1;
         try
         {
            size = packet.length + §_-z1i§.§_-t17§(§_-52§).length;
            totalSize = §_-z1i§.§_-t17§(size).length + size;
            buffer = §_-Q17§.get(totalSize);
            buffer.endian = Endian.LITTLE_ENDIAN;
            buffer.§_-C1W§(size);
            buffer.§_-C1W§(§_-52§++);
            buffer.writeBytes(packet);
            _instance.§_-w18§(buffer);
            §_-Q17§.add(buffer);
         }
         catch(e:Error)
         {
            §_-p2U§.add("WebSocket disconnected: " + e.message);
         }
      }
      
      public static function §_-e2T§(param1:int, ... rest) : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:§_-u1O§ = new §_-u1O§(param1,_instance.deviceType);
         switch(_loc3_.type)
         {
            case §_-u1O§.§_-D1P§:
               break;
            default:
               §_-p2U§.add("Sending packet with type " + _loc3_.type);
               _loc4_ = "";
               _loc5_ = int(rest.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc4_ += (rest[_loc6_] is §_-z1i§ ? "[A: length " + rest[_loc6_].length + "]" : rest[_loc6_]) + (_loc6_ != rest.length - 1 ? ", " : "");
                  _loc6_++;
               }
               §_-p2U§.add("Data: " + _loc4_);
         }
         _loc3_.load(rest);
         §_-tT§(_loc3_);
      }
      
      private static function §_-Lc§(param1:Object, param2:Object) : int
      {
         return param1.priority > param2.priority ? 1 : -1;
      }
      
      override protected function §_-S1Y§() : void
      {
         dispatchEvent(new Event(Event.CONNECT));
         §_-p2U§.add("WebSocket connected");
      }
      
      override protected function §_-zB§(param1:§_-z1i§) : void
      {
         param1.endian = Endian.LITTLE_ENDIAN;
         this.§_-91k§(param1);
      }
      
      override protected function §_-m1O§(param1:Event) : void
      {
         dispatchEvent(new Event(CONNECTION_CLOSED));
      }
      
      override protected function onError(param1:Event) : void
      {
         dispatchEvent(new Event(§_-GN§));
         §_-p2U§.add("Connection error: " + param1.type);
         §_-uR§.setStatus(gls("Невозможно подключиться к игровому серверу!"));
      }
      
      private function §_-91k§(param1:§_-z1i§) : void
      {
         var buffer:§_-z1i§ = param1;
         var packet:§_-s2l§ = new §_-s2l§(buffer);
         §_-p2U§.add(packet);
         switch(packet.type)
         {
            case §_-s2l§.§_-C1i§:
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
                  §_-p2U§.add("Connection/receiveData error: " + e.message);
               }
               break;
            case §_-s2l§.§_-1q§:
               try
               {
                  packet[1] = JSON.parse(packet[1]);
               }
               catch(e:Error)
               {
                  §_-p2U§.add("Connection/receiveData error: " + e.message);
               }
               break;
            case §_-s2l§.§_-F1g§:
               §_-e2T§(§_-u1O§.§_-22P§);
               this.§_-J1p§();
         }
         this.dispatch(packet);
         §_-Q17§.add(buffer);
      }
      
      private function dispatch(param1:§_-s2l§) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Function = null;
         var _loc2_:Array = this.§_-Hs§[param1.type];
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
         var _loc4_:Array = this.§_-H2A§[param1.type];
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
      
      private function §_-X1t§() : void
      {
         if(this.§_-q1S§ >= §_-22s§)
         {
            this.onError(new Event(§_-GN§));
            return;
         }
         ++this.§_-q1S§;
         setTimeout(this.connect,this.§_-q1S§ * 200,this.host,this.§_-82z§);
      }
      
      private function §_-J1p§() : void
      {
         clearTimeout(this.§_-u1v§);
         this.§_-12g§ = 0;
         if(!connected)
         {
            return;
         }
         this.§_-u1v§ = setTimeout(this.§_-wX§,§_-e1q§);
      }
      
      private function §_-wX§() : void
      {
         if(this.§_-12g§ < §_-22s§)
         {
            ++this.§_-12g§;
         }
         else
         {
            close();
         }
      }
   }
}

