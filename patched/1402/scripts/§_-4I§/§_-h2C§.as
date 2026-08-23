package §_-4I§
{
   import §_-22D§.§_-C2E§;
   
   public class §_-h2C§ extends §_-61z§
   {
      
      public static const API:Number = 1;
      
      public function §_-h2C§()
      {
         super();
         this.propName = "bezierThrough";
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         if(!(param2 is Array))
         {
            return false;
         }
         init(param3,param2 as Array,true);
         return true;
      }
   }
}

