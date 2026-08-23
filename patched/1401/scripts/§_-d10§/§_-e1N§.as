package §_-d10§
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   
   public class §_-e1N§ extends Sprite
   {
      
      public static const §_-Va§:int = 0;
      
      public static const §_-61h§:int = 1;
      
      private static var preview:Loader = null;
      
      private static var back:Sprite = null;
      
      private static var §_-821§:MovieClip = null;
      
      public function §_-e1N§()
      {
         super();
         back = new Sprite();
         back.graphics.lineStyle(2,16049614);
         back.graphics.beginFill(16250092);
         back.graphics.drawRoundRectComplex(0,0,179,179,5,5,5,5);
         back.graphics.endFill();
         addChild(back);
         §_-821§ = new MoviePreload();
         §_-821§.x = (back.width - §_-821§.width) * 0.5;
         §_-821§.y = (back.width - §_-821§.width) * 0.5;
         addChild(§_-821§);
         preview = new Loader();
         preview.scrollRect = new Rectangle(0,0,150,150);
         preview.x = preview.y = 15;
         addChild(preview);
         preview.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-53I§);
         preview.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§_-VL§);
      }
      
      private function §_-VL§(param1:Event) : void
      {
         §_-TQ§.add("Error load cast preview file");
         back.visible = false;
         §_-821§.visible = false;
      }
      
      private function §_-53I§(param1:Event) : void
      {
         if(back)
         {
            back.visible = true;
         }
         if(§_-821§)
         {
            §_-821§.visible = false;
         }
      }
      
      public function load(param1:int = 0, param2:int = 0) : void
      {
         if(preview.numChildren != 0)
         {
            preview.unloadAndStop();
         }
         preview.load(new URLRequest(param2 >= §_-61h§ ? §_-a9§.§_-Fy§ : §_-a9§.§_-8k§ + param1 + ".swf"));
      }
   }
}

