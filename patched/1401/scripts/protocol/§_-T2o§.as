package protocol
{
   public class §_-T2o§
   {
      
      public static const §_-32D§:int = 1;
      
      public static const §_-62Z§:int = 2;
      
      public static const §_-71z§:int = 3;
      
      public static const §_-f26§:int = 9;
      
      public static const §_-FK§:int = 21;
      
      public static const §_-p2v§:int = 33;
      
      public static const §_-T1J§:int = 47;
      
      public static const §_-K1N§:int = 48;
      
      public static const §_-d1b§:int = 50;
      
      public static const §_-m11§:int = 19;
      
      public static const §_-CT§:int = 31;
      
      public static const §_-mM§:int = 45;
      
      public static const §_-p1G§:int = 51;
      
      public static const §_-Q2R§:int = 5;
      
      public static const §_-s2X§:int = 6;
      
      public static const §_-w2N§:int = 52;
      
      public static const §_-2O§:int = 59;
      
      public static const §_-g1f§:int = 60;
      
      public var type:int;
      
      private var §_-02w§:int;
      
      private var §_-81x§:Vector.<Function> = new Vector.<Function>();
      
      public function §_-T2o§(param1:int, param2:int = 0)
      {
         super();
         this.type = param1;
         this.§_-02w§ = param2;
      }
      
      public function get value() : int
      {
         return this.§_-02w§;
      }
      
      public function §_-r1g§(param1:int, param2:Boolean = true) : void
      {
         if(this.§_-02w§ == param1)
         {
            return;
         }
         this.§_-02w§ = param1;
         if(param2)
         {
            Connection.§_-Li§(§_-h2B§.§_-d1Y§,this.type,this.§_-02w§);
         }
         this.notify();
      }
      
      public function listen(param1:Function) : void
      {
         this.§_-81x§.push(param1);
      }
      
      public function forget(param1:Function) : void
      {
         var _loc2_:int = this.§_-81x§.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.§_-81x§.splice(_loc2_,1);
      }
      
      private function notify() : void
      {
         var _loc1_:Function = null;
         for each(_loc1_ in this.§_-81x§)
         {
            _loc1_.apply(null,[this]);
         }
      }
   }
}

