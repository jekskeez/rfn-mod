package starling.textures
{
   import flash.display3D.Context3DTextureFormat;
   import flash.utils.ByteArray;
   
   public class §_-A1F§
   {
      
      private var §_-GW§:String;
      
      private var §_-q1a§:int;
      
      private var §_-D1k§:int;
      
      private var §_-n2X§:int;
      
      private var §_-f7§:Boolean;
      
      private var §_-53H§:ByteArray;
      
      public function §_-A1F§(param1:ByteArray)
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         super();
         if(!§_-Of§(param1))
         {
            throw new ArgumentError("Invalid ATF data");
         }
         if(param1[6] == 255)
         {
            param1.position = 12;
         }
         else
         {
            param1.position = 6;
         }
         var _loc2_:uint = param1.readUnsignedByte();
         switch(_loc2_ & 0x7F)
         {
            case 0:
            case 1:
               this.§_-GW§ = Context3DTextureFormat.BGRA;
               break;
            case 12:
            case 2:
            case 3:
               this.§_-GW§ = Context3DTextureFormat.COMPRESSED;
               break;
            case 13:
            case 4:
            case 5:
               this.§_-GW§ = "compressedAlpha";
               break;
            default:
               throw new Error("Invalid ATF format");
         }
         this.§_-q1a§ = Math.pow(2,param1.readUnsignedByte());
         this.§_-D1k§ = Math.pow(2,param1.readUnsignedByte());
         this.§_-n2X§ = param1.readUnsignedByte();
         this.§_-f7§ = (_loc2_ & 0x80) != 0;
         this.§_-53H§ = param1;
         if(param1[5] != 0 && param1[6] == 255)
         {
            _loc3_ = (param1[5] & 1) == 1;
            _loc4_ = param1[5] >> 1 & 0x7F;
            this.§_-n2X§ = _loc3_ ? 1 : _loc4_;
         }
      }
      
      public static function §_-Of§(param1:ByteArray) : Boolean
      {
         var _loc2_:String = null;
         if(param1.length < 3)
         {
            return false;
         }
         _loc2_ = String.fromCharCode(param1[0],param1[1],param1[2]);
         return _loc2_ == "ATF";
      }
      
      public function get format() : String
      {
         return this.§_-GW§;
      }
      
      public function get width() : int
      {
         return this.§_-q1a§;
      }
      
      public function get height() : int
      {
         return this.§_-D1k§;
      }
      
      public function get §_-Y1r§() : int
      {
         return this.§_-n2X§;
      }
      
      public function get §_-u0§() : Boolean
      {
         return this.§_-f7§;
      }
      
      public function get data() : ByteArray
      {
         return this.§_-53H§;
      }
   }
}

