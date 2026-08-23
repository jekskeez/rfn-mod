package tape
{
   import §_-X2V§.CastItemEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import game.mainGame.§_-v1N§;
   
   public class §_-t2b§ extends §_-N1N§
   {
      
      private var §_-3N§:int = -1;
      
      private var §_-e5§:§_-i5§ = null;
      
      public function §_-t2b§(param1:§_-v1N§)
      {
         super(param1);
         var _loc2_:CounterCastAreaImage = new CounterCastAreaImage();
         _loc2_.x = 28;
         _loc2_.y = 23;
         _loc2_.mouseEnabled = false;
         _loc2_.cacheAsBitmap = true;
         addChild(_loc2_);
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,10,16777215,true);
         _loc3_.align = TextFormatAlign.CENTER;
         this.§_-3N§ = param1.count;
         this.§_-e5§ = new §_-i5§(this.§_-3N§.toString(),27,23,_loc3_);
         this.§_-e5§.width = 20;
         this.§_-e5§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-e5§.mouseEnabled = false;
         addChild(this.§_-e5§);
         this.§_-i1H§.addEventListener(CastItemEvent.ITEM_CHANGE,this.§_-m24§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-i1H§.removeEventListener(CastItemEvent.ITEM_CHANGE,this.§_-m24§);
      }
      
      public function get count() : int
      {
         return this.§_-3N§;
      }
      
      public function set count(param1:int) : void
      {
         if(this.§_-3N§ == param1)
         {
            return;
         }
         this.§_-3N§ = param1;
         this.§_-e5§.text = this.§_-3N§.toString();
      }
      
      private function §_-m24§(param1:CastItemEvent) : void
      {
         this.count = param1.§_-i1H§.count;
         if(this.§_-i1H§.type == §_-v1N§.§_-W29§)
         {
            this.icon.alpha = §_-i1H§.count > 0 ? 1 : 0.1;
         }
      }
   }
}

