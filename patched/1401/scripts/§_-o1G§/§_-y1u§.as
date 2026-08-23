package §_-o1G§
{
   import §_-42B§.*;
   import flash.filters.BlurFilter;
   
   public class §_-y1u§ extends §_-31N§
   {
      
      public static const API:Number = 1;
      
      private static var §_-S1x§:Array = ["blurX","blurY","quality"];
      
      public function §_-y1u§()
      {
         super();
         this.propName = "blurFilter";
         this.overwriteProps = ["blurFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-w2Z§ = param1;
         _type = BlurFilter;
         §_-G24§(param2,new BlurFilter(0,0,int(param2.quality) || 2),§_-S1x§);
         return true;
      }
   }
}

