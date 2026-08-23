package dragonBones.objects
{
   public class Timeline
   {
      
      private var §_-y§:Vector.<Frame>;
      
      private var §_-V2a§:Number;
      
      private var §_-Tq§:Number;
      
      public function Timeline()
      {
         super();
         this.§_-y§ = new Vector.<Frame>(0,true);
         this.§_-V2a§ = 0;
         this.§_-Tq§ = 1;
      }
      
      public function get frameList() : Vector.<Frame>
      {
         return this.§_-y§;
      }
      
      public function get duration() : Number
      {
         return this.§_-V2a§;
      }
      
      public function set duration(param1:Number) : void
      {
         this.§_-V2a§ = param1 >= 0 ? param1 : 0;
      }
      
      public function get scale() : Number
      {
         return this.§_-Tq§;
      }
      
      public function set scale(param1:Number) : void
      {
         this.§_-Tq§ = param1 >= 0 ? param1 : 1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-y§.length);
         while(_loc1_--)
         {
            this.§_-y§[_loc1_].dispose();
         }
         this.§_-y§.fixed = false;
         this.§_-y§.length = 0;
         this.§_-y§ = null;
      }
      
      public function addFrame(param1:Frame) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-y§.indexOf(param1) < 0)
         {
            this.§_-y§.fixed = false;
            this.§_-y§[this.§_-y§.length] = param1;
            this.§_-y§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
   }
}

