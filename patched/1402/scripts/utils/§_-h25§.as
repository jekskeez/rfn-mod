package utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.PixelSnapping;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-h25§ extends Bitmap
   {
      
      public var §_-cj§:Array;
      
      public var loop:Boolean = true;
      
      public var speed:Number = 1;
      
      public var isPlaying:Boolean = false;
      
      private var script:Function = null;
      
      private var §_-Eu§:int = -1;
      
      private var clip:* = null;
      
      private var frame:Number = 0;
      
      public function §_-h25§(param1:* = null)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.smoothing = true;
         this.pixelSnapping = PixelSnapping.ALWAYS;
         this.§_-J25§(param1);
      }
      
      public function remove() : void
      {
         this.stop();
         this.§_-cj§ = null;
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
         return this.§_-cj§ ? int(this.§_-cj§.length) : 0;
      }
      
      public function §_-J25§(param1:*, param2:Boolean = true, param3:Boolean = false) : void
      {
         this.clip = param1;
         if(param1 is MovieClip)
         {
            param1.stop();
            this.scaleX = param1.scaleX < 0 ? -Math.abs(this.scaleX) : Math.abs(this.scaleX);
            this.scaleY = param1.scaleY < 0 ? -Math.abs(this.scaleY) : Math.abs(this.scaleY);
         }
         this.§_-cj§ = §_-Z1D§.§_-P2V§(param1,param2);
         if(param3 && !param2)
         {
            §_-p1V§.§_-A3z§(this.§_-VT§,1);
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
         this.script = param2;
         this.§_-Eu§ = param1;
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         this.currentFrame = param1;
         this.§_-M2A§();
         §_-p1V§.§_-A3z§(this.enterFrame);
         this.isPlaying = true;
      }
      
      public function enterFrame() : void
      {
         if(!this.§_-cj§)
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
         if(this.§_-Eu§ == this.currentFrame && this.script != null)
         {
            this.script();
         }
         this.§_-o2W§(this.currentFrame);
      }
      
      public function hitTest(param1:Point) : Boolean
      {
         return this.§_-cj§ ? (this.§_-cj§[this.currentFrame] as BitmapData).hitTest(new Point(),255,globalToLocal(param1)) : false;
      }
      
      protected function §_-o2W§(param1:int) : void
      {
         if(param1 >= this.totalFrames)
         {
            param1 = this.totalFrames - 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         this.§_-M2A§();
      }
      
      private function §_-VT§() : void
      {
         if(!this.§_-cj§)
         {
            return;
         }
         if(this.isPlaying)
         {
            §_-p1V§.§_-DO§(this.§_-VT§);
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.totalFrames)
         {
            if(!this.§_-cj§[_loc1_])
            {
               §_-Z1D§.§_-13w§(this.clip,_loc1_);
               return;
            }
            _loc1_++;
         }
         if(_loc1_ == this.totalFrames)
         {
            §_-p1V§.§_-DO§(this.§_-VT§);
         }
      }
      
      private function §_-M2A§() : void
      {
         if(this.currentFrame < 0 || this.currentFrame >= this.totalFrames)
         {
            §_-p2U§.add("OUT OF RANGE: Trying to rasterize frame " + this.currentFrame,this.totalFrames,this.clip);
            return;
         }
         if(Boolean(this.§_-cj§) && this.§_-cj§[this.currentFrame] == null)
         {
            §_-Z1D§.§_-13w§(this.clip,this.currentFrame);
         }
         if(!this.§_-cj§)
         {
            return;
         }
         bitmapData = this.§_-cj§[this.currentFrame];
         this.smoothing = true;
         this.pixelSnapping = PixelSnapping.ALWAYS;
      }
   }
}

