package §_-03j§
{
   import §_-N14§.§_-G2M§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   import flash.events.Event;
   
   public class §_-cV§ extends Event
   {
      
      public static const §_-z2G§:String = "animationFrameEvent";
      
      public static const §_-w1F§:String = "boneFrameEvent";
      
      public var frameLabel:String;
      
      public var bone:§_-TH§;
      
      public var §_-y8§:§_-G2M§;
      
      public function §_-cV§(param1:String, param2:Boolean = false)
      {
         super(param1,false,param2);
      }
      
      public static function get §_-d2O§() : String
      {
         return §_-z2G§;
      }
      
      public function get armature() : §_-E1r§
      {
         return target as §_-E1r§;
      }
      
      override public function clone() : Event
      {
         var _loc1_:§_-cV§ = new §_-cV§(type,cancelable);
         _loc1_.§_-y8§ = this.§_-y8§;
         _loc1_.bone = this.bone;
         _loc1_.frameLabel = this.frameLabel;
         return _loc1_;
      }
   }
}

