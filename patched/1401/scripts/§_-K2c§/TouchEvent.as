package §_-K2c§
{
   import starling.core.starling_internal;
   import starling.display.DisplayObject;
   
   use namespace starling_internal;
   
   public class TouchEvent extends Event
   {
      
      public static const §_-N1l§:String = "touch";
      
      private static var §_-u2e§:Vector.<§_-e2m§> = new Vector.<§_-e2m§>(0);
      
      private var §_-41B§:Boolean;
      
      private var §_-u2i§:Boolean;
      
      private var §_-03o§:Number;
      
      private var §_-J2H§:Vector.<EventDispatcher>;
      
      public function TouchEvent(param1:String, param2:Vector.<§_-e2m§>, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true)
      {
         super(param1,param5,param2);
         this.§_-41B§ = param3;
         this.§_-u2i§ = param4;
         this.§_-03o§ = -1;
         this.§_-J2H§ = new Vector.<EventDispatcher>(0);
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            if(param2[_loc7_].§_-n2B§ > this.§_-03o§)
            {
               this.§_-03o§ = param2[_loc7_].§_-n2B§;
            }
            _loc7_++;
         }
      }
      
      public function §_-51Q§(param1:DisplayObject, param2:String = null, param3:Vector.<§_-e2m§> = null) : Vector.<§_-e2m§>
      {
         var _loc7_:§_-e2m§ = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(param3 == null)
         {
            param3 = new Vector.<§_-e2m§>(0);
         }
         var _loc4_:Vector.<§_-e2m§> = data as Vector.<§_-e2m§>;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc4_[_loc6_];
            _loc8_ = _loc7_.§_-LH§(param1);
            _loc9_ = param2 == null || param2 == _loc7_.§_-Q2S§;
            if(_loc8_ && _loc9_)
            {
               param3[param3.length] = _loc7_;
            }
            _loc6_++;
         }
         return param3;
      }
      
      public function §_-H2o§(param1:DisplayObject, param2:String = null, param3:int = -1) : §_-e2m§
      {
         var _loc5_:§_-e2m§ = null;
         var _loc6_:int = 0;
         this.§_-51Q§(param1,param2,§_-u2e§);
         var _loc4_:int = int(§_-u2e§.length);
         if(_loc4_ > 0)
         {
            _loc5_ = null;
            if(param3 < 0)
            {
               _loc5_ = §_-u2e§[0];
            }
            else
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  if(§_-u2e§[_loc6_].id == param3)
                  {
                     _loc5_ = §_-u2e§[_loc6_];
                     break;
                  }
                  _loc6_++;
               }
            }
            §_-u2e§.length = 0;
            return _loc5_;
         }
         return null;
      }
      
      public function §_-V1Y§(param1:DisplayObject) : Boolean
      {
         var _loc2_:Boolean = false;
         this.§_-51Q§(param1,null,§_-u2e§);
         var _loc3_:* = int(§_-u2e§.length - 1);
         while(_loc3_ >= 0)
         {
            if(§_-u2e§[_loc3_].§_-Q2S§ != §_-sj§.§_-L23§)
            {
               _loc2_ = true;
               break;
            }
            _loc3_--;
         }
         §_-u2e§.length = 0;
         return _loc2_;
      }
      
      internal function dispatch(param1:Vector.<EventDispatcher>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:EventDispatcher = null;
         var _loc4_:int = 0;
         var _loc5_:EventDispatcher = null;
         var _loc6_:Boolean = false;
         if(Boolean(param1) && Boolean(param1.length))
         {
            _loc2_ = bubbles ? int(param1.length) : 1;
            _loc3_ = target;
            §_-F5§(param1[0] as EventDispatcher);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc5_ = param1[_loc4_] as EventDispatcher;
               if(this.§_-J2H§.indexOf(_loc5_) == -1)
               {
                  _loc6_ = _loc5_.§_-a23§(this);
                  this.§_-J2H§[this.§_-J2H§.length] = _loc5_;
                  if(_loc6_)
                  {
                     break;
                  }
               }
               _loc4_++;
            }
            §_-F5§(_loc3_);
         }
      }
      
      public function get §_-n2B§() : Number
      {
         return this.§_-03o§;
      }
      
      public function get §_-h2Y§() : Vector.<§_-e2m§>
      {
         return (data as Vector.<§_-e2m§>).concat();
      }
      
      public function get shiftKey() : Boolean
      {
         return this.§_-41B§;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.§_-u2i§;
      }
   }
}

