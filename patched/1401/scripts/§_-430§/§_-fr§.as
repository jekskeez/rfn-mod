package §_-430§
{
   import §_-D26§.§_-oM§;
   import dragonBones.§_-Bq§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.ArmatureData;
   import dragonBones.objects.BoneData;
   import dragonBones.objects.DisplayData;
   import dragonBones.objects.SkeletonData;
   import dragonBones.objects.SkinData;
   import dragonBones.objects.SlotData;
   import dragonBones.objects.§_-13c§;
   import dragonBones.objects.§_-l2g§;
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
   
   public class §_-fr§ extends EventDispatcher
   {
      
      protected static const §_-HT§:Matrix = new Matrix();
      
      private static const §_-62Q§:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
      
      protected var §_-uZ§:Object;
      
      protected var §_-B3R§:Object;
      
      protected var §_-23G§:Object;
      
      protected var §_-t13§:String;
      
      protected var §_-51i§:String;
      
      public function §_-fr§(param1:§_-fr§)
      {
         super(this);
         if(param1 != this)
         {
            throw new IllegalOperationError("Abstract class can not be instantiated!");
         }
         this.§_-uZ§ = {};
         this.§_-B3R§ = {};
         this.§_-23G§ = {};
         §_-62Q§.allowCodeImport = true;
      }
      
      public function §_-Q1L§(param1:ByteArray, param2:String = null) : SkeletonData
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc3_:§_-13c§ = §_-l2g§.§_-3H§(param1);
         var _loc4_:SkeletonData = §_-l2g§.§_-Q1L§(_loc3_.dragonBonesData);
         param2 ||= _loc4_.name;
         this.§_-tj§(_loc4_,param2);
         var _loc5_:Loader = new Loader();
         _loc5_.name = param2;
         this.§_-23G§[param2] = _loc3_.textureAtlasData;
         _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-Ry§);
         _loc5_.loadBytes(_loc3_.§_-xU§,§_-62Q§);
         _loc3_.dispose();
         return _loc4_;
      }
      
      public function §_-7i§(param1:String) : SkeletonData
      {
         return this.§_-uZ§[param1];
      }
      
      public function §_-tj§(param1:SkeletonData, param2:String = null) : void
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
         if(!this.§_-uZ§[param2])
         {
         }
         this.§_-uZ§[param2] = param1;
      }
      
      public function §_-w1n§(param1:String) : void
      {
         delete this.§_-uZ§[param1];
      }
      
      public function §_-H1x§(param1:String) : Object
      {
         return this.§_-B3R§[param1];
      }
      
      public function §_-C2V§(param1:Object, param2:String = null) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(!param2 && param1 is §_-oM§)
         {
            param2 = param1.name;
         }
         if(!param2)
         {
            throw new ArgumentError("Unnamed data!");
         }
         if(!this.§_-B3R§[param2])
         {
         }
         this.§_-B3R§[param2] = param1;
      }
      
      public function §_-vj§(param1:String) : void
      {
         delete this.§_-B3R§[param1];
      }
      
      public function dispose(param1:Boolean = true) : void
      {
         var _loc2_:SkeletonData = null;
         var _loc3_:Object = null;
         if(param1)
         {
            for each(_loc2_ in this.§_-uZ§)
            {
               _loc2_.dispose();
            }
            for each(_loc3_ in this.§_-B3R§)
            {
               _loc3_.dispose();
            }
         }
         this.§_-uZ§ = null;
         this.§_-B3R§ = null;
         this.§_-23G§ = null;
         this.§_-t13§ = null;
         this.§_-51i§ = null;
      }
      
      public function §_-g1F§(param1:String, param2:String = null, param3:String = null, param4:String = null, param5:String = null) : §_-E1r§
      {
         var _loc7_:§_-TH§ = null;
         var _loc8_:BoneData = null;
         var _loc10_:§_-Bq§ = null;
         var _loc11_:DisplayData = null;
         var _loc12_:§_-E1r§ = null;
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
            _loc16_ = this.§_-uZ§[param3];
            if(_loc16_)
            {
               _loc17_ = _loc16_.§_-219§(param1);
            }
         }
         else
         {
            for(param3 in this.§_-uZ§)
            {
               _loc16_ = this.§_-uZ§[param3];
               _loc17_ = _loc16_.§_-219§(param1);
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
         this.§_-t13§ = param3;
         this.§_-51i§ = param4 || param3;
         var _loc6_:§_-E1r§ = this.§_-41r§();
         _loc6_.name = param1;
         for each(_loc8_ in _loc17_.§_-117§)
         {
            _loc7_ = new §_-TH§();
            _loc7_.name = _loc8_.name;
            _loc7_.fixedRotation = _loc8_.fixedRotation;
            _loc7_.scaleMode = _loc8_.scaleMode;
            _loc7_.§_-I2C§.copy(_loc8_.transform);
            if(_loc17_.§_-c2p§(_loc8_.parent))
            {
               _loc6_.§_-J1q§(_loc7_,_loc8_.parent);
            }
            else
            {
               _loc6_.§_-J1q§(_loc7_);
            }
         }
         if(Boolean(param2) && param2 != param1)
         {
            _loc18_ = _loc16_.§_-219§(param2);
            if(!_loc18_)
            {
               for(param3 in this.§_-uZ§)
               {
                  _loc16_ = this.§_-uZ§[param3];
                  _loc18_ = _loc16_.§_-219§(param2);
                  if(_loc18_)
                  {
                     break;
                  }
               }
            }
            _loc19_ = _loc16_.§_-219§(param2);
            if(_loc19_)
            {
               _loc20_ = _loc19_.§_-d2p§("");
            }
         }
         if(_loc18_)
         {
            _loc6_.animation.§_-J2w§ = _loc18_.§_-J2w§;
         }
         else
         {
            _loc6_.animation.§_-J2w§ = _loc17_.§_-J2w§;
         }
         var _loc9_:SkinData = _loc17_.§_-d2p§(param5);
         if(!_loc9_)
         {
            throw new ArgumentError();
         }
         var _loc14_:Array = [];
         for each(_loc15_ in _loc9_.§_-525§)
         {
            _loc7_ = _loc6_.§_-M1s§(_loc15_.parent);
            if(_loc7_)
            {
               _loc10_ = this.§_-p5§();
               _loc10_.name = _loc15_.name;
               _loc10_.blendMode = _loc15_.blendMode;
               _loc10_.§_-f28§ = _loc15_.zOrder;
               _loc10_.§_-S2B§ = _loc15_.displayDataList;
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
                        _loc12_ = this.§_-g1F§(_loc11_.name,_loc22_ ? _loc22_.name : null,this.§_-t13§,this.§_-51i§);
                        if(_loc12_)
                        {
                           _loc14_[_loc13_] = _loc12_;
                        }
                        break;
                     case DisplayData.IMAGE:
                        _loc14_[_loc13_] = this.§_-TC§(this.§_-B3R§[this.§_-51i§],_loc11_.name,_loc11_.pivot.x,_loc11_.pivot.y);
                  }
               }
               _loc10_.§_-P2I§ = _loc14_;
               _loc10_.§_-C1J§(0);
               _loc7_.addChild(_loc10_);
            }
         }
         _loc13_ = int(_loc6_.§_-G1x§.length);
         while(_loc13_--)
         {
            _loc6_.§_-G1x§[_loc13_].update();
         }
         _loc13_ = int(_loc6_.§_-4f§.length);
         while(_loc13_--)
         {
            _loc10_ = _loc6_.§_-4f§[_loc13_];
            _loc10_.update();
         }
         _loc6_.§_-82w§();
         return _loc6_;
      }
      
      public function §_-7Z§(param1:String, param2:String = null, param3:Number = NaN, param4:Number = NaN) : Object
      {
         var _loc5_:Object = null;
         var _loc6_:SkeletonData = null;
         var _loc7_:Point = null;
         if(param2)
         {
            _loc5_ = this.§_-B3R§[param2];
         }
         if(!_loc5_ && !param2)
         {
            for(param2 in this.§_-B3R§)
            {
               _loc5_ = this.§_-B3R§[param2];
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
               _loc6_ = this.§_-uZ§[param2];
               if(_loc6_)
               {
                  _loc7_ = _loc6_.§_-S2L§(param1);
                  if(_loc7_)
                  {
                     param3 = _loc7_.x;
                     param4 = _loc7_.y;
                  }
               }
            }
            return this.§_-TC§(_loc5_,param1,param3,param4);
         }
         return null;
      }
      
      protected function §_-Ry§(param1:Event) : void
      {
         var _loc6_:Object = null;
         param1.target.removeEventListener(Event.COMPLETE,this.§_-Ry§);
         var _loc2_:Loader = param1.target.loader;
         var _loc3_:Object = param1.target.content;
         _loc2_.unloadAndStop();
         var _loc4_:String = _loc2_.name;
         var _loc5_:Object = this.§_-23G§[_loc4_];
         delete this.§_-23G§[_loc4_];
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
            _loc6_ = this.§_-T1d§(_loc3_,_loc5_);
            this.§_-C2V§(_loc6_,_loc4_);
            _loc4_ = null;
            var _loc7_:int = 0;
            var _loc8_:* = this.§_-23G§;
            for(_loc4_ in _loc8_)
            {
            }
            if(!_loc4_ && this.hasEventListener(Event.COMPLETE))
            {
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
         }
      }
      
      protected function §_-T1d§(param1:Object, param2:Object) : §_-oM§
      {
         return null;
      }
      
      protected function §_-41r§() : §_-E1r§
      {
         return null;
      }
      
      protected function §_-p5§() : §_-Bq§
      {
         return null;
      }
      
      protected function §_-TC§(param1:Object, param2:String, param3:Number, param4:Number) : Object
      {
         return null;
      }
   }
}

