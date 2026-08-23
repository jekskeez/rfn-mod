package §_-Mq§
{
   import §_-TK§.§_-Z1n§;
   
   public class §_-11l§
   {
      
      protected var objects:Object = {};
      
      public function §_-11l§()
      {
         super();
      }
      
      public function add(param1:String, param2:*, param3:Boolean = true, param4:String = "") : §_-Z1n§
      {
         this.§_-a2a§(param1);
         var _loc5_:§_-Z1n§ = new §_-Z1n§(param2,param3);
         this.objects[param1].push(_loc5_);
         return _loc5_;
      }
      
      public function remove(param1:String, param2:*, param3:Boolean = true) : void
      {
         if(this.objects[param1] is Vector.<§_-Z1n§>)
         {
            delete this.objects[param1];
         }
      }
      
      public function §_-815§(param1:String) : Vector.<§_-Z1n§>
      {
         this.§_-a2a§(param1);
         return this.objects[param1];
      }
      
      public function §_-03M§(param1:String) : Boolean
      {
         return Boolean(this.objects[param1]) && Boolean(this.objects[param1].length) ? true : false;
      }
      
      protected function §_-a2a§(param1:String) : void
      {
         if(!this.objects[param1])
         {
            this.objects[param1] = new Vector.<§_-Z1n§>();
         }
      }
   }
}

