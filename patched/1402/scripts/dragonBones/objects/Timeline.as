package dragonBones.objects
{
   public class Timeline
   {
      
      private var §_-v1b§:Vector.<Frame>;
      
      private var §_-d26§:Number;
      
      private var §_-a12§:Number;
      
      public function Timeline()
      {
         super();
         this.§_-v1b§ = new Vector.<Frame>(0,true);
         this.§_-d26§ = 0;
         this.§_-a12§ = 1;
      }
      
      public function get frameList() : Vector.<Frame>
      {
         return this.§_-v1b§;
      }
      
      public function get duration() : Number
      {
         return this.§_-d26§;
      }
      
      public function set duration(param1:Number) : void
      {
         this.§_-d26§ = param1 >= 0 ? param1 : 0;
      }
      
      public function get scale() : Number
      {
         return this.§_-a12§;
      }
      
      public function set scale(param1:Number) : void
      {
         this.§_-a12§ = param1 >= 0 ? param1 : 1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-v1b§.length);
         while(_loc1_--)
         {
            this.§_-v1b§[_loc1_].dispose();
         }
         this.§_-v1b§.fixed = false;
         this.§_-v1b§.length = 0;
         this.§_-v1b§ = null;
      }
      
      public function addFrame(param1:Frame) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-v1b§.indexOf(param1) < 0)
         {
            this.§_-v1b§.fixed = false;
            this.§_-v1b§[this.§_-v1b§.length] = param1;
            this.§_-v1b§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
   }
}

