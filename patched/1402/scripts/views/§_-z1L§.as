package views
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import utils.§_-O1T§;
   
   public class §_-z1L§ extends §_-332§
   {
      
      private var callback:Function;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      public function §_-z1L§(param1:int, param2:Boolean = true, param3:Function = null)
      {
         super(param1,param2);
         this.callback = param3;
         this.movieLoader.x = this.movieLoader.y = 0;
         this.movieLoader.width = this.movieLoader.height = 25;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
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
         this.movieLoader.visible = false;
         if(this.callback != null)
         {
            this.callback();
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

