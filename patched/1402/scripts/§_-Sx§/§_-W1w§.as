package §_-Sx§
{
   import §_-Vu§.§_-tW§;
   import dragonBones.§_-833§;
   import flash.events.Event;
   
   public class §_-W1w§ extends Event
   {
      
      public static const §_-F8§:String = "fadeIn";
      
      public static const §_-23P§:String = "fadeOut";
      
      public static const START:String = "start";
      
      public static const COMPLETE:String = "complete";
      
      public static const §_-2T§:String = "loopComplete";
      
      public static const §_-716§:String = "fadeInComplete";
      
      public static const §_-M2Y§:String = "fadeOutComplete";
      
      public var §_-p1j§:§_-tW§;
      
      public function §_-W1w§(param1:String, param2:Boolean = false)
      {
         super(param1,false,param2);
      }
      
      public static function get §_-d2L§() : String
      {
         return §_-F8§;
      }
      
      public function get armature() : §_-833§
      {
         return target as §_-833§;
      }
      
      public function get §_-Sq§() : String
      {
         return this.§_-p1j§.name;
      }
      
      override public function clone() : Event
      {
         var _loc1_:§_-W1w§ = new §_-W1w§(type,cancelable);
         _loc1_.§_-p1j§ = this.§_-p1j§;
         return _loc1_;
      }
   }
}

