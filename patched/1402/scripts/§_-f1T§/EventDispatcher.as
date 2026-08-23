package §_-f1T§
{
   import flash.utils.Dictionary;
   import starling.core.starling_internal;
   import starling.display.DisplayObject;
   
   use namespace starling_internal;
   
   public class EventDispatcher
   {
      
      private static var §_-If§:Array = [];
      
      private var §_-v13§:Dictionary;
      
      public function EventDispatcher()
      {
         super();
      }
      
      public function addEventListener(param1:String, param2:Function) : void
      {
         if(this.§_-v13§ == null)
         {
            this.§_-v13§ = new Dictionary();
         }
         var _loc3_:Vector.<Function> = this.§_-v13§[param1] as Vector.<Function>;
         if(_loc3_ == null)
         {
            this.§_-v13§[param1] = new <Function>[param2];
         }
         else if(_loc3_.indexOf(param2) == -1)
         {
            _loc3_[_loc3_.length] = param2;
         }
      }
      
      public function removeEventListener(param1:String, param2:Function) : void
      {
         var _loc3_:Vector.<Function> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Function> = null;
         var _loc7_:int = 0;
         if(this.§_-v13§)
         {
            _loc3_ = this.§_-v13§[param1] as Vector.<Function>;
            _loc4_ = _loc3_ ? int(_loc3_.length) : 0;
            if(_loc4_ > 0)
            {
               _loc5_ = _loc3_.indexOf(param2);
               if(_loc5_ != -1)
               {
                  _loc6_ = _loc3_.slice(0,_loc5_);
                  _loc7_ = _loc5_ + 1;
                  while(_loc7_ < _loc4_)
                  {
                     _loc6_[_loc7_ - 1] = _loc3_[_loc7_];
                     _loc7_++;
                  }
                  this.§_-v13§[param1] = _loc6_;
               }
            }
         }
      }
      
      public function §_-b1M§(param1:String = null) : void
      {
         if(Boolean(param1) && Boolean(this.§_-v13§))
         {
            delete this.§_-v13§[param1];
         }
         else
         {
            this.§_-v13§ = null;
         }
      }
      
      public function dispatchEvent(param1:Event) : void
      {
         var _loc2_:Boolean = param1.bubbles;
         if(!_loc2_ && (this.§_-v13§ == null || !(param1.type in this.§_-v13§)))
         {
            return;
         }
         var _loc3_:EventDispatcher = param1.target;
         param1.§_-d1F§(this);
         if(_loc2_ && this is DisplayObject)
         {
            this.§_-g2z§(param1);
         }
         else
         {
            this.§_-sK§(param1);
         }
         if(_loc3_)
         {
            param1.§_-d1F§(_loc3_);
         }
      }
      
      internal function §_-sK§(param1:Event) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:Function = null;
         var _loc6_:int = 0;
         var _loc2_:Vector.<Function> = this.§_-v13§ ? this.§_-v13§[param1.type] as Vector.<Function> : null;
         var _loc3_:int = _loc2_ == null ? 0 : int(_loc2_.length);
         if(_loc3_)
         {
            param1.§_-V18§(this);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = _loc2_[_loc4_] as Function;
               _loc6_ = _loc5_.length;
               if(_loc6_ == 0)
               {
                  _loc5_();
               }
               else if(_loc6_ == 1)
               {
                  _loc5_(param1);
               }
               else
               {
                  _loc5_(param1,param1.data);
               }
               if(param1.§_-So§)
               {
                  return true;
               }
               _loc4_++;
            }
            return param1.§_-B22§;
         }
         return false;
      }
      
      internal function §_-g2z§(param1:Event) : void
      {
         var _loc2_:Vector.<EventDispatcher> = null;
         var _loc6_:Boolean = false;
         var _loc3_:DisplayObject = this as DisplayObject;
         var _loc4_:* = 1;
         if(§_-If§.length > 0)
         {
            _loc2_ = §_-If§.pop();
            _loc2_[0] = _loc3_;
         }
         else
         {
            _loc2_ = new <EventDispatcher>[_loc3_];
         }
         while(true)
         {
            _loc3_ = _loc3_.parent;
            if(_loc3_ == null)
            {
               break;
            }
            _loc2_[int(_loc4_++)] = _loc3_;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc2_[_loc5_].§_-sK§(param1);
            if(_loc6_)
            {
               break;
            }
            _loc5_++;
         }
         _loc2_.length = 0;
         §_-If§[§_-If§.length] = _loc2_;
      }
      
      public function §_-12v§(param1:String, param2:Boolean = false, param3:Object = null) : void
      {
         var _loc4_:Event = null;
         if(param2 || this.hasEventListener(param1))
         {
            _loc4_ = Event.§_-11t§(param1,param2,param3);
            this.dispatchEvent(_loc4_);
            Event.§_-b3§(_loc4_);
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         var _loc2_:Vector.<Function> = this.§_-v13§ ? this.§_-v13§[param1] : null;
         return _loc2_ ? _loc2_.length != 0 : false;
      }
   }
}

