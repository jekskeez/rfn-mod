package §_-us§
{
   import §_-AY§.§_-Su§;
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   
   public class §_-9G§ extends §_-M18§
   {
      
      private static var §_-jQ§:Object = {};
      
      private var §_-Fb§:Object = null;
      
      public function §_-9G§(param1:§_-Su§)
      {
         super(param1);
      }
      
      private static function §_-226§(param1:Object) : Array
      {
         var _loc2_:String = §_-039§(param1);
         if(_loc2_ in §_-jQ§)
         {
            return §_-jQ§[_loc2_];
         }
         var _loc3_:Array = §_-r14§(param1);
         §_-jQ§[_loc2_] = _loc3_;
         return _loc3_;
      }
      
      private static function §_-039§(param1:Object) : String
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
      
      private static function §_-r14§(param1:Object) : Array
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
      
      override public function §_-N1Z§(param1:§_-833§, param2:Boolean) : void
      {
         var _loc5_:String = null;
         var _loc6_:§_-83b§ = null;
         var _loc7_:§_-83b§ = null;
         super.§_-N1Z§(param1,param2);
         this.§_-Fb§ = {};
         if(!this.params.zOrderBones)
         {
            return;
         }
         var _loc3_:Array = §_-226§(this.params.zOrderBones);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = param1.§_-i2v§(_loc5_);
            _loc7_ = param1.§_-i2v§(this.params.zOrderBones[_loc5_]);
            if(!(!_loc6_ || !_loc7_))
            {
               this.§_-Fb§[_loc5_] = _loc6_.slot.zOrder;
               _loc6_.slot.zOrder = _loc7_.slot.zOrder + 1;
            }
            _loc4_++;
         }
      }
      
      override public function §_-O2O§(param1:§_-833§) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-83b§ = null;
         var _loc4_:§_-83b§ = null;
         for(_loc2_ in this.params.zOrderBones)
         {
            _loc3_ = param1.§_-i2v§(_loc2_);
            _loc4_ = param1.§_-i2v§(this.params.zOrderBones[_loc2_]);
            if(!(!_loc3_ || !_loc4_))
            {
               _loc3_.slot.zOrder = _loc2_ in this.§_-Fb§ ? Number(this.§_-Fb§[_loc2_]) : _loc4_.slot.zOrder - 1;
            }
         }
         super.§_-O2O§(param1);
      }
   }
}

