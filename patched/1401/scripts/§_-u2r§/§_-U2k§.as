package §_-u2r§
{
   import Box2D.Dynamics.b2World;
   import §_-83V§.§_-12C§;
   import §_-P2b§.§_-6L§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-U2k§ extends §_-12C§
   {
      
      public function §_-U2k§()
      {
         super(HarlockPerkView,0,10);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[2] != §_-S2I§.§_-33T§)
         {
            return;
         }
         if(param1[1] != §_-6L§.§_-22E§)
         {
            return;
         }
         if(param1[4] != this.playerId)
         {
            return;
         }
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-w1R§]);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-w1R§]);
      }
   }
}

