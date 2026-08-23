package game
{
   import §_-A1G§.§_-w10§;
   
   public class §_-02D§ extends §_-u2§
   {
      
      public function §_-02D§()
      {
         super();
      }
      
      override public function stop() : void
      {
         if(this.§_-W1u§ == null)
         {
            return;
         }
         this.§_-W1u§.stop();
         §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         this.§_-W1u§ = null;
      }
   }
}

