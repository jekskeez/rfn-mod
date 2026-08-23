package §_-4I§
{
   import §_-22D§.§_-C2E§;
   import flash.display.MovieClip;
   
   public class §_-53I§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected var §_-i1U§:MovieClip;
      
      public var frame:int;
      
      public function §_-53I§()
      {
         super();
         this.propName = "frame";
         this.overwriteProps = ["frame","frameLabel"];
         this.round = true;
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         if(!(param1 is MovieClip) || isNaN(param2))
         {
            return false;
         }
         §_-i1U§ = param1 as MovieClip;
         this.frame = §_-i1U§.currentFrame;
         §_-D1f§(this,"frame",this.frame,param2,"frame");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-No§(param1);
         §_-i1U§.gotoAndStop(this.frame);
      }
   }
}

