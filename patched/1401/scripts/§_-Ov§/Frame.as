package §_-Ov§
{
   public class Frame
   {
      
      public var §_-B2g§:Number = 1;
      
      public var §_-l1e§:Number = 1;
      
      public var §_-A3p§:Number = 0;
      
      public var §_-V2r§:Number = 0;
      
      public var §_-oP§:Number = 1;
      
      public var §_-z15§:Number = 1;
      
      public function Frame(param1:Number = 64, param2:Number = 64, param3:Number = 0, param4:Number = 0, param5:Number = 64, param6:Number = 64)
      {
         super();
         this.§_-A3p§ = param3 / param1;
         this.§_-V2r§ = param4 / param2;
         this.§_-oP§ = (param3 + param5) / param1;
         this.§_-z15§ = (param4 + param6) / param2;
         this.§_-B2g§ = param5 >> 1;
         this.§_-l1e§ = param6 >> 1;
      }
   }
}

