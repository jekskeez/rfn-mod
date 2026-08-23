package
{
   import flash.net.FileReference;
   
   public class §_-p2U§
   {
      
      public static var §_-Z0§:Array = [];
      
      public static var §_-C1x§:Array = [];
      
      public static var §_-bv§:Boolean = false;
      
      public static var §_-i10§:Boolean = false;
      
      private static var §_-C3K§:Boolean = true;
      
      private static var §_-M2E§:uint = 0;
      
      public function §_-p2U§()
      {
         super();
      }
      
      internal static function init(param1:Boolean) : void
      {
         §_-C3K§ = param1;
      }
      
      public static function get §_-t1t§() : Boolean
      {
         return §_-C3K§;
      }
      
      public static function §_-93a§(param1:int = 2147483647) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = Math.max(0,§_-Z0§.length - param1);
         while(_loc3_ < §_-Z0§.length)
         {
            _loc2_ += §_-Z0§[_loc3_] + "\n";
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function §_-m2c§() : void
      {
         var string:String = §_-p2U§.§_-93a§(§_-Z0§.length);
         var myFileReference:FileReference = new FileReference();
         var date:Date = new Date();
         try
         {
            myFileReference.save(string,"SquirrelsGameLog_(" + date.fullYear + "-" + (date.month + 1) + "-" + date.date + "-" + date.hours + "-" + date.minutes + "-" + date.seconds + ").txt");
         }
         catch(error:Error)
         {
            §_-p2U§.add("Logger->downloadMessages: " + error.message);
         }
      }
      
      public static function add(... rest) : void
      {
         var _loc4_:Function = null;
         if(!§_-C3K§)
         {
            return;
         }
         var _loc2_:String = "[" + §_-M2E§++ + "] " + rest;
         if(§_-bv§)
         {
         }
         §_-p2U§.§_-Z0§.push(_loc2_);
         var _loc3_:String = _loc2_ + "\n";
         for each(_loc4_ in §_-C1x§)
         {
            _loc4_(_loc3_);
         }
      }
      
      public static function §_-g2F§(param1:String) : void
      {
         if(!§_-C3K§)
         {
            return;
         }
         §_-p2U§.§_-Z0§.push("[Tag:" + param1 + "]");
      }
      
      public static function §_-43A§(param1:String) : void
      {
         if(!§_-C3K§)
         {
            return;
         }
         while(§_-Z0§.length > 0)
         {
            if(§_-Z0§.pop() == "[Tag:" + param1 + "]")
            {
               return;
            }
         }
      }
      
      private static function §_-61E§() : String
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

