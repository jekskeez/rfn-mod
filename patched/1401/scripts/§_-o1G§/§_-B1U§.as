package §_-o1G§
{
   import §_-42B§.*;
   
   public class §_-B1U§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      public function §_-B1U§()
      {
         super();
         this.propName = "shortRotation";
         this.overwriteProps = [];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         var _loc4_:String = null;
         if(typeof param2 == "number")
         {
            return false;
         }
         for(_loc4_ in param2)
         {
            §_-cL§(param1,_loc4_,param1[_loc4_],typeof param2[_loc4_] == "number" ? Number(param2[_loc4_]) : param1[_loc4_] + Number(param2[_loc4_]));
         }
         return true;
      }
      
      public function §_-cL§(param1:Object, param2:String, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = (param4 - param3) % 360;
         if(_loc5_ != _loc5_ % 180)
         {
            _loc5_ = _loc5_ < 0 ? _loc5_ + 360 : _loc5_ - 360;
         }
         §_-N2Z§(param1,param2,param3,param3 + _loc5_,param2);
         this.overwriteProps[this.overwriteProps.length] = param2;
      }
   }
}

