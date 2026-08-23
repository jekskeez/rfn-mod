package starling.textures
{
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.textures.TextureBase;
   import flash.utils.getQualifiedClassName;
   
   internal class §_-vq§ extends §_-72X§
   {
      
      public function §_-vq§(param1:TextureBase, param2:Number = 1)
      {
         var _loc3_:String = Context3DTextureFormat.BGRA;
         var _loc4_:Number = "videoWidth" in param1 ? Number(param1["videoWidth"]) : 0;
         var _loc5_:Number = "videoHeight" in param1 ? Number(param1["videoHeight"]) : 0;
         super(param1,_loc3_,_loc4_,_loc5_,false,false,false,param2,false);
         if(getQualifiedClassName(param1) != "flash.display3D.textures::VideoTexture")
         {
            throw new ArgumentError("\'base\' must be VideoTexture");
         }
      }
      
      override public function get nativeWidth() : Number
      {
         return base["videoWidth"];
      }
      
      override public function get nativeHeight() : Number
      {
         return base["videoHeight"];
      }
      
      override public function get width() : Number
      {
         return this.nativeWidth / scale;
      }
      
      override public function get height() : Number
      {
         return this.nativeHeight / scale;
      }
   }
}

