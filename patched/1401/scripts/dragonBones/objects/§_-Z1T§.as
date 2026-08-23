package dragonBones.objects
{
   import dragonBones.core.§_-bd§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.utils.ConstValues;
   import dragonBones.utils.DBDataUtil;
   import dragonBones.utils.parseOldXMLData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   use namespace dragonBones_internal;
   
   public final class §_-Z1T§
   {
      
      public function §_-Z1T§()
      {
         super();
      }
      
      public static function §_-o1z§(param1:XML, param2:Number = 1) : Object
      {
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc6_:Rectangle = null;
         var _loc3_:Object = {};
         _loc3_.__name = param1[ConstValues.A_NAME];
         for each(_loc4_ in param1[ConstValues.§_-Ax§])
         {
            _loc5_ = _loc4_[ConstValues.A_NAME];
            _loc6_ = new Rectangle();
            _loc6_.x = int(_loc4_[ConstValues.A_X]) / param2;
            _loc6_.y = int(_loc4_[ConstValues.A_Y]) / param2;
            _loc6_.width = int(_loc4_[ConstValues.§_-83m§]) / param2;
            _loc6_.height = int(_loc4_[ConstValues.§_-D2Q§]) / param2;
            _loc3_[_loc5_] = _loc6_;
         }
         return _loc3_;
      }
      
      public static function §_-e1C§(param1:XML) : SkeletonData
      {
         var _loc5_:XML = null;
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc2_:String = param1[ConstValues.A_VERSION];
         switch(_loc2_)
         {
            case "1.5":
            case "2.0":
            case "2.1":
            case "2.1.1":
            case "2.1.2":
            case "2.2":
               return parseOldXMLData(param1 as XML);
            case §_-bd§.§_-gy§:
               var _loc3_:uint = uint(int(param1[ConstValues.A_FRAME_RATE]));
               var _loc4_:SkeletonData = new SkeletonData();
               _loc4_.name = param1[ConstValues.A_NAME];
               for each(_loc5_ in param1[ConstValues.ARMATURE])
               {
                  _loc4_.§_-8b§(parseArmatureData(_loc5_,_loc4_,_loc3_));
               }
               return _loc4_;
            default:
               throw new Error("Nonsupport version!");
         }
      }
      
      private static function parseArmatureData(param1:XML, param2:SkeletonData, param3:uint) : ArmatureData
      {
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc4_:ArmatureData = new ArmatureData();
         _loc4_.name = param1[ConstValues.A_NAME];
         for each(_loc5_ in param1[ConstValues.BONE])
         {
            _loc4_.addBoneData(parseBoneData(_loc5_));
         }
         for each(_loc6_ in param1[ConstValues.§_-4C§])
         {
            _loc4_.addSkinData(parseSkinData(_loc6_,param2));
         }
         DBDataUtil.transformArmatureData(_loc4_);
         _loc4_.sortBoneDataList();
         for each(_loc7_ in param1[ConstValues.ANIMATION])
         {
            _loc4_.§_-M19§(parseAnimationData(_loc7_,_loc4_,param3));
         }
         return _loc4_;
      }
      
      private static function parseBoneData(param1:XML) : BoneData
      {
         var _loc2_:BoneData = new BoneData();
         _loc2_.name = param1[ConstValues.A_NAME];
         _loc2_.parent = param1[ConstValues.A_PARENT];
         _loc2_.length = Number(param1[ConstValues.§_-q2m§]);
         var _loc3_:String = param1[ConstValues.§_-A2y§];
         if(_loc3_)
         {
            _loc2_.scaleMode = parseInt(_loc3_);
         }
         var _loc4_:String = param1[ConstValues.§_-y1h§][0];
         switch(_loc4_)
         {
            case "0":
            case "false":
            case "no":
            case "":
            case null:
               _loc2_.fixedRotation = false;
               break;
            default:
               _loc2_.fixedRotation = true;
         }
         parseTransform(param1[ConstValues.§_-a2i§][0],_loc2_.global);
         _loc2_.transform.copy(_loc2_.global);
         return _loc2_;
      }
      
      private static function parseSkinData(param1:XML, param2:SkeletonData) : SkinData
      {
         var _loc4_:XML = null;
         var _loc3_:SkinData = new SkinData();
         _loc3_.name = param1[ConstValues.A_NAME];
         for each(_loc4_ in param1[ConstValues.§_-11T§])
         {
            _loc3_.addSlotData(parseSlotData(_loc4_,param2));
         }
         return _loc3_;
      }
      
      private static function parseSlotData(param1:XML, param2:SkeletonData) : SlotData
      {
         var _loc4_:XML = null;
         var _loc3_:SlotData = new SlotData();
         _loc3_.name = param1[ConstValues.A_NAME];
         _loc3_.parent = param1[ConstValues.A_PARENT];
         _loc3_.zOrder = Number(param1[ConstValues.A_Z_ORDER]);
         _loc3_.blendMode = param1[ConstValues.§_-u28§];
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
      
      private static function parseDisplayData(param1:XML, param2:SkeletonData) : DisplayData
      {
         var _loc3_:DisplayData = new DisplayData();
         _loc3_.name = param1[ConstValues.A_NAME];
         _loc3_.type = param1[ConstValues.A_TYPE];
         _loc3_.pivot = param2.addSubTexturePivot(0,0,_loc3_.name);
         parseTransform(param1[ConstValues.§_-a2i§][0],_loc3_.transform,_loc3_.pivot);
         return _loc3_;
      }
      
      dragonBones_internal static function parseAnimationData(param1:XML, param2:ArmatureData, param3:uint) : AnimationData
      {
         var _loc5_:TransformTimeline = null;
         var _loc6_:String = null;
         var _loc7_:XML = null;
         var _loc4_:AnimationData = new AnimationData();
         _loc4_.name = param1[ConstValues.A_NAME];
         _loc4_.frameRate = param3;
         _loc4_.loop = int(param1[ConstValues.A_LOOP]);
         _loc4_.fadeInTime = Number(param1[ConstValues.A_FADE_IN_TIME]);
         _loc4_.duration = Number(param1[ConstValues.A_DURATION]) / param3;
         _loc4_.scale = Number(param1[ConstValues.A_SCALE]);
         _loc4_.tweenEasing = Number(param1[ConstValues.A_TWEEN_EASING]);
         parseTimeline(param1,_loc4_,parseMainFrame,param3);
         for each(_loc7_ in param1[ConstValues.§_-w2H§])
         {
            _loc5_ = parseTransformTimeline(_loc7_,_loc4_.duration,param3);
            _loc6_ = _loc7_[ConstValues.A_NAME];
            _loc4_.addTimeline(_loc5_,_loc6_);
         }
         DBDataUtil.addHideTimeline(_loc4_,param2);
         DBDataUtil.transformAnimationData(_loc4_,param2);
         return _loc4_;
      }
      
      private static function parseTimeline(param1:XML, param2:Timeline, param3:Function, param4:uint) : void
      {
         var _loc6_:Frame = null;
         var _loc7_:XML = null;
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
      
      private static function parseTransformTimeline(param1:XML, param2:Number, param3:uint) : TransformTimeline
      {
         var _loc4_:TransformTimeline = new TransformTimeline();
         _loc4_.duration = param2;
         parseTimeline(param1,_loc4_,parseTransformFrame,param3);
         _loc4_.scale = Number(param1[ConstValues.A_SCALE]);
         _loc4_.offset = Number(param1[ConstValues.A_OFFSET]);
         return _loc4_;
      }
      
      private static function parseFrame(param1:XML, param2:Frame, param3:uint) : void
      {
         param2.duration = Number(param1[ConstValues.A_DURATION]) / param3;
         param2.action = param1[ConstValues.A_ACTION];
         param2.event = param1[ConstValues.A_EVENT];
         param2.sound = param1[ConstValues.A_SOUND];
      }
      
      private static function parseMainFrame(param1:XML, param2:uint) : Frame
      {
         var _loc3_:Frame = new Frame();
         parseFrame(param1,_loc3_,param2);
         return _loc3_;
      }
      
      private static function parseTransformFrame(param1:XML, param2:uint) : TransformFrame
      {
         var _loc3_:TransformFrame = new TransformFrame();
         parseFrame(param1,_loc3_,param2);
         _loc3_.visible = uint(param1[ConstValues.§_-30§]) != 1;
         _loc3_.tweenEasing = Number(param1[ConstValues.A_TWEEN_EASING]);
         _loc3_.tweenRotate = Number(param1[ConstValues.A_TWEEN_ROTATE]);
         _loc3_.displayIndex = Number(param1[ConstValues.A_DISPLAY_INDEX]);
         _loc3_.zOrder = Number(param1[ConstValues.A_Z_ORDER][0]);
         parseTransform(param1[ConstValues.§_-a2i§][0],_loc3_.global,_loc3_.pivot);
         _loc3_.transform.copy(_loc3_.global);
         var _loc4_:XML = param1[ConstValues.COLOR_TRANSFORM][0];
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
      
      private static function parseTransform(param1:XML, param2:DBTransform, param3:Point = null) : void
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

