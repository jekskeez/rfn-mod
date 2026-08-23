package §_-N14§
{
   import dragonBones.§_-TH§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.DBTransform;
   import dragonBones.objects.TransformFrame;
   import dragonBones.objects.TransformTimeline;
   import dragonBones.utils.§_-mP§;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   use namespace dragonBones_internal;
   
   public final class §_-12B§
   {
      
      private static const §_-C1D§:Number = 1.5707963267948966;
      
      private static const §_-P1t§:Number = 6.283185307179586;
      
      private static var §_-a1x§:Vector.<§_-12B§> = new Vector.<§_-12B§>();
      
      public var transform:DBTransform;
      
      public var pivot:Point;
      
      public var §_-H1J§:Boolean;
      
      private var §_-R1P§:int;
      
      private var §_-gL§:§_-G2M§;
      
      private var §_-N1K§:§_-TH§;
      
      private var §_-sP§:TransformTimeline;
      
      private var §_-gw§:TransformFrame;
      
      private var §_-b25§:Number;
      
      private var §_-93Z§:Number;
      
      private var §_-At§:DBTransform;
      
      private var §_-Q21§:Point;
      
      private var §_-O2F§:ColorTransform;
      
      private var §_-u1G§:DBTransform;
      
      private var §_-d1o§:Point;
      
      private var §_-62L§:Number;
      
      private var §_-W0§:Boolean;
      
      private var §_-E1j§:Boolean;
      
      private var §_-B2B§:Number;
      
      public function §_-12B§()
      {
         super();
         this.transform = new DBTransform();
         this.pivot = new Point();
         this.§_-At§ = new DBTransform();
         this.§_-Q21§ = new Point();
         this.§_-O2F§ = new ColorTransform();
      }
      
      dragonBones_internal static function §_-XL§() : §_-12B§
      {
         if(§_-a1x§.length == 0)
         {
            return new §_-12B§();
         }
         return §_-a1x§.pop();
      }
      
      dragonBones_internal static function §_-F1t§(param1:§_-12B§) : void
      {
         if(§_-a1x§.indexOf(param1) < 0)
         {
            §_-a1x§[§_-a1x§.length] = param1;
         }
         param1.clear();
      }
      
      dragonBones_internal static function clear() : void
      {
         var _loc1_:* = int(§_-a1x§.length);
         while(_loc1_--)
         {
            §_-a1x§[_loc1_].clear();
         }
         §_-a1x§.length = 0;
      }
      
      public static function §_-o1J§(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param2 > 1)
         {
            _loc3_ = 0.5 * (1 - Math.cos(param1 * Math.PI)) - param1;
            param2--;
         }
         else if(param2 > 0)
         {
            _loc3_ = Math.sin(param1 * §_-C1D§) - param1;
         }
         else if(param2 < 0)
         {
            _loc3_ = 1 - Math.cos(param1 * §_-C1D§) - param1;
            param2 *= -1;
         }
         return _loc3_ * param2 + param1;
      }
      
      public function fadeIn(param1:§_-TH§, param2:§_-G2M§, param3:TransformTimeline) : void
      {
         this.§_-N1K§ = param1;
         this.§_-gL§ = param2;
         this.§_-sP§ = param3;
         this.§_-u1G§ = this.§_-sP§.§_-iQ§;
         this.§_-d1o§ = this.§_-sP§.§_-W1c§;
         this.§_-W0§ = false;
         this.§_-E1j§ = false;
         this.§_-B2B§ = this.§_-gL§.§_-D2C§;
         this.transform.x = 0;
         this.transform.y = 0;
         this.transform.scaleX = 0;
         this.transform.scaleY = 0;
         this.transform.skewX = 0;
         this.transform.skewY = 0;
         this.pivot.x = 0;
         this.pivot.y = 0;
         this.§_-At§.x = 0;
         this.§_-At§.y = 0;
         this.§_-At§.scaleX = 0;
         this.§_-At§.scaleY = 0;
         this.§_-At§.skewX = 0;
         this.§_-At§.skewY = 0;
         this.§_-Q21§.x = 0;
         this.§_-Q21§.y = 0;
         this.§_-gw§ = null;
         switch(this.§_-sP§.frameList.length)
         {
            case 0:
               this.§_-N1K§.§_-o2w§(null,this,this.§_-gL§,false);
               this.§_-R1P§ = 0;
               break;
            case 1:
               this.§_-R1P§ = -1;
               break;
            default:
               this.§_-R1P§ = 1;
         }
      }
      
      public function fadeOut() : void
      {
         this.transform.skewX = §_-mP§.§_-63l§(this.transform.skewX);
         this.transform.skewY = §_-mP§.§_-63l§(this.transform.skewY);
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:TransformFrame = null;
         var _loc7_:DBTransform = null;
         var _loc8_:Point = null;
         if(this.§_-R1P§)
         {
            if(this.§_-R1P§ > 0)
            {
               if(this.§_-sP§.scale == 0)
               {
                  param1 = 1;
               }
               else
               {
                  param1 /= this.§_-sP§.scale;
               }
               if(param1 == 1)
               {
                  param1 = 0.99999999;
               }
               param1 += this.§_-sP§.offset;
               _loc2_ = param1;
               param1 -= _loc2_;
               _loc3_ = this.§_-B2B§ * param1;
               _loc4_ = false;
               while(!this.§_-gw§ || _loc3_ > this.§_-b25§ + this.§_-93Z§ || _loc3_ < this.§_-b25§)
               {
                  if(_loc4_)
                  {
                     this.§_-N1K§.§_-o2w§(this.§_-gw§,this,this.§_-gL§,true);
                  }
                  _loc4_ = true;
                  if(this.§_-gw§)
                  {
                     _loc5_ = this.§_-sP§.frameList.indexOf(this.§_-gw§) + 1;
                     if(_loc5_ >= this.§_-sP§.frameList.length)
                     {
                        _loc5_ = 0;
                     }
                     this.§_-gw§ = this.§_-sP§.frameList[_loc5_] as TransformFrame;
                  }
                  else
                  {
                     _loc5_ = 0;
                     this.§_-gw§ = this.§_-sP§.frameList[0] as TransformFrame;
                  }
                  this.§_-93Z§ = this.§_-gw§.duration;
                  this.§_-b25§ = this.§_-gw§.position;
               }
               if(_loc4_)
               {
                  this.§_-H1J§ = this.§_-gw§.displayIndex >= 0;
                  if(++_loc5_ >= this.§_-sP§.frameList.length)
                  {
                     _loc5_ = 0;
                  }
                  _loc6_ = this.§_-sP§.frameList[_loc5_] as TransformFrame;
                  if(Boolean(_loc5_ == 0 && this.§_-gL§.loop) && Boolean(this.§_-gL§.§_-Q1h§ >= Math.abs(this.§_-gL§.loop) - 1) && ((this.§_-b25§ + this.§_-93Z§) / this.§_-B2B§ + _loc2_ - this.§_-sP§.offset) * this.§_-sP§.scale > 0.99999999)
                  {
                     this.§_-R1P§ = 0;
                     this.§_-62L§ = NaN;
                  }
                  else if(this.§_-gw§.displayIndex < 0 || _loc6_.displayIndex < 0 || !this.§_-gL§.§_-q2t§)
                  {
                     this.§_-62L§ = NaN;
                  }
                  else if(isNaN(this.§_-gL§.clip.tweenEasing))
                  {
                     this.§_-62L§ = this.§_-gw§.tweenEasing;
                  }
                  else
                  {
                     this.§_-62L§ = this.§_-gL§.clip.tweenEasing;
                  }
                  if(isNaN(this.§_-62L§))
                  {
                     this.§_-W0§ = false;
                     this.§_-E1j§ = false;
                  }
                  else
                  {
                     this.§_-At§.x = _loc6_.transform.x - this.§_-gw§.transform.x;
                     this.§_-At§.y = _loc6_.transform.y - this.§_-gw§.transform.y;
                     this.§_-At§.skewX = _loc6_.transform.skewX - this.§_-gw§.transform.skewX;
                     this.§_-At§.skewY = _loc6_.transform.skewY - this.§_-gw§.transform.skewY;
                     this.§_-At§.scaleX = _loc6_.transform.scaleX - this.§_-gw§.transform.scaleX;
                     this.§_-At§.scaleY = _loc6_.transform.scaleY - this.§_-gw§.transform.scaleY;
                     if(_loc5_ == 0)
                     {
                        this.§_-At§.skewX = §_-mP§.§_-63l§(this.§_-At§.skewX);
                        this.§_-At§.skewY = §_-mP§.§_-63l§(this.§_-At§.skewY);
                     }
                     this.§_-Q21§.x = _loc6_.pivot.x - this.§_-gw§.pivot.x;
                     this.§_-Q21§.y = _loc6_.pivot.y - this.§_-gw§.pivot.y;
                     if(this.§_-At§.x != 0 || this.§_-At§.y != 0 || this.§_-At§.skewX != 0 || this.§_-At§.skewY != 0 || this.§_-At§.scaleX != 0 || this.§_-At§.scaleY != 0 || this.§_-Q21§.x != 0 || this.§_-Q21§.y != 0)
                     {
                        this.§_-W0§ = true;
                     }
                     else
                     {
                        this.§_-W0§ = false;
                     }
                     if(Boolean(this.§_-gw§.color) && Boolean(_loc6_.color))
                     {
                        this.§_-O2F§.alphaOffset = _loc6_.color.alphaOffset - this.§_-gw§.color.alphaOffset;
                        this.§_-O2F§.redOffset = _loc6_.color.redOffset - this.§_-gw§.color.redOffset;
                        this.§_-O2F§.greenOffset = _loc6_.color.greenOffset - this.§_-gw§.color.greenOffset;
                        this.§_-O2F§.blueOffset = _loc6_.color.blueOffset - this.§_-gw§.color.blueOffset;
                        this.§_-O2F§.alphaMultiplier = _loc6_.color.alphaMultiplier - this.§_-gw§.color.alphaMultiplier;
                        this.§_-O2F§.redMultiplier = _loc6_.color.redMultiplier - this.§_-gw§.color.redMultiplier;
                        this.§_-O2F§.greenMultiplier = _loc6_.color.greenMultiplier - this.§_-gw§.color.greenMultiplier;
                        this.§_-O2F§.blueMultiplier = _loc6_.color.blueMultiplier - this.§_-gw§.color.blueMultiplier;
                        if(this.§_-O2F§.alphaOffset != 0 || this.§_-O2F§.redOffset != 0 || this.§_-O2F§.greenOffset != 0 || this.§_-O2F§.blueOffset != 0 || this.§_-O2F§.alphaMultiplier != 0 || this.§_-O2F§.redMultiplier != 0 || this.§_-O2F§.greenMultiplier != 0 || this.§_-O2F§.blueMultiplier != 0)
                        {
                           this.§_-E1j§ = true;
                        }
                        else
                        {
                           this.§_-E1j§ = false;
                        }
                     }
                     else if(this.§_-gw§.color)
                     {
                        this.§_-E1j§ = true;
                        this.§_-O2F§.alphaOffset = -this.§_-gw§.color.alphaOffset;
                        this.§_-O2F§.redOffset = -this.§_-gw§.color.redOffset;
                        this.§_-O2F§.greenOffset = -this.§_-gw§.color.greenOffset;
                        this.§_-O2F§.blueOffset = -this.§_-gw§.color.blueOffset;
                        this.§_-O2F§.alphaMultiplier = 1 - this.§_-gw§.color.alphaMultiplier;
                        this.§_-O2F§.redMultiplier = 1 - this.§_-gw§.color.redMultiplier;
                        this.§_-O2F§.greenMultiplier = 1 - this.§_-gw§.color.greenMultiplier;
                        this.§_-O2F§.blueMultiplier = 1 - this.§_-gw§.color.blueMultiplier;
                     }
                     else if(_loc6_.color)
                     {
                        this.§_-E1j§ = true;
                        this.§_-O2F§.alphaOffset = _loc6_.color.alphaOffset;
                        this.§_-O2F§.redOffset = _loc6_.color.redOffset;
                        this.§_-O2F§.greenOffset = _loc6_.color.greenOffset;
                        this.§_-O2F§.blueOffset = _loc6_.color.blueOffset;
                        --_loc6_.color.alphaMultiplier;
                        --_loc6_.color.redMultiplier;
                        --_loc6_.color.greenMultiplier;
                        --_loc6_.color.blueMultiplier;
                     }
                     else
                     {
                        this.§_-E1j§ = false;
                     }
                  }
                  if(!this.§_-W0§)
                  {
                     if(this.§_-gL§.§_-11n§)
                     {
                        this.transform.x = this.§_-u1G§.x + this.§_-gw§.transform.x;
                        this.transform.y = this.§_-u1G§.y + this.§_-gw§.transform.y;
                        this.transform.skewX = this.§_-u1G§.skewX + this.§_-gw§.transform.skewX;
                        this.transform.skewY = this.§_-u1G§.skewY + this.§_-gw§.transform.skewY;
                        this.transform.scaleX = this.§_-u1G§.scaleX + this.§_-gw§.transform.scaleX;
                        this.transform.scaleY = this.§_-u1G§.scaleY + this.§_-gw§.transform.scaleY;
                        this.pivot.x = this.§_-d1o§.x + this.§_-gw§.pivot.x;
                        this.pivot.y = this.§_-d1o§.y + this.§_-gw§.pivot.y;
                     }
                     else
                     {
                        this.transform.x = this.§_-gw§.transform.x;
                        this.transform.y = this.§_-gw§.transform.y;
                        this.transform.skewX = this.§_-gw§.transform.skewX;
                        this.transform.skewY = this.§_-gw§.transform.skewY;
                        this.transform.scaleX = this.§_-gw§.transform.scaleX;
                        this.transform.scaleY = this.§_-gw§.transform.scaleY;
                        this.pivot.x = this.§_-gw§.pivot.x;
                        this.pivot.y = this.§_-gw§.pivot.y;
                     }
                  }
                  if(!this.§_-E1j§)
                  {
                     if(this.§_-gw§.color)
                     {
                        this.§_-N1K§.§_-126§(this.§_-gw§.color.alphaOffset,this.§_-gw§.color.redOffset,this.§_-gw§.color.greenOffset,this.§_-gw§.color.blueOffset,this.§_-gw§.color.alphaMultiplier,this.§_-gw§.color.redMultiplier,this.§_-gw§.color.greenMultiplier,this.§_-gw§.color.blueMultiplier,true);
                     }
                     else if(this.§_-N1K§.§_-t12§)
                     {
                        this.§_-N1K§.§_-126§(0,0,0,0,1,1,1,1,false);
                     }
                  }
                  this.§_-N1K§.§_-o2w§(this.§_-gw§,this,this.§_-gL§,false);
               }
               if(this.§_-W0§ || this.§_-E1j§)
               {
                  param1 = (_loc3_ - this.§_-b25§) / this.§_-93Z§;
                  if(this.§_-62L§)
                  {
                     param1 = §_-o1J§(param1,this.§_-62L§);
                  }
               }
               if(this.§_-W0§)
               {
                  _loc7_ = this.§_-gw§.transform;
                  _loc8_ = this.§_-gw§.pivot;
                  if(this.§_-gL§.§_-11n§)
                  {
                     this.transform.x = this.§_-u1G§.x + _loc7_.x + this.§_-At§.x * param1;
                     this.transform.y = this.§_-u1G§.y + _loc7_.y + this.§_-At§.y * param1;
                     this.transform.skewX = this.§_-u1G§.skewX + _loc7_.skewX + this.§_-At§.skewX * param1;
                     this.transform.skewY = this.§_-u1G§.skewY + _loc7_.skewY + this.§_-At§.skewY * param1;
                     this.transform.scaleX = this.§_-u1G§.scaleX + _loc7_.scaleX + this.§_-At§.scaleX * param1;
                     this.transform.scaleY = this.§_-u1G§.scaleY + _loc7_.scaleY + this.§_-At§.scaleY * param1;
                     this.pivot.x = this.§_-d1o§.x + _loc8_.x + this.§_-Q21§.x * param1;
                     this.pivot.y = this.§_-d1o§.y + _loc8_.y + this.§_-Q21§.y * param1;
                  }
                  else
                  {
                     this.transform.x = _loc7_.x + this.§_-At§.x * param1;
                     this.transform.y = _loc7_.y + this.§_-At§.y * param1;
                     this.transform.skewX = _loc7_.skewX + this.§_-At§.skewX * param1;
                     this.transform.skewY = _loc7_.skewY + this.§_-At§.skewY * param1;
                     this.transform.scaleX = _loc7_.scaleX + this.§_-At§.scaleX * param1;
                     this.transform.scaleY = _loc7_.scaleY + this.§_-At§.scaleY * param1;
                     this.pivot.x = _loc8_.x + this.§_-Q21§.x * param1;
                     this.pivot.y = _loc8_.y + this.§_-Q21§.y * param1;
                  }
               }
               if(this.§_-E1j§)
               {
                  if(this.§_-gw§.color)
                  {
                     this.§_-N1K§.§_-126§(this.§_-gw§.color.alphaOffset + this.§_-O2F§.alphaOffset * param1,this.§_-gw§.color.redOffset + this.§_-O2F§.redOffset * param1,this.§_-gw§.color.greenOffset + this.§_-O2F§.greenOffset * param1,this.§_-gw§.color.blueOffset + this.§_-O2F§.blueOffset * param1,this.§_-gw§.color.alphaMultiplier + this.§_-O2F§.alphaMultiplier * param1,this.§_-gw§.color.redMultiplier + this.§_-O2F§.redMultiplier * param1,this.§_-gw§.color.greenMultiplier + this.§_-O2F§.greenMultiplier * param1,this.§_-gw§.color.blueMultiplier + this.§_-O2F§.blueMultiplier * param1,true);
                  }
                  else
                  {
                     this.§_-N1K§.§_-126§(this.§_-O2F§.alphaOffset * param1,this.§_-O2F§.redOffset * param1,this.§_-O2F§.greenOffset * param1,this.§_-O2F§.blueOffset * param1,1 + this.§_-O2F§.alphaMultiplier * param1,1 + this.§_-O2F§.redMultiplier * param1,1 + this.§_-O2F§.greenMultiplier * param1,1 + this.§_-O2F§.blueMultiplier * param1,true);
                  }
               }
            }
            else
            {
               this.§_-R1P§ = 0;
               if(this.§_-gL§.§_-11n§)
               {
                  this.transform.copy(this.§_-u1G§);
                  this.pivot.x = this.§_-d1o§.x;
                  this.pivot.y = this.§_-d1o§.y;
               }
               else
               {
                  this.transform.x = this.transform.y = this.transform.skewX = this.transform.skewY = this.transform.scaleX = this.transform.scaleY = 0;
                  this.pivot.x = 0;
                  this.pivot.y = 0;
               }
               this.§_-gw§ = this.§_-sP§.frameList[0] as TransformFrame;
               this.§_-H1J§ = this.§_-gw§.displayIndex >= 0;
               if(this.§_-gw§.color)
               {
                  this.§_-N1K§.§_-126§(this.§_-gw§.color.alphaOffset,this.§_-gw§.color.redOffset,this.§_-gw§.color.greenOffset,this.§_-gw§.color.blueOffset,this.§_-gw§.color.alphaMultiplier,this.§_-gw§.color.redMultiplier,this.§_-gw§.color.greenMultiplier,this.§_-gw§.color.blueMultiplier,true);
               }
               else
               {
                  this.§_-N1K§.§_-126§(0,0,0,0,1,1,1,1,false);
               }
               this.§_-N1K§.§_-o2w§(this.§_-gw§,this,this.§_-gL§,false);
            }
         }
      }
      
      private function clear() : void
      {
         this.§_-R1P§ = 0;
         this.§_-N1K§ = null;
         this.§_-gL§ = null;
         this.§_-sP§ = null;
         this.§_-gw§ = null;
         this.§_-u1G§ = null;
         this.§_-d1o§ = null;
      }
   }
}

