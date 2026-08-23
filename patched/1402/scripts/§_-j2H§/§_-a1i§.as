package §_-j2H§
{
   import §_-TK§.§_-aS§;
   import flash.display.BitmapData;
   import game.mainGame.entity.§_-w1u§;
   import utils.§_-O1T§;
   
   public class §_-a1i§ extends §_-Y1t§ implements §_-w1u§
   {
      
      private var bitmapData:BitmapData;
      
      public function §_-a1i§()
      {
         super();
      }
      
      public function get landSound() : String
      {
         return "land_ice";
      }
      
      override public function §_-e14§() : BitmapData
      {
         if(this.bitmapData == null)
         {
            this.bitmapData = §_-O1T§.getBitmapData(new Ice());
         }
         return this.bitmapData;
      }
      
      override protected function §_-P2S§() : void
      {
         §_-J2J§(new §_-aS§(new Ice()));
      }
   }
}

