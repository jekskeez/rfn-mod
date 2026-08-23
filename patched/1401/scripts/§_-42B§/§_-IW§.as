package §_-42B§
{
   import §_-bQ§.*;
   
   public final class §_-IW§
   {
      
      public static var enabled:Boolean;
      
      public static var mode:int;
      
      public static const §_-9i§:int = 4;
      
      public static const §_-FI§:int = 3;
      
      public static const §_-Ia§:int = 1;
      
      public static const §_-12Y§:int = 5;
      
      public static const AUTO:int = 2;
      
      public static const version:Number = 6.1;
      
      public static const NONE:int = 0;
      
      public function §_-IW§()
      {
         super();
      }
      
      public static function §_-M8§(param1:§_-lH§) : Boolean
      {
         var _loc2_:Boolean = false;
         while(param1)
         {
            if(param1.§_-Np§)
            {
               _loc2_ = true;
               break;
            }
            param1 = param1.timeline;
         }
         return _loc2_;
      }
      
      public static function init(param1:int = 2) : int
      {
         if(§_-y2k§.version < 11.6)
         {
            throw new Error("Warning: Your TweenLite class needs to be updated to work with OverwriteManager (or you may need to clear your ASO files). Please download and install the latest version from http://www.tweenlite.com.");
         }
         §_-y2k§.§_-D1r§ = §_-IW§;
         mode = param1;
         enabled = true;
         return mode;
      }
      
      public static function manageOverwrites(param1:§_-y2k§, param2:Object, param3:Array, param4:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:§_-y2k§ = null;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:§_-lH§ = null;
         var _loc17_:Number = NaN;
         var _loc18_:§_-72V§ = null;
         if(param4 >= 4)
         {
            _loc13_ = int(param3.length);
            _loc5_ = 0;
            while(_loc5_ < _loc13_)
            {
               _loc7_ = param3[_loc5_];
               if(_loc7_ != param1)
               {
                  if(_loc7_.setEnabled(false,false))
                  {
                     _loc6_ = true;
                  }
               }
               else if(param4 == 5)
               {
                  break;
               }
               _loc5_++;
            }
            return _loc6_;
         }
         var _loc8_:Number = param1.§_-hT§ + 1e-10;
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         _loc5_ = int(param3.length);
         while(--_loc5_ > -1)
         {
            _loc7_ = param3[_loc5_];
            if(!(_loc7_ == param1 || _loc7_.gc || !_loc7_.§_-w2X§ && _loc8_ - _loc7_.§_-hT§ <= 2e-10))
            {
               if(_loc7_.timeline != param1.timeline)
               {
                  if(!§_-M8§(_loc7_))
                  {
                     _loc10_[_loc11_++] = _loc7_;
                  }
               }
               else if(_loc7_.§_-hT§ <= _loc8_ && _loc7_.§_-hT§ + _loc7_.totalDuration + 1e-10 > _loc8_ && !_loc7_.§_-Np§ && !(param1.§_-N18§ == 0 && _loc8_ - _loc7_.§_-hT§ <= 2e-10))
               {
                  _loc9_[_loc12_++] = _loc7_;
               }
            }
         }
         if(_loc11_ != 0)
         {
            _loc14_ = param1.§_-L1l§;
            _loc15_ = _loc8_;
            _loc18_ = param1.timeline;
            while(_loc18_)
            {
               _loc14_ *= _loc18_.§_-L1l§;
               _loc15_ += _loc18_.§_-hT§;
               _loc18_ = _loc18_.timeline;
            }
            _loc8_ = _loc14_ * _loc15_;
            _loc5_ = _loc11_;
            while(--_loc5_ > -1)
            {
               _loc16_ = _loc10_[_loc5_];
               _loc14_ = _loc16_.§_-L1l§;
               _loc15_ = _loc16_.§_-hT§;
               _loc18_ = _loc16_.timeline;
               while(_loc18_)
               {
                  _loc14_ *= _loc18_.§_-L1l§;
                  _loc15_ += _loc18_.§_-hT§;
                  _loc18_ = _loc18_.timeline;
               }
               _loc17_ = _loc14_ * _loc15_;
               if(_loc17_ <= _loc8_ && (_loc17_ + _loc16_.totalDuration * _loc14_ + 1e-10 > _loc8_ || _loc16_.§_-N18§ == 0))
               {
                  _loc9_[_loc12_++] = _loc16_;
               }
            }
         }
         if(_loc12_ == 0)
         {
            return _loc6_;
         }
         _loc5_ = _loc12_;
         if(param4 == 2)
         {
            while(--_loc5_ > -1)
            {
               _loc7_ = _loc9_[_loc5_];
               if(_loc7_.§_-d1R§(param2))
               {
                  _loc6_ = true;
               }
               if(_loc7_.§_-t1b§ == null && _loc7_.§_-w2X§)
               {
                  _loc7_.setEnabled(false,false);
               }
            }
         }
         else
         {
            while(--_loc5_ > -1)
            {
               if(§_-y2k§(_loc9_[_loc5_]).setEnabled(false,false))
               {
                  _loc6_ = true;
               }
            }
         }
         return _loc6_;
      }
   }
}

