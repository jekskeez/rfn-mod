package §_-N14§
{
   import dragonBones.§_-Bq§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.AnimationData;
   import dragonBones.objects.DBTransform;
   import flash.geom.Point;
   
   use namespace dragonBones_internal;
   
   public class §_-i2C§
   {
      
      public static const NONE:String = "none";
      
      public static const §_-B4§:String = "sameLayer";
      
      public static const §_-511§:String = "sameGroup";
      
      public static const §_-91T§:String = "sameLayerAndGroup";
      
      public static const ALL:String = "all";
      
      public var §_-q2t§:Boolean;
      
      dragonBones_internal var §_-c2U§:Vector.<Vector.<§_-G2M§>>;
      
      private var §_-H2x§:§_-E1r§;
      
      private var §_-h1Y§:Boolean;
      
      dragonBones_internal var §_-A1V§:§_-G2M§;
      
      private var §_-Gs§:Vector.<String>;
      
      private var §_-L5§:Boolean;
      
      private var §_-C33§:Vector.<AnimationData>;
      
      private var §_-ey§:Number = 1;
      
      public function §_-i2C§(param1:§_-E1r§)
      {
         super();
         this.§_-H2x§ = param1;
         this.§_-c2U§ = new Vector.<Vector.<§_-G2M§>>();
         this.§_-Gs§ = new Vector.<String>();
         this.§_-L5§ = false;
         this.§_-h1Y§ = false;
         this.§_-q2t§ = true;
      }
      
      public function get §_-83e§() : Vector.<String>
      {
         return this.§_-Gs§;
      }
      
      public function get §_-Y1v§() : String
      {
         return this.§_-A1V§ ? this.§_-A1V§.name : null;
      }
      
      public function get §_-K2z§() : §_-G2M§
      {
         return this.§_-A1V§;
      }
      
      public function get §_-P2r§() : Vector.<String>
      {
         return this.§_-Gs§;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.§_-L5§ && this.§_-h1Y§;
      }
      
      public function get §_-Y2w§() : Boolean
      {
         var _loc1_:* = 0;
         var _loc2_:Vector.<§_-G2M§> = null;
         var _loc3_:* = 0;
         if(this.§_-A1V§)
         {
            if(!this.§_-A1V§.§_-Y2w§)
            {
               return false;
            }
            _loc1_ = int(this.§_-c2U§.length);
            while(_loc1_--)
            {
               _loc2_ = this.§_-c2U§[_loc1_];
               _loc3_ = int(_loc2_.length);
               while(_loc3_--)
               {
                  if(!_loc2_[_loc3_].§_-Y2w§)
                  {
                     return false;
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      public function get §_-J2w§() : Vector.<AnimationData>
      {
         return this.§_-C33§;
      }
      
      public function set §_-J2w§(param1:Vector.<AnimationData>) : void
      {
         var _loc2_:AnimationData = null;
         this.§_-C33§ = param1;
         this.§_-Gs§.length = 0;
         for each(_loc2_ in this.§_-C33§)
         {
            this.§_-Gs§[this.§_-Gs§.length] = _loc2_.name;
         }
      }
      
      public function get timeScale() : Number
      {
         return this.§_-ey§;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.§_-ey§ = param1;
      }
      
      public function dispose() : void
      {
         var _loc2_:Vector.<§_-G2M§> = null;
         var _loc3_:* = 0;
         if(!this.§_-H2x§)
         {
            return;
         }
         this.stop();
         var _loc1_:* = int(this.§_-c2U§.length);
         while(_loc1_--)
         {
            _loc2_ = this.§_-c2U§[_loc1_];
            _loc3_ = int(_loc2_.length);
            while(_loc3_--)
            {
               §_-G2M§.§_-F1t§(_loc2_[_loc3_]);
            }
            _loc2_.length = 0;
         }
         this.§_-c2U§.length = 0;
         this.§_-Gs§.length = 0;
         this.§_-H2x§ = null;
         this.§_-c2U§ = null;
         this.§_-C33§ = null;
         this.§_-Gs§ = null;
      }
      
      public function gotoAndPlay(param1:String, param2:Number = -1, param3:Number = -1, param4:Number = NaN, param5:uint = 0, param6:String = null, param7:String = "sameLayerAndGroup", param8:Boolean = true, param9:Boolean = true, param10:Boolean = true) : §_-G2M§
      {
         var _loc12_:AnimationData = null;
         var _loc13_:Number = NaN;
         var _loc14_:§_-G2M§ = null;
         var _loc15_:Vector.<§_-G2M§> = null;
         var _loc17_:§_-Bq§ = null;
         var _loc18_:* = 0;
         if(!this.§_-C33§)
         {
            return null;
         }
         var _loc11_:* = int(this.§_-C33§.length);
         while(_loc11_--)
         {
            if(this.§_-C33§[_loc11_].name == param1)
            {
               _loc12_ = this.§_-C33§[_loc11_];
               break;
            }
         }
         if(!_loc12_)
         {
            return null;
         }
         this.§_-L5§ = true;
         param2 = param2 < 0 ? (_loc12_.fadeInTime < 0 ? 0.3 : _loc12_.fadeInTime) : param2;
         if(param3 < 0)
         {
            _loc13_ = _loc12_.scale < 0 ? 1 : _loc12_.scale;
         }
         else
         {
            _loc13_ = param3 / _loc12_.duration;
         }
         param4 = isNaN(param4) ? _loc12_.loop : param4;
         param5 = this.§_-U2R§(param5);
         switch(param7)
         {
            case NONE:
               break;
            case §_-B4§:
               _loc15_ = this.§_-c2U§[param5];
               _loc11_ = int(_loc15_.length);
               while(_loc11_--)
               {
                  _loc14_ = _loc15_[_loc11_];
                  _loc14_.fadeOut(param2,param9);
               }
               break;
            case §_-511§:
               _loc18_ = int(this.§_-c2U§.length);
               while(_loc18_--)
               {
                  _loc15_ = this.§_-c2U§[_loc18_];
                  _loc11_ = int(_loc15_.length);
                  while(_loc11_--)
                  {
                     _loc14_ = _loc15_[_loc11_];
                     if(_loc14_.group == param6)
                     {
                        _loc14_.fadeOut(param2,param9);
                     }
                  }
               }
               break;
            case ALL:
               _loc18_ = int(this.§_-c2U§.length);
               while(_loc18_--)
               {
                  _loc15_ = this.§_-c2U§[_loc18_];
                  _loc11_ = int(_loc15_.length);
                  while(_loc11_--)
                  {
                     _loc14_ = _loc15_[_loc11_];
                     _loc14_.fadeOut(param2,param9);
                  }
               }
               break;
            case §_-91T§:
            default:
               _loc15_ = this.§_-c2U§[param5];
               _loc11_ = int(_loc15_.length);
               while(_loc11_--)
               {
                  _loc14_ = _loc15_[_loc11_];
                  if(_loc14_.group == param6)
                  {
                     _loc14_.fadeOut(param2,param9);
                  }
               }
         }
         this.§_-A1V§ = §_-G2M§.§_-XL§();
         this.§_-A1V§.group = param6;
         this.§_-A1V§.§_-q2t§ = this.§_-q2t§;
         this.§_-A1V§.fadeIn(this.§_-H2x§,_loc12_,param2,1 / _loc13_,param4,param5,param8,param10);
         this.§_-gz§(this.§_-A1V§);
         var _loc16_:Vector.<§_-Bq§> = this.§_-H2x§.§_-4f§;
         _loc11_ = int(_loc16_.length);
         while(_loc11_--)
         {
            _loc17_ = _loc16_[_loc11_];
            if(_loc17_.childArmature)
            {
               _loc17_.childArmature.animation.gotoAndPlay(param1,param2);
            }
         }
         this.§_-A1V§.§_-ld§(0);
         return this.§_-A1V§;
      }
      
      public function play() : void
      {
         if(!this.§_-C33§ || this.§_-C33§.length == 0)
         {
            return;
         }
         if(!this.§_-A1V§)
         {
            this.gotoAndPlay(this.§_-C33§[0].name);
         }
         else if(!this.§_-L5§)
         {
            this.§_-L5§ = true;
         }
         else
         {
            this.gotoAndPlay(this.§_-A1V§.name);
         }
      }
      
      public function stop() : void
      {
         this.§_-L5§ = false;
      }
      
      public function getState(param1:String, param2:uint = 0) : §_-G2M§
      {
         var _loc3_:int = int(this.§_-c2U§.length);
         if(_loc3_ == 0)
         {
            return null;
         }
         if(param2 >= _loc3_)
         {
            param2 = _loc3_ - 1;
         }
         var _loc4_:Vector.<§_-G2M§> = this.§_-c2U§[param2];
         if(!_loc4_)
         {
            return null;
         }
         var _loc5_:* = int(_loc4_.length);
         while(_loc5_--)
         {
            if(_loc4_[_loc5_].name == param1)
            {
               return _loc4_[_loc5_];
            }
         }
         return null;
      }
      
      public function §_-61D§(param1:String) : Boolean
      {
         var _loc2_:* = int(this.§_-C33§.length);
         while(_loc2_--)
         {
            if(this.§_-C33§[_loc2_].name == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc7_:§_-TH§ = null;
         var _loc8_:String = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Vector.<§_-G2M§> = null;
         var _loc20_:§_-G2M§ = null;
         var _loc21_:§_-12B§ = null;
         var _loc22_:Number = NaN;
         var _loc23_:DBTransform = null;
         var _loc24_:Point = null;
         param1 *= this.§_-ey§;
         var _loc2_:* = int(this.§_-H2x§.§_-G1x§.length);
         var _loc5_:* = int(_loc2_);
         _loc2_--;
         while(_loc5_--)
         {
            _loc7_ = this.§_-H2x§.§_-G1x§[_loc5_];
            _loc8_ = _loc7_.name;
            _loc9_ = 1;
            _loc10_ = 0;
            _loc11_ = 0;
            _loc12_ = 0;
            _loc13_ = 0;
            _loc14_ = 0;
            _loc15_ = 0;
            _loc16_ = 0;
            _loc17_ = 0;
            _loc3_ = int(this.§_-c2U§.length);
            while(_loc3_--)
            {
               _loc18_ = 0;
               _loc19_ = this.§_-c2U§[_loc3_];
               _loc6_ = _loc19_.length;
               _loc4_ = 0;
               for(; _loc4_ < _loc6_; _loc4_++)
               {
                  _loc20_ = _loc19_[_loc4_];
                  if(_loc5_ == _loc2_)
                  {
                     if(_loc20_.§_-ld§(param1))
                     {
                        this.removeState(_loc20_);
                        _loc4_--;
                        _loc6_--;
                        continue;
                     }
                  }
                  _loc21_ = _loc20_.§_-f2d§[_loc8_];
                  if(Boolean(_loc21_) && _loc21_.§_-H1J§)
                  {
                     _loc22_ = _loc20_.§_-A6§ * _loc20_.weight * _loc9_;
                     _loc23_ = _loc21_.transform;
                     _loc24_ = _loc21_.pivot;
                     _loc10_ += _loc23_.x * _loc22_;
                     _loc11_ += _loc23_.y * _loc22_;
                     _loc12_ += _loc23_.skewX * _loc22_;
                     _loc13_ += _loc23_.skewY * _loc22_;
                     _loc14_ += _loc23_.scaleX * _loc22_;
                     _loc15_ += _loc23_.scaleY * _loc22_;
                     _loc16_ += _loc24_.x * _loc22_;
                     _loc17_ += _loc24_.y * _loc22_;
                     _loc18_ += _loc22_;
                  }
               }
               if(_loc18_ >= _loc9_)
               {
                  break;
               }
               _loc9_ -= _loc18_;
            }
            _loc23_ = _loc7_.§_-r2y§;
            _loc24_ = _loc7_.§_-t11§;
            _loc23_.x = _loc10_;
            _loc23_.y = _loc11_;
            _loc23_.skewX = _loc12_;
            _loc23_.skewY = _loc13_;
            _loc23_.scaleX = _loc14_;
            _loc23_.scaleY = _loc15_;
            _loc24_.x = _loc16_;
            _loc24_.y = _loc17_;
         }
      }
      
      dragonBones_internal function §_-51m§(param1:§_-G2M§, param2:Boolean) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:Vector.<§_-G2M§> = null;
         if(param2)
         {
            this.§_-h1Y§ = true;
         }
         else
         {
            _loc3_ = int(this.§_-c2U§.length);
            while(_loc3_--)
            {
               _loc5_ = this.§_-c2U§[_loc3_];
               _loc4_ = int(_loc5_.length);
               while(_loc4_--)
               {
                  if(_loc5_[_loc4_].isPlaying)
                  {
                     return;
                  }
               }
            }
            this.§_-h1Y§ = false;
         }
      }
      
      private function §_-U2R§(param1:uint) : uint
      {
         if(param1 >= this.§_-c2U§.length)
         {
            param1 = this.§_-c2U§.length;
            this.§_-c2U§[param1] = new Vector.<§_-G2M§>();
         }
         return param1;
      }
      
      private function §_-gz§(param1:§_-G2M§) : void
      {
         var _loc2_:Vector.<§_-G2M§> = this.§_-c2U§[param1.§_-n2g§];
         _loc2_.push(param1);
      }
      
      private function removeState(param1:§_-G2M§) : void
      {
         var _loc2_:int = int(param1.§_-n2g§);
         var _loc3_:Vector.<§_-G2M§> = this.§_-c2U§[_loc2_];
         _loc3_.splice(_loc3_.indexOf(param1),1);
         §_-G2M§.§_-F1t§(param1);
         if(_loc3_.length == 0 && _loc2_ == this.§_-c2U§.length - 1)
         {
            --this.§_-c2U§.length;
         }
      }
   }
}

