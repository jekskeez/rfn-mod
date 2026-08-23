package §_-r1M§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-j2H§.§_-62Y§;
   import §_-j2H§.§_-r29§;
   import flash.utils.setTimeout;
   
   public class §_-l2C§ extends Hero
   {
      
      public function §_-l2C§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function set dead(param1:Boolean) : void
      {
         if(param1 && this.shaman)
         {
            setTimeout(this.§_-lu§,0);
            return;
         }
         super.dead = param1;
      }
      
      override public function set shaman(param1:Boolean) : void
      {
         if(this.shaman == param1)
         {
            return;
         }
         this.§_-lu§();
         if(!param1)
         {
            this.team = §_-PM§;
         }
         super.shaman = param1;
      }
      
      private function §_-lu§() : void
      {
         switch(this.team)
         {
            case Hero.§_-i1Y§:
               this.teleportTo(this.game.map.get(§_-62Y§).length > 0 ? this.game.map.get(§_-62Y§)[0].position : null);
               break;
            case Hero.§_-l1B§:
               this.teleportTo(this.game.map.get(§_-r29§).length > 0 ? this.game.map.get(§_-r29§)[0].position : null);
         }
      }
   }
}

