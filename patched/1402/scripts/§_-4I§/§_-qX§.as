package §_-4I§
{
   import §_-y1E§.*;
   import flash.filters.*;
   
   public class §_-qX§ extends §_-y2R§
   {
      
      public static const VERSION:Number = 2.03;
      
      public static const API:Number = 1;
      
      protected var §_-7i§:Boolean;
      
      protected var §_-i1U§:Object;
      
      protected var §_-Km§:int;
      
      protected var §_-M2f§:BitmapFilter;
      
      protected var _type:Class;
      
      public function §_-qX§()
      {
         super();
      }
      
      public function §_-A2U§() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = 0;
         if(§_-7i§)
         {
            _loc1_ = §_-i1U§.filters;
            if(!(_loc1_[§_-Km§] is _type))
            {
               _loc2_ = int(_loc1_.length);
               while(_loc2_--)
               {
                  if(_loc1_[_loc2_] is _type)
                  {
                     _loc1_.splice(_loc2_,1);
                     break;
                  }
               }
            }
            else
            {
               _loc1_.splice(§_-Km§,1);
            }
            §_-i1U§.filters = _loc1_;
         }
      }
      
      protected function §_-T20§(param1:Object, param2:BitmapFilter, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:* = 0;
         var _loc7_:§_-zm§ = null;
         var _loc4_:Array = §_-i1U§.filters;
         var _loc8_:Object = param1 is BitmapFilter ? {} : param1;
         §_-Km§ = -1;
         if(_loc8_.index != null)
         {
            §_-Km§ = _loc8_.index;
         }
         else
         {
            _loc6_ = int(_loc4_.length);
            while(_loc6_--)
            {
               if(_loc4_[_loc6_] is _type)
               {
                  §_-Km§ = _loc6_;
                  break;
               }
            }
         }
         if(§_-Km§ == -1 || _loc4_[§_-Km§] == null || _loc8_.addFilter == true)
         {
            §_-Km§ = _loc8_.index != null ? int(_loc8_.index) : int(_loc4_.length);
            _loc4_[§_-Km§] = param2;
            §_-i1U§.filters = _loc4_;
         }
         §_-M2f§ = _loc4_[§_-Km§];
         if(_loc8_.remove == true)
         {
            §_-7i§ = true;
            this.onComplete = §_-A2U§;
         }
         _loc6_ = int(param3.length);
         while(_loc6_--)
         {
            _loc5_ = param3[_loc6_];
            if(_loc5_ in param1 && §_-M2f§[_loc5_] != param1[_loc5_])
            {
               if(_loc5_ == "color" || _loc5_ == "highlightColor" || _loc5_ == "shadowColor")
               {
                  _loc7_ = new §_-zm§();
                  _loc7_.§_-vS§(§_-M2f§,_loc5_,§_-M2f§[_loc5_],param1[_loc5_]);
                  §_-n1X§[§_-n1X§.length] = new §_-bg§(_loc7_,"changeFactor",0,1,_loc5_,false);
               }
               else if(_loc5_ == "quality" || _loc5_ == "inner" || _loc5_ == "knockout" || _loc5_ == "hideObject")
               {
                  §_-M2f§[_loc5_] = param1[_loc5_];
               }
               else
               {
                  §_-D1f§(§_-M2f§,_loc5_,§_-M2f§[_loc5_],param1[_loc5_],_loc5_);
               }
            }
         }
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc3_:§_-bg§ = null;
         var _loc2_:* = int(§_-n1X§.length);
         var _loc4_:Array = §_-i1U§.filters;
         while(_loc2_--)
         {
            _loc3_ = §_-n1X§[_loc2_];
            _loc3_.target[_loc3_.§_-MF§] = _loc3_.start + _loc3_.change * param1;
         }
         if(!(_loc4_[§_-Km§] is _type))
         {
            _loc2_ = int(§_-Km§ = _loc4_.length);
            while(_loc2_--)
            {
               if(_loc4_[_loc2_] is _type)
               {
                  §_-Km§ = _loc2_;
                  break;
               }
            }
         }
         _loc4_[§_-Km§] = §_-M2f§;
         §_-i1U§.filters = _loc4_;
      }
   }
}

