package §_-D1c§
{
   import events.§_-63A§;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import utils.§_-vo§;
   
   public class §_-11t§ extends Sprite
   {
      
      protected static const §_-xW§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,§_-22V§.§_-O2G§);
      
      protected static const §_-L2F§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,§_-22V§.§_-O2G§);
      
      private var §_-LN§:*;
      
      public function §_-11t§()
      {
         super();
      }
      
      protected static function §_-Y2P§(param1:TextField, param2:TextFormat = null) : void
      {
         if(param2 == null)
         {
            param2 = §_-xW§;
         }
         §_-vo§.embedFonts(param1);
         param1.defaultTextFormat = param2;
         if(param1.length > 0)
         {
            param1.setTextFormat(param2);
         }
      }
      
      public function set inspectObject(param1:*) : void
      {
         this.§_-LN§ = param1;
      }
      
      public function get inspectObject() : *
      {
         return this.§_-LN§;
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
         dispatchEvent(new §_-63A§(this.§_-LN§,§_-63A§.CHANGE));
      }
   }
}

