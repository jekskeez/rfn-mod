package §_-Vu§
{
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import dragonBones.§_-z2H§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.AnimationData;
   import dragonBones.objects.DBTransform;
   import flash.geom.Point;
   
   use namespace dragonBones_internal;
   
   public class §_-h25§
   {
      
      public static const NONE:String = "none";
      
      public static const §_-C1a§:String = "sameLayer";
      
      public static const §_-fX§:String = "sameGroup";
      
      public static const §_-o2A§:String = "sameLayerAndGroup";
      
      public static const ALL:String = "all";
      
      public var §_-n1§:Boolean;
      
      dragonBones_internal var §_-117§:Vector.<Vector.<§_-tW§>>;
      
      private var §_-9Y§:§_-833§;
      
      private var §_-y1z§:Boolean;
      
      dragonBones_internal var §_-22V§:§_-tW§;
      
      private var §_-x25§:Vector.<String>;
      
      private var §_-KV§:Boolean;
      
      private var §_-91R§:Vector.<AnimationData>;
      
      private var §_-L2h§:Number = 1;
      
      public function §_-h25§(param1:§_-833§)
      {
         super();
         this.§_-9Y§ = param1;
         this.§_-117§ = new Vector.<Vector.<§_-tW§>>();
         this.§_-x25§ = new Vector.<String>();
         this.§_-KV§ = false;
         this.§_-y1z§ = false;
         this.§_-n1§ = true;
      }
      
      public function get §_-z2F§() : Vector.<String>
      {
         return this.§_-x25§;
      }
      
      public function get §_-Sq§() : String
      {
         return this.§_-22V§ ? this.§_-22V§.name : null;
      }
      
      public function get §_-g2u§() : §_-tW§
      {
         return this.§_-22V§;
      }
      
      public function get §_-Au§() : Vector.<String>
      {
         return this.§_-x25§;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.§_-KV§ && this.§_-y1z§;
      }
      
      public function get §_-HU§() : Boolean
      {
         var _loc1_:* = 0;
         var _loc2_:Vector.<§_-tW§> = null;
         var _loc3_:* = 0;
         if(this.§_-22V§)
         {
            if(!this.§_-22V§.§_-HU§)
            {
               return false;
            }
            _loc1_ = int(this.§_-117§.length);
            while(_loc1_--)
            {
               _loc2_ = this.§_-117§[_loc1_];
               _loc3_ = int(_loc2_.length);
               while(_loc3_--)
               {
                  if(!_loc2_[_loc3_].§_-HU§)
                  {
                     return false;
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      public function get §_-gi§() : Vector.<AnimationData>
      {
         return this.§_-91R§;
      }
      
      public function set §_-gi§(param1:Vector.<AnimationData>) : void
      {
         var _loc2_:AnimationData = null;
         this.§_-91R§ = param1;
         this.§_-x25§.length = 0;
         for each(_loc2_ in this.§_-91R§)
         {
            this.§_-x25§[this.§_-x25§.length] = _loc2_.name;
         }
      }
      
      public function get timeScale() : Number
      {
         return this.§_-L2h§;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.§_-L2h§ = param1;
      }
      
      public function dispose() : void
      {
         var _loc2_:Vector.<§_-tW§> = null;
         var _loc3_:* = 0;
         if(!this.§_-9Y§)
         {
            return;
         }
         this.stop();
         var _loc1_:* = int(this.§_-117§.length);
         while(_loc1_--)
         {
            _loc2_ = this.§_-117§[_loc1_];
            _loc3_ = int(_loc2_.length);
            while(_loc3_--)
            {
               §_-tW§.§_-Oy§(_loc2_[_loc3_]);
            }
            _loc2_.length = 0;
         }
         this.§_-117§.length = 0;
         this.§_-x25§.length = 0;
         this.§_-9Y§ = null;
         this.§_-117§ = null;
         this.§_-91R§ = null;
         this.§_-x25§ = null;
      }
      
      public function gotoAndPlay(param1:String, param2:Number = -1, param3:Number = -1, param4:Number = NaN, param5:uint = 0, param6:String = null, param7:String = "sameLayerAndGroup", param8:Boolean = true, param9:Boolean = true, param10:Boolean = true) : §_-tW§
      {
         var _loc12_:AnimationData = null;
         var _loc13_:Number = NaN;
         var _loc14_:§_-tW§ = null;
         var _loc15_:Vector.<§_-tW§> = null;
         var _loc17_:§_-z2H§ = null;
         var _loc18_:* = 0;
         if(!this.§_-91R§)
         {
            return null;
         }
         var _loc11_:* = int(this.§_-91R§.length);
         while(_loc11_--)
         {
            if(this.§_-91R§[_loc11_].name == param1)
            {
               _loc12_ = this.§_-91R§[_loc11_];
               break;
            }
         }
         if(!_loc12_)
         {
            return null;
         }
         this.§_-KV§ = true;
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
         param5 = this.§_-s1s§(param5);
         switch(param7)
         {
            case NONE:
               break;
            case §_-C1a§:
               _loc15_ = this.§_-117§[param5];
               _loc11_ = int(_loc15_.length);
               while(_loc11_--)
               {
                  _loc14_ = _loc15_[_loc11_];
                  _loc14_.fadeOut(param2,param9);
               }
               break;
            case §_-fX§:
               _loc18_ = int(this.§_-117§.length);
               while(_loc18_--)
               {
                  _loc15_ = this.§_-117§[_loc18_];
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
               _loc18_ = int(this.§_-117§.length);
               while(_loc18_--)
               {
                  _loc15_ = this.§_-117§[_loc18_];
                  _loc11_ = int(_loc15_.length);
                  while(_loc11_--)
                  {
                     _loc14_ = _loc15_[_loc11_];
                     _loc14_.fadeOut(param2,param9);
                  }
               }
               break;
            case §_-o2A§:
            default:
               _loc15_ = this.§_-117§[param5];
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
         this.§_-22V§ = §_-tW§.§_-M1V§();
         this.§_-22V§.group = param6;
         this.§_-22V§.§_-n1§ = this.§_-n1§;
         this.§_-22V§.fadeIn(this.§_-9Y§,_loc12_,param2,1 / _loc13_,param4,param5,param8,param10);
         this.§_-W10§(this.§_-22V§);
         var _loc16_:Vector.<§_-z2H§> = this.§_-9Y§.§_-j1h§;
         _loc11_ = int(_loc16_.length);
         while(_loc11_--)
         {
            _loc17_ = _loc16_[_loc11_];
            if(_loc17_.childArmature)
            {
               _loc17_.childArmature.animation.gotoAndPlay(param1,param2);
            }
         }
         this.§_-22V§.§_-a1Q§(0);
         return this.§_-22V§;
      }
      
      public function play() : void
      {
         if(!this.§_-91R§ || this.§_-91R§.length == 0)
         {
            return;
         }
         if(!this.§_-22V§)
         {
            this.gotoAndPlay(this.§_-91R§[0].name);
         }
         else if(!this.§_-KV§)
         {
            this.§_-KV§ = true;
         }
         else
         {
            this.gotoAndPlay(this.§_-22V§.name);
         }
      }
      
      public function stop() : void
      {
         this.§_-KV§ = false;
      }
      
      public function getState(param1:String, param2:uint = 0) : §_-tW§
      {
         var _loc3_:int = int(this.§_-117§.length);
         if(_loc3_ == 0)
         {
            return null;
         }
         if(param2 >= _loc3_)
         {
            param2 = _loc3_ - 1;
         }
         var _loc4_:Vector.<§_-tW§> = this.§_-117§[param2];
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
      
      public function §_-B1s§(param1:String) : Boolean
      {
         var _loc2_:* = int(this.§_-91R§.length);
         while(_loc2_--)
         {
            if(this.§_-91R§[_loc2_].name == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc7_:§_-83b§ = null;
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
         var _loc19_:Vector.<§_-tW§> = null;
         var _loc20_:§_-tW§ = null;
         var _loc21_:§_-b2t§ = null;
         var _loc22_:Number = NaN;
         var _loc23_:DBTransform = null;
         var _loc24_:Point = null;
         param1 *= this.§_-L2h§;
         var _loc2_:* = int(this.§_-9Y§.§_-d1d§.length);
         var _loc5_:* = int(_loc2_);
         _loc2_--;
         while(_loc5_--)
         {
            _loc7_ = this.§_-9Y§.§_-d1d§[_loc5_];
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
            _loc3_ = int(this.§_-117§.length);
            while(_loc3_--)
            {
               _loc18_ = 0;
               _loc19_ = this.§_-117§[_loc3_];
               _loc6_ = _loc19_.length;
               _loc4_ = 0;
               for(; _loc4_ < _loc6_; _loc4_++)
               {
                  _loc20_ = _loc19_[_loc4_];
                  if(_loc5_ == _loc2_)
                  {
                     if(_loc20_.§_-a1Q§(param1))
                     {
                        this.removeState(_loc20_);
                        _loc4_--;
                        _loc6_--;
                        continue;
                     }
                  }
                  _loc21_ = _loc20_.§_-i1§[_loc8_];
                  if(Boolean(_loc21_) && _loc21_.§_-k2V§)
                  {
                     _loc22_ = _loc20_.§_-F1Q§ * _loc20_.weight * _loc9_;
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
            _loc23_ = _loc7_.§_-T2b§;
            _loc24_ = _loc7_.§_-G1§;
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
      
      dragonBones_internal function §_-724§(param1:§_-tW§, param2:Boolean) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:Vector.<§_-tW§> = null;
         if(param2)
         {
            this.§_-y1z§ = true;
         }
         else
         {
            _loc3_ = int(this.§_-117§.length);
            while(_loc3_--)
            {
               _loc5_ = this.§_-117§[_loc3_];
               _loc4_ = int(_loc5_.length);
               while(_loc4_--)
               {
                  if(_loc5_[_loc4_].isPlaying)
                  {
                     return;
                  }
               }
            }
            this.§_-y1z§ = false;
         }
      }
      
      private function §_-s1s§(param1:uint) : uint
      {
         if(param1 >= this.§_-117§.length)
         {
            param1 = this.§_-117§.length;
            this.§_-117§[param1] = new Vector.<§_-tW§>();
         }
         return param1;
      }
      
      private function §_-W10§(param1:§_-tW§) : void
      {
         var _loc2_:Vector.<§_-tW§> = this.§_-117§[param1.§_-I1b§];
         _loc2_.push(param1);
      }
      
      private function removeState(param1:§_-tW§) : void
      {
         var _loc2_:int = int(param1.§_-I1b§);
         var _loc3_:Vector.<§_-tW§> = this.§_-117§[_loc2_];
         _loc3_.splice(_loc3_.indexOf(param1),1);
         §_-tW§.§_-Oy§(param1);
         if(_loc3_.length == 0 && _loc2_ == this.§_-117§.length - 1)
         {
            --this.§_-117§.length;
         }
      }
   }
}

