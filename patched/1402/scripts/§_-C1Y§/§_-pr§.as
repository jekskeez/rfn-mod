package §_-C1Y§
{
   import §_-6R§.§_-h1s§;
   import §_-JM§.§_-A3Y§;
   import §_-JM§.§_-c1Q§;
   import dragonBones.§_-833§;
   import dragonBones.§_-z2H§;
   import dragonBones.core.dragonBones_internal;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import starling.core.Starling;
   import starling.display.Sprite;
   import starling.display.§_-I2q§;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   import starling.textures.§_-RS§;
   
   use namespace dragonBones_internal;
   
   public class §_-pr§ extends §_-tc§
   {
      
      public var generateMipMaps:Boolean;
      
      public var optimizeForRenderToTexture:Boolean;
      
      public var §_-VI§:Number;
      
      public function §_-pr§()
      {
         super(this);
         this.§_-VI§ = 1;
      }
      
      override protected function §_-a6§(param1:Object, param2:Object) : §_-c1Q§
      {
         var _loc3_:Texture = null;
         var _loc4_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:MovieClip = null;
         if(param1 is BitmapData)
         {
            _loc4_ = param1 as BitmapData;
            _loc3_ = Texture.§_-h2H§(_loc4_,this.generateMipMaps,this.optimizeForRenderToTexture);
         }
         else
         {
            if(!(param1 is MovieClip))
            {
               throw new Error();
            }
            _loc6_ = this.§_-C20§(param1.width) * this.§_-VI§;
            _loc7_ = this.§_-C20§(param1.height) * this.§_-VI§;
            §_-P1§.a = 1;
            §_-P1§.b = 0;
            §_-P1§.c = 0;
            §_-P1§.d = 1;
            §_-P1§.scale(this.§_-VI§,this.§_-VI§);
            §_-P1§.tx = 0;
            §_-P1§.ty = 0;
            _loc8_ = param1 as MovieClip;
            _loc8_.gotoAndStop(1);
            _loc4_ = new BitmapData(_loc6_,_loc7_,true,16711935);
            _loc4_.draw(_loc8_,§_-P1§);
            _loc8_.gotoAndStop(_loc8_.totalFrames);
            _loc3_ = Texture.§_-h2H§(_loc4_,this.generateMipMaps,this.optimizeForRenderToTexture,this.§_-VI§);
         }
         var _loc5_:§_-A3Y§ = new §_-A3Y§(_loc3_,param2,false);
         if(Starling.§_-B2f§)
         {
            _loc5_.§_-F1b§ = _loc4_;
         }
         else
         {
            _loc4_.dispose();
         }
         return _loc5_;
      }
      
      override protected function §_-Oi§() : §_-833§
      {
         return new §_-833§(new Sprite());
      }
      
      override protected function §_-fI§() : §_-z2H§
      {
         return new §_-z2H§(new §_-h1s§());
      }
      
      override protected function §_-C2Y§(param1:Object, param2:String, param3:Number, param4:Number) : Object
      {
         var _loc6_:§_-I2q§ = null;
         var _loc5_:SubTexture = (param1 as TextureAtlas).getTexture(param2) as SubTexture;
         if(Boolean(_loc5_) && Boolean(_loc5_.width != 0) && _loc5_.height != 0)
         {
            _loc6_ = new §_-I2q§(_loc5_);
            _loc6_.pivotX = param3;
            _loc6_.pivotY = param4;
            _loc6_.smoothing = §_-RS§.NONE;
            return _loc6_;
         }
         return null;
      }
      
      private function §_-C20§(param1:uint) : uint
      {
         return param1 & param1 - 1 ? uint(1 << param1.toString(2).length) : param1;
      }
   }
}

