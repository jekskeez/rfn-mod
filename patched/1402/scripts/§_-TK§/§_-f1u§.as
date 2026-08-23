package §_-TK§
{
   import §_-B37§.§_-Y7§;
   import §_-Mq§.DisplayObjectManager;
   import §_-Mq§.§_-23h§;
   import §_-Mq§.§_-aC§;
   import §_-hd§.§_-01M§;
   import avmplus.getQualifiedClassName;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import starling.display.§_-81s§;
   import starling.display.§_-I2q§;
   import starling.textures.Texture;
   
   public class §_-f1u§ extends §_-aS§
   {
      
      public static const §_-fK§:int = 30;
      
      public var §_-cj§:Array;
      
      public var currentFrame:Number = 0;
      
      public var loop:Boolean = true;
      
      public var isPlaying:Boolean = false;
      
      public var §_-k7§:int = 30;
      
      private var §_-cy§:int = -1;
      
      private var clip:* = null;
      
      private var §_-x16§:Number = 0;
      
      private var §_-Ds§:int = Game.stage.frameRate;
      
      private var §_-yD§:int = 0;
      
      private var §_-02U§:§_-aC§ = §_-aC§.getInstance();
      
      private var §_-61i§:§_-23h§ = §_-23h§.getInstance();
      
      private var §_-8K§:String;
      
      private var §_-B1F§:§_-81s§ = new §_-81s§();
      
      private var §_-5L§:Vector.<§_-Z1n§>;
      
      private var §_-c1J§:Boolean = true;
      
      public function §_-f1u§(param1:* = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.clip = param1;
         this.§_-C4§(param2);
      }
      
      public function reload() : void
      {
         this.stop();
         this.§_-uQ§();
         this.§_-C4§(this.§_-c1J§);
      }
      
      override public function removeFromParent(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.§_-uQ§();
            this.§_-5L§ = null;
         }
         this.stop();
         super.removeFromParent(param1);
      }
      
      public function set §_-i1w§(param1:int) : void
      {
         this.§_-yD§ = param1;
      }
      
      public function get totalFrames() : Number
      {
         return this.§_-5L§ ? this.§_-5L§.length : 0;
      }
      
      public function §_-J25§(param1:*, param2:Boolean = true) : void
      {
         if(param1 is MovieClip)
         {
            param1.stop();
            this.scaleX = param1.scaleX < 0 ? -Math.abs(this.scaleX) : Math.abs(this.scaleX);
            this.scaleY = param1.scaleY < 0 ? -Math.abs(this.scaleY) : Math.abs(this.scaleY);
         }
         this.§_-cj§ = §_-Z1D§.§_-P2V§(param1,param2);
      }
      
      public function set §_-r2X§(param1:int) : void
      {
         this.§_-k7§ = param1 < 0 ? 0 : (param1 > §_-fK§ ? §_-fK§ : param1);
      }
      
      public function get §_-r2X§() : int
      {
         return this.§_-k7§;
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
         §_-p1V§.§_-DO§(this.enterFrame);
         this.isPlaying = false;
         this.§_-o2W§(this.currentFrame);
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         this.currentFrame = param1;
         §_-p1V§.§_-A3z§(this.enterFrame);
         this.isPlaying = true;
      }
      
      public function §_-W2R§(param1:int, param2:int) : void
      {
         if(param2 < 0)
         {
            param2 = 0;
         }
         this.currentFrame = param1;
         this.§_-cy§ = param2;
         §_-p1V§.§_-A3z§(this.enterFrame);
         this.isPlaying = true;
      }
      
      public function enterFrame() : void
      {
         if(!this.totalFrames)
         {
            return;
         }
         this.§_-x16§ += this.§_-r2X§ / this.§_-Ds§;
         if(this.§_-x16§ >= 1)
         {
            --this.§_-x16§;
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
            if(this.§_-yD§ > 0)
            {
               this.currentFrame = this.§_-yD§;
            }
         }
         if(this.§_-cy§ > -1 && this.§_-cy§ == Math.round(this.currentFrame))
         {
            this.stop();
            dispatchEvent(new Event(Event.COMPLETE));
            this.§_-cy§ = -1;
            return;
         }
         this.§_-o2W§(this.currentFrame);
         dispatchEvent(new Event(Event.ENTER_FRAME));
      }
      
      public function hitTest(param1:Point) : Boolean
      {
         return this.§_-cj§ ? (this.§_-cj§[this.currentFrame] as BitmapData).hitTest(new Point(),255,globalToLocal(param1)) : false;
      }
      
      protected function §_-o2W§(param1:Number) : void
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
         if(this.totalFrames > 0 && Boolean(this.§_-B1F§))
         {
            this.§_-B1F§.reset();
            this.§_-B1F§.§_-bQ§(this.§_-5L§[this.currentFrame].item);
         }
      }
      
      private function §_-uQ§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§_-cj§ = [];
         var _loc1_:Vector.<§_-Z1n§> = new Vector.<§_-Z1n§>();
         if(this.§_-5L§)
         {
            _loc2_ = 0;
            _loc3_ = int(this.§_-5L§.length);
            while(_loc2_ < _loc3_)
            {
               if(this.§_-5L§[_loc2_].dispose)
               {
                  _loc1_.push(this.§_-5L§[_loc2_]);
                  DisplayObjectManager.getInstance().remove(this.§_-5L§[_loc2_].item);
                  this.§_-5L§[_loc2_].item.removeFromParent(true);
               }
               _loc2_++;
            }
            _loc2_ = 0;
            _loc3_ = int(_loc1_.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this.§_-5L§.indexOf(_loc1_[_loc2_]);
               if(_loc4_ > -1)
               {
                  this.§_-5L§.splice(this.§_-5L§.indexOf(_loc1_[_loc2_]),1);
               }
               _loc2_++;
            }
         }
         _loc1_ = null;
      }
      
      private function §_-C4§(param1:Boolean = false) : void
      {
         var _loc2_:Texture = §_-Y7§.instance.getTexture(this.clip);
         if(_loc2_ != null)
         {
            this.§_-J2J§(new §_-I2q§(_loc2_));
            this.§_-c1J§ = true;
         }
         else
         {
            this.§_-c1J§ = param1;
            this.§_-p2n§();
         }
         this.§_-J2J§(this.§_-B1F§);
      }
      
      private function §_-p2n§() : void
      {
         var _loc2_:§_-I2q§ = null;
         var _loc3_:Texture = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.§_-8K§ = getQualifiedClassName(this.clip);
         this.§_-5L§ = this.§_-02U§.§_-815§(this.§_-8K§);
         var _loc1_:Vector.<§_-Z1n§> = this.§_-61i§.§_-815§(this.§_-8K§);
         if(!this.§_-5L§.length || !_loc1_.length)
         {
            if(!_loc1_.length || this.§_-5L§.length > _loc1_.length)
            {
               this.§_-5L§ = new Vector.<§_-Z1n§>();
               this.§_-02U§.remove(this.§_-8K§,null);
            }
            this.§_-J25§(this.clip);
            _loc4_ = 0;
            _loc5_ = int(this.§_-cj§.length);
            while(_loc4_ < _loc5_)
            {
               if(_loc1_.length > 0 && _loc4_ < _loc1_.length)
               {
                  _loc2_ = new §_-I2q§(_loc1_[_loc4_].item);
               }
               else
               {
                  _loc3_ = §_-01M§.§_-w1A§(this.§_-cj§[_loc4_]);
                  _loc2_ = new §_-I2q§(_loc3_);
                  this.§_-61i§.add(this.§_-8K§,_loc3_,false,§_-01M§.§_-Y1u§());
               }
               _loc2_.scaleX = _loc2_.scaleY = 1 / §_-01M§.§_-22T§;
               this.§_-02U§.add(this.§_-8K§,_loc2_,this.§_-c1J§);
               _loc4_++;
            }
            this.§_-5L§ = this.§_-02U§.§_-815§(this.§_-8K§);
         }
         if(this.§_-5L§.length > 0)
         {
            this.§_-B1F§.§_-bQ§(this.§_-5L§[0].item);
         }
         this.§_-B1F§.pivotX = -(this.clip as MovieClip).getBounds(this.clip).x;
         this.§_-B1F§.pivotY = -(this.clip as MovieClip).getBounds(this.clip).y;
         this.currentFrame = 0;
      }
   }
}

