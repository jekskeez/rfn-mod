package dragonBones.objects
{
   import flash.geom.Point;
   
   public final class TransformTimeline extends Timeline
   {
      
      public static const §_-82j§:TransformTimeline = new TransformTimeline();
      
      public var §_-oW§:Boolean;
      
      public var §_-R1B§:DBTransform;
      
      public var §_-P1o§:Point;
      
      private var §_-J1c§:Number;
      
      public function TransformTimeline()
      {
         super();
         this.§_-R1B§ = new DBTransform();
         this.§_-P1o§ = new Point();
         this.§_-J1c§ = 0;
      }
      
      public function get offset() : Number
      {
         return this.§_-J1c§;
      }
      
      public function set offset(param1:Number) : void
      {
         this.§_-J1c§ = (param1 || 0) % 1;
         if(this.§_-J1c§ < 0)
         {
            this.§_-J1c§ += 1;
         }
      }
      
      override public function dispose() : void
      {
         if(this == §_-82j§)
         {
            return;
         }
         super.dispose();
         this.§_-R1B§ = null;
         this.§_-P1o§ = null;
      }
   }
}

