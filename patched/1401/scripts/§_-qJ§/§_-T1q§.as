package §_-qJ§
{
   import §_-Rj§.§_-W28§;
   
   public class §_-T1q§ extends §_-W28§ implements §_-J2k§
   {
      
      private var §_-e3§:§_-z1C§;
      
      public function §_-T1q§()
      {
         super();
         this.§_-Y1k§ = §_-w1I§;
         this.§_-e3§ = new §_-z1C§(this,true);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-e3§.update(param1);
      }
      
      override public function dispose() : void
      {
         this.§_-e3§.dispose();
         this.§_-e3§ = null;
         super.dispose();
      }
      
      public function get thirstController() : §_-z1C§
      {
         return this.§_-e3§;
      }
   }
}

