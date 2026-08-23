package §_-I1q§
{
   import Box2D.Dynamics.b2World;
   import §_-8Q§.§_-7A§;
   import game.mainGame.entity.§_-NA§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-t7§ extends §_-7A§ implements §_-NA§
   {
      
      protected var §_-D27§:Boolean = false;
      
      protected var §_-o1r§:int;
      
      public function §_-t7§(param1:int = 0, param2:int = 0)
      {
         super(this.animation,param1,param2);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-u22§]);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-u22§]);
      }
      
      protected function get animation() : Class
      {
         return null;
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[1] != this.§_-o1r§)
               {
                  return;
               }
               if(param1[4] != this.playerId)
               {
                  return;
               }
               this.§_-21H§.map.§_-Y1E§(this,true);
               break;
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-o1r§)
               {
                  return;
               }
               if(param1[2] != this.playerId)
               {
                  return;
               }
               this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
   }
}

