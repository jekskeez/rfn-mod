package utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.PixelSnapping;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-J1f§ extends Bitmap
   {
      
      private static var point:Point = null;
      
      public var §_-cj§:Array = null;
      
      public var currentFrame:int = 0;
      
      public var loop:Boolean = true;
      
      public var speed:Number = 1;
      
      public var isPlaying:Boolean = false;
      
      private var script:Function = null;
      
      private var §_-Eu§:int = -1;
      
      public function §_-J1f§(param1:MovieClip, param2:Boolean = true, param3:Boolean = true, param4:Number = 0, param5:Rectangle = null)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.smoothing = param2;
         this.pixelSnapping = PixelSnapping.ALWAYS;
         param1.stop();
         this.scaleX = param1.scaleX < 0 ? -Math.abs(this.scaleX) : Math.abs(this.scaleX);
         this.scaleY = param1.scaleY < 0 ? -Math.abs(this.scaleY) : Math.abs(this.scaleY);
         if(param1.totalFrames == 1)
         {
            this.currentFrame = 1;
            bitmapData = this.§_-WT§(param1,param4,param2,param3,param5)[0];
         }
         else
         {
            this.§_-cj§ = this.§_-WT§(param1,param4,param2,param3,param5);
         }
         this.gotoAndStop(1);
      }
      
      public static function replace(param1:MovieClip, param2:Boolean = false, param3:Boolean = true, param4:Number = 0) : §_-J1f§
      {
         var _loc10_:DisplayObjectContainer = null;
         var _loc11_:int = 0;
         var _loc5_:Boolean = param1.isPlaying;
         var _loc6_:int = param1.currentFrame;
         var _loc7_:Boolean = param1.visible;
         param1.visible = true;
         var _loc8_:§_-J1f§ = new §_-J1f§(param1,param2,param3,param4);
         if(param1.parent != null)
         {
            _loc10_ = param1.parent as DisplayObjectContainer;
            _loc11_ = _loc10_.getChildIndex(param1);
            _loc10_.removeChild(param1);
            _loc10_.addChildAt(_loc8_,_loc11_);
         }
         var _loc9_:Matrix = new Matrix();
         _loc9_.translate(point.x * param1.scaleX + param1.x,point.y * param1.scaleY + param1.y);
         _loc8_.transform.matrix = _loc9_;
         point = null;
         if(param1.totalFrames == 1)
         {
            _loc8_.stop();
         }
         else if(_loc5_)
         {
            _loc8_.gotoAndPlay(_loc6_);
         }
         else
         {
            _loc8_.gotoAndStop(_loc6_);
         }
         _loc8_.name = param1.name;
         _loc8_.visible = _loc7_;
         param1 = null;
         return _loc8_;
      }
      
      public function remove() : void
      {
         this.stop();
         this.§_-cj§ = null;
      }
      
      public function get totalFrames() : int
      {
         return this.§_-cj§ ? int(this.§_-cj§.length) : 1;
      }
      
      public function play() : void
      {
         if(!this.§_-cj§ || this.isPlaying)
         {
            return;
         }
         this.gotoAndPlay(this.currentFrame);
      }
      
      public function stop() : void
      {
         this.gotoAndStop(this.currentFrame);
      }
      
      public function gotoAndStop(param1:int) : void
      {
         if(!this.§_-cj§)
         {
            return;
         }
         this.currentFrame = param1;
         this.§_-M2A§();
         §_-p1V§.§_-DO§(this.enterFrame);
         this.isPlaying = false;
      }
      
      public function addFrameScript(param1:int, param2:Function) : void
      {
         if(!this.§_-cj§)
         {
            return;
         }
         this.script = param2;
         this.§_-Eu§ = param1;
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         if(!this.§_-cj§)
         {
            return;
         }
         this.currentFrame = param1;
         this.§_-M2A§();
         §_-p1V§.§_-A3z§(this.enterFrame);
         this.isPlaying = true;
      }
      
      public function enterFrame() : void
      {
         if(!this.§_-cj§ || this.visible == false)
         {
            return;
         }
         this.currentFrame += Math.round(this.speed);
         if(this.currentFrame > this.totalFrames)
         {
            if(this.loop)
            {
               this.currentFrame = 1;
            }
            else
            {
               this.currentFrame = this.totalFrames;
               this.stop();
               dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         if(this.§_-Eu§ == this.currentFrame && this.script != null)
         {
            this.script();
         }
         this.§_-o2W§(this.currentFrame);
      }
      
      public function hitTest(param1:Point) : Boolean
      {
         return this.§_-cj§ ? (this.§_-cj§[this.currentFrame - 1] as BitmapData).hitTest(new Point(),255,globalToLocal(param1)) : false;
      }
      
      protected function §_-o2W§(param1:int) : void
      {
         if(param1 > this.totalFrames)
         {
            param1 = this.totalFrames;
         }
         else if(param1 < 1)
         {
            param1 = 1;
         }
         this.currentFrame = param1;
         this.§_-M2A§();
      }
      
      private function §_-WT§(param1:MovieClip, param2:Number, param3:Boolean, param4:Boolean, param5:Rectangle = null) : Array
      {
         var _loc9_:int = 0;
         var _loc10_:Rectangle = null;
         var _loc11_:int = 0;
         var _loc12_:BitmapData = null;
         var _loc13_:MovieClip = null;
         var _loc6_:Rectangle = param5;
         if(param5 == null)
         {
            _loc6_ = param1.getRect(param1);
            _loc9_ = 0;
            while(_loc9_ < param1.totalFrames)
            {
               param1.gotoAndStop(_loc9_ + 1);
               _loc10_ = param1.getRect(param1);
               if(_loc10_.width > _loc6_.width)
               {
                  _loc6_.width = _loc10_.width;
               }
               if(_loc10_.height > _loc6_.height)
               {
                  _loc6_.height = _loc10_.height;
               }
               if(_loc10_.x < _loc6_.x)
               {
                  _loc6_.x = _loc10_.x;
               }
               if(_loc10_.y < _loc6_.y)
               {
                  _loc6_.y = _loc10_.y;
               }
               _loc9_++;
            }
         }
         else
         {
            param1.scrollRect = param5;
         }
         var _loc7_:Array = [];
         var _loc8_:Matrix = new Matrix();
         _loc8_.translate(-_loc6_.x,-_loc6_.y);
         _loc8_.scale(Math.abs(param1.scaleX),Math.abs(param1.scaleY));
         _loc8_.translate(param2,param2);
         point = new Point(_loc6_.x,_loc6_.y);
         _loc9_ = 0;
         while(_loc9_ < param1.totalFrames)
         {
            param1.gotoAndStop(_loc9_ + 1);
            _loc11_ = 0;
            while(_loc11_ < param1.numChildren)
            {
               _loc13_ = param1.getChildAt(_loc11_) as MovieClip;
               if(_loc13_ != null)
               {
                  _loc13_.nextFrame();
                  if(_loc13_.currentFrame == _loc13_.totalFrames)
                  {
                     _loc13_.gotoAndPlay(1);
                  }
               }
               _loc11_++;
            }
            _loc12_ = new BitmapData(_loc6_.width * Math.abs(param1.scaleX) + param2 * 2,_loc6_.height * Math.abs(param1.scaleY) + param2 * 2,param4,0);
            _loc12_.draw(param1,_loc8_,null,null,param5,param3);
            _loc7_.push(_loc12_);
            _loc9_++;
         }
         return _loc7_;
      }
      
      private function §_-M2A§() : void
      {
         if(!this.§_-cj§)
         {
            return;
         }
         bitmapData = this.§_-cj§[this.currentFrame - 1];
      }
   }
}

