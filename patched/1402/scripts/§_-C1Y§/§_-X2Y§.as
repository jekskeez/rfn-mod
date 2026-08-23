package §_-C1Y§
{
   import §_-6R§.§_-518§;
   import §_-JM§.§_-c1Q§;
   import §_-JM§.§_-j2L§;
   import dragonBones.§_-833§;
   import dragonBones.§_-z2H§;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class §_-X2Y§ extends §_-tc§
   {
      
      public var §_-jm§:Boolean;
      
      public function §_-X2Y§()
      {
         super(this);
      }
      
      override protected function §_-a6§(param1:Object, param2:Object) : §_-c1Q§
      {
         return new §_-j2L§(param1,param2,1,false);
      }
      
      override protected function §_-Oi§() : §_-833§
      {
         var _loc1_:Sprite = new Sprite();
         return new §_-833§(_loc1_);
      }
      
      override protected function §_-fI§() : §_-z2H§
      {
         return new §_-z2H§(new §_-518§());
      }
      
      override protected function §_-C2Y§(param1:Object, param2:String, param3:Number, param4:Number) : Object
      {
         var nativeTextureAtlas:§_-j2L§ = null;
         var movieClip:MovieClip = null;
         var displaySWF:Object = null;
         var subTextureData:Rectangle = null;
         var displayShape:Shape = null;
         var textureAtlas:Object = param1;
         var fullName:String = param2;
         var pivotX:Number = param3;
         var pivotY:Number = param4;
         if(textureAtlas is §_-j2L§)
         {
            nativeTextureAtlas = textureAtlas as §_-j2L§;
         }
         if(nativeTextureAtlas)
         {
            movieClip = nativeTextureAtlas.movieClip;
            if(Boolean(movieClip) && movieClip.totalFrames >= 3)
            {
               movieClip.gotoAndStop(movieClip.totalFrames);
               movieClip.gotoAndStop(fullName);
               if(movieClip.numChildren > 0)
               {
                  try
                  {
                     displaySWF = movieClip.getChildAt(0);
                     displaySWF.x = 0;
                     displaySWF.y = 0;
                     return displaySWF;
                  }
                  catch(e:Error)
                  {
                     throw new Error("Can not get the movie clip, please make sure the version of the resource compatible with app version!");
                  }
               }
            }
            else
            {
               if(!nativeTextureAtlas.bitmapData)
               {
                  throw new Error();
               }
               subTextureData = nativeTextureAtlas.getRegion(fullName);
               if(subTextureData)
               {
                  displayShape = new Shape();
                  §_-P1§.a = 1;
                  §_-P1§.b = 0;
                  §_-P1§.c = 0;
                  §_-P1§.d = 1;
                  §_-P1§.scale(1 / nativeTextureAtlas.scale,1 / nativeTextureAtlas.scale);
                  §_-P1§.tx = -pivotX - subTextureData.x;
                  §_-P1§.ty = -pivotY - subTextureData.y;
                  displayShape.graphics.beginBitmapFill(nativeTextureAtlas.bitmapData,§_-P1§,false,this.§_-jm§);
                  displayShape.graphics.drawRect(-pivotX,-pivotY,subTextureData.width,subTextureData.height);
                  return displayShape;
               }
            }
         }
         return null;
      }
   }
}

