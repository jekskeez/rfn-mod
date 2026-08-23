package dragonBones.objects
{
   public final class AnimationData extends Timeline
   {
      
      public var frameRate:uint;
      
      public var name:String;
      
      public var loop:int;
      
      public var tweenEasing:Number;
      
      private var §_-o28§:Object;
      
      private var §_-118§:Number;
      
      public function AnimationData()
      {
         super();
         this.loop = 0;
         this.tweenEasing = NaN;
         this.§_-o28§ = {};
         this.§_-118§ = 0;
      }
      
      public function get §_-xo§() : Object
      {
         return this.§_-o28§;
      }
      
      public function get fadeInTime() : Number
      {
         return this.§_-118§;
      }
      
      public function set fadeInTime(param1:Number) : void
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         this.§_-118§ = param1;
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         super.dispose();
         for(_loc1_ in this.§_-o28§)
         {
            (this.§_-o28§[_loc1_] as TransformTimeline).dispose();
         }
         this.§_-o28§ = null;
      }
      
      public function §_-923§(param1:String) : TransformTimeline
      {
         return this.§_-o28§[param1] as TransformTimeline;
      }
      
      public function addTimeline(param1:TransformTimeline, param2:String) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         this.§_-o28§[param2] = param1;
      }
   }
}

