package §_-o1G§
{
   import §_-42B§.*;
   import flash.media.SoundTransform;
   
   public class §_-I1Q§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected var §_-w2Z§:Object;
      
      protected var §_-o1l§:SoundTransform;
      
      public function §_-I1Q§()
      {
         super();
         this.propName = "volume";
         this.overwriteProps = ["volume"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         if(isNaN(param2) || param1.hasOwnProperty("volume") || !param1.hasOwnProperty("soundTransform"))
         {
            return false;
         }
         §_-w2Z§ = param1;
         §_-o1l§ = §_-w2Z§.soundTransform;
         §_-N2Z§(§_-o1l§,"volume",§_-o1l§.volume,param2,"volume");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-FL§(param1);
         §_-w2Z§.soundTransform = §_-o1l§;
      }
   }
}

