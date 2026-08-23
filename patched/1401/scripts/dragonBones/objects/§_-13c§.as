package dragonBones.objects
{
   import flash.utils.ByteArray;
   
   public final class §_-13c§
   {
      
      public var §_-d1y§:String;
      
      public var dragonBonesData:Object;
      
      public var textureAtlasData:Object;
      
      public var §_-xU§:ByteArray;
      
      public function §_-13c§(param1:Object, param2:Object, param3:ByteArray)
      {
         super();
         this.dragonBonesData = param1;
         this.textureAtlasData = param2;
         this.§_-xU§ = param3;
      }
      
      public function dispose() : void
      {
         this.dragonBonesData = null;
         this.textureAtlasData = null;
         this.§_-xU§ = null;
      }
   }
}

