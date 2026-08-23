package views
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.§_-O1T§;
   
   public class §_-Y1j§ extends §_-Y2D§
   {
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      private var §_-c7§:Sprite;
      
      public function §_-Y1j§(param1:int, param2:Boolean = true, param3:Function = null)
      {
         super(param1,param2,param3);
         this.§_-c7§ = new Sprite();
         this.§_-c7§.graphics.beginFill(0,0);
         this.§_-c7§.graphics.drawRect(0,0,46,48);
         this.§_-c7§.graphics.endFill();
         addChild(this.§_-c7§);
         this.movieLoader.width = this.movieLoader.height = 25;
         this.movieLoader.x = (this.§_-c7§.width - this.movieLoader.width) * 0.5;
         this.movieLoader.y = (this.§_-c7§.height - this.movieLoader.height) * 0.5;
         addChild(this.movieLoader);
      }
      
      override public function get width() : Number
      {
         return this._width > 0 ? this._width : this.§_-c7§.width;
      }
      
      override public function get height() : Number
      {
         return this._height > 0 ? this._height : this.§_-c7§.height;
      }
      
      override protected function §_-03l§(param1:Event) : void
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
                  _loc4_ = §_-O1T§.§_-L2A§(_loc3_.bitmapData);
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
         this.image.x = (this.§_-c7§.width - this.image.width) * 0.5;
         this.image.y = (this.§_-c7§.height - this.image.height) * 0.5;
         this.movieLoader.visible = false;
         if(this.callback != null)
         {
            this.callback();
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

