package §_-o1G§
{
   import §_-42B§.*;
   
   public class EndArrayPlugin extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected var §_-63§:Array;
      
      protected var §_-j2E§:Array = [];
      
      public function EndArrayPlugin()
      {
         super();
         this.propName = "endArray";
         this.overwriteProps = ["endArray"];
      }
      
      public function init(param1:Array, param2:Array) : void
      {
         §_-63§ = param1;
         var _loc3_:* = int(param2.length);
         while(_loc3_--)
         {
            if(param1[_loc3_] != param2[_loc3_] && param1[_loc3_] != null)
            {
               §_-j2E§[§_-j2E§.length] = new ArrayTweenInfo(_loc3_,§_-63§[_loc3_],param2[_loc3_] - §_-63§[_loc3_]);
            }
         }
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         if(!(param1 is Array) || !(param2 is Array))
         {
            return false;
         }
         init(param1 as Array,param2);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc3_:ArrayTweenInfo = null;
         var _loc4_:Number = NaN;
         var _loc2_:* = int(§_-j2E§.length);
         if(this.round)
         {
            while(_loc2_--)
            {
               _loc3_ = §_-j2E§[_loc2_];
               _loc4_ = _loc3_.start + _loc3_.change * param1;
               if(_loc4_ > 0)
               {
                  §_-63§[_loc3_.index] = _loc4_ + 0.5 >> 0;
               }
               else
               {
                  §_-63§[_loc3_.index] = _loc4_ - 0.5 >> 0;
               }
            }
         }
         else
         {
            while(_loc2_--)
            {
               _loc3_ = §_-j2E§[_loc2_];
               §_-63§[_loc3_.index] = _loc3_.start + _loc3_.change * param1;
            }
         }
      }
   }
}

class ArrayTweenInfo
{
   
   public var change:Number;
   
   public var start:Number;
   
   public var index:uint;
   
   public function ArrayTweenInfo(param1:uint, param2:Number, param3:Number)
   {
      super();
      this.index = param1;
      this.start = param2;
      this.change = param3;
   }
}
