package tape
{
   import §_-8I§.CastItemEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import game.mainGame.§_-bM§;
   
   public class §_-M1C§ extends §_-63z§
   {
      
      private var §_-C3L§:int = -1;
      
      private var §_-o§:§_-22V§ = null;
      
      public function §_-M1C§(param1:§_-bM§)
      {
         super(param1);
         var _loc2_:CounterCastAreaImage = new CounterCastAreaImage();
         _loc2_.x = 28;
         _loc2_.y = 23;
         _loc2_.mouseEnabled = false;
         _loc2_.cacheAsBitmap = true;
         addChild(_loc2_);
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,10,16777215,true);
         _loc3_.align = TextFormatAlign.CENTER;
         this.§_-C3L§ = param1.count;
         this.§_-o§ = new §_-22V§(this.§_-C3L§.toString(),27,23,_loc3_);
         this.§_-o§.width = 20;
         this.§_-o§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-o§.mouseEnabled = false;
         addChild(this.§_-o§);
         this.§_-L1z§.addEventListener(CastItemEvent.ITEM_CHANGE,this.§_-k1R§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-L1z§.removeEventListener(CastItemEvent.ITEM_CHANGE,this.§_-k1R§);
      }
      
      public function get count() : int
      {
         return this.§_-C3L§;
      }
      
      public function set count(param1:int) : void
      {
         if(this.§_-C3L§ == param1)
         {
            return;
         }
         this.§_-C3L§ = param1;
         this.§_-o§.text = this.§_-C3L§.toString();
      }
      
      private function §_-k1R§(param1:CastItemEvent) : void
      {
         this.count = param1.§_-L1z§.count;
         if(this.§_-L1z§.type == §_-bM§.§_-t2G§)
         {
            this.icon.alpha = §_-L1z§.count > 0 ? 1 : 0.1;
         }
      }
   }
}

