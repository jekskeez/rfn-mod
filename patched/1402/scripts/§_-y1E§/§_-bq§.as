package §_-y1E§
{
   import §_-22D§.*;
   
   public class §_-bq§
   {
      
      public static const version:Number = 1.64;
      
      protected static var §_-832§:Boolean;
      
      public var §_-83Y§:Boolean;
      
      protected var §_-319§:Boolean;
      
      public var active:Boolean;
      
      protected var §_-eZ§:Number;
      
      public var §_-i8§:Boolean;
      
      public var nextNode:§_-bq§;
      
      public var §_-Qt§:Number;
      
      protected var §_-B2a§:Number = -1;
      
      public var vars:Object;
      
      public var §_-I10§:Number;
      
      public var data:*;
      
      public var timeline:§_-61U§;
      
      public var §_-23G§:Boolean;
      
      public var §_-T18§:Number;
      
      public var prevNode:§_-bq§;
      
      public var §_-N1S§:Number;
      
      public var gc:Boolean;
      
      public var §_-YV§:Number;
      
      public var §_-hz§:Boolean;
      
      public var §_-bY§:Boolean;
      
      public var §_-936§:Number;
      
      public var §_-13H§:Number;
      
      public function §_-bq§(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 != null ? param2 : {};
         if(this.vars.isGSVars)
         {
            this.vars = this.vars.vars;
         }
         this.§_-N1S§ = this.§_-13H§ = param1;
         §_-eZ§ = this.vars.delay ? Number(this.vars.delay) : 0;
         this.§_-936§ = this.vars.timeScale ? Number(this.vars.timeScale) : 1;
         this.active = Boolean(param1 == 0 && §_-eZ§ == 0 && this.vars.immediateRender != false);
         this.§_-I10§ = this.§_-Qt§ = 0;
         this.data = this.vars.data;
         if(!§_-832§)
         {
            if(!isNaN(§_-C2E§.§_-qw§))
            {
               return;
            }
            §_-C2E§.§_-Dl§();
            §_-832§ = true;
         }
         var _loc3_:§_-61U§ = this.vars.timeline is §_-61U§ ? this.vars.timeline : (this.vars.useFrames ? §_-C2E§.§_-D1E§ : §_-C2E§.§_-32n§);
         _loc3_.insert(this,_loc3_.§_-I10§);
         if(this.vars.reversed)
         {
            this.§_-i8§ = true;
         }
         if(this.vars.paused)
         {
            this.paused = true;
         }
      }
      
      public function §_-a2G§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
      }
      
      public function get delay() : Number
      {
         return §_-eZ§;
      }
      
      public function get duration() : Number
      {
         return this.§_-N1S§;
      }
      
      public function set reversed(param1:Boolean) : void
      {
         if(param1 != this.§_-i8§)
         {
            this.§_-i8§ = param1;
            §_-JI§(this.§_-I10§,true);
         }
      }
      
      public function set §_-k1H§(param1:Number) : void
      {
         if(this.timeline != null && (param1 != this.§_-T18§ || this.gc))
         {
            this.timeline.insert(this,param1 - §_-eZ§);
         }
         else
         {
            this.§_-T18§ = param1;
         }
      }
      
      public function §_-k1i§(param1:Boolean = false, param2:Boolean = true) : void
      {
         this.reversed = false;
         this.paused = false;
         this.§_-JI§(param1 ? -§_-eZ§ : 0,param2);
      }
      
      public function set delay(param1:Number) : void
      {
         this.§_-k1H§ += param1 - §_-eZ§;
         §_-eZ§ = param1;
      }
      
      public function §_-9S§() : void
      {
         this.paused = false;
      }
      
      public function get paused() : Boolean
      {
         return this.§_-bY§;
      }
      
      public function play() : void
      {
         this.reversed = false;
         this.paused = false;
      }
      
      public function set duration(param1:Number) : void
      {
         var _loc2_:Number = param1 / this.§_-N1S§;
         this.§_-N1S§ = this.§_-13H§ = param1;
         if(this.active && !this.§_-bY§ && param1 != 0)
         {
            this.§_-JI§(this.§_-I10§ * _loc2_,true);
         }
         §_-VN§(false);
      }
      
      public function invalidate() : void
      {
      }
      
      public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(!param1)
         {
            §_-a2G§(this.totalDuration,param2,false);
            return;
         }
         if(this.timeline.§_-63r§)
         {
            this.setEnabled(false,false);
         }
         else
         {
            this.active = false;
         }
         if(!param2)
         {
            if(Boolean(this.vars.onComplete) && Boolean(this.§_-I10§ >= this.§_-13H§) && !this.§_-i8§)
            {
               this.vars.onComplete.apply(null,this.vars.onCompleteParams);
            }
            else if(this.§_-i8§ && this.§_-I10§ == 0 && Boolean(this.vars.onReverseComplete))
            {
               this.vars.onReverseComplete.apply(null,this.vars.onReverseCompleteParams);
            }
         }
      }
      
      public function get §_-R1Z§() : Number
      {
         return this.§_-I10§;
      }
      
      public function get §_-k1H§() : Number
      {
         return this.§_-T18§;
      }
      
      public function get reversed() : Boolean
      {
         return this.§_-i8§;
      }
      
      public function set currentTime(param1:Number) : void
      {
         §_-JI§(param1,false);
      }
      
      protected function §_-VN§(param1:Boolean = true) : void
      {
         var _loc2_:§_-bq§ = param1 ? this : this.timeline;
         while(_loc2_)
         {
            _loc2_.§_-hz§ = true;
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
         if(param1 != this.§_-bY§ && Boolean(this.timeline))
         {
            if(param1)
            {
               this.§_-YV§ = this.timeline.§_-Je§;
            }
            else
            {
               this.§_-T18§ += this.timeline.§_-Je§ - this.§_-YV§;
               this.§_-YV§ = NaN;
               §_-VN§(false);
            }
            this.§_-bY§ = param1;
            this.active = Boolean(!this.§_-bY§ && this.§_-I10§ > 0 && this.§_-I10§ < this.§_-13H§);
         }
         if(!param1 && this.gc)
         {
            this.§_-JI§(this.§_-I10§,false);
            this.setEnabled(true,false);
         }
      }
      
      public function §_-kl§() : void
      {
         setEnabled(false,false);
      }
      
      public function set §_-R1Z§(param1:Number) : void
      {
         §_-JI§(param1,false);
      }
      
      public function get currentTime() : Number
      {
         return this.§_-Qt§;
      }
      
      protected function §_-JI§(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.timeline)
         {
            _loc3_ = this.§_-bY§ ? this.§_-YV§ : this.timeline.§_-I10§;
            if(this.§_-i8§)
            {
               _loc4_ = this.§_-hz§ ? this.totalDuration : this.§_-13H§;
               this.§_-T18§ = _loc3_ - (_loc4_ - param1) / this.§_-936§;
            }
            else
            {
               this.§_-T18§ = _loc3_ - param1 / this.§_-936§;
            }
            if(!this.timeline.§_-hz§)
            {
               §_-VN§(false);
            }
            if(this.§_-I10§ != param1)
            {
               §_-a2G§(param1,param2,false);
            }
         }
      }
      
      public function §_-Hb§() : void
      {
         this.paused = true;
      }
      
      public function set totalDuration(param1:Number) : void
      {
         this.duration = param1;
      }
      
      public function get totalDuration() : Number
      {
         return this.§_-13H§;
      }
      
      public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         this.gc = !param1;
         if(param1)
         {
            this.active = Boolean(!this.§_-bY§ && this.§_-I10§ > 0 && this.§_-I10§ < this.§_-13H§);
            if(!param2 && this.§_-23G§)
            {
               this.timeline.insert(this,this.§_-T18§ - §_-eZ§);
            }
         }
         else
         {
            this.active = false;
            if(!param2 && !this.§_-23G§)
            {
               this.timeline.remove(this,true);
            }
         }
         return false;
      }
   }
}

