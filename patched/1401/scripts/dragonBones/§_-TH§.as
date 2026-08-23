package dragonBones
{
   import §_-03j§.§_-02F§;
   import §_-03j§.§_-A1e§;
   import §_-03j§.§_-cV§;
   import §_-N14§.§_-12B§;
   import §_-N14§.§_-G2M§;
   import dragonBones.core.§_-QM§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.Frame;
   import dragonBones.objects.TransformFrame;
   import flash.geom.Point;
   
   use namespace dragonBones_internal;
   
   public class §_-TH§ extends §_-QM§
   {
      
      private static const §_-ts§:§_-02F§ = §_-02F§.getInstance();
      
      public var scaleMode:int;
      
      dragonBones_internal var §_-t11§:Point;
      
      private var §_-P2d§:Vector.<§_-QM§>;
      
      private var §_-3B§:§_-Bq§;
      
      public var §_-r2q§:String;
      
      public function §_-TH§()
      {
         super();
         this.§_-P2d§ = new Vector.<§_-QM§>(0,true);
         §_-b1v§ = 2;
         this.§_-t11§ = new Point();
         this.scaleMode = 1;
      }
      
      public function get slot() : §_-Bq§
      {
         return this.§_-3B§;
      }
      
      public function get childArmature() : §_-E1r§
      {
         return this.§_-3B§ ? this.§_-3B§.childArmature : null;
      }
      
      public function get display() : Object
      {
         return this.§_-3B§ ? this.§_-3B§.display : null;
      }
      
      public function set display(param1:Object) : void
      {
         if(this.§_-3B§)
         {
            this.§_-3B§.display = param1;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§_-QM§ = null;
         if(this.§_-e6§ != param1)
         {
            this.§_-e6§ = param1;
            _loc2_ = int(this.§_-P2d§.length);
            while(_loc2_--)
            {
               _loc3_ = this.§_-P2d§[_loc2_];
               if(_loc3_ is §_-Bq§)
               {
                  (_loc3_ as §_-Bq§).§_-p1E§(this.§_-e6§);
               }
            }
         }
      }
      
      override dragonBones_internal function §_-lE§(param1:§_-E1r§) : void
      {
         super.dragonBones_internal::§_-lE§(param1);
         var _loc2_:* = int(this.§_-P2d§.length);
         while(_loc2_--)
         {
            this.§_-P2d§[_loc2_].§_-lE§(this.§_-H2x§);
         }
      }
      
      override public function dispose() : void
      {
         if(!this.§_-P2d§)
         {
            return;
         }
         super.dispose();
         var _loc1_:* = int(this.§_-P2d§.length);
         while(_loc1_--)
         {
            this.§_-P2d§[_loc1_].dispose();
         }
         this.§_-P2d§.fixed = false;
         this.§_-P2d§.length = 0;
         this.§_-P2d§ = null;
         this.§_-3B§ = null;
         this.§_-t11§ = null;
      }
      
      public function contains(param1:§_-QM§) : Boolean
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(param1 == this)
         {
            return false;
         }
         var _loc2_:§_-QM§ = param1;
         while(!(_loc2_ == this || _loc2_ == null))
         {
            _loc2_ = _loc2_.parent;
         }
         return _loc2_ == this;
      }
      
      public function addChild(param1:§_-QM§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(param1 == this || param1 is §_-TH§ && (param1 as §_-TH§).contains(this))
         {
            throw new ArgumentError("An Bone cannot be added as a child to itself or one of its children (or children\'s children, etc.)");
         }
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
         this.§_-P2d§.fixed = false;
         this.§_-P2d§[this.§_-P2d§.length] = param1;
         this.§_-P2d§.fixed = true;
         param1.§_-71V§(this);
         param1.§_-lE§(this.§_-H2x§);
         if(!this.§_-3B§ && param1 is §_-Bq§)
         {
            this.§_-3B§ = param1 as §_-Bq§;
         }
      }
      
      public function removeChild(param1:§_-QM§) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc2_:int = this.§_-P2d§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-P2d§.fixed = false;
            this.§_-P2d§.splice(_loc2_,1);
            this.§_-P2d§.fixed = true;
            param1.§_-71V§(null);
            param1.§_-lE§(null);
            if(param1 == this.§_-3B§)
            {
               this.§_-3B§ = null;
            }
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-81k§() : Vector.<§_-Bq§>
      {
         var _loc1_:Vector.<§_-Bq§> = new Vector.<§_-Bq§>();
         var _loc2_:* = int(this.§_-P2d§.length);
         while(_loc2_--)
         {
            if(this.§_-P2d§[_loc2_] is §_-Bq§)
            {
               _loc1_.unshift(this.§_-P2d§[_loc2_]);
            }
         }
         return _loc1_;
      }
      
      dragonBones_internal function §_-o2w§(param1:Frame, param2:§_-12B§, param3:§_-G2M§, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:TransformFrame = null;
         var _loc7_:int = 0;
         var _loc8_:§_-cV§ = null;
         var _loc9_:§_-A1e§ = null;
         var _loc10_:§_-QM§ = null;
         var _loc11_:§_-E1r§ = null;
         if(param1)
         {
            _loc5_ = param3.§_-Ub§(name);
            if(param3.§_-t2T§ && (_loc5_ == 2 || _loc5_ == -1))
            {
               if(!this.§_-r2q§ || this.§_-r2q§ == param3.name)
               {
                  _loc6_ = param1 as TransformFrame;
                  if(this.§_-3B§)
                  {
                     _loc7_ = _loc6_.displayIndex;
                     if(_loc7_ >= 0)
                     {
                        if(!isNaN(_loc6_.zOrder) && _loc6_.zOrder != this.§_-3B§.§_-sy§)
                        {
                           this.§_-3B§.§_-sy§ = _loc6_.zOrder;
                           this.§_-H2x§.§_-E2L§ = true;
                        }
                     }
                     this.§_-3B§.§_-C1J§(_loc7_);
                     this.§_-3B§.§_-p1E§(_loc6_.visible);
                  }
               }
            }
            if(Boolean(param1.event) && this.§_-H2x§.hasEventListener(§_-cV§.§_-w1F§))
            {
               _loc8_ = new §_-cV§(§_-cV§.§_-w1F§);
               _loc8_.bone = this;
               _loc8_.§_-y8§ = param3;
               _loc8_.frameLabel = param1.event;
               this.§_-H2x§.§_-A2H§.push(_loc8_);
            }
            if(Boolean(param1.sound) && §_-ts§.hasEventListener(§_-A1e§.§_-62Z§))
            {
               _loc9_ = new §_-A1e§(§_-A1e§.§_-62Z§);
               _loc9_.armature = this.§_-H2x§;
               _loc9_.§_-y8§ = param3;
               _loc9_.sound = param1.sound;
               §_-ts§.dispatchEvent(_loc9_);
            }
            if(param1.action)
            {
               for each(_loc10_ in this.§_-P2d§)
               {
                  if(_loc10_ is §_-Bq§)
                  {
                     _loc11_ = (_loc10_ as §_-Bq§).childArmature;
                     if(_loc11_)
                     {
                        _loc11_.animation.gotoAndPlay(param1.action);
                     }
                  }
               }
            }
         }
         else if(this.§_-3B§)
         {
            this.§_-3B§.§_-C1J§(-1);
         }
      }
      
      dragonBones_internal function §_-126§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Boolean) : void
      {
         if(param9 || dragonBones_internal::§_-t12§)
         {
            this.§_-3B§.§_-F12§.§_-126§(param1,param2,param3,param4,param5,param6,param7,param8);
         }
         §_-t12§ = param9;
      }
   }
}

