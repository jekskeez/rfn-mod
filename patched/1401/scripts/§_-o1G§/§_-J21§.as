package §_-o1G§
{
   import §_-42B§.*;
   import §_-bQ§.*;
   
   public class §_-J21§
   {
      
      public static const VERSION:Number = 1.4;
      
      public static const API:Number = 1;
      
      public var activeDisable:Boolean;
      
      public var onInitAllProps:Function;
      
      protected var §_-d1k§:Array = [];
      
      public var onDisable:Function;
      
      public var propName:String;
      
      public var onEnable:Function;
      
      public var round:Boolean;
      
      public var priority:int = 0;
      
      public var overwriteProps:Array;
      
      public var onComplete:Function;
      
      protected var §_-h1q§:Number = 0;
      
      public function §_-J21§()
      {
         super();
      }
      
      public static function activate(param1:Array) : Boolean
      {
         var _loc3_:Object = null;
         §_-y2k§.§_-KR§ = §_-J21§.§_-e19§;
         var _loc2_:* = int(param1.length);
         while(_loc2_--)
         {
            if(param1[_loc2_].hasOwnProperty("API"))
            {
               _loc3_ = new (param1[_loc2_] as Class)();
               §_-y2k§.§_-h2Q§[_loc3_.propName] = param1[_loc2_];
            }
         }
         return true;
      }
      
      private static function §_-e19§(param1:String, param2:§_-y2k§) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:* = 0;
         var _loc3_:§_-f§ = param2.§_-t1b§;
         if(param1 == "onInitAllProps")
         {
            _loc5_ = [];
            _loc6_ = 0;
            while(_loc3_)
            {
               _loc5_[_loc6_++] = _loc3_;
               _loc3_ = _loc3_.nextNode;
            }
            _loc5_.sortOn("priority",Array.NUMERIC | Array.DESCENDING);
            while(--_loc6_ > -1)
            {
               §_-f§(_loc5_[_loc6_]).nextNode = _loc5_[_loc6_ + 1];
               §_-f§(_loc5_[_loc6_]).prevNode = _loc5_[_loc6_ - 1];
            }
            _loc3_ = param2.§_-t1b§ = _loc5_[0];
         }
         while(_loc3_)
         {
            if(_loc3_.§_-w27§ && Boolean(_loc3_.target[param1]))
            {
               if(_loc3_.target.activeDisable)
               {
                  _loc4_ = true;
               }
               _loc3_.target[param1]();
            }
            _loc3_ = _loc3_.nextNode;
         }
         return _loc4_;
      }
      
      public function set changeFactor(param1:Number) : void
      {
         §_-FL§(param1);
         §_-h1q§ = param1;
      }
      
      protected function §_-FL§(param1:Number) : void
      {
         var _loc3_:§_-f§ = null;
         var _loc4_:Number = NaN;
         var _loc2_:int = int(§_-d1k§.length);
         if(this.round)
         {
            while(--_loc2_ > -1)
            {
               _loc3_ = §_-d1k§[_loc2_];
               _loc4_ = _loc3_.start + _loc3_.change * param1;
               if(_loc4_ > 0)
               {
                  _loc3_.target[_loc3_.§_-w26§] = _loc4_ + 0.5 >> 0;
               }
               else
               {
                  _loc3_.target[_loc3_.§_-w26§] = _loc4_ - 0.5 >> 0;
               }
            }
         }
         else
         {
            while(--_loc2_ > -1)
            {
               _loc3_ = §_-d1k§[_loc2_];
               _loc3_.target[_loc3_.§_-w26§] = _loc3_.start + _loc3_.change * param1;
            }
         }
      }
      
      protected function §_-N2Z§(param1:Object, param2:String, param3:Number, param4:*, param5:String = null) : void
      {
         var _loc6_:Number = NaN;
         if(param4 != null)
         {
            _loc6_ = typeof param4 == "number" ? Number(param4) - param3 : Number(param4);
            if(_loc6_ != 0)
            {
               §_-d1k§[§_-d1k§.length] = new §_-f§(param1,param2,param3,_loc6_,param5 || param2,false);
            }
         }
      }
      
      public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-N2Z§(param1,this.propName,param1[this.propName],param2,this.propName);
         return true;
      }
      
      public function get changeFactor() : Number
      {
         return §_-h1q§;
      }
      
      public function killProps(param1:Object) : void
      {
         var _loc2_:int = int(this.overwriteProps.length);
         while(--_loc2_ > -1)
         {
            if(this.overwriteProps[_loc2_] in param1)
            {
               this.overwriteProps.splice(_loc2_,1);
            }
         }
         _loc2_ = int(§_-d1k§.length);
         while(--_loc2_ > -1)
         {
            if(§_-f§(§_-d1k§[_loc2_]).name in param1)
            {
               §_-d1k§.splice(_loc2_,1);
            }
         }
      }
   }
}

