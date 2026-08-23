package views
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.§_-93C§;
   
   public class §_-rL§ extends §_-W1y§
   {
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      private var §_-bP§:Sprite;
      
      public function §_-rL§(param1:int, param2:Boolean = true, param3:Function = null)
      {
         super(param1,param2,param3);
         this.§_-bP§ = new Sprite();
         this.§_-bP§.graphics.beginFill(0,0);
         this.§_-bP§.graphics.drawRect(0,0,46,48);
         this.§_-bP§.graphics.endFill();
         addChild(this.§_-bP§);
         this.movieLoader.width = this.movieLoader.height = 25;
         this.movieLoader.x = (this.§_-bP§.width - this.movieLoader.width) * 0.5;
         this.movieLoader.y = (this.§_-bP§.height - this.movieLoader.height) * 0.5;
         addChild(this.movieLoader);
      }
      
      override public function get width() : Number
      {
         return this._width > 0 ? this._width : this.§_-bP§.width;
      }
      
      override public function get height() : Number
      {
         return this._height > 0 ? this._height : this.§_-bP§.height;
      }
      
      override protected function §_-R9§(param1:Event) : void
      {
         var _loc3_:Bitmap = null;
         var _loc4_:BitmapData = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.image.numChildren)
         {
            if(this.image.getChildAt(_loc2_) is Bitmap)
            {
               _loc3_ = this.image.getChildAt(_loc2_) as Bitmap;
               if(_loc3_.bitmapData != null)
               {
                  _loc4_ = §_-93C§.§_-id§(_loc3_.bitmapData);
                  this._width = _loc4_.width;
                  this._height = _loc4_.height;
                  if(_loc4_ != _loc3_.bitmapData)
                  {
                     _loc3_.bitmapData.dispose();
                     _loc3_.bitmapData = _loc4_;
                  }
                  _loc3_.smoothing = true;
                  _loc3_.scaleX = _loc3_.scaleY = 1;
                  _loc3_.x = _loc3_.y = 0;
               }
            }
            _loc2_++;
         }
         this.image.width = this._width;
         this.image.height = this._height;
         this.image.x = (this.§_-bP§.width - this.image.width) * 0.5;
         this.image.y = (this.§_-bP§.height - this.image.height) * 0.5;
         this.movieLoader.visible = false;
         if(this.callback != null)
         {
            this.callback();
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

