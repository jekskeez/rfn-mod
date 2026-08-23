package §_-C1Y§
{
   import §_-JM§.§_-c1Q§;
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import dragonBones.§_-z2H§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.ArmatureData;
   import dragonBones.objects.BoneData;
   import dragonBones.objects.DisplayData;
   import dragonBones.objects.SkeletonData;
   import dragonBones.objects.SkinData;
   import dragonBones.objects.SlotData;
   import dragonBones.objects.§_-C1V§;
   import dragonBones.objects.§_-fb§;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   use namespace dragonBones_internal;
   
   public class §_-tc§ extends EventDispatcher
   {
      
      protected static const §_-P1§:Matrix = new Matrix();
      
      private static const §_-129§:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
      
      protected var §_-63B§:Object;
      
      protected var §_-W24§:Object;
      
      protected var §_-TO§:Object;
      
      protected var §_-V1E§:String;
      
      protected var §_-4w§:String;
      
      public function §_-tc§(param1:§_-tc§)
      {
         super(this);
         if(param1 != this)
         {
            throw new IllegalOperationError("Abstract class can not be instantiated!");
         }
         this.§_-63B§ = {};
         this.§_-W24§ = {};
         this.§_-TO§ = {};
         §_-129§.allowCodeImport = true;
      }
      
      public function §_-F1X§(param1:ByteArray, param2:String = null) : SkeletonData
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc3_:§_-fb§ = §_-C1V§.§_-oI§(param1);
         var _loc4_:SkeletonData = §_-C1V§.§_-F1X§(_loc3_.dragonBonesData);
         param2 ||= _loc4_.name;
         this.§_-Q2W§(_loc4_,param2);
         var _loc5_:Loader = new Loader();
         _loc5_.name = param2;
         this.§_-TO§[param2] = _loc3_.textureAtlasData;
         _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-B1k§);
         _loc5_.loadBytes(_loc3_.§_-x1f§,§_-129§);
         _loc3_.dispose();
         return _loc4_;
      }
      
      public function §_-l14§(param1:String) : SkeletonData
      {
         return this.§_-63B§[param1];
      }
      
      public function §_-Q2W§(param1:SkeletonData, param2:String = null) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         param2 ||= param1.name;
         if(!param2)
         {
            throw new ArgumentError("Unnamed data!");
         }
         if(!this.§_-63B§[param2])
         {
         }
         this.§_-63B§[param2] = param1;
      }
      
      public function §_-Y1r§(param1:String) : void
      {
         delete this.§_-63B§[param1];
      }
      
      public function §_-N2J§(param1:String) : Object
      {
         return this.§_-W24§[param1];
      }
      
      public function §_-c2H§(param1:Object, param2:String = null) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(!param2 && param1 is §_-c1Q§)
         {
            param2 = param1.name;
         }
         if(!param2)
         {
            throw new ArgumentError("Unnamed data!");
         }
         if(!this.§_-W24§[param2])
         {
         }
         this.§_-W24§[param2] = param1;
      }
      
      public function §_-k1h§(param1:String) : void
      {
         delete this.§_-W24§[param1];
      }
      
      public function dispose(param1:Boolean = true) : void
      {
         var _loc2_:SkeletonData = null;
         var _loc3_:Object = null;
         if(param1)
         {
            for each(_loc2_ in this.§_-63B§)
            {
               _loc2_.dispose();
            }
            for each(_loc3_ in this.§_-W24§)
            {
               _loc3_.dispose();
            }
         }
         this.§_-63B§ = null;
         this.§_-W24§ = null;
         this.§_-TO§ = null;
         this.§_-V1E§ = null;
         this.§_-4w§ = null;
      }
      
      public function §_-i2H§(param1:String, param2:String = null, param3:String = null, param4:String = null, param5:String = null) : §_-833§
      {
         var _loc7_:§_-83b§ = null;
         var _loc8_:BoneData = null;
         var _loc10_:§_-z2H§ = null;
         var _loc11_:DisplayData = null;
         var _loc12_:§_-833§ = null;
         var _loc13_:* = 0;
         var _loc15_:SlotData = null;
         var _loc16_:SkeletonData = null;
         var _loc17_:ArmatureData = null;
         var _loc18_:ArmatureData = null;
         var _loc19_:ArmatureData = null;
         var _loc20_:SkinData = null;
         var _loc21_:SlotData = null;
         var _loc22_:DisplayData = null;
         if(param3)
         {
            _loc16_ = this.§_-63B§[param3];
            if(_loc16_)
            {
               _loc17_ = _loc16_.§_-11w§(param1);
            }
         }
         else
         {
            for(param3 in this.§_-63B§)
            {
               _loc16_ = this.§_-63B§[param3];
               _loc17_ = _loc16_.§_-11w§(param1);
               if(_loc17_)
               {
                  break;
               }
            }
         }
         if(!_loc17_)
         {
            return null;
         }
         this.§_-V1E§ = param3;
         this.§_-4w§ = param4 || param3;
         var _loc6_:§_-833§ = this.§_-Oi§();
         _loc6_.name = param1;
         for each(_loc8_ in _loc17_.§_-f1i§)
         {
            _loc7_ = new §_-83b§();
            _loc7_.name = _loc8_.name;
            _loc7_.fixedRotation = _loc8_.fixedRotation;
            _loc7_.scaleMode = _loc8_.scaleMode;
            _loc7_.§_-x1D§.copy(_loc8_.transform);
            if(_loc17_.§_-2Z§(_loc8_.parent))
            {
               _loc6_.§_-i21§(_loc7_,_loc8_.parent);
            }
            else
            {
               _loc6_.§_-i21§(_loc7_);
            }
         }
         if(Boolean(param2) && param2 != param1)
         {
            _loc18_ = _loc16_.§_-11w§(param2);
            if(!_loc18_)
            {
               for(param3 in this.§_-63B§)
               {
                  _loc16_ = this.§_-63B§[param3];
                  _loc18_ = _loc16_.§_-11w§(param2);
                  if(_loc18_)
                  {
                     break;
                  }
               }
            }
            _loc19_ = _loc16_.§_-11w§(param2);
            if(_loc19_)
            {
               _loc20_ = _loc19_.§_-I1v§("");
            }
         }
         if(_loc18_)
         {
            _loc6_.animation.§_-gi§ = _loc18_.§_-gi§;
         }
         else
         {
            _loc6_.animation.§_-gi§ = _loc17_.§_-gi§;
         }
         var _loc9_:SkinData = _loc17_.§_-I1v§(param5);
         if(!_loc9_)
         {
            throw new ArgumentError();
         }
         var _loc14_:Array = [];
         for each(_loc15_ in _loc9_.§_-53R§)
         {
            _loc7_ = _loc6_.§_-i2v§(_loc15_.parent);
            if(_loc7_)
            {
               _loc10_ = this.§_-fI§();
               _loc10_.name = _loc15_.name;
               _loc10_.blendMode = _loc15_.blendMode;
               _loc10_.§_-E1i§ = _loc15_.zOrder;
               _loc10_.§_-T2§ = _loc15_.displayDataList;
               _loc14_.length = 0;
               _loc13_ = int(_loc15_.displayDataList.length);
               while(_loc13_--)
               {
                  _loc11_ = _loc15_.displayDataList[_loc13_];
                  switch(_loc11_.type)
                  {
                     case DisplayData.ARMATURE:
                        if(_loc20_)
                        {
                           _loc21_ = _loc20_.getSlotData(_loc15_.name);
                           if(_loc21_)
                           {
                              _loc22_ = _loc21_.displayDataList[_loc13_];
                           }
                        }
                        else
                        {
                           _loc22_ = null;
                        }
                        _loc12_ = this.§_-i2H§(_loc11_.name,_loc22_ ? _loc22_.name : null,this.§_-V1E§,this.§_-4w§);
                        if(_loc12_)
                        {
                           _loc14_[_loc13_] = _loc12_;
                        }
                        break;
                     case DisplayData.IMAGE:
                        _loc14_[_loc13_] = this.§_-C2Y§(this.§_-W24§[this.§_-4w§],_loc11_.name,_loc11_.pivot.x,_loc11_.pivot.y);
                  }
               }
               _loc10_.§_-RG§ = _loc14_;
               _loc10_.§_-YG§(0);
               _loc7_.addChild(_loc10_);
            }
         }
         _loc13_ = int(_loc6_.§_-d1d§.length);
         while(_loc13_--)
         {
            _loc6_.§_-d1d§[_loc13_].update();
         }
         _loc13_ = int(_loc6_.§_-j1h§.length);
         while(_loc13_--)
         {
            _loc10_ = _loc6_.§_-j1h§[_loc13_];
            _loc10_.update();
         }
         _loc6_.§_-H2k§();
         return _loc6_;
      }
      
      public function §_-Hq§(param1:String, param2:String = null, param3:Number = NaN, param4:Number = NaN) : Object
      {
         var _loc5_:Object = null;
         var _loc6_:SkeletonData = null;
         var _loc7_:Point = null;
         if(param2)
         {
            _loc5_ = this.§_-W24§[param2];
         }
         if(!_loc5_ && !param2)
         {
            for(param2 in this.§_-W24§)
            {
               _loc5_ = this.§_-W24§[param2];
               if(_loc5_.getRegion(param1))
               {
                  break;
               }
               _loc5_ = null;
            }
         }
         if(_loc5_)
         {
            if(isNaN(param3) || isNaN(param4))
            {
               _loc6_ = this.§_-63B§[param2];
               if(_loc6_)
               {
                  _loc7_ = _loc6_.§_-C3i§(param1);
                  if(_loc7_)
                  {
                     param3 = _loc7_.x;
                     param4 = _loc7_.y;
                  }
               }
            }
            return this.§_-C2Y§(_loc5_,param1,param3,param4);
         }
         return null;
      }
      
      protected function §_-B1k§(param1:Event) : void
      {
         var _loc6_:Object = null;
         param1.target.removeEventListener(Event.COMPLETE,this.§_-B1k§);
         var _loc2_:Loader = param1.target.loader;
         var _loc3_:Object = param1.target.content;
         _loc2_.unloadAndStop();
         var _loc4_:String = _loc2_.name;
         var _loc5_:Object = this.§_-TO§[_loc4_];
         delete this.§_-TO§[_loc4_];
         if(Boolean(_loc4_) && Boolean(_loc5_))
         {
            if(_loc3_ is Bitmap)
            {
               _loc3_ = (_loc3_ as Bitmap).bitmapData;
            }
            else if(_loc3_ is Sprite)
            {
               _loc3_ = (_loc3_ as Sprite).getChildAt(0) as MovieClip;
            }
            _loc6_ = this.§_-a6§(_loc3_,_loc5_);
            this.§_-c2H§(_loc6_,_loc4_);
            _loc4_ = null;
            var _loc7_:int = 0;
            var _loc8_:* = this.§_-TO§;
            for(_loc4_ in _loc8_)
            {
            }
            if(!_loc4_ && this.hasEventListener(Event.COMPLETE))
            {
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
         }
      }
      
      protected function §_-a6§(param1:Object, param2:Object) : §_-c1Q§
      {
         return null;
      }
      
      protected function §_-Oi§() : §_-833§
      {
         return null;
      }
      
      protected function §_-fI§() : §_-z2H§
      {
         return null;
      }
      
      protected function §_-C2Y§(param1:Object, param2:String, param3:Number, param4:Number) : Object
      {
         return null;
      }
   }
}

