package tape
{
   import §_-a11§.§_-h2m§;
   
   public class §_-h2s§ extends §_-h2f§
   {
      
      private var §_-t1A§:Array = [];
      
      public function §_-h2s§()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.§_-t1A§ = param1;
         this.§_-1S§();
      }
      
      public function §_-p2O§(param1:int) : void
      {
         if(this.§_-t1A§.indexOf(param1) == -1)
         {
            this.§_-t1A§.push(param1);
         }
         this.§_-1S§();
      }
      
      public function §_-n4§() : Array
      {
         if(this.§_-t1A§ != null)
         {
            return this.§_-t1A§;
         }
         return [];
      }
      
      override public function addObject(param1:§_-QN§) : void
      {
         param1.addEventListener(§_-h2m§.STICKED,this.§_-u2D§);
         super.addObject(param1);
      }
      
      override public function §_-L1M§(param1:§_-QN§, param2:int = 0) : void
      {
         param1.addEventListener(§_-h2m§.STICKED,this.§_-u2D§);
         super.§_-L1M§(param1,param2);
      }
      
      override public function §_-LF§(param1:§_-QN§) : void
      {
         param1.addEventListener(§_-h2m§.STICKED,this.§_-u2D§);
         super.§_-LF§(param1);
      }
      
      protected function §_-u2D§(param1:§_-h2m§) : void
      {
         dispatchEvent(new §_-h2m§(param1.element,§_-h2m§.STICKED));
      }
      
      private function §_-1S§() : void
      {
         clear();
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-t1A§.length)
         {
            this.addObject(new §_-gn§(this.§_-t1A§[_loc1_]));
            _loc1_++;
         }
      }
   }
}

