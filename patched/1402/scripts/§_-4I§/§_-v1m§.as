package §_-4I§
{
   import §_-22D§.*;
   
   public class §_-v1m§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected var §_-i1U§:Object;
      
      protected var §_-KI§:Boolean;
      
      public function §_-v1m§()
      {
         super();
         this.propName = "autoAlpha";
         this.overwriteProps = ["alpha","visible"];
      }
      
      override public function killProps(param1:Object) : void
      {
         super.killProps(param1);
         §_-KI§ = Boolean("visible" in param1);
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-i1U§ = param1;
         §_-D1f§(param1,"alpha",param1.alpha,param2,"alpha");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-No§(param1);
         if(!§_-KI§)
         {
            §_-i1U§.visible = Boolean(§_-i1U§.alpha != 0);
         }
      }
   }
}

