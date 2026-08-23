package §_-o1G§
{
   import §_-42B§.§_-y2k§;
   import flash.display.MovieClip;
   
   public class §_-V2F§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected var §_-w2Z§:MovieClip;
      
      public var frame:int;
      
      public function §_-V2F§()
      {
         super();
         this.propName = "frame";
         this.overwriteProps = ["frame","frameLabel"];
         this.round = true;
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         if(!(param1 is MovieClip) || isNaN(param2))
         {
            return false;
         }
         §_-w2Z§ = param1 as MovieClip;
         this.frame = §_-w2Z§.currentFrame;
         §_-N2Z§(this,"frame",this.frame,param2,"frame");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-FL§(param1);
         §_-w2Z§.gotoAndStop(this.frame);
      }
   }
}

