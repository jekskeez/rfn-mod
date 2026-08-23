package §_-Vu§
{
   import dragonBones.§_-83b§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.DBTransform;
   import dragonBones.objects.TransformFrame;
   import dragonBones.objects.TransformTimeline;
   import dragonBones.utils.§_-G9§;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   use namespace dragonBones_internal;
   
   public final class §_-b2t§
   {
      
      private static const §_-W17§:Number = 1.5707963267948966;
      
      private static const §_-X26§:Number = 6.283185307179586;
      
      private static var §_-d2i§:Vector.<§_-b2t§> = new Vector.<§_-b2t§>();
      
      public var transform:DBTransform;
      
      public var pivot:Point;
      
      public var §_-k2V§:Boolean;
      
      private var §_-p2C§:int;
      
      private var §_-Q28§:§_-tW§;
      
      private var §_-327§:§_-83b§;
      
      private var §_-c1q§:TransformTimeline;
      
      private var §_-El§:TransformFrame;
      
      private var §_-q2w§:Number;
      
      private var §_-43j§:Number;
      
      private var §_-Z1g§:DBTransform;
      
      private var §_-qE§:Point;
      
      private var §_-v25§:ColorTransform;
      
      private var §_-B3E§:DBTransform;
      
      private var §_-Dm§:Point;
      
      private var §_-n2Q§:Number;
      
      private var §_-CX§:Boolean;
      
      private var §_-C1C§:Boolean;
      
      private var §_-m1V§:Number;
      
      public function §_-b2t§()
      {
         super();
         this.transform = new DBTransform();
         this.pivot = new Point();
         this.§_-Z1g§ = new DBTransform();
         this.§_-qE§ = new Point();
         this.§_-v25§ = new ColorTransform();
      }
      
      dragonBones_internal static function §_-M1V§() : §_-b2t§
      {
         if(§_-d2i§.length == 0)
         {
            return new §_-b2t§();
         }
         return §_-d2i§.pop();
      }
      
      dragonBones_internal static function §_-Oy§(param1:§_-b2t§) : void
      {
         if(§_-d2i§.indexOf(param1) < 0)
         {
            §_-d2i§[§_-d2i§.length] = param1;
         }
         param1.clear();
      }
      
      dragonBones_internal static function clear() : void
      {
         var _loc1_:* = int(§_-d2i§.length);
         while(_loc1_--)
         {
            §_-d2i§[_loc1_].clear();
         }
         §_-d2i§.length = 0;
      }
      
      public static function §_-81D§(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param2 > 1)
         {
            _loc3_ = 0.5 * (1 - Math.cos(param1 * Math.PI)) - param1;
            param2--;
         }
         else if(param2 > 0)
         {
            _loc3_ = Math.sin(param1 * §_-W17§) - param1;
         }
         else if(param2 < 0)
         {
            _loc3_ = 1 - Math.cos(param1 * §_-W17§) - param1;
            param2 *= -1;
         }
         return _loc3_ * param2 + param1;
      }
      
      public function fadeIn(param1:§_-83b§, param2:§_-tW§, param3:TransformTimeline) : void
      {
         this.§_-327§ = param1;
         this.§_-Q28§ = param2;
         this.§_-c1q§ = param3;
         this.§_-B3E§ = this.§_-c1q§.§_-R1B§;
         this.§_-Dm§ = this.§_-c1q§.§_-P1o§;
         this.§_-CX§ = false;
         this.§_-C1C§ = false;
         this.§_-m1V§ = this.§_-Q28§.§_-R1Z§;
         this.transform.x = 0;
         this.transform.y = 0;
         this.transform.scaleX = 0;
         this.transform.scaleY = 0;
         this.transform.skewX = 0;
         this.transform.skewY = 0;
         this.pivot.x = 0;
         this.pivot.y = 0;
         this.§_-Z1g§.x = 0;
         this.§_-Z1g§.y = 0;
         this.§_-Z1g§.scaleX = 0;
         this.§_-Z1g§.scaleY = 0;
         this.§_-Z1g§.skewX = 0;
         this.§_-Z1g§.skewY = 0;
         this.§_-qE§.x = 0;
         this.§_-qE§.y = 0;
         this.§_-El§ = null;
         switch(this.§_-c1q§.frameList.length)
         {
            case 0:
               this.§_-327§.§_-P1L§(null,this,this.§_-Q28§,false);
               this.§_-p2C§ = 0;
               break;
            case 1:
               this.§_-p2C§ = -1;
               break;
            default:
               this.§_-p2C§ = 1;
         }
      }
      
      public function fadeOut() : void
      {
         this.transform.skewX = §_-G9§.§_-n1w§(this.transform.skewX);
         this.transform.skewY = §_-G9§.§_-n1w§(this.transform.skewY);
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
         if(this.§_-p2C§)
         {
            if(this.§_-p2C§ > 0)
            {
               if(this.§_-c1q§.scale == 0)
               {
                  param1 = 1;
               }
               else
               {
                  param1 /= this.§_-c1q§.scale;
               }
               if(param1 == 1)
               {
                  param1 = 0.99999999;
               }
               param1 += this.§_-c1q§.offset;
               _loc2_ = param1;
               param1 -= _loc2_;
               _loc3_ = this.§_-m1V§ * param1;
               _loc4_ = false;
               while(!this.§_-El§ || _loc3_ > this.§_-q2w§ + this.§_-43j§ || _loc3_ < this.§_-q2w§)
               {
                  if(_loc4_)
                  {
                     this.§_-327§.§_-P1L§(this.§_-El§,this,this.§_-Q28§,true);
                  }
                  _loc4_ = true;
                  if(this.§_-El§)
                  {
                     _loc5_ = this.§_-c1q§.frameList.indexOf(this.§_-El§) + 1;
                     if(_loc5_ >= this.§_-c1q§.frameList.length)
                     {
                        _loc5_ = 0;
                     }
                     this.§_-El§ = this.§_-c1q§.frameList[_loc5_] as TransformFrame;
                  }
                  else
                  {
                     _loc5_ = 0;
                     this.§_-El§ = this.§_-c1q§.frameList[0] as TransformFrame;
                  }
                  this.§_-43j§ = this.§_-El§.duration;
                  this.§_-q2w§ = this.§_-El§.position;
               }
               if(_loc4_)
               {
                  this.§_-k2V§ = this.§_-El§.displayIndex >= 0;
                  if(++_loc5_ >= this.§_-c1q§.frameList.length)
                  {
                     _loc5_ = 0;
                  }
                  _loc6_ = this.§_-c1q§.frameList[_loc5_] as TransformFrame;
                  if(Boolean(_loc5_ == 0 && this.§_-Q28§.loop) && Boolean(this.§_-Q28§.§_-j2§ >= Math.abs(this.§_-Q28§.loop) - 1) && ((this.§_-q2w§ + this.§_-43j§) / this.§_-m1V§ + _loc2_ - this.§_-c1q§.offset) * this.§_-c1q§.scale > 0.99999999)
                  {
                     this.§_-p2C§ = 0;
                     this.§_-n2Q§ = NaN;
                  }
                  else if(this.§_-El§.displayIndex < 0 || _loc6_.displayIndex < 0 || !this.§_-Q28§.§_-n1§)
                  {
                     this.§_-n2Q§ = NaN;
                  }
                  else if(isNaN(this.§_-Q28§.clip.tweenEasing))
                  {
                     this.§_-n2Q§ = this.§_-El§.tweenEasing;
                  }
                  else
                  {
                     this.§_-n2Q§ = this.§_-Q28§.clip.tweenEasing;
                  }
                  if(isNaN(this.§_-n2Q§))
                  {
                     this.§_-CX§ = false;
                     this.§_-C1C§ = false;
                  }
                  else
                  {
                     this.§_-Z1g§.x = _loc6_.transform.x - this.§_-El§.transform.x;
                     this.§_-Z1g§.y = _loc6_.transform.y - this.§_-El§.transform.y;
                     this.§_-Z1g§.skewX = _loc6_.transform.skewX - this.§_-El§.transform.skewX;
                     this.§_-Z1g§.skewY = _loc6_.transform.skewY - this.§_-El§.transform.skewY;
                     this.§_-Z1g§.scaleX = _loc6_.transform.scaleX - this.§_-El§.transform.scaleX;
                     this.§_-Z1g§.scaleY = _loc6_.transform.scaleY - this.§_-El§.transform.scaleY;
                     if(_loc5_ == 0)
                     {
                        this.§_-Z1g§.skewX = §_-G9§.§_-n1w§(this.§_-Z1g§.skewX);
                        this.§_-Z1g§.skewY = §_-G9§.§_-n1w§(this.§_-Z1g§.skewY);
                     }
                     this.§_-qE§.x = _loc6_.pivot.x - this.§_-El§.pivot.x;
                     this.§_-qE§.y = _loc6_.pivot.y - this.§_-El§.pivot.y;
                     if(this.§_-Z1g§.x != 0 || this.§_-Z1g§.y != 0 || this.§_-Z1g§.skewX != 0 || this.§_-Z1g§.skewY != 0 || this.§_-Z1g§.scaleX != 0 || this.§_-Z1g§.scaleY != 0 || this.§_-qE§.x != 0 || this.§_-qE§.y != 0)
                     {
                        this.§_-CX§ = true;
                     }
                     else
                     {
                        this.§_-CX§ = false;
                     }
                     if(Boolean(this.§_-El§.color) && Boolean(_loc6_.color))
                     {
                        this.§_-v25§.alphaOffset = _loc6_.color.alphaOffset - this.§_-El§.color.alphaOffset;
                        this.§_-v25§.redOffset = _loc6_.color.redOffset - this.§_-El§.color.redOffset;
                        this.§_-v25§.greenOffset = _loc6_.color.greenOffset - this.§_-El§.color.greenOffset;
                        this.§_-v25§.blueOffset = _loc6_.color.blueOffset - this.§_-El§.color.blueOffset;
                        this.§_-v25§.alphaMultiplier = _loc6_.color.alphaMultiplier - this.§_-El§.color.alphaMultiplier;
                        this.§_-v25§.redMultiplier = _loc6_.color.redMultiplier - this.§_-El§.color.redMultiplier;
                        this.§_-v25§.greenMultiplier = _loc6_.color.greenMultiplier - this.§_-El§.color.greenMultiplier;
                        this.§_-v25§.blueMultiplier = _loc6_.color.blueMultiplier - this.§_-El§.color.blueMultiplier;
                        if(this.§_-v25§.alphaOffset != 0 || this.§_-v25§.redOffset != 0 || this.§_-v25§.greenOffset != 0 || this.§_-v25§.blueOffset != 0 || this.§_-v25§.alphaMultiplier != 0 || this.§_-v25§.redMultiplier != 0 || this.§_-v25§.greenMultiplier != 0 || this.§_-v25§.blueMultiplier != 0)
                        {
                           this.§_-C1C§ = true;
                        }
                        else
                        {
                           this.§_-C1C§ = false;
                        }
                     }
                     else if(this.§_-El§.color)
                     {
                        this.§_-C1C§ = true;
                        this.§_-v25§.alphaOffset = -this.§_-El§.color.alphaOffset;
                        this.§_-v25§.redOffset = -this.§_-El§.color.redOffset;
                        this.§_-v25§.greenOffset = -this.§_-El§.color.greenOffset;
                        this.§_-v25§.blueOffset = -this.§_-El§.color.blueOffset;
                        this.§_-v25§.alphaMultiplier = 1 - this.§_-El§.color.alphaMultiplier;
                        this.§_-v25§.redMultiplier = 1 - this.§_-El§.color.redMultiplier;
                        this.§_-v25§.greenMultiplier = 1 - this.§_-El§.color.greenMultiplier;
                        this.§_-v25§.blueMultiplier = 1 - this.§_-El§.color.blueMultiplier;
                     }
                     else if(_loc6_.color)
                     {
                        this.§_-C1C§ = true;
                        this.§_-v25§.alphaOffset = _loc6_.color.alphaOffset;
                        this.§_-v25§.redOffset = _loc6_.color.redOffset;
                        this.§_-v25§.greenOffset = _loc6_.color.greenOffset;
                        this.§_-v25§.blueOffset = _loc6_.color.blueOffset;
                        --_loc6_.color.alphaMultiplier;
                        --_loc6_.color.redMultiplier;
                        --_loc6_.color.greenMultiplier;
                        --_loc6_.color.blueMultiplier;
                     }
                     else
                     {
                        this.§_-C1C§ = false;
                     }
                  }
                  if(!this.§_-CX§)
                  {
                     if(this.§_-Q28§.§_-Z1§)
                     {
                        this.transform.x = this.§_-B3E§.x + this.§_-El§.transform.x;
                        this.transform.y = this.§_-B3E§.y + this.§_-El§.transform.y;
                        this.transform.skewX = this.§_-B3E§.skewX + this.§_-El§.transform.skewX;
                        this.transform.skewY = this.§_-B3E§.skewY + this.§_-El§.transform.skewY;
                        this.transform.scaleX = this.§_-B3E§.scaleX + this.§_-El§.transform.scaleX;
                        this.transform.scaleY = this.§_-B3E§.scaleY + this.§_-El§.transform.scaleY;
                        this.pivot.x = this.§_-Dm§.x + this.§_-El§.pivot.x;
                        this.pivot.y = this.§_-Dm§.y + this.§_-El§.pivot.y;
                     }
                     else
                     {
                        this.transform.x = this.§_-El§.transform.x;
                        this.transform.y = this.§_-El§.transform.y;
                        this.transform.skewX = this.§_-El§.transform.skewX;
                        this.transform.skewY = this.§_-El§.transform.skewY;
                        this.transform.scaleX = this.§_-El§.transform.scaleX;
                        this.transform.scaleY = this.§_-El§.transform.scaleY;
                        this.pivot.x = this.§_-El§.pivot.x;
                        this.pivot.y = this.§_-El§.pivot.y;
                     }
                  }
                  if(!this.§_-C1C§)
                  {
                     if(this.§_-El§.color)
                     {
                        this.§_-327§.§_-zJ§(this.§_-El§.color.alphaOffset,this.§_-El§.color.redOffset,this.§_-El§.color.greenOffset,this.§_-El§.color.blueOffset,this.§_-El§.color.alphaMultiplier,this.§_-El§.color.redMultiplier,this.§_-El§.color.greenMultiplier,this.§_-El§.color.blueMultiplier,true);
                     }
                     else if(this.§_-327§.§_-fS§)
                     {
                        this.§_-327§.§_-zJ§(0,0,0,0,1,1,1,1,false);
                     }
                  }
                  this.§_-327§.§_-P1L§(this.§_-El§,this,this.§_-Q28§,false);
               }
               if(this.§_-CX§ || this.§_-C1C§)
               {
                  param1 = (_loc3_ - this.§_-q2w§) / this.§_-43j§;
                  if(this.§_-n2Q§)
                  {
                     param1 = §_-81D§(param1,this.§_-n2Q§);
                  }
               }
               if(this.§_-CX§)
               {
                  _loc7_ = this.§_-El§.transform;
                  _loc8_ = this.§_-El§.pivot;
                  if(this.§_-Q28§.§_-Z1§)
                  {
                     this.transform.x = this.§_-B3E§.x + _loc7_.x + this.§_-Z1g§.x * param1;
                     this.transform.y = this.§_-B3E§.y + _loc7_.y + this.§_-Z1g§.y * param1;
                     this.transform.skewX = this.§_-B3E§.skewX + _loc7_.skewX + this.§_-Z1g§.skewX * param1;
                     this.transform.skewY = this.§_-B3E§.skewY + _loc7_.skewY + this.§_-Z1g§.skewY * param1;
                     this.transform.scaleX = this.§_-B3E§.scaleX + _loc7_.scaleX + this.§_-Z1g§.scaleX * param1;
                     this.transform.scaleY = this.§_-B3E§.scaleY + _loc7_.scaleY + this.§_-Z1g§.scaleY * param1;
                     this.pivot.x = this.§_-Dm§.x + _loc8_.x + this.§_-qE§.x * param1;
                     this.pivot.y = this.§_-Dm§.y + _loc8_.y + this.§_-qE§.y * param1;
                  }
                  else
                  {
                     this.transform.x = _loc7_.x + this.§_-Z1g§.x * param1;
                     this.transform.y = _loc7_.y + this.§_-Z1g§.y * param1;
                     this.transform.skewX = _loc7_.skewX + this.§_-Z1g§.skewX * param1;
                     this.transform.skewY = _loc7_.skewY + this.§_-Z1g§.skewY * param1;
                     this.transform.scaleX = _loc7_.scaleX + this.§_-Z1g§.scaleX * param1;
                     this.transform.scaleY = _loc7_.scaleY + this.§_-Z1g§.scaleY * param1;
                     this.pivot.x = _loc8_.x + this.§_-qE§.x * param1;
                     this.pivot.y = _loc8_.y + this.§_-qE§.y * param1;
                  }
               }
               if(this.§_-C1C§)
               {
                  if(this.§_-El§.color)
                  {
                     this.§_-327§.§_-zJ§(this.§_-El§.color.alphaOffset + this.§_-v25§.alphaOffset * param1,this.§_-El§.color.redOffset + this.§_-v25§.redOffset * param1,this.§_-El§.color.greenOffset + this.§_-v25§.greenOffset * param1,this.§_-El§.color.blueOffset + this.§_-v25§.blueOffset * param1,this.§_-El§.color.alphaMultiplier + this.§_-v25§.alphaMultiplier * param1,this.§_-El§.color.redMultiplier + this.§_-v25§.redMultiplier * param1,this.§_-El§.color.greenMultiplier + this.§_-v25§.greenMultiplier * param1,this.§_-El§.color.blueMultiplier + this.§_-v25§.blueMultiplier * param1,true);
                  }
                  else
                  {
                     this.§_-327§.§_-zJ§(this.§_-v25§.alphaOffset * param1,this.§_-v25§.redOffset * param1,this.§_-v25§.greenOffset * param1,this.§_-v25§.blueOffset * param1,1 + this.§_-v25§.alphaMultiplier * param1,1 + this.§_-v25§.redMultiplier * param1,1 + this.§_-v25§.greenMultiplier * param1,1 + this.§_-v25§.blueMultiplier * param1,true);
                  }
               }
            }
            else
            {
               this.§_-p2C§ = 0;
               if(this.§_-Q28§.§_-Z1§)
               {
                  this.transform.copy(this.§_-B3E§);
                  this.pivot.x = this.§_-Dm§.x;
                  this.pivot.y = this.§_-Dm§.y;
               }
               else
               {
                  this.transform.x = this.transform.y = this.transform.skewX = this.transform.skewY = this.transform.scaleX = this.transform.scaleY = 0;
                  this.pivot.x = 0;
                  this.pivot.y = 0;
               }
               this.§_-El§ = this.§_-c1q§.frameList[0] as TransformFrame;
               this.§_-k2V§ = this.§_-El§.displayIndex >= 0;
               if(this.§_-El§.color)
               {
                  this.§_-327§.§_-zJ§(this.§_-El§.color.alphaOffset,this.§_-El§.color.redOffset,this.§_-El§.color.greenOffset,this.§_-El§.color.blueOffset,this.§_-El§.color.alphaMultiplier,this.§_-El§.color.redMultiplier,this.§_-El§.color.greenMultiplier,this.§_-El§.color.blueMultiplier,true);
               }
               else
               {
                  this.§_-327§.§_-zJ§(0,0,0,0,1,1,1,1,false);
               }
               this.§_-327§.§_-P1L§(this.§_-El§,this,this.§_-Q28§,false);
            }
         }
      }
      
      private function clear() : void
      {
         this.§_-p2C§ = 0;
         this.§_-327§ = null;
         this.§_-Q28§ = null;
         this.§_-c1q§ = null;
         this.§_-El§ = null;
         this.§_-B3E§ = null;
         this.§_-Dm§ = null;
      }
   }
}

