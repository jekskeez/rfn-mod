package dragonBones.objects
{
   import dragonBones.core.§_-Zf§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.utils.ConstValues;
   import dragonBones.utils.DBDataUtil;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   use namespace dragonBones_internal;
   
   public final class §_-m1e§
   {
      
      public function §_-m1e§()
      {
         super();
      }
      
      public static function §_-637§(param1:Object, param2:Number = 1) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:Rectangle = null;
         var _loc3_:Object = {};
         _loc3_.__name = param1[ConstValues.A_NAME];
         for each(_loc4_ in param1[ConstValues.§_-K1F§])
         {
            _loc5_ = _loc4_[ConstValues.A_NAME];
            _loc6_ = new Rectangle();
            _loc6_.x = int(_loc4_[ConstValues.A_X]) / param2;
            _loc6_.y = int(_loc4_[ConstValues.A_Y]) / param2;
            _loc6_.width = int(_loc4_[ConstValues.§_-l2H§]) / param2;
            _loc6_.height = int(_loc4_[ConstValues.§_-X1u§]) / param2;
            _loc3_[_loc5_] = _loc6_;
         }
         return _loc3_;
      }
      
      public static function §_-r2o§(param1:Object) : SkeletonData
      {
         var _loc5_:Object = null;
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc2_:String = param1[ConstValues.A_VERSION];
         switch(_loc2_)
         {
            case §_-Zf§.§_-W2x§:
               var _loc3_:uint = uint(int(param1[ConstValues.A_FRAME_RATE]));
               var _loc4_:SkeletonData = new SkeletonData();
               _loc4_.name = param1[ConstValues.A_NAME];
               for each(_loc5_ in param1[ConstValues.ARMATURE])
               {
                  _loc4_.§_-Bf§(parseArmatureData(_loc5_,_loc4_,_loc3_));
               }
               return _loc4_;
            default:
               throw new Error("Nonsupport version!");
         }
      }
      
      private static function parseArmatureData(param1:Object, param2:SkeletonData, param3:uint) : ArmatureData
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc4_:ArmatureData = new ArmatureData();
         _loc4_.name = param1[ConstValues.A_NAME];
         for each(_loc5_ in param1[ConstValues.BONE])
         {
            _loc4_.addBoneData(parseBoneData(_loc5_));
         }
         for each(_loc6_ in param1[ConstValues.§_-X1j§])
         {
            _loc4_.addSkinData(parseSkinData(_loc6_,param2));
         }
         DBDataUtil.transformArmatureData(_loc4_);
         _loc4_.sortBoneDataList();
         for each(_loc7_ in param1[ConstValues.ANIMATION])
         {
            _loc4_.§_-K28§(parseAnimationData(_loc7_,_loc4_,param3));
         }
         return _loc4_;
      }
      
      private static function parseBoneData(param1:Object) : BoneData
      {
         var _loc5_:int = 0;
         var _loc2_:BoneData = new BoneData();
         _loc2_.name = param1[ConstValues.A_NAME];
         _loc2_.parent = param1[ConstValues.A_PARENT];
         _loc2_.length = Number(param1[ConstValues.§_-11h§]) || 0;
         var _loc3_:Object = param1[ConstValues.§_-Ec§];
         if(_loc3_)
         {
            _loc5_ = _loc3_ as int;
            _loc2_.scaleMode = _loc5_;
         }
         var _loc4_:Boolean = param1[ConstValues.§_-y1Y§] as Boolean;
         if(_loc4_)
         {
            _loc2_.fixedRotation = _loc4_;
         }
         parseTransform(param1[ConstValues.§_-b1l§],_loc2_.global);
         _loc2_.transform.copy(_loc2_.global);
         return _loc2_;
      }
      
      private static function parseSkinData(param1:Object, param2:SkeletonData) : SkinData
      {
         var _loc4_:Object = null;
         var _loc3_:SkinData = new SkinData();
         _loc3_.name = param1[ConstValues.A_NAME];
         for each(_loc4_ in param1[ConstValues.§_-z2j§])
         {
            _loc3_.addSlotData(parseSlotData(_loc4_,param2));
         }
         return _loc3_;
      }
      
      private static function parseSlotData(param1:Object, param2:SkeletonData) : SlotData
      {
         var _loc4_:Object = null;
         var _loc3_:SlotData = new SlotData();
         _loc3_.name = param1[ConstValues.A_NAME];
         _loc3_.parent = param1[ConstValues.A_PARENT];
         _loc3_.zOrder = Number(param1[ConstValues.A_Z_ORDER]);
         _loc3_.blendMode = param1[ConstValues.§_-y16§];
         if(!_loc3_.blendMode)
         {
            _loc3_.blendMode = "normal";
         }
         for each(_loc4_ in param1[ConstValues.DISPLAY])
         {
            _loc3_.addDisplayData(parseDisplayData(_loc4_,param2));
         }
         return _loc3_;
      }
      
      private static function parseDisplayData(param1:Object, param2:SkeletonData) : DisplayData
      {
         var _loc3_:DisplayData = new DisplayData();
         _loc3_.name = param1[ConstValues.A_NAME];
         _loc3_.type = param1[ConstValues.A_TYPE];
         _loc3_.pivot = param2.addSubTexturePivot(0,0,_loc3_.name);
         parseTransform(param1[ConstValues.§_-b1l§],_loc3_.transform,_loc3_.pivot);
         return _loc3_;
      }
      
      private static function parseAnimationData(param1:Object, param2:ArmatureData, param3:uint) : AnimationData
      {
         var _loc5_:TransformTimeline = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:* = undefined;
         var _loc4_:AnimationData = new AnimationData();
         _loc4_.name = param1[ConstValues.A_NAME];
         _loc4_.frameRate = param3;
         _loc4_.loop = int(param1[ConstValues.A_LOOP]);
         _loc4_.fadeInTime = Number(param1[ConstValues.A_FADE_IN_TIME]);
         _loc4_.duration = Number(param1[ConstValues.A_DURATION]) / param3;
         _loc4_.scale = Number(param1[ConstValues.A_SCALE]);
         if(ConstValues.A_TWEEN_EASING in param1)
         {
            _loc8_ = param1[ConstValues.A_TWEEN_EASING];
            if(_loc8_ == undefined || _loc8_ == null)
            {
               _loc4_.tweenEasing = NaN;
            }
            else
            {
               _loc4_.tweenEasing = Number(_loc8_);
            }
         }
         else
         {
            _loc4_.tweenEasing = NaN;
         }
         parseTimeline(param1,_loc4_,parseMainFrame,param3);
         for each(_loc7_ in param1[ConstValues.§_-sI§])
         {
            _loc5_ = parseTransformTimeline(_loc7_,_loc4_.duration,param3);
            _loc6_ = _loc7_[ConstValues.A_NAME];
            _loc4_.addTimeline(_loc5_,_loc6_);
         }
         DBDataUtil.addHideTimeline(_loc4_,param2);
         DBDataUtil.transformAnimationData(_loc4_,param2);
         return _loc4_;
      }
      
      private static function parseTimeline(param1:Object, param2:Timeline, param3:Function, param4:uint) : void
      {
         var _loc6_:Frame = null;
         var _loc7_:Object = null;
         var _loc5_:Number = 0;
         for each(_loc7_ in param1[ConstValues.FRAME])
         {
            _loc6_ = param3(_loc7_,param4);
            _loc6_.position = _loc5_;
            param2.addFrame(_loc6_);
            _loc5_ += _loc6_.duration;
         }
         if(_loc6_)
         {
            _loc6_.duration = param2.duration - _loc6_.position;
         }
      }
      
      private static function parseTransformTimeline(param1:Object, param2:Number, param3:uint) : TransformTimeline
      {
         var _loc4_:TransformTimeline = new TransformTimeline();
         _loc4_.duration = param2;
         parseTimeline(param1,_loc4_,parseTransformFrame,param3);
         _loc4_.scale = Number(param1[ConstValues.A_SCALE]);
         _loc4_.offset = Number(param1[ConstValues.A_OFFSET]);
         return _loc4_;
      }
      
      private static function parseFrame(param1:Object, param2:Frame, param3:uint) : void
      {
         param2.duration = Number(param1[ConstValues.A_DURATION]) / param3;
         param2.action = param1[ConstValues.A_ACTION];
         param2.event = param1[ConstValues.A_EVENT];
         param2.sound = param1[ConstValues.A_SOUND];
      }
      
      private static function parseMainFrame(param1:Object, param2:uint) : Frame
      {
         var _loc3_:Frame = new Frame();
         parseFrame(param1,_loc3_,param2);
         return _loc3_;
      }
      
      private static function parseTransformFrame(param1:Object, param2:uint) : TransformFrame
      {
         var _loc5_:* = undefined;
         var _loc3_:TransformFrame = new TransformFrame();
         parseFrame(param1,_loc3_,param2);
         _loc3_.visible = uint(param1[ConstValues.§_-212§]) != 1;
         if(ConstValues.A_TWEEN_EASING in param1)
         {
            _loc5_ = param1[ConstValues.A_TWEEN_EASING];
            if(_loc5_ == undefined || _loc5_ == null)
            {
               _loc3_.tweenEasing = NaN;
            }
            else
            {
               _loc3_.tweenEasing = Number(_loc5_);
            }
         }
         else
         {
            _loc3_.tweenEasing = 0;
         }
         _loc3_.tweenRotate = Number(param1[ConstValues.A_TWEEN_ROTATE]);
         _loc3_.displayIndex = Number(param1[ConstValues.A_DISPLAY_INDEX]);
         _loc3_.zOrder = Number(param1[ConstValues.A_Z_ORDER]);
         parseTransform(param1[ConstValues.§_-b1l§],_loc3_.global,_loc3_.pivot);
         _loc3_.transform.copy(_loc3_.global);
         var _loc4_:Object = param1[ConstValues.COLOR_TRANSFORM];
         if(_loc4_)
         {
            _loc3_.color = new ColorTransform();
            _loc3_.color.alphaOffset = Number(_loc4_[ConstValues.A_ALPHA_OFFSET]);
            _loc3_.color.redOffset = Number(_loc4_[ConstValues.A_RED_OFFSET]);
            _loc3_.color.greenOffset = Number(_loc4_[ConstValues.A_GREEN_OFFSET]);
            _loc3_.color.blueOffset = Number(_loc4_[ConstValues.A_BLUE_OFFSET]);
            _loc3_.color.alphaMultiplier = Number(_loc4_[ConstValues.A_ALPHA_MULTIPLIER]) * 0.01;
            _loc3_.color.redMultiplier = Number(_loc4_[ConstValues.A_RED_MULTIPLIER]) * 0.01;
            _loc3_.color.greenMultiplier = Number(_loc4_[ConstValues.A_GREEN_MULTIPLIER]) * 0.01;
            _loc3_.color.blueMultiplier = Number(_loc4_[ConstValues.A_BLUE_MULTIPLIER]) * 0.01;
         }
         return _loc3_;
      }
      
      private static function parseTransform(param1:Object, param2:DBTransform, param3:Point = null) : void
      {
         if(param1)
         {
            if(param2)
            {
               param2.x = Number(param1[ConstValues.A_X]);
               param2.y = Number(param1[ConstValues.A_Y]);
               param2.skewX = Number(param1[ConstValues.A_SKEW_X]) * ConstValues.ANGLE_TO_RADIAN;
               param2.skewY = Number(param1[ConstValues.A_SKEW_Y]) * ConstValues.ANGLE_TO_RADIAN;
               param2.scaleX = Number(param1[ConstValues.A_SCALE_X]);
               param2.scaleY = Number(param1[ConstValues.A_SCALE_Y]);
            }
            if(param3)
            {
               param3.x = Number(param1[ConstValues.A_PIVOT_X]);
               param3.y = Number(param1[ConstValues.A_PIVOT_Y]);
            }
         }
      }
   }
}

