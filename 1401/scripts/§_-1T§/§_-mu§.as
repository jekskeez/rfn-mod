package §_-1T§
{
   import §_-RI§.§_-XK§;
   
   public class §_-mu§
   {
      
      protected var objects:Object = {};
      
      public function §_-mu§()
      {
         super();
      }
      
      public function add(param1:String, param2:*, param3:Boolean = true, param4:String = "") : §_-XK§
      {
         this.§_-737§(param1);
         var _loc5_:§_-XK§ = new §_-XK§(param2,param3);
         this.objects[param1].push(_loc5_);
         return _loc5_;
      }
      
      public function remove(param1:String, param2:*, param3:Boolean = true) : void
      {
         if(this.objects[param1] is Vector.<§_-XK§>)
         {
            delete this.objects[param1];
         }
      }
      
      public function §_-43X§(param1:String) : Vector.<§_-XK§>
      {
         this.§_-737§(param1);
         return this.objects[param1];
      }
      
      public function §_-Yu§(param1:String) : Boolean
      {
         return Boolean(this.objects[param1]) && Boolean(this.objects[param1].length) ? true : false;
      }
      
      protected function §_-737§(param1:String) : void
      {
         if(!this.objects[param1])
         {
            this.objects[param1] = new Vector.<§_-XK§>();
         }
      }
   }
}

