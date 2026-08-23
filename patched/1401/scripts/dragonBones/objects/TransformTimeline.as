package dragonBones.objects
{
   import flash.geom.Point;
   
   public final class TransformTimeline extends Timeline
   {
      
      public static const §_-z29§:TransformTimeline = new TransformTimeline();
      
      public var §_-i2T§:Boolean;
      
      public var §_-iQ§:DBTransform;
      
      public var §_-W1c§:Point;
      
      private var §_-H2O§:Number;
      
      public function TransformTimeline()
      {
         super();
         this.§_-iQ§ = new DBTransform();
         this.§_-W1c§ = new Point();
         this.§_-H2O§ = 0;
      }
      
      public function get offset() : Number
      {
         return this.§_-H2O§;
      }
      
      public function set offset(param1:Number) : void
      {
         this.§_-H2O§ = (param1 || 0) % 1;
         if(this.§_-H2O§ < 0)
         {
            this.§_-H2O§ += 1;
         }
      }
      
      override public function dispose() : void
      {
         if(this == §_-z29§)
         {
            return;
         }
         super.dispose();
         this.§_-iQ§ = null;
         this.§_-W1c§ = null;
      }
   }
}

