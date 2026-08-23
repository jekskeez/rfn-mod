package §_-4I§
{
   import §_-22D§.*;
   import flash.filters.DropShadowFilter;
   
   public class §_-H1b§ extends §_-qX§
   {
      
      public static const API:Number = 1;
      
      private static var §_-U2M§:Array = ["distance","angle","color","alpha","blurX","blurY","strength","quality","inner","knockout","hideObject"];
      
      public function §_-H1b§()
      {
         super();
         this.propName = "dropShadowFilter";
         this.overwriteProps = ["dropShadowFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-i1U§ = param1;
         _type = DropShadowFilter;
         §_-T20§(param2,new DropShadowFilter(0,45,0,0,0,0,1,int(param2.quality) || 2,param2.inner,param2.knockout,param2.hideObject),§_-U2M§);
         return true;
      }
   }
}

