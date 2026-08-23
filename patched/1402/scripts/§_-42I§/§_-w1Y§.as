package §_-42I§
{
   import events.§_-F2k§;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import utils.§_-L2J§;
   
   public class §_-w1Y§ extends Sprite
   {
      
      protected static const §_-dt§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,§_-i5§.§_-Y2H§);
      
      protected static const §_-yI§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,§_-i5§.§_-Y2H§);
      
      private var §_-ay§:*;
      
      public function §_-w1Y§()
      {
         super();
      }
      
      protected static function §_-G1V§(param1:TextField, param2:TextFormat = null) : void
      {
         if(param2 == null)
         {
            param2 = §_-dt§;
         }
         §_-L2J§.embedFonts(param1);
         param1.defaultTextFormat = param2;
         if(param1.length > 0)
         {
            param1.setTextFormat(param2);
         }
      }
      
      public function set inspectObject(param1:*) : void
      {
         this.§_-ay§ = param1;
      }
      
      public function get inspectObject() : *
      {
         return this.§_-ay§;
      }
      
      public function get widgetHeight() : Number
      {
         return this.height;
      }
      
      public function dispose() : void
      {
      }
      
      protected function dispatch() : void
      {
         dispatchEvent(new §_-F2k§(this.§_-ay§,§_-F2k§.CHANGE));
      }
   }
}

