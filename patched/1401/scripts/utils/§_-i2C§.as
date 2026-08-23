package utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.PixelSnapping;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-i2C§ extends Bitmap
   {
      
      public var §_-B2v§:Array;
      
      public var loop:Boolean = true;
      
      public var speed:Number = 1;
      
      public var isPlaying:Boolean = false;
      
      private var script:Function = null;
      
      private var §_-w1S§:int = -1;
      
      private var clip:* = null;
      
      private var frame:Number = 0;
      
      public function §_-i2C§(param1:* = null)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.smoothing = true;
         this.pixelSnapping = PixelSnapping.ALWAYS;
         this.§_-z1w§(param1);
      }
      
      public function remove() : void
      {
         this.stop();
         this.§_-B2v§ = null;
      }
      
      public function get currentFrame() : int
      {
         return int(this.frame);
      }
      
      public function set currentFrame(param1:int) : void
      {
         this.frame = Number(param1);
      }
      
      public function get totalFrames() : int
      {
         return this.§_-B2v§ ? int(this.§_-B2v§.length) : 0;
      }
      
      public function §_-z1w§(param1:*, param2:Boolean = true, param3:Boolean = false) : void
      {
         this.clip = param1;
         if(param1 is MovieClip)
         {
            param1.stop();
            this.scaleX = param1.scaleX < 0 ? -Math.abs(this.scaleX) : Math.abs(this.scaleX);
            this.scaleY = param1.scaleY < 0 ? -Math.abs(this.scaleY) : Math.abs(this.scaleY);
         }
         this.§_-B2v§ = §_-Ey§.§_-23A§(param1,param2);
         if(param3 && !param2)
         {
            §_-01Y§.§_-h1R§(this.§_-x12§,1);
         }
      }
      
      public function play() : void
      {
         if(this.isPlaying)
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
         if(!this.§_-B2v§)
         {
            return;
         }
         this.currentFrame = param1;
         this.§_-52g§();
         §_-01Y§.§_-t1s§(this.enterFrame);
         this.isPlaying = false;
      }
      
      public function addFrameScript(param1:int, param2:Function) : void
      {
         this.script = param2;
         this.§_-w1S§ = param1;
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         this.currentFrame = param1;
         this.§_-52g§();
         §_-01Y§.§_-h1R§(this.enterFrame);
         this.isPlaying = true;
      }
      
      public function enterFrame() : void
      {
         if(!this.§_-B2v§)
         {
            return;
         }
         this.frame += this.speed;
         if(this.currentFrame >= this.totalFrames)
         {
            if(this.loop)
            {
               this.currentFrame -= this.totalFrames;
            }
            else
            {
               this.currentFrame = this.totalFrames - 1;
               this.stop();
               dispatchEvent(new Event("Complete"));
            }
         }
         if(this.§_-w1S§ == this.currentFrame && this.script != null)
         {
            this.script();
         }
         this.§_-Ab§(this.currentFrame);
      }
      
      public function hitTest(param1:Point) : Boolean
      {
         return this.§_-B2v§ ? (this.§_-B2v§[this.currentFrame] as BitmapData).hitTest(new Point(),255,globalToLocal(param1)) : false;
      }
      
      protected function §_-Ab§(param1:int) : void
      {
         if(param1 >= this.totalFrames)
         {
            param1 = this.totalFrames - 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         this.§_-52g§();
      }
      
      private function §_-x12§() : void
      {
         if(!this.§_-B2v§)
         {
            return;
         }
         if(this.isPlaying)
         {
            §_-01Y§.§_-t1s§(this.§_-x12§);
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.totalFrames)
         {
            if(!this.§_-B2v§[_loc1_])
            {
               §_-Ey§.§_-OZ§(this.clip,_loc1_);
               return;
            }
            _loc1_++;
         }
         if(_loc1_ == this.totalFrames)
         {
            §_-01Y§.§_-t1s§(this.§_-x12§);
         }
      }
      
      private function §_-52g§() : void
      {
         if(this.currentFrame < 0 || this.currentFrame >= this.totalFrames)
         {
            §_-TQ§.add("OUT OF RANGE: Trying to rasterize frame " + this.currentFrame,this.totalFrames,this.clip);
            return;
         }
         if(Boolean(this.§_-B2v§) && this.§_-B2v§[this.currentFrame] == null)
         {
            §_-Ey§.§_-OZ§(this.clip,this.currentFrame);
         }
         if(!this.§_-B2v§)
         {
            return;
         }
         bitmapData = this.§_-B2v§[this.currentFrame];
         this.smoothing = true;
         this.pixelSnapping = PixelSnapping.ALWAYS;
      }
   }
}

