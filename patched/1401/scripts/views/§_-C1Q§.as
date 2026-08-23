package views
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class §_-C1Q§ extends Sprite
   {
      
      public static const EVENT_UPDATE:String = "EVENT_UPDATE";
      
      private var count:int = 0;
      
      private var textField:TextField = null;
      
      private var §_-y1B§:ImageEventGame = null;
      
      public function §_-C1Q§()
      {
         super();
         this.init();
      }
      
      public function set §_-M2W§(param1:int) : void
      {
         if(param1 <= 0)
         {
            this.count = 0;
            this.visible = false;
            return;
         }
         this.count = param1;
         this.textField.text = String(param1 > 99 ? "99+" : param1);
         this.§_-y1B§.scaleX = param1 > 99 ? 1.2 : 1;
         this.§_-y1B§.scaleY = param1 > 99 ? 1.2 : 1;
         if(!this.visible)
         {
            dispatchEvent(new Event(§_-C1Q§.EVENT_UPDATE));
         }
         this.§_-z1j§();
      }
      
      public function get §_-M2W§() : int
      {
         return this.count;
      }
      
      private function init() : void
      {
         var _loc1_:Sprite = new Sprite();
         addChild(_loc1_);
         this.§_-y1B§ = new ImageEventGame();
         _loc1_.addChild(this.§_-y1B§);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,16777215,true);
         _loc2_.align = "center";
         this.textField = new §_-22V§(String(this.§_-M2W§),-3,this.§_-y1B§.y,_loc2_);
         this.textField.width = 25;
         this.textField.wordWrap = true;
         this.textField.filters = [new GlowFilter(6763521,0.6,3.5,3.5,3,2)];
         _loc1_.addChild(this.textField);
      }
      
      private function §_-z1j§() : void
      {
         this.textField.width = this.count > 99 ? 30 : 25;
         this.textField.y = this.§_-y1B§.y + (this.count > 99 ? 4 : 2);
      }
   }
}

