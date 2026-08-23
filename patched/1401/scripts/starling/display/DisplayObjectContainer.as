package starling.display
{
   import §_-K2c§.Event;
   import §_-kW§.§_-J1k§;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.utils.getQualifiedClassName;
   import starling.core.§_-T2v§;
   import starling.core.starling_internal;
   import starling.filters.FragmentFilter;
   import starling.utils.§_-rI§;
   
   use namespace starling_internal;
   
   public class DisplayObjectContainer extends DisplayObject
   {
      
      private static var §_-S19§:Matrix = new Matrix();
      
      private static var §_-G2g§:Point = new Point();
      
      private static var §_-OA§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private static var §_-x10§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private var §_-h2g§:Vector.<DisplayObject>;
      
      private var §_-y2T§:Boolean;
      
      public function DisplayObjectContainer()
      {
         super();
         if(Capabilities.isDebugger && getQualifiedClassName(this) == "starling.display::DisplayObjectContainer")
         {
            throw new §_-J1k§();
         }
         this.§_-h2g§ = new Vector.<DisplayObject>(0);
      }
      
      private static function §_-41P§(param1:Vector.<DisplayObject>, param2:Function, param3:int, param4:int, param5:Vector.<DisplayObject>) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param4 <= 1)
         {
            return;
         }
         _loc6_ = 0;
         _loc7_ = param3 + param4;
         _loc8_ = param4 / 2;
         _loc9_ = param3;
         _loc10_ = param3 + _loc8_;
         §_-41P§(param1,param2,param3,_loc8_,param5);
         §_-41P§(param1,param2,param3 + _loc8_,param4 - _loc8_,param5);
         _loc6_ = 0;
         while(_loc6_ < param4)
         {
            if(_loc9_ < param3 + _loc8_ && (_loc10_ == _loc7_ || param2(param1[_loc9_],param1[_loc10_]) <= 0))
            {
               param5[_loc6_] = param1[_loc9_];
               _loc9_++;
            }
            else
            {
               param5[_loc6_] = param1[_loc10_];
               _loc10_++;
            }
            _loc6_++;
         }
         _loc6_ = param3;
         while(_loc6_ < _loc7_)
         {
            param1[_loc6_] = param5[int(_loc6_ - param3)];
            _loc6_++;
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = int(this.§_-h2g§.length - 1);
         while(_loc1_ >= 0)
         {
            this.§_-h2g§[_loc1_].dispose();
            _loc1_--;
         }
         super.dispose();
      }
      
      public function addChild(param1:DisplayObject) : DisplayObject
      {
         return this.addChildAt(param1,this.§_-h2g§.length);
      }
      
      public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc3_:int = int(this.§_-h2g§.length);
         if(param2 >= 0 && param2 <= _loc3_)
         {
            if(param1.parent == this)
            {
               this.setChildIndex(param1,param2);
            }
            else
            {
               param1.removeFromParent();
               if(param2 == _loc3_)
               {
                  this.§_-h2g§[_loc3_] = param1;
               }
               else
               {
                  this.§_-2Q§(param2,0,param1);
               }
               param1.§_-71V§(this);
               param1.§_-g11§(Event.ADDED,true);
               if(stage)
               {
                  _loc4_ = param1 as DisplayObjectContainer;
                  if(_loc4_)
                  {
                     _loc4_.§_-v26§(Event.ADDED_TO_STAGE);
                  }
                  else
                  {
                     param1.§_-g11§(Event.ADDED_TO_STAGE);
                  }
               }
            }
            return param1;
         }
         throw new RangeError("Invalid child index");
      }
      
      public function removeChild(param1:DisplayObject, param2:Boolean = false) : DisplayObject
      {
         var _loc3_:int = this.getChildIndex(param1);
         if(_loc3_ != -1)
         {
            this.removeChildAt(_loc3_,param2);
         }
         return param1;
      }
      
      public function removeChildAt(param1:int, param2:Boolean = false) : DisplayObject
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:DisplayObjectContainer = null;
         if(param1 >= 0 && param1 < this.§_-h2g§.length)
         {
            _loc3_ = this.§_-h2g§[param1];
            _loc3_.§_-g11§(Event.REMOVED,true);
            if(stage)
            {
               _loc4_ = _loc3_ as DisplayObjectContainer;
               if(_loc4_)
               {
                  _loc4_.§_-v26§(Event.REMOVED_FROM_STAGE);
               }
               else
               {
                  _loc3_.§_-g11§(Event.REMOVED_FROM_STAGE);
               }
            }
            _loc3_.§_-71V§(null);
            param1 = this.§_-h2g§.indexOf(_loc3_);
            if(param1 >= 0)
            {
               this.§_-2Q§(param1,1);
            }
            if(param2)
            {
               _loc3_.dispose();
            }
            return _loc3_;
         }
         throw new RangeError("Invalid child index");
      }
      
      public function removeChildren(param1:int = 0, param2:int = -1, param3:Boolean = false) : void
      {
         if(param2 < 0 || param2 >= this.numChildren)
         {
            param2 = this.numChildren - 1;
         }
         var _loc4_:int = param1;
         while(_loc4_ <= param2)
         {
            this.removeChildAt(param1,param3);
            _loc4_++;
         }
      }
      
      public function getChildAt(param1:int) : DisplayObject
      {
         var _loc2_:int = int(this.§_-h2g§.length);
         if(param1 < 0)
         {
            param1 = _loc2_ + param1;
         }
         if(param1 >= 0 && param1 < _loc2_)
         {
            return this.§_-h2g§[param1];
         }
         throw new RangeError("Invalid child index");
      }
      
      public function getChildByName(param1:String) : DisplayObject
      {
         var _loc2_:int = int(this.§_-h2g§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§_-h2g§[_loc3_].name == param1)
            {
               return this.§_-h2g§[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getChildIndex(param1:DisplayObject) : int
      {
         return this.§_-h2g§.indexOf(param1);
      }
      
      public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         var _loc3_:int = this.getChildIndex(param1);
         if(_loc3_ == param2)
         {
            return;
         }
         if(_loc3_ == -1)
         {
            throw new ArgumentError("Not a child of this container");
         }
         this.§_-2Q§(_loc3_,1);
         this.§_-2Q§(param2,0,param1);
      }
      
      public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         var _loc3_:int = this.getChildIndex(param1);
         var _loc4_:int = this.getChildIndex(param2);
         if(_loc3_ == -1 || _loc4_ == -1)
         {
            throw new ArgumentError("Not a child of this container");
         }
         this.§_-53B§(_loc3_,_loc4_);
      }
      
      public function §_-53B§(param1:int, param2:int) : void
      {
         var _loc3_:DisplayObject = this.getChildAt(param1);
         var _loc4_:DisplayObject = this.getChildAt(param2);
         this.§_-h2g§[param1] = _loc4_;
         this.§_-h2g§[param2] = _loc3_;
      }
      
      public function §_-h1K§(param1:Function) : void
      {
         §_-x10§.length = this.§_-h2g§.length;
         §_-41P§(this.§_-h2g§,param1,0,this.§_-h2g§.length,§_-x10§);
         §_-x10§.length = 0;
      }
      
      public function contains(param1:DisplayObject) : Boolean
      {
         while(param1)
         {
            if(param1 == this)
            {
               return true;
            }
            param1 = param1.parent;
         }
         return false;
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         var _loc3_:int = int(this.§_-h2g§.length);
         if(_loc3_ == 0)
         {
            §_-eJ§(param1,§_-S19§);
            §_-rI§.§_-Sy§(§_-S19§,0,0,§_-G2g§);
            param2.setTo(§_-G2g§.x,§_-G2g§.y,0,0);
         }
         else if(_loc3_ == 1)
         {
            this.§_-h2g§[0].getBounds(param1,param2);
         }
         else
         {
            _loc4_ = Number.MAX_VALUE;
            _loc5_ = -Number.MAX_VALUE;
            _loc6_ = Number.MAX_VALUE;
            _loc7_ = -Number.MAX_VALUE;
            _loc8_ = 0;
            while(_loc8_ < _loc3_)
            {
               this.§_-h2g§[_loc8_].getBounds(param1,param2);
               if(_loc4_ > param2.x)
               {
                  _loc4_ = param2.x;
               }
               if(_loc5_ < param2.right)
               {
                  _loc5_ = param2.right;
               }
               if(_loc6_ > param2.y)
               {
                  _loc6_ = param2.y;
               }
               if(_loc7_ < param2.bottom)
               {
                  _loc7_ = param2.bottom;
               }
               _loc8_++;
            }
            param2.setTo(_loc4_,_loc6_,_loc5_ - _loc4_,_loc7_ - _loc6_);
         }
         return param2;
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         var _loc8_:DisplayObject = null;
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         if(!§_-O2d§(param1))
         {
            return null;
         }
         var _loc3_:DisplayObject = null;
         var _loc4_:Number = param1.x;
         var _loc5_:Number = param1.y;
         var _loc6_:int = int(this.§_-h2g§.length);
         var _loc7_:* = int(_loc6_ - 1);
         while(_loc7_ >= 0)
         {
            _loc8_ = this.§_-h2g§[_loc7_];
            if(!_loc8_.§_-A1S§)
            {
               §_-S19§.copyFrom(_loc8_.transformationMatrix);
               §_-S19§.invert();
               §_-rI§.§_-Sy§(§_-S19§,_loc4_,_loc5_,§_-G2g§);
               _loc3_ = _loc8_.hitTest(§_-G2g§,param2);
               if(_loc3_)
               {
                  return param2 && this.§_-y2T§ ? this : _loc3_;
               }
            }
            _loc7_--;
         }
         return null;
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         var _loc7_:DisplayObject = null;
         var _loc8_:FragmentFilter = null;
         var _loc9_:DisplayObject = null;
         var _loc3_:Number = param2 * this.alpha;
         var _loc4_:int = int(this.§_-h2g§.length);
         var _loc5_:String = param1.blendMode;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = this.§_-h2g§[_loc6_];
            if(_loc7_.§_-C31§)
            {
               _loc8_ = _loc7_.filter;
               _loc9_ = _loc7_.mask;
               param1.§_-G3§();
               param1.§_-62B§(_loc7_);
               param1.blendMode = _loc7_.blendMode;
               if(_loc9_)
               {
                  param1.§_-j2m§(_loc9_);
               }
               if(_loc8_)
               {
                  _loc8_.render(_loc7_,param1,_loc3_);
               }
               else
               {
                  _loc7_.render(param1,_loc3_);
               }
               if(_loc9_)
               {
                  param1.§_-k24§();
               }
               param1.blendMode = _loc5_;
               param1.§_-n1Z§();
            }
            _loc6_++;
         }
      }
      
      public function §_-NI§(param1:Event) : void
      {
         if(param1.bubbles)
         {
            throw new ArgumentError("Broadcast of bubbling events is prohibited");
         }
         var _loc2_:int = int(§_-OA§.length);
         this.§_-o2D§(this,param1.type,§_-OA§);
         var _loc3_:int = int(§_-OA§.length);
         var _loc4_:int = _loc2_;
         while(_loc4_ < _loc3_)
         {
            §_-OA§[_loc4_].dispatchEvent(param1);
            _loc4_++;
         }
         §_-OA§.length = _loc2_;
      }
      
      public function §_-v26§(param1:String, param2:Object = null) : void
      {
         var _loc3_:Event = Event.§_-11x§(param1,false,param2);
         this.§_-NI§(_loc3_);
         Event.§_-3h§(_loc3_);
      }
      
      public function get numChildren() : int
      {
         return this.§_-h2g§.length;
      }
      
      public function get §_-V8§() : Boolean
      {
         return this.§_-y2T§;
      }
      
      public function set §_-V8§(param1:Boolean) : void
      {
         this.§_-y2T§ = param1;
      }
      
      private function §_-2Q§(param1:int, param2:uint = 4294967295, param3:DisplayObject = null) : void
      {
         var _loc6_:int = 0;
         var _loc4_:Vector.<DisplayObject> = this.§_-h2g§;
         var _loc5_:uint = _loc4_.length;
         if(param1 < 0)
         {
            param1 += _loc5_;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > _loc5_)
         {
            param1 = int(_loc5_);
         }
         if(param1 + param2 > _loc5_)
         {
            param2 = _loc5_ - param1;
         }
         var _loc7_:int = param3 ? 1 : 0;
         var _loc8_:int = _loc7_ - param2;
         var _loc9_:uint = _loc5_ + _loc8_;
         var _loc10_:* = int(_loc5_ - param1 - param2);
         if(_loc8_ < 0)
         {
            _loc6_ = param1 + _loc7_;
            while(_loc10_)
            {
               _loc4_[_loc6_] = _loc4_[int(_loc6_ - _loc8_)];
               _loc10_--;
               _loc6_++;
            }
            _loc4_.length = _loc9_;
         }
         else if(_loc8_ > 0)
         {
            _loc6_ = 1;
            while(_loc10_)
            {
               _loc4_[int(_loc9_ - _loc6_)] = _loc4_[int(_loc5_ - _loc6_)];
               _loc10_--;
               _loc6_++;
            }
            _loc4_.length = _loc9_;
         }
         if(param3)
         {
            _loc4_[param1] = param3;
         }
      }
      
      internal function §_-o2D§(param1:DisplayObject, param2:String, param3:Vector.<DisplayObject>) : void
      {
         var _loc5_:Vector.<DisplayObject> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         if(param1.hasEventListener(param2))
         {
            param3[param3.length] = param1;
         }
         if(_loc4_)
         {
            _loc5_ = _loc4_.§_-h2g§;
            _loc6_ = int(_loc5_.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               this.§_-o2D§(_loc5_[_loc7_],param2,param3);
               _loc7_++;
            }
         }
      }
   }
}

