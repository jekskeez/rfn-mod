package §_-4I§
{
   import §_-22D§.*;
   import flash.filters.BlurFilter;
   
   public class §_-o1P§ extends §_-qX§
   {
      
      public static const API:Number = 1;
      
      private static var §_-U2M§:Array = ["blurX","blurY","quality"];
      
      public function §_-o1P§()
      {
         super();
         this.propName = "blurFilter";
         this.overwriteProps = ["blurFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-i1U§ = param1;
         _type = BlurFilter;
         §_-T20§(param2,new BlurFilter(0,0,int(param2.quality) || 2),§_-U2M§);
         return true;
      }
   }
}

