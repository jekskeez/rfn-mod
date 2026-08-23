package §_-4I§
{
   import §_-22D§.*;
   import flash.filters.GlowFilter;
   
   public class §_-7b§ extends §_-qX§
   {
      
      public static const API:Number = 1;
      
      private static var §_-U2M§:Array = ["color","alpha","blurX","blurY","strength","quality","inner","knockout"];
      
      public function §_-7b§()
      {
         super();
         this.propName = "glowFilter";
         this.overwriteProps = ["glowFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-i1U§ = param1;
         _type = GlowFilter;
         §_-T20§(param2,new GlowFilter(16777215,0,0,0,Number(param2.strength) || 1,int(param2.quality) || 2,param2.inner,param2.knockout),§_-U2M§);
         return true;
      }
   }
}

