package §_-430§
{
   import §_-D26§.§_-G1K§;
   import §_-D26§.§_-oM§;
   import §_-Rz§.§_-v2r§;
   import dragonBones.§_-Bq§;
   import dragonBones.§_-E1r§;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class §_-B36§ extends §_-fr§
   {
      
      public var §_-f2o§:Boolean;
      
      public function §_-B36§()
      {
         super(this);
      }
      
      override protected function §_-T1d§(param1:Object, param2:Object) : §_-oM§
      {
         return new §_-G1K§(param1,param2,1,false);
      }
      
      override protected function §_-41r§() : §_-E1r§
      {
         var _loc1_:Sprite = new Sprite();
         return new §_-E1r§(_loc1_);
      }
      
      override protected function §_-p5§() : §_-Bq§
      {
         return new §_-Bq§(new §_-v2r§());
      }
      
      override protected function §_-TC§(param1:Object, param2:String, param3:Number, param4:Number) : Object
      {
         var nativeTextureAtlas:§_-G1K§ = null;
         var movieClip:MovieClip = null;
         var displaySWF:Object = null;
         var subTextureData:Rectangle = null;
         var displayShape:Shape = null;
         var textureAtlas:Object = param1;
         var fullName:String = param2;
         var pivotX:Number = param3;
         var pivotY:Number = param4;
         if(textureAtlas is §_-G1K§)
         {
            nativeTextureAtlas = textureAtlas as §_-G1K§;
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
                  §_-HT§.a = 1;
                  §_-HT§.b = 0;
                  §_-HT§.c = 0;
                  §_-HT§.d = 1;
                  §_-HT§.scale(1 / nativeTextureAtlas.scale,1 / nativeTextureAtlas.scale);
                  §_-HT§.tx = -pivotX - subTextureData.x;
                  §_-HT§.ty = -pivotY - subTextureData.y;
                  displayShape.graphics.beginBitmapFill(nativeTextureAtlas.bitmapData,§_-HT§,false,this.§_-f2o§);
                  displayShape.graphics.drawRect(-pivotX,-pivotY,subTextureData.width,subTextureData.height);
                  return displayShape;
               }
            }
         }
         return null;
      }
   }
}

