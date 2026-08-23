package tape
{
   import §_-r2Y§.§_-33e§;
   
   public class §_-y1R§ extends §_-xc§
   {
      
      private var §_-H1X§:Array = [];
      
      public function §_-y1R§()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.§_-H1X§ = param1;
         this.§_-h1E§();
      }
      
      public function §_-k1§(param1:int) : void
      {
         if(this.§_-H1X§.indexOf(param1) == -1)
         {
            this.§_-H1X§.push(param1);
         }
         this.§_-h1E§();
      }
      
      public function §_-H1Q§() : Array
      {
         if(this.§_-H1X§ != null)
         {
            return this.§_-H1X§;
         }
         return [];
      }
      
      override public function addObject(param1:§_-K2k§) : void
      {
         param1.addEventListener(§_-33e§.STICKED,this.§_-gX§);
         super.addObject(param1);
      }
      
      override public function §_-v1z§(param1:§_-K2k§, param2:int = 0) : void
      {
         param1.addEventListener(§_-33e§.STICKED,this.§_-gX§);
         super.§_-v1z§(param1,param2);
      }
      
      override public function §_-yA§(param1:§_-K2k§) : void
      {
         param1.addEventListener(§_-33e§.STICKED,this.§_-gX§);
         super.§_-yA§(param1);
      }
      
      protected function §_-gX§(param1:§_-33e§) : void
      {
         dispatchEvent(new §_-33e§(param1.element,§_-33e§.STICKED));
      }
      
      private function §_-h1E§() : void
      {
         clear();
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-H1X§.length)
         {
            this.addObject(new §_-n1X§(this.§_-H1X§[_loc1_]));
            _loc1_++;
         }
      }
   }
}

