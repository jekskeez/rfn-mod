package §_-I1q§
{
   import Box2D.Dynamics.b2World;
   import §_-8Q§.§_-p1u§;
   import §_-j2E§.§_-A11§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-VQ§ extends §_-p1u§
   {
      
      public function §_-VQ§()
      {
         super(HarlockPerkView,0,10);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[2] != §_-s2l§.§_-31c§)
         {
            return;
         }
         if(param1[1] != §_-A11§.§_-Wb§)
         {
            return;
         }
         if(param1[4] != this.playerId)
         {
            return;
         }
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C1i§]);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-C1i§]);
      }
   }
}

