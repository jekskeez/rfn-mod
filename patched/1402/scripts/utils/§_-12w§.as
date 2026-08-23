package utils
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.system.Capabilities;
   
   public class §_-12w§
   {
      
      public function §_-12w§()
      {
         super();
      }
      
      public static function get §_-x1n§() : Object
      {
         var _loc1_:String = Capabilities.version;
         var _loc2_:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
         var _loc3_:Object = _loc2_.exec(_loc1_);
         var _loc4_:Object = {};
         _loc4_["major"] = _loc3_[2];
         _loc4_["minor"] = _loc3_[3];
         return _loc4_;
      }
      
      public static function §_-b1b§(param1:MovieClip) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            if(_loc3_ is MovieClip)
            {
               (_loc3_ as MovieClip).stop();
               §_-b1b§(_loc3_ as MovieClip);
            }
            _loc2_++;
         }
      }
   }
}

