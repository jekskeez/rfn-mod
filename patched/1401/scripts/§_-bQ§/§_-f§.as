package §_-bQ§
{
   public final class §_-f§
   {
      
      public var priority:int;
      
      public var start:Number;
      
      public var prevNode:§_-f§;
      
      public var change:Number;
      
      public var target:Object;
      
      public var name:String;
      
      public var §_-w26§:String;
      
      public var nextNode:§_-f§;
      
      public var §_-w27§:Boolean;
      
      public function §_-f§(param1:Object, param2:String, param3:Number, param4:Number, param5:String, param6:Boolean, param7:§_-f§ = null, param8:int = 0)
      {
         super();
         this.target = param1;
         this.§_-w26§ = param2;
         this.start = param3;
         this.change = param4;
         this.name = param5;
         this.§_-w27§ = param6;
         if(param7)
         {
            param7.prevNode = this;
            this.nextNode = param7;
         }
         this.priority = param8;
      }
   }
}

