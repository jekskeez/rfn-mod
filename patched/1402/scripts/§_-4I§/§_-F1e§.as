package §_-4I§
{
   import §_-22D§.*;
   import flash.filters.BevelFilter;
   
   public class §_-F1e§ extends §_-qX§
   {
      
      public static const API:Number = 1;
      
      private static var §_-U2M§:Array = ["distance","angle","highlightColor","highlightAlpha","shadowColor","shadowAlpha","blurX","blurY","strength","quality"];
      
      public function §_-F1e§()
      {
         super();
         this.propName = "bevelFilter";
         this.overwriteProps = ["bevelFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-i1U§ = param1;
         _type = BevelFilter;
         §_-T20§(param2,new BevelFilter(0,0,16777215,0.5,0,0.5,2,2,0,int(param2.quality) || 2),§_-U2M§);
         return true;
      }
   }
}

