package dragonBones.objects
{
   public final class AnimationData extends Timeline
   {
      
      public var frameRate:uint;
      
      public var name:String;
      
      public var loop:int;
      
      public var tweenEasing:Number;
      
      private var §_-73p§:Object;
      
      private var §_-cw§:Number;
      
      public function AnimationData()
      {
         super();
         this.loop = 0;
         this.tweenEasing = NaN;
         this.§_-73p§ = {};
         this.§_-cw§ = 0;
      }
      
      public function get §_-yJ§() : Object
      {
         return this.§_-73p§;
      }
      
      public function get fadeInTime() : Number
      {
         return this.§_-cw§;
      }
      
      public function set fadeInTime(param1:Number) : void
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         this.§_-cw§ = param1;
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         super.dispose();
         for(_loc1_ in this.§_-73p§)
         {
            (this.§_-73p§[_loc1_] as TransformTimeline).dispose();
         }
         this.§_-73p§ = null;
      }
      
      public function §_-h2U§(param1:String) : TransformTimeline
      {
         return this.§_-73p§[param1] as TransformTimeline;
      }
      
      public function addTimeline(param1:TransformTimeline, param2:String) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         this.§_-73p§[param2] = param1;
      }
   }
}

