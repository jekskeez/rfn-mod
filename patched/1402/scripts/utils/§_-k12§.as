package utils
{
   import flash.display.MovieClip;
   
   public class §_-k12§
   {
      
      public function §_-k12§()
      {
         super();
      }
      
      public static function §_-b2X§(param1:MovieClip, param2:int = 1) : void
      {
         var _loc4_:MovieClip = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_) as MovieClip;
            if(_loc4_)
            {
               §_-b2X§(_loc4_,param2);
            }
            _loc3_++;
         }
         param1.gotoAndPlay(param2);
      }
      
      public static function §_-b2P§(param1:MovieClip, param2:int = -1, param3:Function = null) : void
      {
         var clip:MovieClip = param1;
         var stopFrame:int = param2;
         var callback:Function = param3;
         clip.addFrameScript(clip.totalFrames - 1,function():void
         {
            stopAll(clip,stopFrame == -1 ? int(clip.totalFrames - 1) : stopFrame);
            if(callback != null)
            {
               callback();
            }
         });
         §_-b2X§(clip,1);
      }
      
      public static function stopAll(param1:MovieClip, param2:int = 1) : void
      {
         var _loc4_:MovieClip = null;
         param1.stopAllMovieClips();
         param1.gotoAndStop(param2);
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_) as MovieClip;
            if(_loc4_)
            {
               §_-k12§.stopAll(_loc4_,param2);
            }
            _loc3_++;
         }
      }
   }
}

