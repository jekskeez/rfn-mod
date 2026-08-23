package views
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class §_-A3c§ extends Sprite
   {
      
      public static const EVENT_UPDATE:String = "EVENT_UPDATE";
      
      private var count:int = 0;
      
      private var textField:TextField = null;
      
      private var §_-K1C§:ImageEventGame = null;
      
      public function §_-A3c§()
      {
         super();
         this.init();
      }
      
      public function set §_-B1K§(param1:int) : void
      {
         if(param1 <= 0)
         {
            this.count = 0;
            this.visible = false;
            return;
         }
         this.count = param1;
         this.textField.text = String(param1 > 99 ? "99+" : param1);
         this.§_-K1C§.scaleX = param1 > 99 ? 1.2 : 1;
         this.§_-K1C§.scaleY = param1 > 99 ? 1.2 : 1;
         if(!this.visible)
         {
            dispatchEvent(new Event(§_-A3c§.EVENT_UPDATE));
         }
         this.§_-v2P§();
      }
      
      public function get §_-B1K§() : int
      {
         return this.count;
      }
      
      private function init() : void
      {
         var _loc1_:Sprite = new Sprite();
         addChild(_loc1_);
         this.§_-K1C§ = new ImageEventGame();
         _loc1_.addChild(this.§_-K1C§);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,16777215,true);
         _loc2_.align = "center";
         this.textField = new §_-i5§(String(this.§_-B1K§),-3,this.§_-K1C§.y,_loc2_);
         this.textField.width = 25;
         this.textField.wordWrap = true;
         this.textField.filters = [new GlowFilter(6763521,0.6,3.5,3.5,3,2)];
         _loc1_.addChild(this.textField);
      }
      
      private function §_-v2P§() : void
      {
         this.textField.width = this.count > 99 ? 30 : 25;
         this.textField.y = this.§_-K1C§.y + (this.count > 99 ? 4 : 2);
      }
   }
}

