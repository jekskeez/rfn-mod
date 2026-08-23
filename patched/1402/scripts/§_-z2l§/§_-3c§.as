package §_-z2l§
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-3c§ extends Sprite
   {
      
      private static const §_-6§:int = 280;
      
      protected static const §_-RP§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      protected static const §_-W2z§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,17,16777215);
      
      protected static const §_-K2g§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,17,16763904,null,null,null,null,null,"center");
      
      protected var background:Sprite = null;
      
      protected var §_-Kk§:§_-i5§ = null;
      
      public function §_-3c§()
      {
         super();
         this.§_-72W§();
      }
      
      protected function §_-72W§() : void
      {
         if(this.background)
         {
            addChild(this.background);
         }
         if(this.§_-Kk§)
         {
            addChild(this.§_-Kk§);
            this.§_-Kk§.x = (this.width - this.§_-Kk§.width) * 0.5;
            this.§_-Kk§.y = 5;
         }
      }
      
      public function set caption(param1:String) : void
      {
         this.§_-Kk§ = new §_-i5§(param1,0,0,§_-K2g§,§_-6§ - 10);
         this.§_-Kk§.filters = [§_-RP§];
      }
      
      public function get caption() : String
      {
         return this.§_-Kk§ ? this.§_-Kk§.text : "";
      }
      
      public function get id() : int
      {
         return 0;
      }
      
      public function get bitmapData() : BitmapData
      {
         var _loc1_:BitmapData = new BitmapData(§_-6§,§_-6§);
         var _loc2_:DisplayObject = §_-uR§.§_-t2O§();
         _loc2_.scaleX = _loc2_.scaleY = 0.6;
         _loc2_.x = int((§_-6§ - _loc2_.width) * 0.5);
         _loc2_.y = int(§_-6§ - _loc2_.height / 1.5);
         this.addChild(_loc2_);
         _loc1_.draw(this);
         return _loc1_;
      }
   }
}

