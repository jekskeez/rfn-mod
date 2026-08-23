package §_-4I§
{
   import §_-22D§.*;
   import flash.display.*;
   
   public class §_-Lb§ extends §_-53I§
   {
      
      public static const API:Number = 1;
      
      public function §_-Lb§()
      {
         super();
         this.propName = "frameLabel";
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         if(!param3.target is MovieClip)
         {
            return false;
         }
         §_-i1U§ = param1 as MovieClip;
         this.frame = §_-i1U§.currentFrame;
         var _loc4_:Array = §_-i1U§.currentLabels;
         var _loc5_:String = param2;
         var _loc6_:int = §_-i1U§.currentFrame;
         var _loc7_:* = int(_loc4_.length);
         while(_loc7_--)
         {
            if(_loc4_[_loc7_].name == _loc5_)
            {
               _loc6_ = int(_loc4_[_loc7_].frame);
               break;
            }
         }
         if(this.frame != _loc6_)
         {
            §_-D1f§(this,"frame",this.frame,_loc6_,"frame");
         }
         return true;
      }
   }
}

