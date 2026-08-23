package §_-t2Y§
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-H1W§ extends Sprite
   {
      
      private static const §_-E1N§:int = 280;
      
      protected static const §_-52c§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      protected static const §_-Y2k§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,17,16777215);
      
      protected static const §_-G27§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,17,16763904,null,null,null,null,null,"center");
      
      protected var background:Sprite = null;
      
      protected var §_-83N§:§_-22V§ = null;
      
      public function §_-H1W§()
      {
         super();
         this.§_-h1d§();
      }
      
      protected function §_-h1d§() : void
      {
         if(this.background)
         {
            addChild(this.background);
         }
         if(this.§_-83N§)
         {
            addChild(this.§_-83N§);
            this.§_-83N§.x = (this.width - this.§_-83N§.width) * 0.5;
            this.§_-83N§.y = 5;
         }
      }
      
      public function set caption(param1:String) : void
      {
         this.§_-83N§ = new §_-22V§(param1,0,0,§_-G27§,§_-E1N§ - 10);
         this.§_-83N§.filters = [§_-52c§];
      }
      
      public function get caption() : String
      {
         return this.§_-83N§ ? this.§_-83N§.text : "";
      }
      
      public function get id() : int
      {
         return 0;
      }
      
      public function get bitmapData() : BitmapData
      {
         var _loc1_:BitmapData = new BitmapData(§_-E1N§,§_-E1N§);
         var _loc2_:DisplayObject = §_-k2X§.§_-81z§();
         _loc2_.scaleX = _loc2_.scaleY = 0.6;
         _loc2_.x = int((§_-E1N§ - _loc2_.width) * 0.5);
         _loc2_.y = int(§_-E1N§ - _loc2_.height / 1.5);
         this.addChild(_loc2_);
         _loc1_.draw(this);
         return _loc1_;
      }
   }
}

