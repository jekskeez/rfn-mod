package dragonBones.utils
{
   import §_-N14§.§_-12B§;
   import dragonBones.objects.AnimationData;
   import dragonBones.objects.ArmatureData;
   import dragonBones.objects.BoneData;
   import dragonBones.objects.DBTransform;
   import dragonBones.objects.DisplayData;
   import dragonBones.objects.Frame;
   import dragonBones.objects.SkinData;
   import dragonBones.objects.SlotData;
   import dragonBones.objects.TransformFrame;
   import dragonBones.objects.TransformTimeline;
   import flash.geom.Point;
   
   public final class DBDataUtil
   {
      
      private static const _helpTransform1:DBTransform = new DBTransform();
      
      private static const _helpTransform2:DBTransform = new DBTransform();
      
      public function DBDataUtil()
      {
         super();
      }
      
      public static function transformArmatureData(param1:ArmatureData) : void
      {
         var _loc4_:BoneData = null;
         var _loc5_:BoneData = null;
         var _loc2_:Vector.<BoneData> = param1.§_-117§;
         var _loc3_:* = int(_loc2_.length);
         while(_loc3_--)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.parent)
            {
               _loc5_ = param1.§_-c2p§(_loc4_.parent);
               if(_loc5_)
               {
                  _loc4_.transform.copy(_loc4_.global);
                  §_-mP§.§_-zR§(_loc4_.transform,_loc5_.global);
               }
            }
         }
      }
      
      public static function §_-14§(param1:ArmatureData) : void
      {
         var _loc2_:Vector.<AnimationData> = param1.§_-J2w§;
         var _loc3_:* = int(_loc2_.length);
         while(_loc3_--)
         {
            transformAnimationData(_loc2_[_loc3_],param1);
         }
      }
      
      public static function transformAnimationData(param1:AnimationData, param2:ArmatureData) : void
      {
         var _loc7_:BoneData = null;
         var _loc8_:TransformTimeline = null;
         var _loc9_:SlotData = null;
         var _loc10_:DisplayData = null;
         var _loc11_:TransformTimeline = null;
         var _loc12_:Vector.<Frame> = null;
         var _loc13_:DBTransform = null;
         var _loc14_:Point = null;
         var _loc15_:TransformFrame = null;
         var _loc16_:uint = 0;
         var _loc17_:TransformFrame = null;
         var _loc18_:int = 0;
         var _loc19_:Number = NaN;
         var _loc3_:SkinData = param2.§_-d2p§(null);
         var _loc4_:Vector.<BoneData> = param2.§_-117§;
         var _loc5_:Vector.<SlotData> = _loc3_.§_-525§;
         var _loc6_:* = int(_loc4_.length);
         while(_loc6_--)
         {
            _loc7_ = _loc4_[_loc6_];
            _loc8_ = param1.§_-923§(_loc7_.name);
            if(_loc8_)
            {
               _loc9_ = null;
               for each(_loc9_ in _loc5_)
               {
                  if(_loc9_.parent == _loc7_.name)
                  {
                     break;
                  }
               }
               _loc11_ = _loc7_.parent ? param1.§_-923§(_loc7_.parent) : null;
               _loc12_ = _loc8_.frameList;
               _loc13_ = null;
               _loc14_ = null;
               _loc15_ = null;
               _loc16_ = _loc12_.length;
               _loc18_ = 0;
               while(_loc18_ < _loc16_)
               {
                  _loc17_ = _loc12_[_loc18_] as TransformFrame;
                  if(_loc11_)
                  {
                     _helpTransform1.copy(_loc17_.global);
                     §_-n12§(_loc11_,_loc17_.position,_helpTransform2);
                     §_-mP§.§_-zR§(_helpTransform1,_helpTransform2);
                     _loc17_.transform.copy(_helpTransform1);
                  }
                  else
                  {
                     _loc17_.transform.copy(_loc17_.global);
                  }
                  _loc17_.transform.x -= _loc7_.transform.x;
                  _loc17_.transform.y -= _loc7_.transform.y;
                  _loc17_.transform.skewX -= _loc7_.transform.skewX;
                  _loc17_.transform.skewY -= _loc7_.transform.skewY;
                  _loc17_.transform.scaleX -= _loc7_.transform.scaleX;
                  _loc17_.transform.scaleY -= _loc7_.transform.scaleY;
                  if(!_loc8_.§_-i2T§)
                  {
                     if(_loc9_)
                     {
                        _loc17_.zOrder -= _loc9_.zOrder;
                     }
                  }
                  if(!_loc13_)
                  {
                     _loc13_ = _loc8_.§_-iQ§;
                     _loc13_.copy(_loc17_.transform);
                     _loc13_.skewX = §_-mP§.§_-63l§(_loc13_.skewX);
                     _loc13_.skewY = §_-mP§.§_-63l§(_loc13_.skewY);
                     _loc14_ = _loc8_.§_-W1c§;
                     _loc14_.x = _loc17_.pivot.x;
                     _loc14_.y = _loc17_.pivot.y;
                  }
                  _loc17_.transform.x -= _loc13_.x;
                  _loc17_.transform.y -= _loc13_.y;
                  _loc17_.transform.skewX = §_-mP§.§_-63l§(_loc17_.transform.skewX - _loc13_.skewX);
                  _loc17_.transform.skewY = §_-mP§.§_-63l§(_loc17_.transform.skewY - _loc13_.skewY);
                  _loc17_.transform.scaleX -= _loc13_.scaleX;
                  _loc17_.transform.scaleY -= _loc13_.scaleY;
                  if(!_loc8_.§_-i2T§)
                  {
                     _loc17_.pivot.x -= _loc14_.x;
                     _loc17_.pivot.y -= _loc14_.y;
                  }
                  if(_loc15_)
                  {
                     _loc19_ = _loc17_.transform.skewX - _loc15_.transform.skewX;
                     if(_loc15_.tweenRotate)
                     {
                        if(_loc15_.tweenRotate > 0)
                        {
                           if(_loc19_ < 0)
                           {
                              _loc17_.transform.skewX += Math.PI * 2;
                              _loc17_.transform.skewY += Math.PI * 2;
                           }
                           if(_loc15_.tweenRotate > 1)
                           {
                              _loc17_.transform.skewX += Math.PI * 2 * (_loc15_.tweenRotate - 1);
                              _loc17_.transform.skewY += Math.PI * 2 * (_loc15_.tweenRotate - 1);
                           }
                        }
                        else
                        {
                           if(_loc19_ > 0)
                           {
                              _loc17_.transform.skewX -= Math.PI * 2;
                              _loc17_.transform.skewY -= Math.PI * 2;
                           }
                           if(_loc15_.tweenRotate < 1)
                           {
                              _loc17_.transform.skewX += Math.PI * 2 * (_loc15_.tweenRotate + 1);
                              _loc17_.transform.skewY += Math.PI * 2 * (_loc15_.tweenRotate + 1);
                           }
                        }
                     }
                     else
                     {
                        _loc17_.transform.skewX = _loc15_.transform.skewX + §_-mP§.§_-63l§(_loc17_.transform.skewX - _loc15_.transform.skewX);
                        _loc17_.transform.skewY = _loc15_.transform.skewY + §_-mP§.§_-63l§(_loc17_.transform.skewY - _loc15_.transform.skewY);
                     }
                  }
                  _loc15_ = _loc17_;
                  _loc18_++;
               }
               _loc8_.§_-i2T§ = true;
            }
         }
      }
      
      public static function §_-n12§(param1:TransformTimeline, param2:Number, param3:DBTransform) : void
      {
         var _loc6_:TransformFrame = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:TransformFrame = null;
         var _loc4_:Vector.<Frame> = param1.frameList;
         var _loc5_:* = int(_loc4_.length);
         while(_loc5_--)
         {
            _loc6_ = _loc4_[_loc5_] as TransformFrame;
            if(_loc6_.position <= param2 && _loc6_.position + _loc6_.duration > param2)
            {
               _loc7_ = _loc6_.tweenEasing;
               if(_loc5_ == _loc4_.length - 1 || isNaN(_loc7_) || param2 == _loc6_.position)
               {
                  param3.copy(_loc6_.global);
               }
               else
               {
                  _loc8_ = (param2 - _loc6_.position) / _loc6_.duration;
                  if(_loc7_)
                  {
                     _loc8_ = §_-12B§.§_-o1J§(_loc8_,_loc7_);
                  }
                  _loc9_ = _loc4_[_loc5_ + 1] as TransformFrame;
                  param3.x = _loc6_.global.x + (_loc9_.global.x - _loc6_.global.x) * _loc8_;
                  param3.y = _loc6_.global.y + (_loc9_.global.y - _loc6_.global.y) * _loc8_;
                  param3.skewX = §_-mP§.§_-63l§(_loc6_.global.skewX + (_loc9_.global.skewX - _loc6_.global.skewX) * _loc8_);
                  param3.skewY = §_-mP§.§_-63l§(_loc6_.global.skewY + (_loc9_.global.skewY - _loc6_.global.skewY) * _loc8_);
                  param3.scaleX = _loc6_.global.scaleX + (_loc9_.global.scaleX - _loc6_.global.scaleX) * _loc8_;
                  param3.scaleY = _loc6_.global.scaleY + (_loc9_.global.scaleY - _loc6_.global.scaleY) * _loc8_;
               }
               break;
            }
         }
      }
      
      public static function addHideTimeline(param1:AnimationData, param2:ArmatureData) : void
      {
         var _loc5_:BoneData = null;
         var _loc6_:String = null;
         var _loc3_:Vector.<BoneData> = param2.§_-117§;
         var _loc4_:* = int(_loc3_.length);
         while(_loc4_--)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = _loc5_.name;
            if(!param1.§_-923§(_loc6_))
            {
               param1.addTimeline(TransformTimeline.§_-z29§,_loc6_);
            }
         }
      }
   }
}

