package §_-o1G§
{
   import §_-42B§.*;
   import flash.filters.BevelFilter;
   
   public class §_-Bi§ extends §_-31N§
   {
      
      public static const API:Number = 1;
      
      private static var §_-S1x§:Array = ["distance","angle","highlightColor","highlightAlpha","shadowColor","shadowAlpha","blurX","blurY","strength","quality"];
      
      public function §_-Bi§()
      {
         super();
         this.propName = "bevelFilter";
         this.overwriteProps = ["bevelFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-w2Z§ = param1;
         _type = BevelFilter;
         §_-G24§(param2,new BevelFilter(0,0,16777215,0.5,0,0.5,2,2,0,int(param2.quality) || 2),§_-S1x§);
         return true;
      }
   }
}

