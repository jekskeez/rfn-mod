package §_-u2r§
{
   import Box2D.Dynamics.b2World;
   import §_-83V§.§_-e2B§;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-Pa§ extends §_-e2B§ implements §_-s2K§
   {
      
      protected var §_-42S§:Boolean = false;
      
      protected var §_-WN§:int;
      
      public function §_-Pa§(param1:int = 0, param2:int = 0)
      {
         super(this.animation,param1,param2);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-Q1g§]);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-Q1g§]);
      }
      
      protected function get animation() : Class
      {
         return null;
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[1] != this.§_-WN§)
               {
                  return;
               }
               if(param1[4] != this.playerId)
               {
                  return;
               }
               this.§_-H2D§.map.§_-Qc§(this,true);
               break;
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-WN§)
               {
                  return;
               }
               if(param1[2] != this.playerId)
               {
                  return;
               }
               this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
   }
}

