package dragonBones.utils
{
   import dragonBones.objects.ArmatureData;
   import dragonBones.objects.SkeletonData;
   
   public function parseOldXMLData(param1:XML) : SkeletonData
   {
      var _loc4_:XML = null;
      var _loc5_:XML = null;
      var _loc6_:ArmatureData = null;
      var _loc7_:XML = null;
      var _loc2_:uint = uint(int(param1[A_FRAME_RATE]));
      var _loc3_:SkeletonData = new SkeletonData();
      _loc3_.name = param1[A_NAME];
      for each(_loc4_ in param1[ARMATURES][ARMATURE])
      {
         _loc3_.§_-8b§(parseArmatureData(_loc4_,_loc3_));
      }
      for each(_loc5_ in param1[ANIMATIONS][ANIMATION])
      {
         _loc6_ = _loc3_.§_-219§(_loc5_[A_NAME]);
         if(_loc6_)
         {
            for each(_loc7_ in _loc5_[MOVEMENT])
            {
               _loc6_.§_-M19§(parseAnimationData(_loc7_,_loc6_,_loc2_));
            }
         }
      }
      return _loc3_;
   }
}

import dragonBones.objects.AnimationData;
import dragonBones.objects.ArmatureData;
import dragonBones.objects.BoneData;
import dragonBones.objects.DBTransform;
import dragonBones.objects.DisplayData;
import dragonBones.objects.Frame;
import dragonBones.objects.SkeletonData;
import dragonBones.objects.SkinData;
import dragonBones.objects.SlotData;
import dragonBones.objects.Timeline;
import dragonBones.objects.TransformFrame;
import dragonBones.objects.TransformTimeline;
import flash.geom.ColorTransform;
import flash.geom.Point;

function parseArmatureData(param1:XML, param2:SkeletonData):ArmatureData
{
   var _loc4_:XML = null;
   var _loc3_:ArmatureData = new ArmatureData();
   _loc3_.name = param1[A_NAME];
   for each(_loc4_ in param1[BONE])
   {
      _loc3_.addBoneData(parseBoneData(_loc4_));
   }
   _loc3_.addSkinData(parseSkinData(param1,param2));
   DBDataUtil.transformArmatureData(_loc3_);
   _loc3_.sortBoneDataList();
   return _loc3_;
}
function parseBoneData(param1:XML):BoneData
{
   var _loc2_:BoneData = new BoneData();
   _loc2_.name = param1[A_NAME];
   _loc2_.parent = param1[A_PARENT];
   parseTransform(param1,_loc2_.global);
   _loc2_.transform.copy(_loc2_.global);
   return _loc2_;
}
function parseSkinData(param1:XML, param2:SkeletonData):SkinData
{
   var _loc4_:XML = null;
   var _loc3_:SkinData = new SkinData();
   for each(_loc4_ in param1[BONE])
   {
      _loc3_.addSlotData(parseSlotData(_loc4_,param2));
   }
   return _loc3_;
}
function parseSlotData(param1:XML, param2:SkeletonData):SlotData
{
   var _loc4_:XML = null;
   var _loc5_:DisplayData = null;
   var _loc3_:SlotData = new SlotData();
   _loc3_.name = param1[A_NAME];
   _loc3_.parent = _loc3_.name;
   _loc3_.zOrder = param1[A_Z_ORDER];
   for each(_loc4_ in param1[DISPLAY])
   {
      _loc5_ = parseDisplayData(_loc4_,param2);
      _loc3_.addDisplayData(_loc5_);
   }
   return _loc3_;
}
function parseDisplayData(param1:XML, param2:SkeletonData):DisplayData
{
   var _loc3_:DisplayData = new DisplayData();
   _loc3_.name = param1[A_NAME];
   if(uint(param1[A_TYPE]) == 1)
   {
      _loc3_.type = DisplayData.ARMATURE;
   }
   else
   {
      _loc3_.type = DisplayData.IMAGE;
   }
   _loc3_.transform.x = NaN;
   _loc3_.transform.y = NaN;
   _loc3_.transform.skewX = 0;
   _loc3_.transform.skewY = 0;
   _loc3_.transform.scaleX = 1;
   _loc3_.transform.scaleY = 1;
   _loc3_.pivot = param2.addSubTexturePivot(Number(param1[A_PIVOT_X]),Number(param1[A_PIVOT_Y]),_loc3_.name);
   return _loc3_;
}
function parseAnimationData(param1:XML, param2:ArmatureData, param3:uint):AnimationData
{
   var _loc7_:SlotData = null;
   var _loc8_:TransformTimeline = null;
   var _loc9_:String = null;
   var _loc10_:XML = null;
   var _loc4_:AnimationData = new AnimationData();
   _loc4_.name = param1[A_NAME];
   _loc4_.frameRate = param3;
   _loc4_.loop = uint(param1[A_LOOP]) == 1 ? 0 : 1;
   _loc4_.fadeInTime = uint(param1[A_FADE_IN_TIME]) / param3;
   _loc4_.duration = uint(param1[A_DURATION]) / param3;
   var _loc5_:Number = Number(param1[A_DURATION_TWEEN][0]);
   if(isNaN(_loc5_))
   {
      _loc4_.scale = 1;
   }
   else
   {
      _loc4_.scale = _loc5_ / param3 / _loc4_.duration;
   }
   _loc4_.tweenEasing = Number(param1[A_TWEEN_EASING][0]);
   parseTimeline(param1,_loc4_,parseMainFrame,param3);
   var _loc6_:SkinData = param2.skinDataList[0];
   for each(_loc10_ in param1[BONE])
   {
      _loc8_ = parseTransformTimeline(_loc10_,_loc4_.duration,param3);
      _loc9_ = _loc10_[A_NAME];
      _loc4_.addTimeline(_loc8_,_loc9_);
      if(_loc6_)
      {
         _loc7_ = _loc6_.getSlotData(_loc9_);
         formatDisplayTransformXYAndTimelinePivot(_loc7_,_loc8_);
      }
   }
   DBDataUtil.addHideTimeline(_loc4_,param2);
   DBDataUtil.transformAnimationData(_loc4_,param2);
   return _loc4_;
}
function parseTimeline(param1:XML, param2:Timeline, param3:Function, param4:uint):void
{
   var _loc6_:Frame = null;
   var _loc7_:XML = null;
   var _loc5_:Number = 0;
   for each(_loc7_ in param1[FRAME])
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
function parseTransformTimeline(param1:XML, param2:Number, param3:uint):TransformTimeline
{
   var _loc4_:TransformTimeline = new TransformTimeline();
   _loc4_.duration = param2;
   parseTimeline(param1,_loc4_,parseTransformFrame,param3);
   _loc4_.scale = Number(param1[A_SCALE]);
   _loc4_.offset = (1 - Number(param1[A_OFFSET])) % 1;
   return _loc4_;
}
function parseFrame(param1:XML, param2:Frame, param3:uint):void
{
   param2.duration = uint(param1[A_DURATION]) / param3;
   param2.action = param1[A_ACTION];
   param2.event = param1[A_EVENT];
   param2.sound = param1[A_SOUND];
}
function parseMainFrame(param1:XML, param2:uint):Frame
{
   var _loc3_:Frame = new Frame();
   parseFrame(param1,_loc3_,param2);
   return _loc3_;
}
function parseTransformFrame(param1:XML, param2:uint):TransformFrame
{
   var _loc3_:TransformFrame = new TransformFrame();
   parseFrame(param1,_loc3_,param2);
   _loc3_.visible = param1[A_VISIBLE][0] ? uint(param1[A_VISIBLE]) == 1 : true;
   _loc3_.tweenEasing = Number(param1[A_TWEEN_EASING]);
   _loc3_.tweenRotate = int(param1[A_TWEEN_ROTATE]);
   _loc3_.displayIndex = int(param1[A_DISPLAY_INDEX]);
   _loc3_.zOrder = int(param1[A_Z_ORDER]);
   parseTransform(param1,_loc3_.global,_loc3_.pivot);
   _loc3_.transform.copy(_loc3_.global);
   _loc3_.pivot.x *= -1;
   _loc3_.pivot.y *= -1;
   var _loc4_:XML = param1[COLOR_TRANSFORM][0];
   if(_loc4_)
   {
      _loc3_.color = new ColorTransform();
      _loc3_.color.alphaOffset = int(_loc4_[A_ALPHA_OFFSET]);
      _loc3_.color.redOffset = int(_loc4_[A_RED_OFFSET]);
      _loc3_.color.greenOffset = int(_loc4_[A_GREEN_OFFSET]);
      _loc3_.color.blueOffset = int(_loc4_[A_BLUE_OFFSET]);
      _loc3_.color.alphaMultiplier = int(_loc4_[A_ALPHA_MULTIPLIER]) * 0.01;
      _loc3_.color.redMultiplier = int(_loc4_[A_RED_MULTIPLIER]) * 0.01;
      _loc3_.color.greenMultiplier = int(_loc4_[A_GREEN_MULTIPLIER]) * 0.01;
      _loc3_.color.blueMultiplier = int(_loc4_[A_BLUE_MULTIPLIER]) * 0.01;
   }
   return _loc3_;
}
function parseTransform(param1:XML, param2:DBTransform, param3:Point = null):void
{
   if(param1)
   {
      if(param2)
      {
         param2.x = Number(param1[A_X]);
         param2.y = Number(param1[A_Y]);
         param2.skewX = Number(param1[A_SKEW_X]) * ConstValues.ANGLE_TO_RADIAN;
         param2.skewY = Number(param1[A_SKEW_Y]) * ConstValues.ANGLE_TO_RADIAN;
         param2.scaleX = Number(param1[A_SCALE_X]);
         param2.scaleY = Number(param1[A_SCALE_Y]);
      }
      if(param3)
      {
         param3.x = Number(param1[A_PIVOT_X]);
         param3.y = Number(param1[A_PIVOT_Y]);
      }
   }
}
function formatDisplayTransformXYAndTimelinePivot(param1:SlotData, param2:TransformTimeline):void
{
   var _loc3_:DisplayData = null;
   var _loc4_:TransformFrame = null;
   if(!param1)
   {
      return;
   }
   for each(_loc4_ in param2.frameList)
   {
      if(_loc4_.displayIndex >= 0)
      {
         _loc3_ = param1.displayDataList[_loc4_.displayIndex];
         if(isNaN(_loc3_.transform.x))
         {
            _loc3_.transform.x = _loc4_.pivot.x;
            _loc3_.transform.y = _loc4_.pivot.y;
         }
         _loc4_.pivot.x -= _loc3_.transform.x;
         _loc4_.pivot.y -= _loc3_.transform.y;
      }
   }
}
const ARMATURES:String = "armatures";

const ANIMATIONS:String = "animations";

const ARMATURE:String = "armature";

const BONE:String = "b";

const DISPLAY:String = "d";

const ANIMATION:String = "animation";

const MOVEMENT:String = "mov";

const FRAME:String = "f";

const COLOR_TRANSFORM:String = "colorTransform";

const A_VERSION:String = "version";

const A_FRAME_RATE:String = "frameRate";

const A_NAME:String = "name";

const A_PARENT:String = "parent";

const A_TYPE:String = "isArmature";

const A_DURATION:String = "dr";

const A_FADE_IN_TIME:String = "to";

const A_DURATION_TWEEN:String = "drTW";

const A_LOOP:String = "lp";

const A_SCALE:String = "sc";

const A_OFFSET:String = "dl";

const A_EVENT:String = "evt";

const A_SOUND:String = "sd";

const A_TWEEN_EASING:String = "twE";

const A_TWEEN_ROTATE:String = "twR";

const A_ACTION:String = "mov";

const A_VISIBLE:String = "visible";

const A_DISPLAY_INDEX:String = "dI";

const A_Z_ORDER:String = "z";

const A_X:String = "x";

const A_Y:String = "y";

const A_SKEW_X:String = "kX";

const A_SKEW_Y:String = "kY";

const A_SCALE_X:String = "cX";

const A_SCALE_Y:String = "cY";

const A_PIVOT_X:String = "pX";

const A_PIVOT_Y:String = "pY";

const A_ALPHA_OFFSET:String = "a";

const A_RED_OFFSET:String = "r";

const A_GREEN_OFFSET:String = "g";

const A_BLUE_OFFSET:String = "b";

const A_ALPHA_MULTIPLIER:String = "aM";

const A_RED_MULTIPLIER:String = "rM";

const A_GREEN_MULTIPLIER:String = "gM";

const A_BLUE_MULTIPLIER:String = "bM";

