package §_-q2r§
{
   import §_-tB§.§_-x15§;
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
      
      public static var §_-7s§:uint = 64 * 1024;
      
      private var §_-Vm§:String;
      
      private var §_-z2f§:uint = 0;
      
      private var §_-g1L§:Dictionary;
      
      private var §_-p1Q§:String;
      
      private var §_-UD§:ByteArray;
      
      private var §_-h26§:uint = 0;
      
      private var §_-MR§:Boolean = false;
      
      private var §_-TQ§:Array;
      
      private var §_-51B§:Array;
      
      private var _loader:URLLoader;
      
      private var §_-Rw§:uint = 0;
      
      private var §_-Zi§:Number;
      
      private var §_-f1o§:Dictionary;
      
      private var §_-a2W§:Boolean = false;
      
      public var requestHeaders:Array;
      
      public function MultipartURLLoader()
      {
         super();
         §_-TQ§ = new Array();
         §_-f1o§ = new Dictionary();
         §_-51B§ = new Array();
         §_-g1L§ = new Dictionary();
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
      
      private function §_-sr§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(§_-TQ§.length)
         {
            for each(_loc4_ in §_-TQ§)
            {
               param1 = §_-I2k§(param1,§_-f1o§[_loc4_] as FilePart);
               param1 = §_-Iu§(param1,§_-f1o§[_loc4_] as FilePart);
               if(_loc2_ != §_-TQ§.length - 1)
               {
                  param1 = §_-qe§(param1);
               }
               _loc2_++;
            }
            param1 = §_-d19§(param1);
         }
         return param1;
      }
      
      private function §_-J1F§() : void
      {
         var _loc1_:FilePart = null;
         if(§_-z2f§ < §_-TQ§.length)
         {
            _loc1_ = §_-f1o§[§_-TQ§[§_-z2f§]] as FilePart;
            §_-UD§ = §_-I2k§(§_-UD§,_loc1_);
            §_-Zi§ = setTimeout(§_-x1V§,10,§_-UD§,_loc1_.fileContent,0);
            ++§_-z2f§;
         }
         else
         {
            §_-UD§ = §_-d19§(§_-UD§);
            §_-UD§ = §_-y2a§(§_-UD§);
            §_-MR§ = true;
            dispatchEvent(new §_-x15§(§_-x15§.§_-X1s§,§_-Rw§,§_-Rw§));
            dispatchEvent(new §_-x15§(§_-x15§.§_-33g§));
         }
      }
      
      public function get loader() : URLLoader
      {
         return _loader;
      }
      
      private function §_-R2w§(param1:SecurityErrorEvent) : void
      {
         §_-DO§();
         dispatchEvent(param1);
      }
      
      private function §_-Q1o§() : void
      {
         clearInterval(§_-Zi§);
         §_-UD§ = new ByteArray();
         §_-UD§.endian = Endian.BIG_ENDIAN;
         §_-UD§ = §_-kz§(§_-UD§);
         §_-z2f§ = 0;
         §_-h26§ = 0;
         §_-MR§ = false;
         if(§_-TQ§.length)
         {
            §_-J1F§();
         }
         else
         {
            §_-UD§ = §_-y2a§(§_-UD§);
            §_-MR§ = true;
            dispatchEvent(new §_-x15§(§_-x15§.§_-33g§));
         }
      }
      
      public function dispose() : void
      {
         clearInterval(§_-Zi§);
         §_-DO§();
         close();
         _loader = null;
         §_-p1Q§ = null;
         §_-51B§ = null;
         §_-g1L§ = null;
         §_-TQ§ = null;
         §_-f1o§ = null;
         requestHeaders = null;
         §_-UD§ = null;
      }
      
      public function §_-52G§() : String
      {
         var _loc1_:int = 0;
         if(§_-p1Q§ == null)
         {
            §_-p1Q§ = "";
            _loc1_ = 0;
            while(_loc1_ < 32)
            {
               §_-p1Q§ += String.fromCharCode(int(97 + Math.random() * 25));
               _loc1_++;
            }
         }
         return §_-p1Q§;
      }
      
      private function §_-y2a§(param1:ByteArray) : ByteArray
      {
         param1 = §_-43J§(param1);
         return §_-33F§(param1);
      }
      
      public function §_-I1s§() : void
      {
         §_-51B§ = new Array();
         §_-g1L§ = new Dictionary();
         §_-MR§ = false;
      }
      
      private function §_-V24§(param1:ProgressEvent) : void
      {
         dispatchEvent(param1);
      }
      
      public function §_-jO§() : void
      {
         var _loc1_:String = null;
         for each(_loc1_ in §_-TQ§)
         {
            (§_-f1o§[_loc1_] as FilePart).dispose();
         }
         §_-TQ§ = new Array();
         §_-f1o§ = new Dictionary();
         §_-Rw§ = 0;
         §_-MR§ = false;
      }
      
      private function §_-W2u§() : void
      {
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = §_-Vm§;
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = §_-UD§;
         _loc1_.requestHeaders.push(new URLRequestHeader("Content-type","multipart/form-data; boundary=" + §_-52G§()));
         if(requestHeaders.length)
         {
            _loc1_.requestHeaders = _loc1_.requestHeaders.concat(requestHeaders);
         }
         §_-A3z§();
         _loader.load(_loc1_);
      }
      
      public function §_-p1c§(param1:String, param2:Object = "") : void
      {
         if(§_-51B§.indexOf(param1) == -1)
         {
            §_-51B§.push(param1);
         }
         §_-g1L§[param1] = param2;
         §_-MR§ = false;
      }
      
      private function onComplete(param1:Event) : void
      {
         §_-DO§();
         dispatchEvent(param1);
      }
      
      private function §_-r25§(param1:HTTPStatusEvent) : void
      {
         dispatchEvent(param1);
      }
      
      public function get dataFormat() : String
      {
         return _loader.dataFormat;
      }
      
      private function §_-43J§(param1:ByteArray) : ByteArray
      {
         var _loc2_:int = §_-52G§().length;
         param1 = §_-33F§(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.writeByte(§_-p1Q§.charCodeAt(_loc3_));
            _loc3_++;
         }
         return param1;
      }
      
      private function §_-Rl§(param1:IOErrorEvent) : void
      {
         §_-DO§();
         dispatchEvent(param1);
      }
      
      public function §_-m2R§(param1:ByteArray, param2:String, param3:String = "Filedata", param4:String = "application/octet-stream") : void
      {
         var _loc5_:FilePart = null;
         if(§_-TQ§.indexOf(param2) == -1)
         {
            §_-TQ§.push(param2);
            §_-f1o§[param2] = new FilePart(param1,param2,param3,param4);
            §_-Rw§ += param1.length;
         }
         else
         {
            _loc5_ = §_-f1o§[param2] as FilePart;
            §_-Rw§ -= _loc5_.fileContent.length;
            _loc5_.fileContent = param1;
            _loc5_.fileName = param2;
            _loc5_.dataField = param3;
            _loc5_.contentType = param4;
            §_-Rw§ += param1.length;
         }
         §_-MR§ = false;
      }
      
      private function §_-12N§(param1:ByteArray) : ByteArray
      {
         param1.writeByte(34);
         return param1;
      }
      
      private function §_-x1V§(param1:ByteArray, param2:ByteArray, param3:uint = 0) : void
      {
         var _loc4_:uint = Math.min(§_-7s§,param2.length - param3);
         param1.writeBytes(param2,param3,_loc4_);
         if(_loc4_ < §_-7s§ || param3 + _loc4_ >= param2.length)
         {
            param1 = §_-qe§(param1);
            §_-J1F§();
            return;
         }
         param3 += _loc4_;
         §_-h26§ += _loc4_;
         if(§_-h26§ % §_-7s§ * 2 == 0)
         {
            dispatchEvent(new §_-x15§(§_-x15§.§_-X1s§,§_-h26§,§_-Rw§));
         }
         §_-Zi§ = setTimeout(§_-x1V§,10,param1,param2,param3);
      }
      
      public function get §_-Zd§() : Boolean
      {
         return §_-MR§;
      }
      
      private function §_-Iu§(param1:ByteArray, param2:FilePart) : ByteArray
      {
         param1.writeBytes(param2.fileContent,0,param2.fileContent.length);
         return param1;
      }
      
      public function §_-P2C§() : void
      {
         §_-Q1o§();
      }
      
      private function §_-DO§() : void
      {
         _loader.removeEventListener(Event.COMPLETE,onComplete);
         _loader.removeEventListener(ProgressEvent.PROGRESS,§_-V24§);
         _loader.removeEventListener(IOErrorEvent.IO_ERROR,§_-Rl§);
         _loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS,§_-r25§);
         _loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,§_-R2w§);
      }
      
      public function get §_-Y1Z§() : Boolean
      {
         return §_-a2W§;
      }
      
      private function §_-y1M§() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = Endian.BIG_ENDIAN;
         _loc1_ = §_-kz§(_loc1_);
         _loc1_ = §_-sr§(_loc1_);
         return §_-y2a§(_loc1_);
      }
      
      private function §_-33F§(param1:ByteArray) : ByteArray
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
         §_-Vm§ = param1;
         §_-a2W§ = param2;
         if(§_-a2W§)
         {
            if(!§_-MR§)
            {
               §_-Q1o§();
            }
            else
            {
               §_-W2u§();
            }
         }
         else
         {
            §_-UD§ = §_-y1M§();
            §_-W2u§();
         }
      }
      
      public function §_-33z§() : void
      {
         if(§_-Vm§ == null || §_-Vm§ == "" || §_-a2W§ == false)
         {
            throw new IllegalOperationError("You can use this method only if loading asynchronous.");
         }
         if(!§_-MR§ && §_-a2W§)
         {
            throw new IllegalOperationError("You should prepare data before sending when using asynchronous.");
         }
         §_-W2u§();
      }
      
      private function §_-qe§(param1:ByteArray) : ByteArray
      {
         param1.writeShort(3338);
         return param1;
      }
      
      private function §_-I2k§(param1:ByteArray, param2:FilePart) : ByteArray
      {
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         param1 = §_-43J§(param1);
         param1 = §_-qe§(param1);
         _loc4_ = "Content-Disposition: form-data; name=\"Filename\"";
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1 = §_-qe§(param1);
         param1 = §_-qe§(param1);
         param1.writeUTFBytes(param2.fileName);
         param1 = §_-qe§(param1);
         param1 = §_-43J§(param1);
         param1 = §_-qe§(param1);
         _loc4_ = "Content-Disposition: form-data; name=\"" + param2.dataField + "\"; filename=\"";
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1.writeUTFBytes(param2.fileName);
         param1 = §_-12N§(param1);
         param1 = §_-qe§(param1);
         _loc4_ = "Content-Type: " + param2.contentType;
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            param1.writeByte(_loc4_.charCodeAt(_loc3_));
            _loc3_++;
         }
         param1 = §_-qe§(param1);
         return §_-qe§(param1);
      }
      
      private function §_-kz§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         for each(_loc4_ in §_-51B§)
         {
            param1 = §_-43J§(param1);
            param1 = §_-qe§(param1);
            _loc3_ = "Content-Disposition: form-data; name=\"" + _loc4_ + "\"";
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               param1.writeByte(_loc3_.charCodeAt(_loc2_));
               _loc2_++;
            }
            param1 = §_-qe§(param1);
            param1 = §_-qe§(param1);
            param1.writeUTFBytes(§_-g1L§[_loc4_]);
            param1 = §_-qe§(param1);
         }
         return param1;
      }
      
      private function §_-A3z§() : void
      {
         _loader.addEventListener(Event.COMPLETE,onComplete,false,0,false);
         _loader.addEventListener(ProgressEvent.PROGRESS,§_-V24§,false,0,false);
         _loader.addEventListener(IOErrorEvent.IO_ERROR,§_-Rl§,false,0,false);
         _loader.addEventListener(HTTPStatusEvent.HTTP_STATUS,§_-r25§,false,0,false);
         _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,§_-R2w§,false,0,false);
      }
      
      private function §_-d19§(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         param1 = §_-qe§(param1);
         param1 = §_-43J§(param1);
         param1 = §_-qe§(param1);
         _loc3_ = "Content-Disposition: form-data; name=\"Upload\"";
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            param1.writeByte(_loc3_.charCodeAt(_loc2_));
            _loc2_++;
         }
         param1 = §_-qe§(param1);
         param1 = §_-qe§(param1);
         _loc3_ = "Submit Query";
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            param1.writeByte(_loc3_.charCodeAt(_loc2_));
            _loc2_++;
         }
         return §_-qe§(param1);
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
