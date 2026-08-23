package §_-o1G§
{
   import §_-42B§.*;
   import flash.display.*;
   
   public class §_-T1F§ extends §_-V2F§
   {
      
      public static const API:Number = 1;
      
      public function §_-T1F§()
      {
         super();
         this.propName = "frameLabel";
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         if(!param3.target is MovieClip)
         {
            return false;
         }
         §_-w2Z§ = param1 as MovieClip;
         this.frame = §_-w2Z§.currentFrame;
         var _loc4_:Array = §_-w2Z§.currentLabels;
         var _loc5_:String = param2;
         var _loc6_:int = §_-w2Z§.currentFrame;
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
            §_-N2Z§(this,"frame",this.frame,_loc6_,"frame");
         }
         return true;
      }
   }
}

