package §_-f1T§
{
   import starling.core.starling_internal;
   import starling.display.DisplayObject;
   
   use namespace starling_internal;
   
   public class TouchEvent extends Event
   {
      
      public static const §_-qu§:String = "touch";
      
      private static var §_-60§:Vector.<§_-J1a§> = new Vector.<§_-J1a§>(0);
      
      private var §_-W28§:Boolean;
      
      private var §_-31D§:Boolean;
      
      private var §_-q2h§:Number;
      
      private var §_-N2y§:Vector.<EventDispatcher>;
      
      public function TouchEvent(param1:String, param2:Vector.<§_-J1a§>, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true)
      {
         super(param1,param5,param2);
         this.§_-W28§ = param3;
         this.§_-31D§ = param4;
         this.§_-q2h§ = -1;
         this.§_-N2y§ = new Vector.<EventDispatcher>(0);
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            if(param2[_loc7_].§_-EK§ > this.§_-q2h§)
            {
               this.§_-q2h§ = param2[_loc7_].§_-EK§;
            }
            _loc7_++;
         }
      }
      
      public function §_-31F§(param1:DisplayObject, param2:String = null, param3:Vector.<§_-J1a§> = null) : Vector.<§_-J1a§>
      {
         var _loc7_:§_-J1a§ = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(param3 == null)
         {
            param3 = new Vector.<§_-J1a§>(0);
         }
         var _loc4_:Vector.<§_-J1a§> = data as Vector.<§_-J1a§>;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc4_[_loc6_];
            _loc8_ = _loc7_.§_-X1D§(param1);
            _loc9_ = param2 == null || param2 == _loc7_.§_-iR§;
            if(_loc8_ && _loc9_)
            {
               param3[param3.length] = _loc7_;
            }
            _loc6_++;
         }
         return param3;
      }
      
      public function §_-d2S§(param1:DisplayObject, param2:String = null, param3:int = -1) : §_-J1a§
      {
         var _loc5_:§_-J1a§ = null;
         var _loc6_:int = 0;
         this.§_-31F§(param1,param2,§_-60§);
         var _loc4_:int = int(§_-60§.length);
         if(_loc4_ > 0)
         {
            _loc5_ = null;
            if(param3 < 0)
            {
               _loc5_ = §_-60§[0];
            }
            else
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  if(§_-60§[_loc6_].id == param3)
                  {
                     _loc5_ = §_-60§[_loc6_];
                     break;
                  }
                  _loc6_++;
               }
            }
            §_-60§.length = 0;
            return _loc5_;
         }
         return null;
      }
      
      public function §_-BA§(param1:DisplayObject) : Boolean
      {
         var _loc2_:Boolean = false;
         this.§_-31F§(param1,null,§_-60§);
         var _loc3_:* = int(§_-60§.length - 1);
         while(_loc3_ >= 0)
         {
            if(§_-60§[_loc3_].§_-iR§ != §_-01Z§.§_-1Z§)
            {
               _loc2_ = true;
               break;
            }
            _loc3_--;
         }
         §_-60§.length = 0;
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
            §_-d1F§(param1[0] as EventDispatcher);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc5_ = param1[_loc4_] as EventDispatcher;
               if(this.§_-N2y§.indexOf(_loc5_) == -1)
               {
                  _loc6_ = _loc5_.§_-sK§(this);
                  this.§_-N2y§[this.§_-N2y§.length] = _loc5_;
                  if(_loc6_)
                  {
                     break;
                  }
               }
               _loc4_++;
            }
            §_-d1F§(_loc3_);
         }
      }
      
      public function get §_-EK§() : Number
      {
         return this.§_-q2h§;
      }
      
      public function get §_-KD§() : Vector.<§_-J1a§>
      {
         return (data as Vector.<§_-J1a§>).concat();
      }
      
      public function get shiftKey() : Boolean
      {
         return this.§_-W28§;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.§_-31D§;
      }
   }
}

