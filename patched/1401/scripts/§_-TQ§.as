package
{
   import flash.net.FileReference;
   
   public class §_-TQ§
   {
      
      public static var §_-03P§:Array = [];
      
      public static var §_-J1R§:Array = [];
      
      public static var §_-ei§:Boolean = false;
      
      public static var §_-u24§:Boolean = false;
      
      private static var §_-v12§:Boolean = true;
      
      private static var §_-p1v§:uint = 0;
      
      public function §_-TQ§()
      {
         super();
      }
      
      internal static function init(param1:Boolean) : void
      {
         §_-v12§ = param1;
      }
      
      public static function get §_-L17§() : Boolean
      {
         return §_-v12§;
      }
      
      public static function §_-l5§(param1:int = 2147483647) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = Math.max(0,§_-03P§.length - param1);
         while(_loc3_ < §_-03P§.length)
         {
            _loc2_ += §_-03P§[_loc3_] + "\n";
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function §_-o1k§() : void
      {
         var string:String = §_-TQ§.§_-l5§(§_-03P§.length);
         var myFileReference:FileReference = new FileReference();
         var date:Date = new Date();
         try
         {
            myFileReference.save(string,"SquirrelsGameLog_(" + date.fullYear + "-" + (date.month + 1) + "-" + date.date + "-" + date.hours + "-" + date.minutes + "-" + date.seconds + ").txt");
         }
         catch(error:Error)
         {
            §_-TQ§.add("Logger->downloadMessages: " + error.message);
         }
      }
      
      public static function add(... rest) : void
      {
         var _loc4_:Function = null;
         if(!§_-v12§)
         {
            return;
         }
         var _loc2_:String = "[" + §_-p1v§++ + "] " + rest;
         if(§_-ei§)
         {
         }
         §_-TQ§.§_-03P§.push(_loc2_);
         var _loc3_:String = _loc2_ + "\n";
         for each(_loc4_ in §_-J1R§)
         {
            _loc4_(_loc3_);
         }
      }
      
      public static function §_-V2L§(param1:String) : void
      {
         if(!§_-v12§)
         {
            return;
         }
         §_-TQ§.§_-03P§.push("[Tag:" + param1 + "]");
      }
      
      public static function §_-p1§(param1:String) : void
      {
         if(!§_-v12§)
         {
            return;
         }
         while(§_-03P§.length > 0)
         {
            if(§_-03P§.pop() == "[Tag:" + param1 + "]")
            {
               return;
            }
         }
      }
      
      private static function §_-O4§() : String
      {
         var _loc1_:Date = new Date();
         var _loc2_:String = _loc1_.hours.toString();
         var _loc3_:String = _loc1_.minutes.toString();
         var _loc4_:String = _loc1_.seconds.toString();
         if(_loc2_.length < 2)
         {
            _loc2_ = "0" + _loc2_;
         }
         if(_loc3_.length < 2)
         {
            _loc3_ = "0" + _loc3_;
         }
         if(_loc4_.length < 2)
         {
            _loc4_ = "0" + _loc4_;
         }
         return _loc2_ + ":" + _loc3_ + ":" + _loc4_;
      }
   }
}

