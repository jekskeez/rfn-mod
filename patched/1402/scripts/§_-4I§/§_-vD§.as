package §_-4I§
{
   import §_-22D§.*;
   import flash.media.SoundTransform;
   
   public class §_-vD§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected var §_-i1U§:Object;
      
      protected var §_-J2q§:SoundTransform;
      
      public function §_-vD§()
      {
         super();
         this.propName = "volume";
         this.overwriteProps = ["volume"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         if(isNaN(param2) || param1.hasOwnProperty("volume") || !param1.hasOwnProperty("soundTransform"))
         {
            return false;
         }
         §_-i1U§ = param1;
         §_-J2q§ = §_-i1U§.soundTransform;
         §_-D1f§(§_-J2q§,"volume",§_-J2q§.volume,param2,"volume");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-No§(param1);
         §_-i1U§.soundTransform = §_-J2q§;
      }
   }
}

