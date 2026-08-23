package §_-TK§
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import starling.textures.Texture;
   
   public class §_-zg§ extends Texture
   {
      
      public static const §_-O1N§:String = "texture_error";
      
      public static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-zg§()
      {
         super();
      }
      
      public static function §_-h2H§(param1:BitmapData, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : Texture
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
         texture = Texture.§_-p2i§(data.width / scale,data.height / scale,true,generateMipMaps,optimizeForRenderToTexture,scale,format,repeat);
         try
         {
            texture.root.§_-YT§(data);
            texture.root.§_-y1f§ = function():void
            {
               texture.root.§_-YT§(dataClone);
            };
         }
         catch(e:Error)
         {
            §_-jx§.dispatchEvent(new Event(§_-O1N§));
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

