package dragonBones.objects
{
   import flash.geom.Point;
   
   public final class DisplayData
   {
      
      public static const ARMATURE:String = "armature";
      
      public static const IMAGE:String = "image";
      
      public var name:String;
      
      public var type:String;
      
      public var transform:DBTransform;
      
      public var pivot:Point;
      
      public function DisplayData()
      {
         super();
         this.transform = new DBTransform();
      }
      
      public function dispose() : void
      {
         this.transform = null;
         this.pivot = null;
      }
   }
}

