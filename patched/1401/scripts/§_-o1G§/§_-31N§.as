package §_-o1G§
{
   import §_-bQ§.*;
   import flash.filters.*;
   
   public class §_-31N§ extends §_-J21§
   {
      
      public static const VERSION:Number = 2.03;
      
      public static const API:Number = 1;
      
      protected var §_-V2d§:Boolean;
      
      protected var §_-w2Z§:Object;
      
      protected var §_-U2q§:int;
      
      protected var §_-A2n§:BitmapFilter;
      
      protected var _type:Class;
      
      public function §_-31N§()
      {
         super();
      }
      
      public function §_-V2f§() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = 0;
         if(§_-V2d§)
         {
            _loc1_ = §_-w2Z§.filters;
            if(!(_loc1_[§_-U2q§] is _type))
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
               _loc1_.splice(§_-U2q§,1);
            }
            §_-w2Z§.filters = _loc1_;
         }
      }
      
      protected function §_-G24§(param1:Object, param2:BitmapFilter, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:* = 0;
         var _loc7_:§_-R1x§ = null;
         var _loc4_:Array = §_-w2Z§.filters;
         var _loc8_:Object = param1 is BitmapFilter ? {} : param1;
         §_-U2q§ = -1;
         if(_loc8_.index != null)
         {
            §_-U2q§ = _loc8_.index;
         }
         else
         {
            _loc6_ = int(_loc4_.length);
            while(_loc6_--)
            {
               if(_loc4_[_loc6_] is _type)
               {
                  §_-U2q§ = _loc6_;
                  break;
               }
            }
         }
         if(§_-U2q§ == -1 || _loc4_[§_-U2q§] == null || _loc8_.addFilter == true)
         {
            §_-U2q§ = _loc8_.index != null ? int(_loc8_.index) : int(_loc4_.length);
            _loc4_[§_-U2q§] = param2;
            §_-w2Z§.filters = _loc4_;
         }
         §_-A2n§ = _loc4_[§_-U2q§];
         if(_loc8_.remove == true)
         {
            §_-V2d§ = true;
            this.onComplete = §_-V2f§;
         }
         _loc6_ = int(param3.length);
         while(_loc6_--)
         {
            _loc5_ = param3[_loc6_];
            if(_loc5_ in param1 && §_-A2n§[_loc5_] != param1[_loc5_])
            {
               if(_loc5_ == "color" || _loc5_ == "highlightColor" || _loc5_ == "shadowColor")
               {
                  _loc7_ = new §_-R1x§();
                  _loc7_.§_-cM§(§_-A2n§,_loc5_,§_-A2n§[_loc5_],param1[_loc5_]);
                  §_-d1k§[§_-d1k§.length] = new §_-f§(_loc7_,"changeFactor",0,1,_loc5_,false);
               }
               else if(_loc5_ == "quality" || _loc5_ == "inner" || _loc5_ == "knockout" || _loc5_ == "hideObject")
               {
                  §_-A2n§[_loc5_] = param1[_loc5_];
               }
               else
               {
                  §_-N2Z§(§_-A2n§,_loc5_,§_-A2n§[_loc5_],param1[_loc5_],_loc5_);
               }
            }
         }
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc3_:§_-f§ = null;
         var _loc2_:* = int(§_-d1k§.length);
         var _loc4_:Array = §_-w2Z§.filters;
         while(_loc2_--)
         {
            _loc3_ = §_-d1k§[_loc2_];
            _loc3_.target[_loc3_.§_-w26§] = _loc3_.start + _loc3_.change * param1;
         }
         if(!(_loc4_[§_-U2q§] is _type))
         {
            _loc2_ = int(§_-U2q§ = _loc4_.length);
            while(_loc2_--)
            {
               if(_loc4_[_loc2_] is _type)
               {
                  §_-U2q§ = _loc2_;
                  break;
               }
            }
         }
         _loc4_[§_-U2q§] = §_-A2n§;
         §_-w2Z§.filters = _loc4_;
      }
   }
}

