package §_-o1G§
{
   import §_-42B§.*;
   import flash.filters.DropShadowFilter;
   
   public class §_-Ys§ extends §_-31N§
   {
      
      public static const API:Number = 1;
      
      private static var §_-S1x§:Array = ["distance","angle","color","alpha","blurX","blurY","strength","quality","inner","knockout","hideObject"];
      
      public function §_-Ys§()
      {
         super();
         this.propName = "dropShadowFilter";
         this.overwriteProps = ["dropShadowFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-w2Z§ = param1;
         _type = DropShadowFilter;
         §_-G24§(param2,new DropShadowFilter(0,45,0,0,0,0,1,int(param2.quality) || 2,param2.inner,param2.knockout,param2.hideObject),§_-S1x§);
         return true;
      }
   }
}

