package §_-D25§
{
   import §_-Ko§.§_-37§;
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   import flash.utils.clearInterval;
   import flash.utils.setTimeout;
   
   public class MultipartURLLoader extends EventDispatcher
   {
      
      public static var §_-D2U§:uint = 64 * 1024;
      
      private var §_-32f§:String;
      
      private var §_-ve§:uint = 0;
      
      private var §_-OI§:Dictionary;
      
      private var §_-yI§:String;
      
      private var §_-E28§:ByteArray;
      
      private var §_-d2L§:uint = 0;
      
      private var §_-X1M§:Boolean = false;
      
      private var §_-4z§:Array;
      
      private var §_-rQ§:Array;
      
      private var _loader:URLLoader;
      
      private var §_-bw§:uint = 0;
      
      private var §_-38§:Number;
      
      private var §_-C2G§:Dictionary;
      
      private var §_-s2n§:Boolean = false;
      
      public var requestHeaders:Array;
      
      public function MultipartURLLoader()
      {
         super();
         §_-4z§ = new Array();
         §_-C2G§ = new Dictionary();
         §_-rQ§ = new Array();
         §_-OI§ = new Dictionary();
         _loader = new URLLoader();
         requestHeaders = new Array();
      }
      
      public function set dataFormat(param1:String) : void
      {
         if(param1 != URLLoaderDataFormat.BINARY && param1 != URLLoaderDataFormat.TEXT && param1 != URLLoaderDataFormat.VARIABLES)
         {
            throw new IllegalOperationError("Illegal URLLoader Data Format");
         }
         _loader.dataFormat = param1;
      }
      
      private function §_-dT§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(§_-4z§.length)
         {
            for each(_loc4_ in §_-4z§)
            {
               param1 = §_-k1h§(param1,§_-C2G§[_loc4_] as FilePart);
               param1 = §_-F1C§(param1,§_-C2G§[_loc4_] as FilePart);
               if(_loc2_ != §_-4z§.length - 1)
               {
                  param1 = §_-PC§(param1);
               }
               _loc2_++;
            }
            param1 = §_-wB§(param1);
         }
         return param1;
      }
      
      private function §_-83T§() : void
      {
         var _loc1_:FilePart = null;
         if(§_-ve§ < §_-4z§.length)
         {
            _loc1_ = §_-C2G§[§_-4z§[§_-ve§]] as FilePart;
            §_-E28§ = §_-k1h§(§_-E28§,_loc1_);
            §_-38§ = setTimeout(§_-Q1a§,10,§_-E28§,_loc1_.fileContent,0);
            ++§_-ve§;
         }
         else
         {
            §_-E28§ = §_-wB§(§_-E28§);
            §_-E28§ = §_-n2v§(§_-E28§);
            §_-X1M§ = true;
            dispatchEvent(new §_-37§(§_-37§.§_-b1R§,§_-bw§,§_-bw§));
            dispatchEvent(new §_-37§(§_-37§.§_-Xf§));
         }
      }
      
      public function get loader() : URLLoader
      {
         return _loader;
      }
      
      private function §_-T1x§(param1:SecurityErrorEvent) : void
      {
         §_-t1s§();
         dispatchEvent(param1);
      }
      
      private function §_-Q2F§() : void
      {
         clearInterval(§_-38§);
         §_-E28§ = new ByteArray();
         §_-E28§.endian = Endian.BIG_ENDIAN;
         §_-E28§ = §_-439§(§_-E28§);
         §_-ve§ = 0;
         §_-d2L§ = 0;
         §_-X1M§ = false;
         if(§_-4z§.length)
         {
            §_-83T§();
         }
         else
         {
            §_-E28§ = §_-n2v§(§_-E28§);
            §_-X1M§ = true;
            dispatchEvent(new §_-37§(§_-37§.§_-Xf§));
         }
      }
      
      public function dispose() : void
      {
         clearInterval(§_-38§);
         §_-t1s§();
         close();
         _loader = null;
         §_-yI§ = null;
         §_-rQ§ = null;
         §_-OI§ = null;
         §_-4z§ = null;
         §_-C2G§ = null;
         requestHeaders = null;
         §_-E28§ = null;
      }
      
      public function §_-n1b§() : String
      {
         var _loc1_:int = 0;
         if(§_-yI§ == null)
         {
            §_-yI§ = "";
            _loc1_ = 0;
            while(_loc1_ < 32)
            {
               §_-yI§ += String.fromCharCode(int(97 + Math.random() * 25));
               _loc1_++;
            }
         }
         return §_-yI§;
      }
      
      private function §_-n2v§(param1:ByteArray) : ByteArray
      {
         param1 = §_-52i§(param1);
         return §_-93H§(param1);
      }
      
      public function §_-F1g§() : void
      {
         §_-rQ§ = new Array();
         §_-OI§ = new Dictionary();
         §_-X1M§ = false;
      }
      
      private function §_-32q§(param1:ProgressEvent) : void
      {
         dispatchEvent(param1);
      }
      
      public function §_-a2w§() : void
      {
         var _loc1_:String = null;
         for each(_loc1_ in §_-4z§)
         {
            (§_-C2G§[_loc1_] as FilePart).dispose();
         }
         §_-4z§ = new Array();
         §_-C2G§ = new Dictionary();
         §_-bw§ = 0;
         §_-X1M§ = false;
      }
      
      private function §_-F1h§() : void
      {
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = §_-32f§;
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = §_-E28§;
         _loc1_.requestHeaders.push(new URLRequestHeader("Content-type","multipart/form-data; boundary=" + §_-n1b§()));
         if(requestHeaders.length)
         {
            _loc1_.requestHeaders = _loc1_.requestHeaders.concat(requestHeaders);
         }
         §_-h1R§();
         _loader.load(_loc1_);
      }
      
      public function §_-I1a§(param1:String, param2:Object = "") : void
      {
         if(§_-rQ§.indexOf(param1) == -1)
         {
            §_-rQ§.push(param1);
         }
         §_-OI§[param1] = param2;
         §_-X1M§ = false;
      }
      
      private function onComplete(param1:Event) : void
      {
         §_-t1s§();
         dispatchEvent(param1);
      }
      
      private function §_-tq§(param1:HTTPStatusEvent) : void
      {
         dispatchEvent(param1);
      }
      
      public function get dataFormat() : String
      {
         return _loader.dataFormat;
      }
      
      private function §_-52i§(param1:ByteArray) : ByteArray
      {
         var _loc2_:int = §_-n1b§().length;
         param1 = §_-93H§(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.writeByte(§_-yI§.charCodeAt(_loc3_));
            _loc3_++;
         }
         return param1;
      }
      
      private function §_-pd§(param1:IOErrorEvent) : void
      {
         §_-t1s§();
         dispatchEvent(param1);
      }
      
      public function §_-hh§(param1:ByteArray, param2:String, param3:String = "Filedata", param4:String = "application/octet-stream") : void
      {
         var _loc5_:FilePart = null;
         if(§_-4z§.indexOf(param2) == -1)
         {
            §_-4z§.push(param2);
            §_-C2G§[param2] = new FilePart(param1,param2,param3,param4);
            §_-bw§ += param1.length;
         }
         else
         {
            _loc5_ = §_-C2G§[param2] as FilePart;
            §_-bw§ -= _loc5_.fileContent.length;
            _loc5_.fileContent = param1;
            _loc5_.fileName = param2;
            _loc5_.dataField = param3;
            _loc5_.contentType = param4;
            §_-bw§ += param1.length;
         }
         §_-X1M§ = false;
      }
      
      private function §_-L22§(param1:ByteArray) : ByteArray
      {
         param1.writeByte(34);
         return param1;
      }
      
      private function §_-Q1a§(param1:ByteArray, param2:ByteArray, param3:uint = 0) : void
      {
         var _loc4_:uint = Math.min(§_-D2U§,param2.length - param3);
         param1.writeBytes(param2,param3,_loc4_);
         if(_loc4_ < §_-D2U§ || param3 + _loc4_ >= param2.length)
         {
            param1 = §_-PC§(param1);
            §_-83T§();
            return;
         }
         param3 += _loc4_;
         §_-d2L§ += _loc4_;
         if(§_-d2L§ % §_-D2U§ * 2 == 0)
         {
            dispatchEvent(new §_-37§(§_-37§.§_-b1R§,§_-d2L§,§_-bw§));
         }
         §_-38§ = setTimeout(§_-Q1a§,10,param1,param2,param3);
      }
      
      public function get §_-QQ§() : Boolean
      {
         return §_-X1M§;
      }
      
      private function §_-F1C§(param1:ByteArray, param2:FilePart) : ByteArray
      {
         param1.writeBytes(param2.fileContent,0,param2.fileContent.length);
         return param1;
      }
      
      public function §_-l2o§() : void
      {
         §_-Q2F§();
      }
      
      private function §_-t1s§() : void
      {
         _loader.removeEventListener(Event.COMPLETE,onComplete);
         _loader.removeEventListener(ProgressEvent.PROGRESS,§_-32q§);
         _loader.removeEventListener(IOErrorEvent.IO_ERROR,§_-pd§);
         _loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS,§_-tq§);
         _loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,§_-T1x§);
      }
      
      public function get §_-B1B§() : Boolean
      {
         return §_-s2n§;
      }
      
      private function §_-11F§() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = Endian.BIG_ENDIAN;
         _loc1_ = §_-439§(_loc1_);
         _loc1_ = §_-dT§(_loc1_);
         return §_-n2v§(_loc1_);
      }
      
      private function §_-93H§(param1:ByteArray) : ByteArray
      {
         param1.writeShort(11565);
         return param1;
      }
      
      public function load(param1:String, param2:Boolean = false) : void
      {
         if(param1 == null || param1 == "")
         {
            throw new IllegalOperationError("You cant load without specifing PATH");
         }
         §_-32f§ = param1;
         §_-s2n§ = param2;
         if(§_-s2n§)
         {
            if(!§_-X1M§)
            {
               §_-Q2F§();
            }
            else
            {
               §_-F1h§();
            }
         }
         else
         {
            §_-E28§ = §_-11F§();
            §_-F1h§();
         }
      }
      
      public function §_-X1q§() : void
      {
         if(§_-32f§ == null || §_-32f§ == "" || §_-s2n§ == false)
         {
            throw new IllegalOperationError("You can use this method only if loading asynchronous.");
         }
         if(!§_-X1M§ && §_-s2n§)
         {
            throw new IllegalOperationError("You should prepare data before sending when using asynchronous.");
         }
         §_-F1h§();
      }
      
      private function §_-PC§(param1:ByteArray) : ByteArray
      {
         param1.writeShort(3338);
         return param1;
      }
      
      private function §_-k1h§(param1:ByteArray, param2:FilePart) : ByteArray
      {
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         param1 = §_-52i§(param1);
         param1 = §_-PC§(param1);
         _loc4_ = "Content-Disposition: form-data; name=\"Filename\"";
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1 = §_-PC§(param1);
         param1 = §_-PC§(param1);
         param1.writeUTFBytes(param2.fileName);
         param1 = §_-PC§(param1);
         param1 = §_-52i§(param1);
         param1 = §_-PC§(param1);
         _loc4_ = "Content-Disposition: form-data; name=\"" + param2.dataField + "\"; filename=\"";
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1.writeUTFBytes(param2.fileName);
         param1 = §_-L22§(param1);
         param1 = §_-PC§(param1);
         _loc4_ = "Content-Type: " + param2.contentType;
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1 = §_-PC§(param1);
         return §_-PC§(param1);
      }
      
      private function §_-439§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         for each(_loc4_ in §_-rQ§)
         {
            param1 = §_-52i§(param1);
            param1 = §_-PC§(param1);
            _loc3_ = "Content-Disposition: form-data; name=\"" + _loc4_ + "\"";
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               param1.writeByte(_loc3_.charCodeAt(_loc2_));
               _loc2_++;
            }
            param1 = §_-PC§(param1);
            param1 = §_-PC§(param1);
            param1.writeUTFBytes(§_-OI§[_loc4_]);
            param1 = §_-PC§(param1);
         }
         return param1;
      }
      
      private function §_-h1R§() : void
      {
         _loader.addEventListener(Event.COMPLETE,onComplete,false,0,false);
         _loader.addEventListener(ProgressEvent.PROGRESS,§_-32q§,false,0,false);
         _loader.addEventListener(IOErrorEvent.IO_ERROR,§_-pd§,false,0,false);
         _loader.addEventListener(HTTPStatusEvent.HTTP_STATUS,§_-tq§,false,0,false);
         _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,§_-T1x§,false,0,false);
      }
      
      private function §_-wB§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         param1 = §_-PC§(param1);
         param1 = §_-52i§(param1);
         param1 = §_-PC§(param1);
         _loc3_ = "Content-Disposition: form-data; name=\"Upload\"";
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            param1.writeByte(_loc3_.charCodeAt(_loc2_));
            _loc2_++;
         }
         param1 = §_-PC§(param1);
         param1 = §_-PC§(param1);
         _loc3_ = "Submit Query";
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            param1.writeByte(_loc3_.charCodeAt(_loc2_));
            _loc2_++;
         }
         return §_-PC§(param1);
      }
      
      public function close() : void
      {
         try
         {
            _loader.close();
         }
         catch(e:Error)
         {
         }
      }
   }
}

import flash.utils.ByteArray;

class FilePart
{
   
   public var dataField:String;
   
   public var contentType:String;
   
   public var fileName:String;
   
   public var fileContent:ByteArray;
   
   public function FilePart(param1:ByteArray, param2:String, param3:String = "Filedata", param4:String = "application/octet-stream")
   {
      super();
      this.fileContent = param1;
      this.fileName = param2;
      this.dataField = param3;
      this.contentType = param4;
   }
   
   public function dispose() : void
   {
      fileContent = null;
      fileName = null;
      dataField = null;
      contentType = null;
   }
}
