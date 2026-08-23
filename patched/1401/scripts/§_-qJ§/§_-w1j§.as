package §_-qJ§
{
   import §_-F19§.§_-p2§;
   
   public class §_-w1j§ extends §_-p2§ implements §_-J2k§
   {
      
      private var §_-e3§:§_-z1C§;
      
      public function §_-w1j§(param1:Boolean = false)
      {
         super(false,param1);
         this.§_-Y1k§ = §_-w1I§;
         this.§_-e3§ = new §_-z1C§(this);
      }
      
      public function get thirstController() : §_-z1C§
      {
         return this.§_-e3§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.thirstController.update(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.thirstController.dispose();
         this.§_-e3§ = null;
      }
   }
}

