package dragonBones.objects
{
   public final class BoneData
   {
      
      public var name:String;
      
      public var parent:String;
      
      public var length:Number;
      
      public var global:DBTransform;
      
      public var transform:DBTransform;
      
      public var scaleMode:int;
      
      public var fixedRotation:Boolean;
      
      public function BoneData()
      {
         super();
         this.length = 0;
         this.global = new DBTransform();
         this.transform = new DBTransform();
         this.scaleMode = 1;
         this.fixedRotation = false;
      }
      
      public function dispose() : void
      {
         this.global = null;
         this.transform = null;
      }
   }
}

