package §_-RI§
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import starling.textures.Texture;
   
   public class §_-52F§ extends Texture
   {
      
      public static const §_-g1V§:String = "texture_error";
      
      public static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-52F§()
      {
         super();
      }
      
      public static function §_-b2K§(param1:BitmapData, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : Texture
      {
         var dataClone:BitmapData = null;
         var texture:Texture = null;
         var data:BitmapData = param1;
         var generateMipMaps:Boolean = param2;
         var optimizeForRenderToTexture:Boolean = param3;
         var scale:Number = param4;
         var format:String = param5;
         var repeat:Boolean = param6;
         dataClone = data.clone();
         texture = Texture.§_-31k§(data.width / scale,data.height / scale,true,generateMipMaps,optimizeForRenderToTexture,scale,format,repeat);
         try
         {
            texture.root.§_-B3d§(data);
            texture.root.§_-x2b§ = function():void
            {
               texture.root.§_-B3d§(dataClone);
            };
         }
         catch(e:Error)
         {
            §_-u1o§.dispatchEvent(new Event(§_-g1V§));
         }
         finally
         {
            return texture;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}

