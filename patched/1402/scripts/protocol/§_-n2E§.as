package protocol
{
   public class §_-n2E§
   {
      
      public static const §_-U1G§:int = 1;
      
      public static const §_-XU§:int = 2;
      
      public static const §_-F2s§:int = 3;
      
      public static const §_-B2C§:int = 9;
      
      public static const §_-j1v§:int = 21;
      
      public static const §_-m2U§:int = 33;
      
      public static const §_-T2s§:int = 47;
      
      public static const §_-S1K§:int = 48;
      
      public static const §_-F1o§:int = 50;
      
      public static const §_-X1A§:int = 19;
      
      public static const §_-qO§:int = 31;
      
      public static const §_-A3F§:int = 45;
      
      public static const §_-72d§:int = 51;
      
      public static const §_-y1i§:int = 5;
      
      public static const §_-NL§:int = 6;
      
      public static const §_-X2z§:int = 52;
      
      public static const §_-PG§:int = 59;
      
      public static const §_-33J§:int = 60;
      
      public var type:int;
      
      private var §_-4r§:int;
      
      private var §_-H2A§:Vector.<Function> = new Vector.<Function>();
      
      public function §_-n2E§(param1:int, param2:int = 0)
      {
         super();
         this.type = param1;
         this.§_-4r§ = param2;
      }
      
      public function get value() : int
      {
         return this.§_-4r§;
      }
      
      public function §_-i2T§(param1:int, param2:Boolean = true) : void
      {
         if(this.§_-4r§ == param1)
         {
            return;
         }
         this.§_-4r§ = param1;
         if(param2)
         {
            Connection.§_-e2T§(§_-u1O§.§_-r17§,this.type,this.§_-4r§);
         }
         this.notify();
      }
      
      public function listen(param1:Function) : void
      {
         this.§_-H2A§.push(param1);
      }
      
      public function forget(param1:Function) : void
      {
         var _loc2_:int = this.§_-H2A§.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.§_-H2A§.splice(_loc2_,1);
      }
      
      private function notify() : void
      {
         var _loc1_:Function = null;
         for each(_loc1_ in this.§_-H2A§)
         {
            _loc1_.apply(null,[this]);
         }
      }
   }
}

