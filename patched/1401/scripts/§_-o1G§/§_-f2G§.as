package §_-o1G§
{
   import §_-42B§.*;
   import flash.filters.GlowFilter;
   
   public class §_-f2G§ extends §_-31N§
   {
      
      public static const API:Number = 1;
      
      private static var §_-S1x§:Array = ["color","alpha","blurX","blurY","strength","quality","inner","knockout"];
      
      public function §_-f2G§()
      {
         super();
         this.propName = "glowFilter";
         this.overwriteProps = ["glowFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-w2Z§ = param1;
         _type = GlowFilter;
         §_-G24§(param2,new GlowFilter(16777215,0,0,0,Number(param2.strength) || 1,int(param2.quality) || 2,param2.inner,param2.knockout),§_-S1x§);
         return true;
      }
   }
}

