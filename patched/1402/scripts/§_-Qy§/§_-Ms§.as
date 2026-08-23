package §_-Qy§
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   
   public class §_-Ms§ extends Sprite
   {
      
      public static const §_-l1a§:int = 0;
      
      public static const §_-z1g§:int = 1;
      
      private static var preview:Loader = null;
      
      private static var back:Sprite = null;
      
      private static var §_-Yw§:MovieClip = null;
      
      public function §_-Ms§()
      {
         super();
         back = new Sprite();
         back.graphics.lineStyle(2,16049614);
         back.graphics.beginFill(16250092);
         back.graphics.drawRoundRectComplex(0,0,179,179,5,5,5,5);
         back.graphics.endFill();
         addChild(back);
         §_-Yw§ = new MoviePreload();
         §_-Yw§.x = (back.width - §_-Yw§.width) * 0.5;
         §_-Yw§.y = (back.width - §_-Yw§.width) * 0.5;
         addChild(§_-Yw§);
         preview = new Loader();
         preview.scrollRect = new Rectangle(0,0,150,150);
         preview.x = preview.y = 15;
         addChild(preview);
         preview.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-Q2k§);
         preview.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§_-R4§);
      }
      
      private function §_-R4§(param1:Event) : void
      {
         §_-p2U§.add("Error load cast preview file");
         back.visible = false;
         §_-Yw§.visible = false;
      }
      
      private function §_-Q2k§(param1:Event) : void
      {
         if(back)
         {
            back.visible = true;
         }
         if(§_-Yw§)
         {
            §_-Yw§.visible = false;
         }
      }
      
      public function load(param1:int = 0, param2:int = 0) : void
      {
         if(preview.numChildren != 0)
         {
            preview.unloadAndStop();
         }
         preview.load(new URLRequest(param2 >= §_-z1g§ ? §_-Zy§.§_-yw§ : §_-Zy§.§_-93l§ + param1 + ".swf"));
      }
   }
}

