package §_-s2e§
{
   import §_-F2q§.§_-e2Y§;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class §_-13B§ extends §_-O17§
   {
      
      private static const §_-41m§:Class;
      
      private static var base:§_-e2Y§ = null;
      
      public static var data:ByteArray = null;
      
      loop1:
      while(true)
      {
         if(!_loc2_)
         {
            §_-41m§ = §_-1N§;
            if(!_loc2_)
            {
               if(_loc1_)
               {
                  var _temp_2:* = §_-13B§;
                  var _temp_1:* = _loc1_;
                  var _loc1_:* = _loc1_;
                  _loc1_ = _temp_1;
                  this = _temp_2;
                  do
                  {
                     data = null;
                     if(_loc1_)
                     {
                        continue;
                     }
                     if(!_loc2_)
                     {
                        break loop1;
                     }
                     var _temp_4:* = _loc1_;
                     var _temp_3:* = _loc1_;
                     _loc1_ = _loc1_;
                     _loc1_ = _temp_3;
                     _loc1_ = _temp_4;
                  }
                  while(!_loc2_);
                  addr007d:
                  var _temp_6:* = _loc2_;
                  var _temp_5:* = _loc2_;
                  this = §_-13B§;
                  var _loc2_:* = _temp_5;
                  _loc2_ = _temp_6;
                  break;
                  addr0045:
               }
               base = null;
            }
         }
         if(!_loc2_)
         {
            §§goto(addr0045);
         }
         §§goto(addr007d);
      }
      
      public function §_-13B§()
      {
         if(!_loc1_)
         {
            super();
         }
      }
      
      public static function gls(param1:String, ... rest) : String
      {
         while(true)
         {
            if(!_loc3_)
            {
               if(base != null)
               {
                  break;
               }
               if(_loc3_)
               {
                  break;
               }
            }
            base = new §_-e2Y§(§_-Zy§.§_-dm§,§_-S4§());
            break;
         }
         return base.gls(param1,rest);
      }
      
      private static function §_-S4§() : ByteArray
      {
         return new §_-41m§();
      }
      
      override public function loadBytes(param1:Class) : void
      {
         while(true)
         {
            if(!_loc3_)
            {
               data = new param1();
               if(_loc3_)
               {
                  break;
               }
            }
            onComplete(new Event(Event.COMPLETE));
            break;
         }
      }
      
      override protected function onLoaded(param1:Event) : void
      {
         while(true)
         {
            if(!_loc3_)
            {
               data = this.§_-w1f§.data;
               if(_loc2_)
               {
                  break;
               }
            }
            onComplete(param1);
            break;
         }
      }
   }
}

