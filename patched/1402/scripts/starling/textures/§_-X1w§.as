package starling.textures
{
   import flash.display3D.Context3DTextureFormat;
   import flash.utils.ByteArray;
   
   public class §_-X1w§
   {
      
      private var §_-P2O§:String;
      
      private var §_-sd§:int;
      
      private var §_-Pb§:int;
      
      private var §_-p5§:int;
      
      private var §_-U1T§:Boolean;
      
      private var §_-g1t§:ByteArray;
      
      public function §_-X1w§(param1:ByteArray)
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         super();
         if(!§_-jp§(param1))
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
               this.§_-P2O§ = Context3DTextureFormat.BGRA;
               break;
            case 12:
            case 2:
            case 3:
               this.§_-P2O§ = Context3DTextureFormat.COMPRESSED;
               break;
            case 13:
            case 4:
            case 5:
               this.§_-P2O§ = "compressedAlpha";
               break;
            default:
               throw new Error("Invalid ATF format");
         }
         this.§_-sd§ = Math.pow(2,param1.readUnsignedByte());
         this.§_-Pb§ = Math.pow(2,param1.readUnsignedByte());
         this.§_-p5§ = param1.readUnsignedByte();
         this.§_-U1T§ = (_loc2_ & 0x80) != 0;
         this.§_-g1t§ = param1;
         if(param1[5] != 0 && param1[6] == 255)
         {
            _loc3_ = (param1[5] & 1) == 1;
            _loc4_ = param1[5] >> 1 & 0x7F;
            this.§_-p5§ = _loc3_ ? 1 : _loc4_;
         }
      }
      
      public static function §_-jp§(param1:ByteArray) : Boolean
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
         return this.§_-P2O§;
      }
      
      public function get width() : int
      {
         return this.§_-sd§;
      }
      
      public function get height() : int
      {
         return this.§_-Pb§;
      }
      
      public function get §_-B2z§() : int
      {
         return this.§_-p5§;
      }
      
      public function get §_-r1q§() : Boolean
      {
         return this.§_-U1T§;
      }
      
      public function get data() : ByteArray
      {
         return this.§_-g1t§;
      }
   }
}

