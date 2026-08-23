package §_-B1O§
{
   import §_-RI§.§_-h2I§;
   import flash.display.BitmapData;
   import game.mainGame.entity.§_-YY§;
   import utils.§_-93C§;
   
   public class §_-z§ extends §_-K2R§ implements §_-YY§
   {
      
      private var bitmapData:BitmapData;
      
      public function §_-z§()
      {
         super();
      }
      
      public function get landSound() : String
      {
         return "land_ice";
      }
      
      override public function §_-81e§() : BitmapData
      {
         if(this.bitmapData == null)
         {
            this.bitmapData = §_-93C§.getBitmapData(new Ice());
         }
         return this.bitmapData;
      }
      
      override protected function §_-c2m§() : void
      {
         §_-83v§(new §_-h2I§(new Ice()));
      }
   }
}

