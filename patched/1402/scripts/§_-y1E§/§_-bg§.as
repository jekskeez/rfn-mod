package §_-y1E§
{
   public final class §_-bg§
   {
      
      public var priority:int;
      
      public var start:Number;
      
      public var prevNode:§_-bg§;
      
      public var change:Number;
      
      public var target:Object;
      
      public var name:String;
      
      public var §_-MF§:String;
      
      public var nextNode:§_-bg§;
      
      public var §_-33j§:Boolean;
      
      public function §_-bg§(param1:Object, param2:String, param3:Number, param4:Number, param5:String, param6:Boolean, param7:§_-bg§ = null, param8:int = 0)
      {
         super();
         this.target = param1;
         this.§_-MF§ = param2;
         this.start = param3;
         this.change = param4;
         this.name = param5;
         this.§_-33j§ = param6;
         if(param7)
         {
            param7.prevNode = this;
            this.nextNode = param7;
         }
         this.priority = param8;
      }
   }
}

