package
{
   import §_-N14§.§_-w2t§;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class §_-01Y§
   {
      
      private static var _instance:§_-01Y§ = new §_-01Y§();
      
      private static var §_-81x§:Vector.<Function> = new Vector.<Function>();
      
      private static var §_-F1w§:Vector.<int> = new Vector.<int>();
      
      private static var §_-n1r§:Vector.<Function> = new Vector.<Function>();
      
      private static var §_-rg§:int = 0;
      
      private static var §_-12j§:int = 0;
      
      private static var §_-v1y§:int = 0;
      
      public function §_-01Y§()
      {
         super();
         if(_instance)
         {
            return;
         }
         Game.stage.addEventListener(Event.ENTER_FRAME,§_-L1Y§);
      }
      
      public static function §_-h1R§(param1:Function, param2:int = 0) : void
      {
         if(§_-81x§.indexOf(param1) != -1)
         {
            return;
         }
         if(§_-81x§.length == 0)
         {
            §_-81x§.push(param1);
            §_-F1w§.push(param2);
            return;
         }
         var _loc3_:Number = §_-F1w§.length;
         while(--_loc3_ > -1)
         {
            if(_loc3_ == §_-F1w§.length - 1 && §_-F1w§[_loc3_] <= param2)
            {
               §_-81x§.push(param1);
               §_-F1w§.push(param2);
               break;
            }
            if(§_-F1w§[_loc3_] <= param2)
            {
               §_-F1w§.splice(_loc3_ + 1,0,param2);
               §_-81x§.splice(_loc3_ + 1,0,param1);
               break;
            }
            if(_loc3_ == 0)
            {
               §_-F1w§.splice(0,0,param2);
               §_-81x§.splice(0,0,param1);
            }
         }
      }
      
      public static function §_-t1s§(param1:Function) : void
      {
         var _loc2_:int = §_-81x§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         §_-81x§.splice(_loc2_,1);
         §_-F1w§.splice(_loc2_,1);
      }
      
      public static function §_-c9§(param1:Function) : void
      {
         if(§_-n1r§.indexOf(param1) != -1)
         {
            return;
         }
         §_-n1r§.push(param1);
      }
      
      public static function §_-l2K§(param1:Function) : void
      {
         var _loc2_:int = §_-n1r§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         §_-n1r§.splice(_loc2_,1);
      }
      
      public static function get delay() : Number
      {
         return §_-v1y§ * 0.001;
      }
      
      public static function get §_-tN§() : int
      {
         return §_-rg§;
      }
      
      private static function §_-L1Y§(param1:Event) : void
      {
         var _loc2_:Number = getTimer();
         §_-v1y§ = _loc2_ - §_-rg§;
         §_-rg§ = _loc2_;
         §_-w2t§.§_-R2J§.§_-ld§(§_-v1y§ * 0.001);
         var _loc3_:Vector.<Function> = §_-81x§.concat();
         var _loc4_:Number = _loc3_.length;
         while(--_loc4_ > -1)
         {
            _loc3_[_loc4_]();
         }
         §_-12j§ += §_-v1y§;
         if(§_-12j§ >= 1000)
         {
            §_-12j§ -= 1000;
            _loc3_ = §_-n1r§.concat();
            _loc4_ = _loc3_.length;
            while(--_loc4_ > -1)
            {
               _loc3_[_loc4_]();
            }
         }
      }
   }
}

