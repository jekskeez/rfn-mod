package §_-B1O§
{
   import §_-RI§.§_-h2I§;
   import utils.§_-M4§;
   
   public class §_-PI§ extends §_-M1M§
   {
      
      public function §_-PI§()
      {
         super();
      }
      
      override public function set message(param1:String) : void
      {
         if(this.§_-N1I§)
         {
            this.§_-N1I§.removeFromParent();
         }
         §_-13W§ = param1;
         if(!param1 || param1 == "")
         {
            return;
         }
         this.§_-N1I§ = new §_-h2I§(new §_-M4§(param1),true);
         this.§_-N1I§.x = -this.§_-N1I§.width + 5;
         this.§_-N1I§.y = -this.§_-N1I§.height - 35;
         §_-83v§(this.§_-N1I§);
      }
      
      override protected function init() : void
      {
         var _loc1_:§_-h2I§ = new §_-h2I§(new ShamanIcon());
         _loc1_.y = -_loc1_.height + 21;
         _loc1_.x = -_loc1_.width * 0.5;
         §_-83v§(_loc1_);
      }
   }
}

