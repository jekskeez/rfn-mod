package §_-03j§
{
   import §_-N14§.§_-G2M§;
   import dragonBones.§_-E1r§;
   import flash.events.Event;
   
   public class §_-A1e§ extends Event
   {
      
      public static const §_-62Z§:String = "sound";
      
      public var armature:§_-E1r§;
      
      public var §_-y8§:§_-G2M§;
      
      public var sound:String;
      
      public function §_-A1e§(param1:String, param2:Boolean = false)
      {
         super(param1,false,param2);
      }
      
      override public function clone() : Event
      {
         var _loc1_:§_-A1e§ = new §_-A1e§(type,cancelable);
         _loc1_.armature = this.armature;
         _loc1_.§_-y8§ = this.§_-y8§;
         _loc1_.sound = this.sound;
         return _loc1_;
      }
   }
}

