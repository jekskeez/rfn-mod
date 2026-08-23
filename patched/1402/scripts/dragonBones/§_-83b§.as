package dragonBones
{
   import §_-Sx§.§_-6r§;
   import §_-Sx§.§_-HF§;
   import §_-Sx§.§_-b2K§;
   import §_-Vu§.§_-b2t§;
   import §_-Vu§.§_-tW§;
   import dragonBones.core.§_-Rq§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.Frame;
   import dragonBones.objects.TransformFrame;
   import flash.geom.Point;
   
   use namespace dragonBones_internal;
   
   public class §_-83b§ extends §_-Rq§
   {
      
      private static const §_-32s§:§_-HF§ = §_-HF§.getInstance();
      
      public var scaleMode:int;
      
      dragonBones_internal var §_-G1§:Point;
      
      private var §_-T1I§:Vector.<§_-Rq§>;
      
      private var §_-I1l§:§_-z2H§;
      
      public var §_-M1A§:String;
      
      public function §_-83b§()
      {
         super();
         this.§_-T1I§ = new Vector.<§_-Rq§>(0,true);
         §_-uN§ = 2;
         this.§_-G1§ = new Point();
         this.scaleMode = 1;
      }
      
      public function get slot() : §_-z2H§
      {
         return this.§_-I1l§;
      }
      
      public function get childArmature() : §_-833§
      {
         return this.§_-I1l§ ? this.§_-I1l§.childArmature : null;
      }
      
      public function get display() : Object
      {
         return this.§_-I1l§ ? this.§_-I1l§.display : null;
      }
      
      public function set display(param1:Object) : void
      {
         if(this.§_-I1l§)
         {
            this.§_-I1l§.display = param1;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§_-Rq§ = null;
         if(this.§_-H17§ != param1)
         {
            this.§_-H17§ = param1;
            _loc2_ = int(this.§_-T1I§.length);
            while(_loc2_--)
            {
               _loc3_ = this.§_-T1I§[_loc2_];
               if(_loc3_ is §_-z2H§)
               {
                  (_loc3_ as §_-z2H§).§_-V2b§(this.§_-H17§);
               }
            }
         }
      }
      
      override dragonBones_internal function §_-M1q§(param1:§_-833§) : void
      {
         super.dragonBones_internal::§_-M1q§(param1);
         var _loc2_:* = int(this.§_-T1I§.length);
         while(_loc2_--)
         {
            this.§_-T1I§[_loc2_].§_-M1q§(this.§_-9Y§);
         }
      }
      
      override public function dispose() : void
      {
         if(!this.§_-T1I§)
         {
            return;
         }
         super.dispose();
         var _loc1_:* = int(this.§_-T1I§.length);
         while(_loc1_--)
         {
            this.§_-T1I§[_loc1_].dispose();
         }
         this.§_-T1I§.fixed = false;
         this.§_-T1I§.length = 0;
         this.§_-T1I§ = null;
         this.§_-I1l§ = null;
         this.§_-G1§ = null;
      }
      
      public function contains(param1:§_-Rq§) : Boolean
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(param1 == this)
         {
            return false;
         }
         var _loc2_:§_-Rq§ = param1;
         while(!(_loc2_ == this || _loc2_ == null))
         {
            _loc2_ = _loc2_.parent;
         }
         return _loc2_ == this;
      }
      
      public function addChild(param1:§_-Rq§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(param1 == this || param1 is §_-83b§ && (param1 as §_-83b§).contains(this))
         {
            throw new ArgumentError("An Bone cannot be added as a child to itself or one of its children (or children\'s children, etc.)");
         }
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
         this.§_-T1I§.fixed = false;
         this.§_-T1I§[this.§_-T1I§.length] = param1;
         this.§_-T1I§.fixed = true;
         param1.§_-31J§(this);
         param1.§_-M1q§(this.§_-9Y§);
         if(!this.§_-I1l§ && param1 is §_-z2H§)
         {
            this.§_-I1l§ = param1 as §_-z2H§;
         }
      }
      
      public function removeChild(param1:§_-Rq§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc2_:int = this.§_-T1I§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-T1I§.fixed = false;
            this.§_-T1I§.splice(_loc2_,1);
            this.§_-T1I§.fixed = true;
            param1.§_-31J§(null);
            param1.§_-M1q§(null);
            if(param1 == this.§_-I1l§)
            {
               this.§_-I1l§ = null;
            }
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-KY§() : Vector.<§_-z2H§>
      {
         var _loc1_:Vector.<§_-z2H§> = new Vector.<§_-z2H§>();
         var _loc2_:* = int(this.§_-T1I§.length);
         while(_loc2_--)
         {
            if(this.§_-T1I§[_loc2_] is §_-z2H§)
            {
               _loc1_.unshift(this.§_-T1I§[_loc2_]);
            }
         }
         return _loc1_;
      }
      
      dragonBones_internal function §_-P1L§(param1:Frame, param2:§_-b2t§, param3:§_-tW§, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:TransformFrame = null;
         var _loc7_:int = 0;
         var _loc8_:§_-b2K§ = null;
         var _loc9_:§_-6r§ = null;
         var _loc10_:§_-Rq§ = null;
         var _loc11_:§_-833§ = null;
         if(param1)
         {
            _loc5_ = param3.§_-XM§(name);
            if(param3.§_-03Y§ && (_loc5_ == 2 || _loc5_ == -1))
            {
               if(!this.§_-M1A§ || this.§_-M1A§ == param3.name)
               {
                  _loc6_ = param1 as TransformFrame;
                  if(this.§_-I1l§)
                  {
                     _loc7_ = _loc6_.displayIndex;
                     if(_loc7_ >= 0)
                     {
                        if(!isNaN(_loc6_.zOrder) && _loc6_.zOrder != this.§_-I1l§.§_-51D§)
                        {
                           this.§_-I1l§.§_-51D§ = _loc6_.zOrder;
                           this.§_-9Y§.§_-uT§ = true;
                        }
                     }
                     this.§_-I1l§.§_-YG§(_loc7_);
                     this.§_-I1l§.§_-V2b§(_loc6_.visible);
                  }
               }
            }
            if(Boolean(param1.event) && this.§_-9Y§.hasEventListener(§_-b2K§.§_-V2T§))
            {
               _loc8_ = new §_-b2K§(§_-b2K§.§_-V2T§);
               _loc8_.bone = this;
               _loc8_.§_-p1j§ = param3;
               _loc8_.frameLabel = param1.event;
               this.§_-9Y§.§_-iv§.push(_loc8_);
            }
            if(Boolean(param1.sound) && §_-32s§.hasEventListener(§_-6r§.§_-XU§))
            {
               _loc9_ = new §_-6r§(§_-6r§.§_-XU§);
               _loc9_.armature = this.§_-9Y§;
               _loc9_.§_-p1j§ = param3;
               _loc9_.sound = param1.sound;
               §_-32s§.dispatchEvent(_loc9_);
            }
            if(param1.action)
            {
               for each(_loc10_ in this.§_-T1I§)
               {
                  if(_loc10_ is §_-z2H§)
                  {
                     _loc11_ = (_loc10_ as §_-z2H§).childArmature;
                     if(_loc11_)
                     {
                        _loc11_.animation.gotoAndPlay(param1.action);
                     }
                  }
               }
            }
         }
         else if(this.§_-I1l§)
         {
            this.§_-I1l§.§_-YG§(-1);
         }
      }
      
      dragonBones_internal function §_-zJ§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Boolean) : void
      {
         if(param9 || dragonBones_internal::§_-fS§)
         {
            this.§_-I1l§.§_-Z2T§.§_-zJ§(param1,param2,param3,param4,param5,param6,param7,param8);
         }
         §_-fS§ = param9;
      }
   }
}

