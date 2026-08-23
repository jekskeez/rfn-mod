package §_-430§
{
   import §_-D26§.§_-oM§;
   import §_-D26§.§_-q1f§;
   import §_-Rz§.§_-83J§;
   import dragonBones.§_-Bq§;
   import dragonBones.§_-E1r§;
   import dragonBones.core.dragonBones_internal;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import starling.core.Starling;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   import starling.textures.§_-a1g§;
   
   use namespace dragonBones_internal;
   
   public class §_-H2F§ extends §_-fr§
   {
      
      public var generateMipMaps:Boolean;
      
      public var optimizeForRenderToTexture:Boolean;
      
      public var §_-81c§:Number;
      
      public function §_-H2F§()
      {
         super(this);
         this.§_-81c§ = 1;
      }
      
      override protected function §_-T1d§(param1:Object, param2:Object) : §_-oM§
      {
         var _loc3_:Texture = null;
         var _loc4_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:MovieClip = null;
         if(param1 is BitmapData)
         {
            _loc4_ = param1 as BitmapData;
            _loc3_ = Texture.§_-b2K§(_loc4_,this.generateMipMaps,this.optimizeForRenderToTexture);
         }
         else
         {
            if(!(param1 is MovieClip))
            {
               throw new Error();
            }
            _loc6_ = this.§_-P1Z§(param1.width) * this.§_-81c§;
            _loc7_ = this.§_-P1Z§(param1.height) * this.§_-81c§;
            §_-HT§.a = 1;
            §_-HT§.b = 0;
            §_-HT§.c = 0;
            §_-HT§.d = 1;
            §_-HT§.scale(this.§_-81c§,this.§_-81c§);
            §_-HT§.tx = 0;
            §_-HT§.ty = 0;
            _loc8_ = param1 as MovieClip;
            _loc8_.gotoAndStop(1);
            _loc4_ = new BitmapData(_loc6_,_loc7_,true,16711935);
            _loc4_.draw(_loc8_,§_-HT§);
            _loc8_.gotoAndStop(_loc8_.totalFrames);
            _loc3_ = Texture.§_-b2K§(_loc4_,this.generateMipMaps,this.optimizeForRenderToTexture,this.§_-81c§);
         }
         var _loc5_:§_-q1f§ = new §_-q1f§(_loc3_,param2,false);
         if(Starling.§_-m2K§)
         {
            _loc5_.§_-zo§ = _loc4_;
         }
         else
         {
            _loc4_.dispose();
         }
         return _loc5_;
      }
      
      override protected function §_-41r§() : §_-E1r§
      {
         return new §_-E1r§(new Sprite());
      }
      
      override protected function §_-p5§() : §_-Bq§
      {
         return new §_-Bq§(new §_-83J§());
      }
      
      override protected function §_-TC§(param1:Object, param2:String, param3:Number, param4:Number) : Object
      {
         var _loc6_:§_-jH§ = null;
         var _loc5_:SubTexture = (param1 as TextureAtlas).getTexture(param2) as SubTexture;
         if(Boolean(_loc5_) && Boolean(_loc5_.width != 0) && _loc5_.height != 0)
         {
            _loc6_ = new §_-jH§(_loc5_);
            _loc6_.pivotX = param3;
            _loc6_.pivotY = param4;
            _loc6_.smoothing = §_-a1g§.NONE;
            return _loc6_;
         }
         return null;
      }
      
      private function §_-P1Z§(param1:uint) : uint
      {
         return param1 & param1 - 1 ? uint(1 << param1.toString(2).length) : param1;
      }
   }
}

