package §_-03j§
{
   import §_-N14§.§_-G2M§;
   import dragonBones.§_-E1r§;
   import flash.events.Event;
   
   public class §_-Q24§ extends Event
   {
      
      public static const §_-A2e§:String = "fadeIn";
      
      public static const §_-G2z§:String = "fadeOut";
      
      public static const START:String = "start";
      
      public static const COMPLETE:String = "complete";
      
      public static const §_-X2a§:String = "loopComplete";
      
      public static const §_-01P§:String = "fadeInComplete";
      
      public static const §_-bu§:String = "fadeOutComplete";
      
      public var §_-y8§:§_-G2M§;
      
      public function §_-Q24§(param1:String, param2:Boolean = false)
      {
         super(param1,false,param2);
      }
      
      public static function get §_-j2P§() : String
      {
         return §_-A2e§;
      }
      
      public function get armature() : §_-E1r§
      {
         return target as §_-E1r§;
      }
      
      public function get §_-Y1v§() : String
      {
         return this.§_-y8§.name;
      }
      
      override public function clone() : Event
      {
         var _loc1_:§_-Q24§ = new §_-Q24§(type,cancelable);
         _loc1_.§_-y8§ = this.§_-y8§;
         return _loc1_;
      }
   }
}

