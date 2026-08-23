package dragonBones.objects
{
   import dragonBones.utils.§_-c1e§;
   import dragonBones.utils.checkBytesTailisXML;
   import flash.utils.ByteArray;
   
   public final class §_-l2g§
   {
      
      public function §_-l2g§()
      {
         super();
      }
      
      public static function §_-y29§(param1:Object, param2:Object, param3:ByteArray) : ByteArray
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeBytes(param3);
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeObject(param2);
         _loc5_.compress();
         _loc4_.position = _loc4_.length;
         _loc4_.writeBytes(_loc5_);
         _loc4_.writeInt(_loc5_.length);
         _loc5_.length = 0;
         _loc5_.writeObject(param1);
         _loc5_.compress();
         _loc4_.position = _loc4_.length;
         _loc4_.writeBytes(_loc5_);
         _loc4_.writeInt(_loc5_.length);
         return _loc4_;
      }
      
      public static function §_-3H§(param1:ByteArray) : §_-13c§
      {
         var decompressedData:§_-13c§ = null;
         var bytesCopy:ByteArray = null;
         var strSize:int = 0;
         var position:uint = 0;
         var dataBytes:ByteArray = null;
         var dragonBonesData:Object = null;
         var textureAtlasData:Object = null;
         var bytes:ByteArray = param1;
         var dataType:String = §_-c1e§.§_-eC§(bytes);
         switch(dataType)
         {
            case §_-c1e§.§_-A2N§:
            case §_-c1e§.§_-7T§:
            case §_-c1e§.§_-52j§:
            case §_-c1e§.ATF:
               try
               {
                  bytesCopy = new ByteArray();
                  bytesCopy.writeBytes(bytes);
                  bytes = bytesCopy;
                  bytes.position = bytes.length - 4;
                  strSize = bytes.readInt();
                  position = bytes.length - 4 - strSize;
                  dataBytes = new ByteArray();
                  dataBytes.writeBytes(bytes,position,strSize);
                  dataBytes.uncompress();
                  bytes.length = position;
                  if(checkBytesTailisXML(dataBytes))
                  {
                     dragonBonesData = XML(dataBytes.readUTFBytes(dataBytes.length));
                  }
                  else
                  {
                     dragonBonesData = dataBytes.readObject();
                  }
                  bytes.position = bytes.length - 4;
                  strSize = bytes.readInt();
                  position = bytes.length - 4 - strSize;
                  dataBytes.length = 0;
                  dataBytes.writeBytes(bytes,position,strSize);
                  dataBytes.uncompress();
                  bytes.length = position;
                  if(checkBytesTailisXML(dataBytes))
                  {
                     textureAtlasData = XML(dataBytes.readUTFBytes(dataBytes.length));
                  }
                  else
                  {
                     textureAtlasData = dataBytes.readObject();
                  }
               }
               catch(e:Error)
               {
                  throw new Error("Data error!");
               }
               decompressedData = new §_-13c§(dragonBonesData,textureAtlasData,bytes);
               decompressedData.§_-d1y§ = dataType;
               return decompressedData;
            case §_-c1e§.§_-D1b§:
               throw new Error("Can not decompress zip!");
            default:
               throw new Error("Nonsupport data!");
         }
      }
      
      public static function §_-F11§(param1:Object, param2:Number = 1) : Object
      {
         if(param1 is XML)
         {
            return §_-Z1T§.§_-o1z§(param1 as XML,param2);
         }
         return §_-x1l§.§_-o1z§(param1,param2);
      }
      
      public static function §_-Q1L§(param1:Object) : SkeletonData
      {
         if(param1 is XML)
         {
            return §_-Z1T§.§_-e1C§(param1 as XML);
         }
         return §_-x1l§.§_-e1C§(param1);
      }
   }
}

