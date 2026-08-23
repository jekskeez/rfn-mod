package dragonBones.objects
{
   import dragonBones.utils.§_-82R§;
   import dragonBones.utils.checkBytesTailisXML;
   import flash.utils.ByteArray;
   
   public final class §_-C1V§
   {
      
      public function §_-C1V§()
      {
         super();
      }
      
      public static function §_-cQ§(param1:Object, param2:Object, param3:ByteArray) : ByteArray
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
      
      public static function §_-oI§(param1:ByteArray) : §_-fb§
      {
         var decompressedData:§_-fb§ = null;
         var bytesCopy:ByteArray = null;
         var strSize:int = 0;
         var position:uint = 0;
         var dataBytes:ByteArray = null;
         var dragonBonesData:Object = null;
         var textureAtlasData:Object = null;
         var bytes:ByteArray = param1;
         var dataType:String = §_-82R§.§_-iM§(bytes);
         switch(dataType)
         {
            case §_-82R§.§_-p2d§:
            case §_-82R§.§_-D1Y§:
            case §_-82R§.§_-k1t§:
            case §_-82R§.ATF:
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
               decompressedData = new §_-fb§(dragonBonesData,textureAtlasData,bytes);
               decompressedData.§_-o13§ = dataType;
               return decompressedData;
            case §_-82R§.§_-x1o§:
               throw new Error("Can not decompress zip!");
            default:
               throw new Error("Nonsupport data!");
         }
      }
      
      public static function §_-P1P§(param1:Object, param2:Number = 1) : Object
      {
         if(param1 is XML)
         {
            return §_-d1n§.§_-637§(param1 as XML,param2);
         }
         return §_-m1e§.§_-637§(param1,param2);
      }
      
      public static function §_-F1X§(param1:Object) : SkeletonData
      {
         if(param1 is XML)
         {
            return §_-d1n§.§_-r2o§(param1 as XML);
         }
         return §_-m1e§.§_-r2o§(param1);
      }
   }
}

