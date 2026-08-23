package §_-RI§
{
   import §_-1T§.DisplayObjectManager;
   import §_-1T§.§_-02y§;
   import §_-1T§.§_-s1q§;
   import §_-C1l§.§_-a2§;
   import §_-O24§.§_-l1D§;
   import avmplus.getQualifiedClassName;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import starling.display.§_-jH§;
   import starling.display.§_-t2M§;
   import starling.textures.Texture;
   
   public class §_-d2d§ extends §_-h2I§
   {
      
      public static const §_-C1b§:int = 30;
      
      public var §_-B2v§:Array;
      
      public var currentFrame:Number = 0;
      
      public var loop:Boolean = true;
      
      public var isPlaying:Boolean = false;
      
      public var §_-O1k§:int = 30;
      
      private var §_-MH§:int = -1;
      
      private var clip:* = null;
      
      private var §_-e1s§:Number = 0;
      
      private var §_-A2F§:int = Game.stage.frameRate;
      
      private var §_-01C§:int = 0;
      
      private var §_-C34§:§_-s1q§ = §_-s1q§.getInstance();
      
      private var §_-Pr§:§_-02y§ = §_-02y§.getInstance();
      
      private var §_-MF§:String;
      
      private var §_-N1J§:§_-t2M§ = new §_-t2M§();
      
      private var §_-63G§:Vector.<§_-XK§>;
      
      private var §_-91a§:Boolean = true;
      
      public function §_-d2d§(param1:* = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.clip = param1;
         this.§_-l1n§(param2);
      }
      
      public function reload() : void
      {
         this.stop();
         this.§_-s1O§();
         this.§_-l1n§(this.§_-91a§);
      }
      
      override public function removeFromParent(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.§_-s1O§();
            this.§_-63G§ = null;
         }
         this.stop();
         super.removeFromParent(param1);
      }
      
      public function set §_-h23§(param1:int) : void
      {
         this.§_-01C§ = param1;
      }
      
      public function get totalFrames() : Number
      {
         return this.§_-63G§ ? this.§_-63G§.length : 0;
      }
      
      public function §_-z1w§(param1:*, param2:Boolean = true) : void
      {
         if(param1 is MovieClip)
         {
            param1.stop();
            this.scaleX = param1.scaleX < 0 ? -Math.abs(this.scaleX) : Math.abs(this.scaleX);
            this.scaleY = param1.scaleY < 0 ? -Math.abs(this.scaleY) : Math.abs(this.scaleY);
         }
         this.§_-B2v§ = §_-Ey§.§_-23A§(param1,param2);
      }
      
      public function set §_-o1b§(param1:int) : void
      {
         this.§_-O1k§ = param1 < 0 ? 0 : (param1 > §_-C1b§ ? §_-C1b§ : param1);
      }
      
      public function get §_-o1b§() : int
      {
         return this.§_-O1k§;
      }
      
      override public function play() : void
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
         if(!this.totalFrames)
         {
            return;
         }
         this.currentFrame = param1;
         §_-01Y§.§_-t1s§(this.enterFrame);
         this.isPlaying = false;
         this.§_-Ab§(this.currentFrame);
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         this.currentFrame = param1;
         §_-01Y§.§_-h1R§(this.enterFrame);
         this.isPlaying = true;
      }
      
      public function §_-01w§(param1:int, param2:int) : void
      {
         if(param2 < 0)
         {
            param2 = 0;
         }
         this.currentFrame = param1;
         this.§_-MH§ = param2;
         §_-01Y§.§_-h1R§(this.enterFrame);
         this.isPlaying = true;
      }
      
      public function enterFrame() : void
      {
         if(!this.totalFrames)
         {
            return;
         }
         this.§_-e1s§ += this.§_-o1b§ / this.§_-A2F§;
         if(this.§_-e1s§ >= 1)
         {
            --this.§_-e1s§;
            ++this.currentFrame;
         }
         if(this.currentFrame >= this.totalFrames)
         {
            if(!this.loop)
            {
               this.currentFrame = this.totalFrames - 1;
               this.stop();
               dispatchEvent(new Event(Event.COMPLETE));
               return;
            }
            this.currentFrame -= this.totalFrames;
            if(this.§_-01C§ > 0)
            {
               this.currentFrame = this.§_-01C§;
            }
         }
         if(this.§_-MH§ > -1 && this.§_-MH§ == Math.round(this.currentFrame))
         {
            this.stop();
            dispatchEvent(new Event(Event.COMPLETE));
            this.§_-MH§ = -1;
            return;
         }
         this.§_-Ab§(this.currentFrame);
         dispatchEvent(new Event(Event.ENTER_FRAME));
      }
      
      public function hitTest(param1:Point) : Boolean
      {
         return this.§_-B2v§ ? (this.§_-B2v§[this.currentFrame] as BitmapData).hitTest(new Point(),255,globalToLocal(param1)) : false;
      }
      
      protected function §_-Ab§(param1:Number) : void
      {
         if(param1 >= this.totalFrames)
         {
            param1 = this.totalFrames - 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         this.currentFrame = Math.round(param1);
         if(this.totalFrames > 0 && Boolean(this.§_-N1J§))
         {
            this.§_-N1J§.reset();
            this.§_-N1J§.§_-p1F§(this.§_-63G§[this.currentFrame].item);
         }
      }
      
      private function §_-s1O§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§_-B2v§ = [];
         var _loc1_:Vector.<§_-XK§> = new Vector.<§_-XK§>();
         if(this.§_-63G§)
         {
            _loc2_ = 0;
            _loc3_ = int(this.§_-63G§.length);
            while(_loc2_ < _loc3_)
            {
               if(this.§_-63G§[_loc2_].dispose)
               {
                  _loc1_.push(this.§_-63G§[_loc2_]);
                  DisplayObjectManager.getInstance().remove(this.§_-63G§[_loc2_].item);
                  this.§_-63G§[_loc2_].item.removeFromParent(true);
               }
               _loc2_++;
            }
            _loc2_ = 0;
            _loc3_ = int(_loc1_.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this.§_-63G§.indexOf(_loc1_[_loc2_]);
               if(_loc4_ > -1)
               {
                  this.§_-63G§.splice(this.§_-63G§.indexOf(_loc1_[_loc2_]),1);
               }
               _loc2_++;
            }
         }
         _loc1_ = null;
      }
      
      private function §_-l1n§(param1:Boolean = false) : void
      {
         var _loc2_:Texture = §_-l1D§.instance.getTexture(this.clip);
         if(_loc2_ != null)
         {
            this.§_-83v§(new §_-jH§(_loc2_));
            this.§_-91a§ = true;
         }
         else
         {
            this.§_-91a§ = param1;
            this.§_-a§();
         }
         this.§_-83v§(this.§_-N1J§);
      }
      
      private function §_-a§() : void
      {
         var _loc2_:§_-jH§ = null;
         var _loc3_:Texture = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.§_-MF§ = getQualifiedClassName(this.clip);
         this.§_-63G§ = this.§_-C34§.§_-43X§(this.§_-MF§);
         var _loc1_:Vector.<§_-XK§> = this.§_-Pr§.§_-43X§(this.§_-MF§);
         if(!this.§_-63G§.length || !_loc1_.length)
         {
            if(!_loc1_.length || this.§_-63G§.length > _loc1_.length)
            {
               this.§_-63G§ = new Vector.<§_-XK§>();
               this.§_-C34§.remove(this.§_-MF§,null);
            }
            this.§_-z1w§(this.clip);
            _loc4_ = 0;
            _loc5_ = int(this.§_-B2v§.length);
            while(_loc4_ < _loc5_)
            {
               if(_loc1_.length > 0 && _loc4_ < _loc1_.length)
               {
                  _loc2_ = new §_-jH§(_loc1_[_loc4_].item);
               }
               else
               {
                  _loc3_ = §_-a2§.§_-43Q§(this.§_-B2v§[_loc4_]);
                  _loc2_ = new §_-jH§(_loc3_);
                  this.§_-Pr§.add(this.§_-MF§,_loc3_,false,§_-a2§.§_-73c§());
               }
               _loc2_.scaleX = _loc2_.scaleY = 1 / §_-a2§.§_-v1n§;
               this.§_-C34§.add(this.§_-MF§,_loc2_,this.§_-91a§);
               _loc4_++;
            }
            this.§_-63G§ = this.§_-C34§.§_-43X§(this.§_-MF§);
         }
         if(this.§_-63G§.length > 0)
         {
            this.§_-N1J§.§_-p1F§(this.§_-63G§[0].item);
         }
         this.§_-N1J§.pivotX = -(this.clip as MovieClip).getBounds(this.clip).x;
         this.§_-N1J§.pivotY = -(this.clip as MovieClip).getBounds(this.clip).y;
         this.currentFrame = 0;
      }
   }
}

