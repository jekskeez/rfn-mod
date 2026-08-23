package §_-Sx§
{
   import §_-Vu§.§_-tW§;
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import flash.events.Event;
   
   public class §_-b2K§ extends Event
   {
      
      public static const §_-x2q§:String = "animationFrameEvent";
      
      public static const §_-V2T§:String = "boneFrameEvent";
      
      public var frameLabel:String;
      
      public var bone:§_-83b§;
      
      public var §_-p1j§:§_-tW§;
      
      public function §_-b2K§(param1:String, param2:Boolean = false)
      {
         super(param1,false,param2);
      }
      
      public static function get §_-w1Q§() : String
      {
         return §_-x2q§;
      }
      
      public function get armature() : §_-833§
      {
         return target as §_-833§;
      }
      
      override public function clone() : Event
      {
         var _loc1_:§_-b2K§ = new §_-b2K§(type,cancelable);
         _loc1_.§_-p1j§ = this.§_-p1j§;
         _loc1_.bone = this.bone;
         _loc1_.frameLabel = this.frameLabel;
         return _loc1_;
      }
   }
}

