package
{
   import §_-Vu§.§_-p4§;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class §_-p1V§
   {
      
      private static var _instance:§_-p1V§ = new §_-p1V§();
      
      private static var §_-H2A§:Vector.<Function> = new Vector.<Function>();
      
      private static var §_-1P§:Vector.<int> = new Vector.<int>();
      
      private static var §_-528§:Vector.<Function> = new Vector.<Function>();
      
      private static var §_-H1m§:int = 0;
      
      private static var §_-S1U§:int = 0;
      
      private static var §_-p28§:int = 0;
      
      public function §_-p1V§()
      {
         super();
         if(_instance)
         {
            return;
         }
         Game.stage.addEventListener(Event.ENTER_FRAME,§_-A1X§);
      }
      
      public static function §_-A3z§(param1:Function, param2:int = 0) : void
      {
         if(§_-H2A§.indexOf(param1) != -1)
         {
            return;
         }
         if(§_-H2A§.length == 0)
         {
            §_-H2A§.push(param1);
            §_-1P§.push(param2);
            return;
         }
         var _loc3_:Number = §_-1P§.length;
         while(--_loc3_ > -1)
         {
            if(_loc3_ == §_-1P§.length - 1 && §_-1P§[_loc3_] <= param2)
            {
               §_-H2A§.push(param1);
               §_-1P§.push(param2);
               break;
            }
            if(§_-1P§[_loc3_] <= param2)
            {
               §_-1P§.splice(_loc3_ + 1,0,param2);
               §_-H2A§.splice(_loc3_ + 1,0,param1);
               break;
            }
            if(_loc3_ == 0)
            {
               §_-1P§.splice(0,0,param2);
               §_-H2A§.splice(0,0,param1);
            }
         }
      }
      
      public static function §_-DO§(param1:Function) : void
      {
         var _loc2_:int = §_-H2A§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         §_-H2A§.splice(_loc2_,1);
         §_-1P§.splice(_loc2_,1);
      }
      
      public static function §_-63T§(param1:Function) : void
      {
         if(§_-528§.indexOf(param1) != -1)
         {
            return;
         }
         §_-528§.push(param1);
      }
      
      public static function §_-B3x§(param1:Function) : void
      {
         var _loc2_:int = §_-528§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         §_-528§.splice(_loc2_,1);
      }
      
      public static function get delay() : Number
      {
         return §_-p28§ * 0.001;
      }
      
      public static function get §_-23d§() : int
      {
         return §_-H1m§;
      }
      
      private static function §_-A1X§(param1:Event) : void
      {
         var _loc2_:Number = getTimer();
         §_-p28§ = _loc2_ - §_-H1m§;
         §_-H1m§ = _loc2_;
         §_-p4§.§_-m1U§.§_-a1Q§(§_-p28§ * 0.001);
         var _loc3_:Vector.<Function> = §_-H2A§.concat();
         var _loc4_:Number = _loc3_.length;
         while(--_loc4_ > -1)
         {
            _loc3_[_loc4_]();
         }
         §_-S1U§ += §_-p28§;
         if(§_-S1U§ >= 1000)
         {
            §_-S1U§ -= 1000;
            _loc3_ = §_-528§.concat();
            _loc4_ = _loc3_.length;
            while(--_loc4_ > -1)
            {
               _loc3_[_loc4_]();
            }
         }
      }
   }
}

