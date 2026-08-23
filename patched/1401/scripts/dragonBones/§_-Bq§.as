package dragonBones
{
   import §_-Rz§.§_-p1S§;
   import dragonBones.core.§_-QM§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.DisplayData;
   import flash.geom.Matrix;
   
   use namespace dragonBones_internal;
   
   public class §_-Bq§ extends §_-QM§
   {
      
      dragonBones_internal var §_-S2B§:Vector.<DisplayData>;
      
      dragonBones_internal var §_-F12§:§_-p1S§;
      
      dragonBones_internal var §_-f28§:Number;
      
      dragonBones_internal var §_-sy§:Number;
      
      dragonBones_internal var §_-k1U§:Boolean;
      
      private var §_-o10§:Boolean;
      
      private var §_-oc§:Number;
      
      private var §_-n4§:int;
      
      private var §_-H3§:String;
      
      private var §_-T2a§:Array;
      
      public function §_-Bq§(param1:§_-p1S§)
      {
         super();
         this.§_-F12§ = param1;
         this.§_-T2a§ = [];
         this.§_-n4§ = -1;
         §_-b1v§ = 1;
         this.§_-f28§ = 0;
         this.§_-sy§ = 0;
         this.§_-oc§ = 0;
         this.§_-k1U§ = false;
         this.§_-o10§ = false;
         this.§_-H3§ = "normal";
         if(this.§_-F12§.display)
         {
            this.§_-F12§.§_-f2H§(this.§_-H3§);
         }
      }
      
      public function get zOrder() : Number
      {
         return this.§_-f28§ + this.§_-sy§ + this.§_-oc§;
      }
      
      public function set zOrder(param1:Number) : void
      {
         if(this.zOrder != param1)
         {
            this.§_-oc§ = param1 - this.§_-f28§ - this.§_-sy§;
            if(this.§_-H2x§)
            {
               this.§_-H2x§.§_-E2L§ = true;
            }
         }
      }
      
      public function get blendMode() : String
      {
         return this.§_-H3§;
      }
      
      public function set blendMode(param1:String) : void
      {
         if(this.§_-H3§ != param1)
         {
            this.§_-H3§ = param1;
            if(this.§_-F12§.display)
            {
               this.§_-F12§.§_-f2H§(this.§_-H3§);
            }
         }
      }
      
      public function get display() : Object
      {
         var _loc1_:Object = this.§_-T2a§[this.§_-n4§];
         if(_loc1_ is §_-E1r§)
         {
            return _loc1_.display;
         }
         return _loc1_;
      }
      
      public function set display(param1:Object) : void
      {
         this.§_-T2a§[this.§_-n4§] = param1;
         this.§_-iI§(param1);
      }
      
      public function get childArmature() : §_-E1r§
      {
         if(this.§_-T2a§[this.§_-n4§] is §_-E1r§)
         {
            return this.§_-T2a§[this.§_-n4§] as §_-E1r§;
         }
         return null;
      }
      
      public function set childArmature(param1:§_-E1r§) : void
      {
         this.§_-T2a§[this.§_-n4§] = param1;
         if(param1)
         {
            this.§_-iI§(param1.display);
         }
      }
      
      public function get §_-P2I§() : Array
      {
         return this.§_-T2a§;
      }
      
      public function set §_-P2I§(param1:Array) : void
      {
         var _loc3_:int = 0;
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc2_:* = int(this.§_-T2a§.length = param1.length);
         while(_loc2_--)
         {
            this.§_-T2a§[_loc2_] = param1[_loc2_];
         }
         if(this.§_-n4§ >= 0)
         {
            _loc3_ = this.§_-n4§;
            this.§_-n4§ = -1;
            this.§_-C1J§(_loc3_);
         }
      }
      
      private function §_-iI§(param1:Object) : void
      {
         if(this.§_-F12§.display)
         {
            this.§_-F12§.display = param1;
         }
         else
         {
            this.§_-F12§.display = param1;
            if(this.§_-H2x§)
            {
               this.§_-F12§.§_-83I§(this.§_-H2x§.display);
               this.§_-H2x§.§_-E2L§ = true;
            }
         }
         this.§_-31a§();
         if(!this.§_-o10§ && Boolean(this.§_-F12§.display))
         {
            this.§_-k1U§ = true;
            this.§_-F12§.§_-f2H§(this.§_-H3§);
         }
         else
         {
            this.§_-k1U§ = false;
         }
      }
      
      dragonBones_internal function §_-C1J§(param1:int) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Object = null;
         if(param1 < 0)
         {
            if(!this.§_-o10§)
            {
               this.§_-o10§ = true;
               this.§_-F12§.§_-WF§();
               this.§_-31a§();
            }
         }
         else
         {
            if(this.§_-o10§)
            {
               this.§_-o10§ = false;
               _loc3_ = true;
               if(this.§_-H2x§)
               {
                  this.§_-F12§.§_-83I§(this.§_-H2x§.display);
                  this.§_-H2x§.§_-E2L§ = true;
               }
            }
            _loc2_ = this.§_-T2a§.length;
            if(param1 >= _loc2_ && _loc2_ > 0)
            {
               param1 = _loc2_ - 1;
            }
            if(this.§_-n4§ != param1)
            {
               this.§_-n4§ = param1;
               _loc4_ = this.§_-T2a§[this.§_-n4§];
               if(_loc4_ is §_-E1r§)
               {
                  this.§_-iI§((_loc4_ as §_-E1r§).display);
               }
               else
               {
                  this.§_-iI§(_loc4_);
               }
               if(Boolean(this.§_-S2B§) && this.§_-n4§ <= this.§_-S2B§.length)
               {
                  this.§_-W1I§.copy(this.§_-S2B§[this.§_-n4§].transform);
               }
            }
            else if(_loc3_)
            {
               this.§_-31a§();
            }
         }
         if(!this.§_-o10§ && Boolean(this.§_-F12§.display))
         {
            this.§_-k1U§ = true;
         }
         else
         {
            this.§_-k1U§ = false;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(param1 != this.§_-e6§)
         {
            this.§_-e6§ = param1;
            this.§_-p1E§(this.§_-e6§);
         }
      }
      
      override dragonBones_internal function §_-lE§(param1:§_-E1r§) : void
      {
         super.dragonBones_internal::§_-lE§(param1);
         if(this.§_-H2x§)
         {
            this.§_-H2x§.§_-E2L§ = true;
            this.§_-F12§.§_-83I§(this.§_-H2x§.display);
         }
         else
         {
            this.§_-F12§.§_-WF§();
         }
      }
      
      override public function dispose() : void
      {
         if(!this.§_-F12§)
         {
            return;
         }
         super.dispose();
         this.§_-F12§.dispose();
         this.§_-T2a§.length = 0;
         this.§_-F12§ = null;
         this.§_-T2a§ = null;
         this.§_-S2B§ = null;
      }
      
      override dragonBones_internal function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Matrix = null;
         super.dragonBones_internal::update();
         if(this.§_-k1U§)
         {
            _loc1_ = §_-01r§.§_-t11§.x;
            _loc2_ = §_-01r§.§_-t11§.y;
            if(Boolean(_loc1_) || Boolean(_loc2_))
            {
               _loc3_ = §_-01r§.§_-h1C§;
               this.§_-h1C§.tx += _loc3_.a * _loc1_ + _loc3_.c * _loc2_;
               this.§_-h1C§.ty += _loc3_.b * _loc1_ + _loc3_.d * _loc2_;
            }
            this.§_-F12§.§_-7S§(this.§_-h1C§,this.§_-M2f§);
         }
      }
      
      dragonBones_internal function §_-p1E§(param1:Boolean) : void
      {
         this.§_-F12§.visible = this.§_-01r§.visible && this.§_-e6§ && param1;
      }
      
      private function §_-31a§() : void
      {
         var _loc1_:§_-E1r§ = this.childArmature;
         if(_loc1_)
         {
            if(this.§_-o10§)
            {
               _loc1_.animation.stop();
               _loc1_.animation.§_-A1V§ = null;
            }
            else if(Boolean(this.§_-H2x§) && Boolean(this.§_-H2x§.animation.§_-K2z§) && _loc1_.animation.§_-61D§(this.§_-H2x§.animation.§_-K2z§.name))
            {
               _loc1_.animation.gotoAndPlay(this.§_-H2x§.animation.§_-K2z§.name);
            }
            else
            {
               _loc1_.animation.play();
            }
         }
      }
      
      public function §_-N1d§(param1:Array) : void
      {
         this.§_-P2I§ = param1;
      }
   }
}

