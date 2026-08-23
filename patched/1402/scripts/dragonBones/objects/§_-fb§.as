package dragonBones.objects
{
   import flash.utils.ByteArray;
   
   public final class §_-fb§
   {
      
      public var §_-o13§:String;
      
      public var dragonBonesData:Object;
      
      public var textureAtlasData:Object;
      
      public var §_-x1f§:ByteArray;
      
      public function §_-fb§(param1:Object, param2:Object, param3:ByteArray)
      {
         super();
         this.dragonBonesData = param1;
         this.textureAtlasData = param2;
         this.§_-x1f§ = param3;
      }
      
      public function dispose() : void
      {
         this.dragonBonesData = null;
         this.textureAtlasData = null;
         this.§_-x1f§ = null;
      }
   }
}

