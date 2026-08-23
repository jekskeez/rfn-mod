package §_-bQ§
{
   import §_-42B§.*;
   
   public class §_-lH§
   {
      
      public static const version:Number = 1.64;
      
      protected static var §_-i2N§:Boolean;
      
      public var §_-w2X§:Boolean;
      
      protected var §_-eb§:Boolean;
      
      public var active:Boolean;
      
      protected var §_-lt§:Number;
      
      public var §_-xA§:Boolean;
      
      public var nextNode:§_-lH§;
      
      public var §_-b1T§:Number;
      
      protected var §_-23h§:Number = -1;
      
      public var vars:Object;
      
      public var §_-63E§:Number;
      
      public var data:*;
      
      public var timeline:§_-72V§;
      
      public var §_-B3n§:Boolean;
      
      public var §_-hT§:Number;
      
      public var prevNode:§_-lH§;
      
      public var §_-N18§:Number;
      
      public var gc:Boolean;
      
      public var §_-v2s§:Number;
      
      public var §_-BL§:Boolean;
      
      public var §_-Np§:Boolean;
      
      public var §_-L1l§:Number;
      
      public var §_-n1P§:Number;
      
      public function §_-lH§(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 != null ? param2 : {};
         if(this.vars.isGSVars)
         {
            this.vars = this.vars.vars;
         }
         this.§_-N18§ = this.§_-n1P§ = param1;
         §_-lt§ = this.vars.delay ? Number(this.vars.delay) : 0;
         this.§_-L1l§ = this.vars.timeScale ? Number(this.vars.timeScale) : 1;
         this.active = Boolean(param1 == 0 && §_-lt§ == 0 && this.vars.immediateRender != false);
         this.§_-63E§ = this.§_-b1T§ = 0;
         this.data = this.vars.data;
         if(!§_-i2N§)
         {
            if(!isNaN(§_-y2k§.§_-j1Z§))
            {
               return;
            }
            §_-y2k§.§_-D2F§();
            §_-i2N§ = true;
         }
         var _loc3_:§_-72V§ = this.vars.timeline is §_-72V§ ? this.vars.timeline : (this.vars.useFrames ? §_-y2k§.§_-Q2C§ : §_-y2k§.§_-Q1i§);
         _loc3_.insert(this,_loc3_.§_-63E§);
         if(this.vars.reversed)
         {
            this.§_-xA§ = true;
         }
         if(this.vars.paused)
         {
            this.paused = true;
         }
      }
      
      public function §_-m1b§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
      }
      
      public function get delay() : Number
      {
         return §_-lt§;
      }
      
      public function get duration() : Number
      {
         return this.§_-N18§;
      }
      
      public function set reversed(param1:Boolean) : void
      {
         if(param1 != this.§_-xA§)
         {
            this.§_-xA§ = param1;
            §_-O2A§(this.§_-63E§,true);
         }
      }
      
      public function set §_-f2Z§(param1:Number) : void
      {
         if(this.timeline != null && (param1 != this.§_-hT§ || this.gc))
         {
            this.timeline.insert(this,param1 - §_-lt§);
         }
         else
         {
            this.§_-hT§ = param1;
         }
      }
      
      public function §_-g15§(param1:Boolean = false, param2:Boolean = true) : void
      {
         this.reversed = false;
         this.paused = false;
         this.§_-O2A§(param1 ? -§_-lt§ : 0,param2);
      }
      
      public function set delay(param1:Number) : void
      {
         this.§_-f2Z§ += param1 - §_-lt§;
         §_-lt§ = param1;
      }
      
      public function §_-y2z§() : void
      {
         this.paused = false;
      }
      
      public function get paused() : Boolean
      {
         return this.§_-Np§;
      }
      
      public function play() : void
      {
         this.reversed = false;
         this.paused = false;
      }
      
      public function set duration(param1:Number) : void
      {
         var _loc2_:Number = param1 / this.§_-N18§;
         this.§_-N18§ = this.§_-n1P§ = param1;
         if(this.active && !this.§_-Np§ && param1 != 0)
         {
            this.§_-O2A§(this.§_-63E§ * _loc2_,true);
         }
         §_-g2G§(false);
      }
      
      public function invalidate() : void
      {
      }
      
      public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(!param1)
         {
            §_-m1b§(this.totalDuration,param2,false);
            return;
         }
         if(this.timeline.§_-n1J§)
         {
            this.setEnabled(false,false);
         }
         else
         {
            this.active = false;
         }
         if(!param2)
         {
            if(Boolean(this.vars.onComplete) && Boolean(this.§_-63E§ >= this.§_-n1P§) && !this.§_-xA§)
            {
               this.vars.onComplete.apply(null,this.vars.onCompleteParams);
            }
            else if(this.§_-xA§ && this.§_-63E§ == 0 && Boolean(this.vars.onReverseComplete))
            {
               this.vars.onReverseComplete.apply(null,this.vars.onReverseCompleteParams);
            }
         }
      }
      
      public function get §_-D2C§() : Number
      {
         return this.§_-63E§;
      }
      
      public function get §_-f2Z§() : Number
      {
         return this.§_-hT§;
      }
      
      public function get reversed() : Boolean
      {
         return this.§_-xA§;
      }
      
      public function set currentTime(param1:Number) : void
      {
         §_-O2A§(param1,false);
      }
      
      protected function §_-g2G§(param1:Boolean = true) : void
      {
         var _loc2_:§_-lH§ = param1 ? this : this.timeline;
         while(_loc2_)
         {
            _loc2_.§_-BL§ = true;
            _loc2_ = _loc2_.timeline;
         }
      }
      
      public function reverse(param1:Boolean = true) : void
      {
         this.reversed = true;
         if(param1)
         {
            this.paused = false;
         }
         else if(this.gc)
         {
            this.setEnabled(true,false);
         }
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(param1 != this.§_-Np§ && Boolean(this.timeline))
         {
            if(param1)
            {
               this.§_-v2s§ = this.timeline.§_-b18§;
            }
            else
            {
               this.§_-hT§ += this.timeline.§_-b18§ - this.§_-v2s§;
               this.§_-v2s§ = NaN;
               §_-g2G§(false);
            }
            this.§_-Np§ = param1;
            this.active = Boolean(!this.§_-Np§ && this.§_-63E§ > 0 && this.§_-63E§ < this.§_-n1P§);
         }
         if(!param1 && this.gc)
         {
            this.§_-O2A§(this.§_-63E§,false);
            this.setEnabled(true,false);
         }
      }
      
      public function §_-h2r§() : void
      {
         setEnabled(false,false);
      }
      
      public function set §_-D2C§(param1:Number) : void
      {
         §_-O2A§(param1,false);
      }
      
      public function get currentTime() : Number
      {
         return this.§_-b1T§;
      }
      
      protected function §_-O2A§(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.timeline)
         {
            _loc3_ = this.§_-Np§ ? this.§_-v2s§ : this.timeline.§_-63E§;
            if(this.§_-xA§)
            {
               _loc4_ = this.§_-BL§ ? this.totalDuration : this.§_-n1P§;
               this.§_-hT§ = _loc3_ - (_loc4_ - param1) / this.§_-L1l§;
            }
            else
            {
               this.§_-hT§ = _loc3_ - param1 / this.§_-L1l§;
            }
            if(!this.timeline.§_-BL§)
            {
               §_-g2G§(false);
            }
            if(this.§_-63E§ != param1)
            {
               §_-m1b§(param1,param2,false);
            }
         }
      }
      
      public function §_-z1n§() : void
      {
         this.paused = true;
      }
      
      public function set totalDuration(param1:Number) : void
      {
         this.duration = param1;
      }
      
      public function get totalDuration() : Number
      {
         return this.§_-n1P§;
      }
      
      public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         this.gc = !param1;
         if(param1)
         {
            this.active = Boolean(!this.§_-Np§ && this.§_-63E§ > 0 && this.§_-63E§ < this.§_-n1P§);
            if(!param2 && this.§_-B3n§)
            {
               this.timeline.insert(this,this.§_-hT§ - §_-lt§);
            }
         }
         else
         {
            this.active = false;
            if(!param2 && !this.§_-B3n§)
            {
               this.timeline.remove(this,true);
            }
         }
         return false;
      }
   }
}

