package dragonBones
{
   import §_-03j§.§_-02F§;
   import §_-03j§.§_-A1e§;
   import §_-03j§.§_-cV§;
   import §_-03j§.§_-p2B§;
   import §_-N14§.§_-12B§;
   import §_-N14§.§_-G2M§;
   import §_-N14§.§_-N1Q§;
   import §_-N14§.§_-i2C§;
   import dragonBones.core.§_-QM§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.Frame;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   use namespace dragonBones_internal;
   
   public class §_-E1r§ extends EventDispatcher implements §_-N1Q§
   {
      
      private static const §_-ts§:§_-02F§ = §_-02F§.getInstance();
      
      private const §_-02t§:Array = [];
      
      public var name:String;
      
      public var userData:Object;
      
      dragonBones_internal var §_-E2L§:Boolean;
      
      dragonBones_internal var §_-4f§:Vector.<§_-Bq§>;
      
      dragonBones_internal var §_-G1x§:Vector.<§_-TH§>;
      
      dragonBones_internal var §_-A2H§:Vector.<Event>;
      
      protected var §_-x27§:Boolean;
      
      protected var §_-3g§:Object;
      
      protected var §_-o2d§:§_-i2C§;
      
      public function §_-E1r§(param1:Object)
      {
         super(this);
         this.§_-3g§ = param1;
         this.§_-o2d§ = new §_-i2C§(this);
         this.§_-E2L§ = false;
         this.§_-4f§ = new Vector.<§_-Bq§>();
         this.§_-4f§.fixed = true;
         this.§_-G1x§ = new Vector.<§_-TH§>();
         this.§_-G1x§.fixed = true;
         this.§_-A2H§ = new Vector.<Event>();
         this.§_-x27§ = false;
      }
      
      public function get display() : Object
      {
         return this.§_-3g§;
      }
      
      public function get animation() : §_-i2C§
      {
         return this.§_-o2d§;
      }
      
      public function dispose() : void
      {
         var _loc1_:§_-Bq§ = null;
         var _loc2_:§_-TH§ = null;
         if(!this.§_-o2d§)
         {
            return;
         }
         this.userData = null;
         this.§_-o2d§.dispose();
         for each(_loc1_ in this.§_-4f§)
         {
            _loc1_.dispose();
         }
         for each(_loc2_ in this.§_-G1x§)
         {
            _loc2_.dispose();
         }
         this.§_-4f§.fixed = false;
         this.§_-4f§.length = 0;
         this.§_-G1x§.fixed = false;
         this.§_-G1x§.length = 0;
         this.§_-A2H§.length = 0;
         this.§_-o2d§ = null;
         this.§_-4f§ = null;
         this.§_-G1x§ = null;
         this.§_-A2H§ = null;
      }
      
      public function §_-V1S§() : void
      {
         this.§_-x27§ = true;
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§_-Bq§ = null;
         var _loc4_:§_-E1r§ = null;
         var _loc5_:Event = null;
         if(this.§_-o2d§.isPlaying || this.§_-x27§)
         {
            this.§_-x27§ = false;
            this.§_-o2d§.§_-ld§(param1);
            param1 *= this.§_-o2d§.timeScale;
            _loc2_ = int(this.§_-G1x§.length);
            while(_loc2_--)
            {
               this.§_-G1x§[_loc2_].update();
            }
            _loc2_ = int(this.§_-4f§.length);
            while(_loc2_--)
            {
               _loc3_ = this.§_-4f§[_loc2_];
               _loc3_.update();
               if(_loc3_.§_-k1U§)
               {
                  _loc4_ = _loc3_.childArmature;
                  if(_loc4_)
                  {
                     _loc4_.§_-ld§(param1);
                  }
               }
            }
            if(this.§_-E2L§)
            {
               this.§_-82w§();
               if(this.hasEventListener(§_-p2B§.§_-J0§))
               {
                  this.dispatchEvent(new §_-p2B§(§_-p2B§.§_-J0§));
               }
            }
            if(this.§_-A2H§ != null && this.§_-A2H§.length > 0)
            {
               for each(_loc5_ in this.§_-A2H§)
               {
                  this.dispatchEvent(_loc5_);
               }
               if(this.§_-A2H§ != null)
               {
                  this.§_-A2H§.length = 0;
               }
            }
         }
         else
         {
            param1 *= this.§_-o2d§.timeScale;
            _loc2_ = int(this.§_-4f§.length);
            while(_loc2_--)
            {
               _loc3_ = this.§_-4f§[_loc2_];
               if(_loc3_.§_-k1U§)
               {
                  _loc4_ = _loc3_.childArmature;
                  if(_loc4_)
                  {
                     _loc4_.§_-ld§(param1);
                  }
               }
            }
         }
      }
      
      public function §_-81k§(param1:Boolean = true) : Vector.<§_-Bq§>
      {
         return param1 ? this.§_-4f§.concat() : this.§_-4f§;
      }
      
      public function getBones(param1:Boolean = true) : Vector.<§_-TH§>
      {
         return param1 ? this.§_-G1x§.concat() : this.§_-G1x§;
      }
      
      public function §_-Hs§(param1:String) : §_-Bq§
      {
         var _loc2_:* = int(this.§_-4f§.length);
         while(_loc2_--)
         {
            if(this.§_-4f§[_loc2_].name == param1)
            {
               return this.§_-4f§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-AO§(param1:Object) : §_-Bq§
      {
         var _loc2_:* = 0;
         if(param1)
         {
            _loc2_ = int(this.§_-4f§.length);
            while(_loc2_--)
            {
               if(this.§_-4f§[_loc2_].display == param1)
               {
                  return this.§_-4f§[_loc2_];
               }
            }
         }
         return null;
      }
      
      public function §_-z1i§(param1:§_-Bq§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-4f§.indexOf(param1) >= 0)
         {
            param1.parent.removeChild(param1);
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-n17§(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:§_-Bq§ = this.§_-Hs§(param1);
         if(_loc2_)
         {
            this.§_-z1i§(_loc2_);
         }
      }
      
      public function §_-M1s§(param1:String) : §_-TH§
      {
         var _loc2_:* = int(this.§_-G1x§.length);
         while(_loc2_--)
         {
            if(this.§_-G1x§[_loc2_].name == param1)
            {
               return this.§_-G1x§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-O2C§(param1:Object) : §_-TH§
      {
         var _loc2_:§_-Bq§ = this.§_-AO§(param1);
         return _loc2_ ? _loc2_.parent : null;
      }
      
      public function §_-L2S§(param1:§_-TH§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-G1x§.indexOf(param1) >= 0)
         {
            if(param1.parent)
            {
               param1.parent.removeChild(param1);
            }
            else
            {
               param1.§_-lE§(null);
            }
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-z24§(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:§_-TH§ = this.§_-M1s§(param1);
         if(_loc2_)
         {
            this.§_-L2S§(_loc2_);
         }
      }
      
      public function addChild(param1:§_-QM§, param2:String = null) : void
      {
         var _loc3_:§_-TH§ = null;
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(param2)
         {
            _loc3_ = this.§_-M1s§(param2);
            if(!_loc3_)
            {
               throw new ArgumentError();
            }
            _loc3_.addChild(param1);
         }
         else
         {
            if(param1.parent)
            {
               param1.parent.removeChild(param1);
            }
            param1.§_-lE§(this);
         }
      }
      
      public function §_-J1q§(param1:§_-TH§, param2:String = null) : void
      {
         this.addChild(param1,param2);
      }
      
      public function §_-82w§() : void
      {
         var _loc2_:§_-Bq§ = null;
         this.§_-4f§.fixed = false;
         this.§_-4f§.sort(this.§_-t2i§);
         this.§_-4f§.fixed = true;
         var _loc1_:* = int(this.§_-4f§.length);
         while(_loc1_--)
         {
            _loc2_ = this.§_-4f§[_loc1_];
            if(_loc2_.§_-k1U§)
            {
               _loc2_.§_-F12§.§_-83I§(this.display);
            }
         }
         this.§_-E2L§ = false;
      }
      
      dragonBones_internal function §_-tE§(param1:§_-QM§) : void
      {
         var _loc2_:§_-Bq§ = null;
         var _loc3_:§_-TH§ = null;
         if(param1 is §_-Bq§)
         {
            _loc2_ = param1 as §_-Bq§;
            if(this.§_-4f§.indexOf(_loc2_) < 0)
            {
               this.§_-4f§.fixed = false;
               this.§_-4f§[this.§_-4f§.length] = _loc2_;
               this.§_-4f§.fixed = true;
            }
         }
         else if(param1 is §_-TH§)
         {
            _loc3_ = param1 as §_-TH§;
            if(this.§_-G1x§.indexOf(_loc3_) < 0)
            {
               this.§_-G1x§.fixed = false;
               this.§_-G1x§[this.§_-G1x§.length] = _loc3_;
               this.§_-K1i§();
               this.§_-G1x§.fixed = true;
            }
         }
      }
      
      dragonBones_internal function §_-X§(param1:§_-QM§) : void
      {
         var _loc2_:§_-Bq§ = null;
         var _loc3_:int = 0;
         var _loc4_:§_-TH§ = null;
         if(param1 is §_-Bq§)
         {
            _loc2_ = param1 as §_-Bq§;
            _loc3_ = this.§_-4f§.indexOf(_loc2_);
            if(_loc3_ >= 0)
            {
               this.§_-4f§.fixed = false;
               this.§_-4f§.splice(_loc3_,1);
               this.§_-4f§.fixed = true;
            }
         }
         else if(param1 is §_-TH§)
         {
            _loc4_ = param1 as §_-TH§;
            _loc3_ = this.§_-G1x§.indexOf(_loc4_);
            if(_loc3_ >= 0)
            {
               this.§_-G1x§.fixed = false;
               this.§_-G1x§.splice(_loc3_,1);
               this.§_-G1x§.fixed = true;
            }
         }
      }
      
      dragonBones_internal function §_-K1i§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-TH§ = null;
         var _loc4_:§_-TH§ = null;
         var _loc1_:* = int(this.§_-G1x§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         this.§_-02t§.length = 0;
         while(_loc1_--)
         {
            _loc2_ = 0;
            _loc3_ = this.§_-G1x§[_loc1_];
            _loc4_ = _loc3_;
            while(_loc4_)
            {
               _loc2_++;
               _loc4_ = _loc4_.parent;
            }
            this.§_-02t§[_loc1_] = {
               "level":_loc2_,
               "bone":_loc3_
            };
         }
         this.§_-02t§.sortOn("level",Array.NUMERIC | Array.DESCENDING);
         _loc1_ = int(this.§_-02t§.length);
         while(_loc1_--)
         {
            this.§_-G1x§[_loc1_] = this.§_-02t§[_loc1_].bone;
         }
         this.§_-02t§.length = 0;
      }
      
      dragonBones_internal function §_-o2w§(param1:Frame, param2:§_-12B§, param3:§_-G2M§, param4:Boolean) : void
      {
         var _loc5_:§_-cV§ = null;
         var _loc6_:§_-A1e§ = null;
         if(Boolean(param1.event) && this.hasEventListener(§_-cV§.§_-z2G§))
         {
            _loc5_ = new §_-cV§(§_-cV§.§_-z2G§);
            _loc5_.§_-y8§ = param3;
            _loc5_.frameLabel = param1.event;
            this.§_-A2H§.push(_loc5_);
         }
         if(Boolean(param1.sound) && §_-ts§.hasEventListener(§_-A1e§.§_-62Z§))
         {
            _loc6_ = new §_-A1e§(§_-A1e§.§_-62Z§);
            _loc6_.armature = this;
            _loc6_.§_-y8§ = param3;
            _loc6_.sound = param1.sound;
            §_-ts§.dispatchEvent(_loc6_);
         }
         if(param1.action)
         {
            if(param3.isPlaying)
            {
               this.animation.gotoAndPlay(param1.action);
            }
         }
      }
      
      private function §_-t2i§(param1:§_-Bq§, param2:§_-Bq§) : int
      {
         return param1.zOrder < param2.zOrder ? 1 : -1;
      }
   }
}

