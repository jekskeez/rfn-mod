package dragonBones
{
   import §_-Sx§.§_-6r§;
   import §_-Sx§.§_-GE§;
   import §_-Sx§.§_-HF§;
   import §_-Sx§.§_-b2K§;
   import §_-Vu§.§_-93Y§;
   import §_-Vu§.§_-b2t§;
   import §_-Vu§.§_-h25§;
   import §_-Vu§.§_-tW§;
   import dragonBones.core.§_-Rq§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.Frame;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   use namespace dragonBones_internal;
   
   public class §_-833§ extends EventDispatcher implements §_-93Y§
   {
      
      private static const §_-32s§:§_-HF§ = §_-HF§.getInstance();
      
      private const §_-x1p§:Array = [];
      
      public var name:String;
      
      public var userData:Object;
      
      dragonBones_internal var §_-uT§:Boolean;
      
      dragonBones_internal var §_-j1h§:Vector.<§_-z2H§>;
      
      dragonBones_internal var §_-d1d§:Vector.<§_-83b§>;
      
      dragonBones_internal var §_-iv§:Vector.<Event>;
      
      protected var §_-Ga§:Boolean;
      
      protected var §_-U0§:Object;
      
      protected var §_-31e§:§_-h25§;
      
      public function §_-833§(param1:Object)
      {
         super(this);
         this.§_-U0§ = param1;
         this.§_-31e§ = new §_-h25§(this);
         this.§_-uT§ = false;
         this.§_-j1h§ = new Vector.<§_-z2H§>();
         this.§_-j1h§.fixed = true;
         this.§_-d1d§ = new Vector.<§_-83b§>();
         this.§_-d1d§.fixed = true;
         this.§_-iv§ = new Vector.<Event>();
         this.§_-Ga§ = false;
      }
      
      public function get display() : Object
      {
         return this.§_-U0§;
      }
      
      public function get animation() : §_-h25§
      {
         return this.§_-31e§;
      }
      
      public function dispose() : void
      {
         var _loc1_:§_-z2H§ = null;
         var _loc2_:§_-83b§ = null;
         if(!this.§_-31e§)
         {
            return;
         }
         this.userData = null;
         this.§_-31e§.dispose();
         for each(_loc1_ in this.§_-j1h§)
         {
            _loc1_.dispose();
         }
         for each(_loc2_ in this.§_-d1d§)
         {
            _loc2_.dispose();
         }
         this.§_-j1h§.fixed = false;
         this.§_-j1h§.length = 0;
         this.§_-d1d§.fixed = false;
         this.§_-d1d§.length = 0;
         this.§_-iv§.length = 0;
         this.§_-31e§ = null;
         this.§_-j1h§ = null;
         this.§_-d1d§ = null;
         this.§_-iv§ = null;
      }
      
      public function §_-j2c§() : void
      {
         this.§_-Ga§ = true;
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§_-z2H§ = null;
         var _loc4_:§_-833§ = null;
         var _loc5_:Event = null;
         if(this.§_-31e§.isPlaying || this.§_-Ga§)
         {
            this.§_-Ga§ = false;
            this.§_-31e§.§_-a1Q§(param1);
            param1 *= this.§_-31e§.timeScale;
            _loc2_ = int(this.§_-d1d§.length);
            while(_loc2_--)
            {
               this.§_-d1d§[_loc2_].update();
            }
            _loc2_ = int(this.§_-j1h§.length);
            while(_loc2_--)
            {
               _loc3_ = this.§_-j1h§[_loc2_];
               _loc3_.update();
               if(_loc3_.§_-Et§)
               {
                  _loc4_ = _loc3_.childArmature;
                  if(_loc4_)
                  {
                     _loc4_.§_-a1Q§(param1);
                  }
               }
            }
            if(this.§_-uT§)
            {
               this.§_-H2k§();
               if(this.hasEventListener(§_-GE§.§_-f2p§))
               {
                  this.dispatchEvent(new §_-GE§(§_-GE§.§_-f2p§));
               }
            }
            if(this.§_-iv§ != null && this.§_-iv§.length > 0)
            {
               for each(_loc5_ in this.§_-iv§)
               {
                  this.dispatchEvent(_loc5_);
               }
               if(this.§_-iv§ != null)
               {
                  this.§_-iv§.length = 0;
               }
            }
         }
         else
         {
            param1 *= this.§_-31e§.timeScale;
            _loc2_ = int(this.§_-j1h§.length);
            while(_loc2_--)
            {
               _loc3_ = this.§_-j1h§[_loc2_];
               if(_loc3_.§_-Et§)
               {
                  _loc4_ = _loc3_.childArmature;
                  if(_loc4_)
                  {
                     _loc4_.§_-a1Q§(param1);
                  }
               }
            }
         }
      }
      
      public function §_-KY§(param1:Boolean = true) : Vector.<§_-z2H§>
      {
         return param1 ? this.§_-j1h§.concat() : this.§_-j1h§;
      }
      
      public function getBones(param1:Boolean = true) : Vector.<§_-83b§>
      {
         return param1 ? this.§_-d1d§.concat() : this.§_-d1d§;
      }
      
      public function §_-d2O§(param1:String) : §_-z2H§
      {
         var _loc2_:* = int(this.§_-j1h§.length);
         while(_loc2_--)
         {
            if(this.§_-j1h§[_loc2_].name == param1)
            {
               return this.§_-j1h§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-ND§(param1:Object) : §_-z2H§
      {
         var _loc2_:* = 0;
         if(param1)
         {
            _loc2_ = int(this.§_-j1h§.length);
            while(_loc2_--)
            {
               if(this.§_-j1h§[_loc2_].display == param1)
               {
                  return this.§_-j1h§[_loc2_];
               }
            }
         }
         return null;
      }
      
      public function §_-t1g§(param1:§_-z2H§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-j1h§.indexOf(param1) >= 0)
         {
            param1.parent.removeChild(param1);
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-5v§(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:§_-z2H§ = this.§_-d2O§(param1);
         if(_loc2_)
         {
            this.§_-t1g§(_loc2_);
         }
      }
      
      public function §_-i2v§(param1:String) : §_-83b§
      {
         var _loc2_:* = int(this.§_-d1d§.length);
         while(_loc2_--)
         {
            if(this.§_-d1d§[_loc2_].name == param1)
            {
               return this.§_-d1d§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-z1F§(param1:Object) : §_-83b§
      {
         var _loc2_:§_-z2H§ = this.§_-ND§(param1);
         return _loc2_ ? _loc2_.parent : null;
      }
      
      public function §_-O2S§(param1:§_-83b§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-d1d§.indexOf(param1) >= 0)
         {
            if(param1.parent)
            {
               param1.parent.removeChild(param1);
            }
            else
            {
               param1.§_-M1q§(null);
            }
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-qH§(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:§_-83b§ = this.§_-i2v§(param1);
         if(_loc2_)
         {
            this.§_-O2S§(_loc2_);
         }
      }
      
      public function addChild(param1:§_-Rq§, param2:String = null) : void
      {
         var _loc3_:§_-83b§ = null;
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(param2)
         {
            _loc3_ = this.§_-i2v§(param2);
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
            param1.§_-M1q§(this);
         }
      }
      
      public function §_-i21§(param1:§_-83b§, param2:String = null) : void
      {
         this.addChild(param1,param2);
      }
      
      public function §_-H2k§() : void
      {
         var _loc2_:§_-z2H§ = null;
         this.§_-j1h§.fixed = false;
         this.§_-j1h§.sort(this.§_-P1i§);
         this.§_-j1h§.fixed = true;
         var _loc1_:* = int(this.§_-j1h§.length);
         while(_loc1_--)
         {
            _loc2_ = this.§_-j1h§[_loc1_];
            if(_loc2_.§_-Et§)
            {
               _loc2_.§_-Z2T§.§_-A3B§(this.display);
            }
         }
         this.§_-uT§ = false;
      }
      
      dragonBones_internal function §_-51R§(param1:§_-Rq§) : void
      {
         var _loc2_:§_-z2H§ = null;
         var _loc3_:§_-83b§ = null;
         if(param1 is §_-z2H§)
         {
            _loc2_ = param1 as §_-z2H§;
            if(this.§_-j1h§.indexOf(_loc2_) < 0)
            {
               this.§_-j1h§.fixed = false;
               this.§_-j1h§[this.§_-j1h§.length] = _loc2_;
               this.§_-j1h§.fixed = true;
            }
         }
         else if(param1 is §_-83b§)
         {
            _loc3_ = param1 as §_-83b§;
            if(this.§_-d1d§.indexOf(_loc3_) < 0)
            {
               this.§_-d1d§.fixed = false;
               this.§_-d1d§[this.§_-d1d§.length] = _loc3_;
               this.§_-Q4§();
               this.§_-d1d§.fixed = true;
            }
         }
      }
      
      dragonBones_internal function §_-jT§(param1:§_-Rq§) : void
      {
         var _loc2_:§_-z2H§ = null;
         var _loc3_:int = 0;
         var _loc4_:§_-83b§ = null;
         if(param1 is §_-z2H§)
         {
            _loc2_ = param1 as §_-z2H§;
            _loc3_ = this.§_-j1h§.indexOf(_loc2_);
            if(_loc3_ >= 0)
            {
               this.§_-j1h§.fixed = false;
               this.§_-j1h§.splice(_loc3_,1);
               this.§_-j1h§.fixed = true;
            }
         }
         else if(param1 is §_-83b§)
         {
            _loc4_ = param1 as §_-83b§;
            _loc3_ = this.§_-d1d§.indexOf(_loc4_);
            if(_loc3_ >= 0)
            {
               this.§_-d1d§.fixed = false;
               this.§_-d1d§.splice(_loc3_,1);
               this.§_-d1d§.fixed = true;
            }
         }
      }
      
      dragonBones_internal function §_-Q4§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-83b§ = null;
         var _loc4_:§_-83b§ = null;
         var _loc1_:* = int(this.§_-d1d§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         this.§_-x1p§.length = 0;
         while(_loc1_--)
         {
            _loc2_ = 0;
            _loc3_ = this.§_-d1d§[_loc1_];
            _loc4_ = _loc3_;
            while(_loc4_)
            {
               _loc2_++;
               _loc4_ = _loc4_.parent;
            }
            this.§_-x1p§[_loc1_] = {
               "level":_loc2_,
               "bone":_loc3_
            };
         }
         this.§_-x1p§.sortOn("level",Array.NUMERIC | Array.DESCENDING);
         _loc1_ = int(this.§_-x1p§.length);
         while(_loc1_--)
         {
            this.§_-d1d§[_loc1_] = this.§_-x1p§[_loc1_].bone;
         }
         this.§_-x1p§.length = 0;
      }
      
      dragonBones_internal function §_-P1L§(param1:Frame, param2:§_-b2t§, param3:§_-tW§, param4:Boolean) : void
      {
         var _loc5_:§_-b2K§ = null;
         var _loc6_:§_-6r§ = null;
         if(Boolean(param1.event) && this.hasEventListener(§_-b2K§.§_-x2q§))
         {
            _loc5_ = new §_-b2K§(§_-b2K§.§_-x2q§);
            _loc5_.§_-p1j§ = param3;
            _loc5_.frameLabel = param1.event;
            this.§_-iv§.push(_loc5_);
         }
         if(Boolean(param1.sound) && §_-32s§.hasEventListener(§_-6r§.§_-XU§))
         {
            _loc6_ = new §_-6r§(§_-6r§.§_-XU§);
            _loc6_.armature = this;
            _loc6_.§_-p1j§ = param3;
            _loc6_.sound = param1.sound;
            §_-32s§.dispatchEvent(_loc6_);
         }
         if(param1.action)
         {
            if(param3.isPlaying)
            {
               this.animation.gotoAndPlay(param1.action);
            }
         }
      }
      
      private function §_-P1i§(param1:§_-z2H§, param2:§_-z2H§) : int
      {
         return param1.zOrder < param2.zOrder ? 1 : -1;
      }
   }
}

