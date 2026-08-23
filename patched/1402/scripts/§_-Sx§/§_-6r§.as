package §_-Sx§
{
   import §_-Vu§.§_-tW§;
   import dragonBones.§_-833§;
   import flash.events.Event;
   
   public class §_-6r§ extends Event
   {
      
      public static const §_-XU§:String = "sound";
      
      public var armature:§_-833§;
      
      public var §_-p1j§:§_-tW§;
      
      public var sound:String;
      
      public function §_-6r§(param1:String, param2:Boolean = false)
      {
         super(param1,false,param2);
      }
      
      override public function clone() : Event
      {
         var _loc1_:§_-6r§ = new §_-6r§(type,cancelable);
         _loc1_.armature = this.armature;
         _loc1_.§_-p1j§ = this.§_-p1j§;
         _loc1_.sound = this.sound;
         return _loc1_;
      }
   }
}

