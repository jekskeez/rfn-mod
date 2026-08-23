package §_-2V§
{
   import §_-53U§.§_-M26§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   
   public class §_-ph§ extends §_-G1O§
   {
      
      private static var §_-Uw§:Object = {};
      
      private var §_-v11§:Object = null;
      
      public function §_-ph§(param1:§_-M26§)
      {
         super(param1);
      }
      
      private static function §_-63W§(param1:Object) : Array
      {
         var _loc2_:String = §_-L14§(param1);
         if(_loc2_ in §_-Uw§)
         {
            return §_-Uw§[_loc2_];
         }
         var _loc3_:Array = §_-13n§(param1);
         §_-Uw§[_loc2_] = _loc3_;
         return _loc3_;
      }
      
      private static function §_-L14§(param1:Object) : String
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         for(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         _loc2_.sort();
         _loc4_ = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_.push(_loc2_[_loc5_] + ":" + param1[_loc2_[_loc5_]]);
            _loc5_++;
         }
         return _loc4_.join("|");
      }
      
      private static function §_-13n§(param1:Object) : Array
      {
         var _loc3_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc2_:Array = [];
         for(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         if(_loc2_.length <= 1)
         {
            return _loc2_;
         }
         var _loc4_:Array = [];
         var _loc5_:Object = {};
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc5_[_loc2_[_loc6_]] = true;
            _loc6_++;
         }
         var _loc7_:int = _loc2_.length * _loc2_.length;
         var _loc8_:int = 0;
         while(_loc4_.length < _loc2_.length && _loc8_ < _loc7_)
         {
            _loc8_++;
            for(_loc10_ in _loc5_)
            {
               _loc11_ = param1[_loc10_];
               if(!(_loc11_ in _loc5_))
               {
                  _loc4_.push(_loc10_);
                  delete _loc5_[_loc10_];
               }
            }
         }
         for(_loc9_ in _loc5_)
         {
            _loc4_.push(_loc9_);
         }
         return _loc4_;
      }
      
      override public function §_-83Y§(param1:§_-E1r§, param2:Boolean) : void
      {
         var _loc5_:String = null;
         var _loc6_:§_-TH§ = null;
         var _loc7_:§_-TH§ = null;
         super.§_-83Y§(param1,param2);
         this.§_-v11§ = {};
         if(!this.params.zOrderBones)
         {
            return;
         }
         var _loc3_:Array = §_-63W§(this.params.zOrderBones);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = param1.§_-M1s§(_loc5_);
            _loc7_ = param1.§_-M1s§(this.params.zOrderBones[_loc5_]);
            if(!(!_loc6_ || !_loc7_))
            {
               this.§_-v11§[_loc5_] = _loc6_.slot.zOrder;
               _loc6_.slot.zOrder = _loc7_.slot.zOrder + 1;
            }
            _loc4_++;
         }
      }
      
      override public function §_-q2v§(param1:§_-E1r§) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-TH§ = null;
         var _loc4_:§_-TH§ = null;
         for(_loc2_ in this.params.zOrderBones)
         {
            _loc3_ = param1.§_-M1s§(_loc2_);
            _loc4_ = param1.§_-M1s§(this.params.zOrderBones[_loc2_]);
            if(!(!_loc3_ || !_loc4_))
            {
               _loc3_.slot.zOrder = _loc2_ in this.§_-v11§ ? Number(this.§_-v11§[_loc2_]) : _loc4_.slot.zOrder - 1;
            }
         }
         super.§_-q2v§(param1);
      }
   }
}

