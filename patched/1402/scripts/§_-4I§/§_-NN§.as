package §_-4I§
{
   import §_-22D§.*;
   
   public class §_-NN§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected var §_-i1U§:Object;
      
      protected var §_-935§:Boolean;
      
      protected var §_-H17§:Boolean;
      
      protected var §_-T2b§:§_-C2E§;
      
      public function §_-NN§()
      {
         super();
         this.propName = "visible";
         this.overwriteProps = ["visible"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-i1U§ = param1;
         §_-T2b§ = param3;
         §_-935§ = §_-i1U§.visible;
         §_-H17§ = Boolean(param2);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         if(param1 == 1 && (§_-T2b§.§_-N1S§ == §_-T2b§.§_-Qt§ || §_-T2b§.§_-Qt§ == 0))
         {
            §_-i1U§.visible = §_-H17§;
         }
         else
         {
            §_-i1U§.visible = §_-935§;
         }
      }
   }
}

