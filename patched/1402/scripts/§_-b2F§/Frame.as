package §_-b2F§
{
   public class Frame
   {
      
      public var §_-81E§:Number = 1;
      
      public var §_-7D§:Number = 1;
      
      public var §_-m2Y§:Number = 0;
      
      public var §_-1a§:Number = 0;
      
      public var §_-pm§:Number = 1;
      
      public var §_-S0§:Number = 1;
      
      public function Frame(param1:Number = 64, param2:Number = 64, param3:Number = 0, param4:Number = 0, param5:Number = 64, param6:Number = 64)
      {
         super();
         this.§_-m2Y§ = param3 / param1;
         this.§_-1a§ = param4 / param2;
         this.§_-pm§ = (param3 + param5) / param1;
         this.§_-S0§ = (param4 + param6) / param2;
         this.§_-81E§ = param5 >> 1;
         this.§_-7D§ = param6 >> 1;
      }
   }
}

