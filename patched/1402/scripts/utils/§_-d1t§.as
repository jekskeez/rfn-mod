package utils
{
   import flash.net.LocalConnection;
   import flash.system.System;
   import flash.utils.Dictionary;
   
   public class §_-d1t§
   {
      
      private static var §_-j2r§:Dictionary = new Dictionary(true);
      
      public function §_-d1t§()
      {
         super();
      }
      
      public static function §_-B12§(param1:*) : void
      {
         var stack:String = null;
         var instance:* = param1;
         try
         {
            throw new Error("");
         }
         catch(e:Error)
         {
            stack = e.getStackTrace();
         }
         §_-j2r§[instance] = [stack,false];
      }
      
      public static function §_-xx§(param1:*) : void
      {
         if(param1 == null)
         {
            return;
         }
         §_-j2r§[param1][1] = true;
      }
      
      public static function §_-734§(param1:Boolean = false) : String
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc7_:* = undefined;
         §_-224§(3);
         var _loc2_:String = "Alive instances:\n";
         if(param1)
         {
            for(_loc7_ in §_-j2r§)
            {
               _loc2_ += "\t Class: " + _loc7_ + (param1 ? "\t Stack:" + §_-j2r§[_loc7_][0] + "\n" : "\n");
            }
            return _loc2_;
         }
         var _loc3_:Object = {};
         for(_loc7_ in §_-j2r§)
         {
            if(!(String(_loc7_) in _loc3_))
            {
               _loc3_[String(_loc7_)] = [0,0];
            }
            ++_loc3_[String(_loc7_)][1];
            if(!§_-j2r§[_loc7_][1])
            {
               ++_loc3_[String(_loc7_)][0];
            }
         }
         _loc4_ = [];
         for(_loc5_ in _loc3_)
         {
            _loc4_.push({
               "name":_loc5_,
               "count":_loc3_[_loc5_][0] + "/" + _loc3_[_loc5_][1]
            });
         }
         _loc4_.sortOn("name");
         for each(_loc6_ in _loc4_)
         {
            _loc2_ += "\t" + _loc6_.name + " : " + _loc6_.count + "\n";
         }
         return _loc2_;
      }
      
      public static function §_-224§(param1:int = 1) : void
      {
         §_-p2U§.add("Running GC... " + System.totalMemory / 1000000 + " Mb");
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            try
            {
               new LocalConnection().connect("Crio");
               new LocalConnection().connect("Crio");
            }
            catch(e:*)
            {
            }
            _loc2_++;
         }
         §_-p2U§.add("Complete... " + System.totalMemory / 1000000 + " Mb");
      }
   }
}

