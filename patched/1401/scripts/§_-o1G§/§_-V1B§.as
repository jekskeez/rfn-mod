package §_-o1G§
{
   import §_-42B§.*;
   
   public class §_-V1B§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected var §_-w2Z§:Object;
      
      protected var §_-I1S§:Boolean;
      
      protected var §_-e6§:Boolean;
      
      protected var §_-r2y§:§_-y2k§;
      
      public function §_-V1B§()
      {
         super();
         this.propName = "visible";
         this.overwriteProps = ["visible"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-w2Z§ = param1;
         §_-r2y§ = param3;
         §_-I1S§ = §_-w2Z§.visible;
         §_-e6§ = Boolean(param2);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         if(param1 == 1 && (§_-r2y§.§_-N18§ == §_-r2y§.§_-b1T§ || §_-r2y§.§_-b1T§ == 0))
         {
            §_-w2Z§.visible = §_-e6§;
         }
         else
         {
            §_-w2Z§.visible = §_-I1S§;
         }
      }
   }
}

